Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77E24D9B27
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:27:39 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6H4-0003Nu-Qi
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:27:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU633-0005xR-Kn
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:11 -0400
Received: from [2a00:1450:4864:20::532] (port=41483
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU632-0000cQ-1m
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:09 -0400
Received: by mail-ed1-x532.google.com with SMTP id c20so23888212edr.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWdV171HSSpOSKf8zM5nQltG2DSb/w7EjYDdhCceeVg=;
 b=WHTZ6LXgJMCXNi/w3F95yp9TuymZ2XMiotyMV+qnqL1L0x7S4ReJrtft5Bmtcs71f8
 /C5db8dK/HbFAHkqlUXS2kg/jB7QuZ8mUkm3eut/q/xJ2EMk6TNuseGX2BclIxCdDbAY
 9PLnwslQrtd7TA4Ks+CdzHgAMmP9OxzJ2i/GaPA67/FW7AMlt+YR7wD+RcIpUOW7I0tA
 KI0FmDDunRRRWyzD08hT+YdoFs/TQO+5W7jcDb6nwEvkyIUYD8qPvF4kzb3JP/4pnuz7
 hwBs1qLC2zf0e/WI1larmaFYuxIzSXHXz5squnykhrmVd0BsL7pLckw336bwy66A9R2H
 Gykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWdV171HSSpOSKf8zM5nQltG2DSb/w7EjYDdhCceeVg=;
 b=m5htvTEZNYFPPgoTA97ss0+Tn1Fhlj1rhzsHTu1Chtnim9sVOdWeFhOVifDopZdmVP
 JVxWPPtAxELJLMotsfg7N79FNwRhHo4Q4ppASnWrx+Q7tDkrqKwlf0divVBqBv6DhW4M
 CA898g/ObJ+6kzQo2r2nu1X/hp2TdjxafrvagaK+ycFPEWndh2oQ8k4xTfQk+5wkUZWJ
 bErnJ7zO4CmZWWGqnsu2/LvqSakkisr72EMY50UcQe+PbVDRGtIdP8K3orZtZaFl+eEJ
 BXKiEKxfSOwTgDT93tCZET6tO04NAEK5WG8mjz2ZM+t7LJaRY2BwdpBOB17vAEPAbEie
 u1kA==
X-Gm-Message-State: AOAM532jdAL7x5Q4YfY93ei3xAjBUk8YLuU3u2fFxO2x6p696eQjZ/ja
 SMAsiJJXqLpGD8UT5g5Cqnchrg==
X-Google-Smtp-Source: ABdhPJwi2FVzuILfhsyKxBGv86mQqcTULNPLe1ht8aF7lp2Nik2txbk41/UQy/0RIZBVMos5EDd+Qw==
X-Received: by 2002:a05:6402:2750:b0:416:29dd:1d17 with SMTP id
 z16-20020a056402275000b0041629dd1d17mr24960753edd.387.1647346385950; 
 Tue, 15 Mar 2022 05:13:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 eq18-20020a170907291200b006da97b09661sm8024676ejc.17.2022.03.15.05.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5BFB1FFBE;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/8] docs/devel: try and impose some organisation
Date: Tue, 15 Mar 2022 12:12:49 +0000
Message-Id: <20220315121251.2280317-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com,
 Kashyap Chamarthy <kchamart@redhat.com>, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a growing set of developer docs but the index is currently in
order of when stuff was added. Try and make things a bit easier to
find my adding sub indexes and organising into themes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>

---
v2
  - fix whitespace issues
---
 docs/devel/index-api.rst       | 15 +++++++++++
 docs/devel/index-build.rst     | 19 ++++++++++++++
 docs/devel/index-internals.rst | 21 ++++++++++++++++
 docs/devel/index-process.rst   | 17 +++++++++++++
 docs/devel/index-tcg.rst       | 16 ++++++++++++
 docs/devel/index.rst           | 46 ++++++----------------------------
 6 files changed, 95 insertions(+), 39 deletions(-)
 create mode 100644 docs/devel/index-api.rst
 create mode 100644 docs/devel/index-build.rst
 create mode 100644 docs/devel/index-internals.rst
 create mode 100644 docs/devel/index-process.rst
 create mode 100644 docs/devel/index-tcg.rst

