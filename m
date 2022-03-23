Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E64E51A2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:53:15 +0100 (CET)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzYA-00047Z-I8
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:53:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz98-0001w3-Se
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:22 -0400
Received: from [2a00:1450:4864:20::42d] (port=37754
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz97-00064l-9p
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so1663176wru.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zp2Sjdd9zoSrgaf/w0vqz4NfuF1qKahAjTWAzq9LOCs=;
 b=so94ONMG/oSKh3pTnH66AJGpuPa+MBGVs117WP9X+wQ9q57xLYXih1EdrNL+KSS4zU
 eQJ6C9AIYrXfB0QYN1rw2RMemU3vvIPFyybTWbnjC4Jakx/stzDeLF8D2elKnVtVgIh9
 PEZG9C4xDtQLvmw/ONgJCEKUJI4zfYF6tba5YU9y+szPO4bZjiFGXHLVXJ+F/3nzqmnN
 0+YiZi/soBX99eqyRdGSlfcwCh88GROTz8Aea2gLuQPAwyQr7VFwTAV1mpIpRBse5wwW
 q5P32EvjuDrJMjO0TDXeQQ9aCGMmCnfC9wH0Znsp/kSNxMrZazf378wrMH63bWS8m8dj
 QbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zp2Sjdd9zoSrgaf/w0vqz4NfuF1qKahAjTWAzq9LOCs=;
 b=d7Z9GKF2YKkoO190p45U9hR6j6eJJQ5HKLkeQrrghMN4vH6yiV6qMMkSPZuicxtw3Y
 kuciiN5SY6QoWUXo4f2YJdhgRnytzn6YQ55KG04vOoAr9hDT1bgqOZrr11Z4renp3Rlo
 Vz4dvJoGkwH7wDUOMxIH0HbVKnWW7N2WgIQ7hTAs3xw3i/A1O7KANuSnvjXQ5DVJADyy
 dctclGg6KtfNxFuN9Nn7i7M8S3HBfeUX4bhm2E0GqV8DdjVSuVKAxTPkw+PCk5MIaN/x
 M2ohsgX4UDhjjkm2WQszbWjrunfOEolX+N0VDK0258hHipkgvBR7RlN65ygHwv33aW+j
 ZRqg==
X-Gm-Message-State: AOAM530KIE9ONj2lpfzeZYaBuZrFWcFcvxi6pKJUjC2NFI3cEbB2St3U
 gyZmYanWvA4TB+d1cZ4lRajpQ6UXWqG3Ag==
X-Google-Smtp-Source: ABdhPJwi0wAQFcaj4nu3FA/zMzlmUwv+7KUevPEdXWng0yTVwDPnmFReEd1cVmrxozrHA8xPmusoiA==
X-Received: by 2002:adf:e4c2:0:b0:204:6d8:ce9a with SMTP id
 v2-20020adfe4c2000000b0020406d8ce9amr15455284wrm.189.1648034840010; 
 Wed, 23 Mar 2022 04:27:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm3751808wma.2.2022.03.23.04.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D1BBD1FFBC;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/8] docs/devel: try and impose some organisation
Date: Wed, 23 Mar 2022 11:27:07 +0000
Message-Id: <20220323112711.440376-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a growing set of developer docs but the index is currently in
order of when stuff was added. Try and make things a bit easier to
find my adding sub indexes and organising into themes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Message-Id: <20220315121251.2280317-7-alex.bennee@linaro.org>

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


