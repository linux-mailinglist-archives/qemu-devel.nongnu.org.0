Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935BF4D3099
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:55:42 +0100 (CET)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwmz-0006Um-Mt
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:55:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRwlQ-0005bY-8u
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:54:04 -0500
Received: from [2a00:1450:4864:20::532] (port=39472
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRwlO-0000nD-Ff
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:54:03 -0500
Received: by mail-ed1-x532.google.com with SMTP id g20so2944851edw.6
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 05:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwvpkQRDMsQ8Jipt9pBWsoiA7ecmGMOpjjWgPDvbJnM=;
 b=INSKlmv6GR9u2ZHeswnzZPm+WzaHtIJoUzvDtu4STpK+5f/7W9uVq2ouuMo7+z0kRv
 x52QYl2trKo5rSa2lS5KXymgcJ2uqN+K1vptZU8sU6GbPQCNp0L1ixKMDirC85/YMCkZ
 Srt8oMv3DxZ049F/JQRHgJiu4GZcM6TVv0wZPiUBm9VL8pSUUJpzyvGw3HamKxOlWXTq
 iXRhCXPmYBoTQ4D0f3RYvrKiZvgynMfk4lLFs9u154AaLx6KAj3inHGwcOm3afQtkkYN
 QIQOAeM/ePvniQ9gyZFn+wvDd43Q4IjHaGSe1pG865Ss9zKUHNauFXLptMwyW/xBDP+X
 VNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwvpkQRDMsQ8Jipt9pBWsoiA7ecmGMOpjjWgPDvbJnM=;
 b=AhgdP+bQqQoYOoNoKY3WE0Iz0WKUR0ymxiy7A7adbQ1SnBmfdE/q5w/mcoLu9feUse
 qnasErB7IWY0YA78XgLQR811aGhUqOkuLH/7XEra4Ad8PaW6ny+vgzWtLhs/LcoEprqh
 zvL4ha0S9K7/GkJEvxWR33P7kPaTzHUm4QgqGKJs/z4IX1L86WTKCO+/kgXTIlYRKui+
 5Dx6E/si05kpv8cufLlu7j8rVRLroG0TDqXfG7+L+Dc8sVbHllt534L0M2fXAAp5EEkW
 mHLrHM3zy8FgcMICuCz8br+5ke2j2oO/mt8asF+jMyMp04+G1mntmCpktRy7mZZesF7B
 /Kzg==
X-Gm-Message-State: AOAM530Ln7YplB6K+2sfqp+OBnHcMWbxay9ZGzSj1odutF5NRPhJ0FPW
 UCPRUuoi5pLCpAVrOcoKrPp38ISTF2cV6g==
X-Google-Smtp-Source: ABdhPJxskNqK2MkovKhhHYakxM9j+Nq3811fyfSYK+FiCtK0KaVYVOWCFYCH9xVEGMwTap8+5aAlLA==
X-Received: by 2002:aa7:de1a:0:b0:415:e628:4c66 with SMTP id
 h26-20020aa7de1a000000b00415e6284c66mr20955231edv.128.1646834040956; 
 Wed, 09 Mar 2022 05:54:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 cc21-20020a0564021b9500b00403bc1dfd5csm855056edb.85.2022.03.09.05.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 05:53:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E7001FFB7;
 Wed,  9 Mar 2022 13:53:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: try and impose some organisation
Date: Wed,  9 Mar 2022 13:53:55 +0000
Message-Id: <20220309135355.4149689-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a growing set of developer docs but the index is currently in
order of when stuff was added. Try and make things a bit easier to
find my adding sub indexes and organising into themes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/index-api.rst       | 15 +++++++++++
 docs/devel/index-build.rst     | 20 +++++++++++++++
 docs/devel/index-internals.rst | 22 ++++++++++++++++
 docs/devel/index-process.rst   | 18 +++++++++++++
 docs/devel/index-tcg.rst       | 17 +++++++++++++
 docs/devel/index.rst           | 46 ++++++----------------------------
 6 files changed, 99 insertions(+), 39 deletions(-)
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
index 0000000000..982ee801bd
--- /dev/null
+++ b/docs/devel/index-build.rst
@@ -0,0 +1,20 @@
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
+      
diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
new file mode 100644
index 0000000000..78270e89b3
--- /dev/null
+++ b/docs/devel/index-internals.rst
@@ -0,0 +1,22 @@
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
+      
diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
new file mode 100644
index 0000000000..0290762c08
--- /dev/null
+++ b/docs/devel/index-process.rst
@@ -0,0 +1,18 @@
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
+      
diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
new file mode 100644
index 0000000000..daa63e9a9a
--- /dev/null
+++ b/docs/devel/index-tcg.rst
@@ -0,0 +1,17 @@
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
+      
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