diff --git a/docs/devel/index-api.rst b/docs/devel/index-api.rst
new file mode 100644
index 0000000000..b749240272
--- /dev/null
+++ b/docs/devel/index-api.rst
@@ -0,0 +1,15 @@
+Internal QEMU APIs
+------------------
+
+Details about how QEMU's various internal APIs. Most of these are
+generated from in-code annotations to function prototypes.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   bitops
+   loads-stores
+   memory
+   modules
+   ui
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
new file mode 100644
index 0000000000..d96894f07c
--- /dev/null
+++ b/docs/devel/index-build.rst
@@ -0,0 +1,19 @@
+QEMU Build and Test System
+--------------------------
+
+Details about how QEMU's build system works and how it is integrated
+into our testing infrastructure. You will need to understand some of
+the basics if you are adding new files and targets to the build.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   build-system
+   kconfig
+   testing
+   qtest
+   ci
+   qapi-code-gen
+   fuzzing
+   control-flow-integrity
diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
new file mode 100644
index 0000000000..bb118b8eaf
--- /dev/null
+++ b/docs/devel/index-internals.rst
@@ -0,0 +1,21 @@
+Internal Subsystem Information
+------------------------------
+
+Details about QEMU's various subsystems including how to add features to them.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   qom
+   atomics
+   block-coroutine-wrapper
+   clocks
+   ebpf_rss
+   migration
+   multi-process
+   reset
+   s390-dasd-ipl
+   tracing
+   vfio-migration
+   writing-monitor-commands
diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
new file mode 100644
index 0000000000..314e9e94cc
--- /dev/null
+++ b/docs/devel/index-process.rst
@@ -0,0 +1,17 @@
+QEMU Community Processes
+------------------------
+
+Notes about how to interact with the community and how and where to submit patches.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   code-of-conduct
+   conflict-resolution
+   style
+   submitting-a-patch
+   trivial-patches
+   stable-process
+   submitting-a-pull-request
+   secure-coding-practices
diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
new file mode 100644
index 0000000000..3acbd95d36
--- /dev/null
+++ b/docs/devel/index-tcg.rst
@@ -0,0 +1,16 @@
+TCG Emulation
+-------------
+
+Details about QEMU's Tiny Code Generator and the infrastructure
+associated with emulation. You do not need to worry about this if you
+are only implementing things for HW accelerated hypervisors.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   tcg
+   decodetree
+   multi-thread-tcg
+   tcg-icount
+   tcg-plugins
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index afd937535e..a68207052d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -7,44 +7,12 @@ You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
 .. toctree::
-   :maxdepth: 2
+   :maxdepth: 1
    :includehidden:
 
-   code-of-conduct
-   conflict-resolution
-   build-system
-   style
-   kconfig
-   testing
-   fuzzing
-   control-flow-integrity
-   loads-stores
-   memory
-   migration
-   atomics
-   stable-process
-   ci
-   qtest
-   decodetree
-   secure-coding-practices
-   tcg
-   tcg-icount
-   tracing
-   multi-thread-tcg
-   tcg-plugins
-   bitops
-   ui
-   reset
-   s390-dasd-ipl
-   clocks
-   qom
-   modules
-   block-coroutine-wrapper
-   multi-process
-   ebpf_rss
-   vfio-migration
-   qapi-code-gen
-   writing-monitor-commands
-   trivial-patches
-   submitting-a-patch
-   submitting-a-pull-request
+
+   index-process
+   index-build
+   index-api
+   index-internals
+   index-tcg
-- 
2.30.2


