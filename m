Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8885067CC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:37:12 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkIJ-0006FB-3i
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsa-0005P0-JW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:36 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsV-0008K9-Fe
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id s25so19937271edi.13
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvwLTF/YUpusucxnWfO5BDXCMNh2/WY9f2hzq1Kk0Rs=;
 b=FWujbmq5rBzRwRVpBAmOqO8nix17tdSJJ8tlBFesOo22pO5ef8j1KN8jH0Ws2hd5+s
 FgN07XZUMwGdLJgIE1wtDFjTLo9xFpjgltPrDX0Z7X7FKE08V5pB2svoFZ4zgGMxzHRg
 h6L1VSsH7YX8w7/73GtUHPdbvUHrXvtqfYob9xj81AQ2/w9DKyyxs3mRXhMVwj02Cozo
 NUDGPf+MwEESGlltk5YcQxuB4urR0abjvv8IlGf04dFhxr1LLNYzdJMmkEboVtng/B0p
 bGAREn/MyIEwbWnDGG1ficZHbNWaRvBji9F9o/HH4n0Q5T/8aGHuXtYmxMc1asfTzTAU
 swaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvwLTF/YUpusucxnWfO5BDXCMNh2/WY9f2hzq1Kk0Rs=;
 b=t5P2zwhAOS13D7+HBqqTHl+ZGweb/coPwS0WPa0TPlJkI960kXS83Sx+s/C9q0CoNX
 j//spQjktl8pbTxbc6zZY1u+kPh/ME8FIJz9YpcQzWCG70Vd6bf8xTiFF7R2iN8Y60gI
 YDTx6GlU3/ex/XhXcxxu7oHdqtqRQCM2cCiLrs2+gScPXI0bXZEOROXw+qR1/e4aGH5a
 aUs9tvrItUmZdsjRXUScAktdLFxrZlvK0L6YvftaJWP+btvX7uc0PxIryY5D1lQFcvuU
 yuMawkyBF0eTgtgYj5Vb/CBWmL7unWaxAB9oIlKdBYH7vA+Ug4tpRwmBPfKDufEASlxX
 jZbg==
X-Gm-Message-State: AOAM532hfyWdL0w7QXBpOa+28vMcSd+YNgGFrzaIED0ycepbSYL7gsB7
 nVTWIbecKSRfbuuavu3K5J0n6g==
X-Google-Smtp-Source: ABdhPJyv0fX7YLwYL7YtMe6oH7Wer0MMFS5eA0AVwLAHCjye74Nt/9jdoiooCY/wFvAlpXSdfsGTwQ==
X-Received: by 2002:aa7:cb93:0:b0:415:d57a:4603 with SMTP id
 r19-20020aa7cb93000000b00415d57a4603mr16206361edt.62.1650359427996; 
 Tue, 19 Apr 2022 02:10:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709067c0400b006ef810aab6fsm3285674ejo.213.2022.04.19.02.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FC751FFBB;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 03/25] docs/devel: drop :hidden: and :includehidden: tags
Date: Tue, 19 Apr 2022 10:09:58 +0100
Message-Id: <20220419091020.3008144-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was confusing and in the case of qtest was hiding the details of
the qgraph sub-document in the qtest pages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/index-api.rst       | 1 -
 docs/devel/index-build.rst     | 3 +--
 docs/devel/index-internals.rst | 1 -
 docs/devel/index-process.rst   | 1 -
 docs/devel/index-tcg.rst       | 1 -
 docs/devel/index.rst           | 2 --
 docs/devel/qtest.rst           | 1 -
 7 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/docs/devel/index-api.rst b/docs/devel/index-api.rst
index b749240272..60c0d7459d 100644
--- a/docs/devel/index-api.rst
+++ b/docs/devel/index-api.rst
@@ -6,7 +6,6 @@ generated from in-code annotations to function prototypes.
 
 .. toctree::
    :maxdepth: 2
-   :includehidden:
 
    bitops
    loads-stores
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
index d96894f07c..1002a533a6 100644
--- a/docs/devel/index-build.rst
+++ b/docs/devel/index-build.rst
@@ -6,8 +6,7 @@ into our testing infrastructure. You will need to understand some of
 the basics if you are adding new files and targets to the build.
 
 .. toctree::
-   :maxdepth: 2
-   :includehidden:
+   :maxdepth: 3
 
    build-system
    kconfig
diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index bb118b8eaf..a50889c556 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -5,7 +5,6 @@ Details about QEMU's various subsystems including how to add features to them.
 
 .. toctree::
    :maxdepth: 2
-   :includehidden:
 
    qom
    atomics
diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
index 314e9e94cc..d0d7a200fd 100644
--- a/docs/devel/index-process.rst
+++ b/docs/devel/index-process.rst
@@ -5,7 +5,6 @@ Notes about how to interact with the community and how and where to submit patch
 
 .. toctree::
    :maxdepth: 2
-   :includehidden:
 
    code-of-conduct
    conflict-resolution
diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
index 3acbd95d36..0b0ad12c22 100644
--- a/docs/devel/index-tcg.rst
+++ b/docs/devel/index-tcg.rst
@@ -7,7 +7,6 @@ are only implementing things for HW accelerated hypervisors.
 
 .. toctree::
    :maxdepth: 2
-   :includehidden:
 
    tcg
    decodetree
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index a68207052d..09cfb322be 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -8,8 +8,6 @@ modifying QEMU's source code.
 
 .. toctree::
    :maxdepth: 1
-   :includehidden:
-
 
    index-process
    index-build
diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
index c3dceb6c8a..add293d397 100644
--- a/docs/devel/qtest.rst
+++ b/docs/devel/qtest.rst
@@ -3,7 +3,6 @@ QTest Device Emulation Testing Framework
 ========================================
 
 .. toctree::
-   :hidden:
 
    qgraph
 
-- 
2.30.2


