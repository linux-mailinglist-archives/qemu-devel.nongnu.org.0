Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419F4F9B1C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:54:42 +0200 (CEST)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrsf-00066j-Ct
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmJ-00076Q-Bz
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmC-00031X-Pr
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id a2so4524307wrh.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvwLTF/YUpusucxnWfO5BDXCMNh2/WY9f2hzq1Kk0Rs=;
 b=UlROvWYmvYwvAXexnDDWV4lCQAc0F+rfz5pmb5lRhDA18oIrAisfVUkhqQKc+8pqJy
 ZELU+RM/ij5Nyl0YPkfWEp720ZMMoPMxaT0zFlwTDULrWaeELgUVrRUD0iFpNSZcx9T6
 ljfOQo1T6mDtyUFoatbFR/RX+AYZXSF3ixSSgjUGQlkJjSwv8IAhcVLiUSbn+YVs7TUk
 7NbA7POuLSWy5IXbJKYk5Ph1dEc7IAVhX+46M3T39SHEMvMvrOfIyt8J5AnA2zobxvV9
 fk/lBiMEAmWSHxKgq9yfyjMMN//VsV8NNZfT+ZqKkT24kWnFFHyk9w60zQXuhHRYlvX4
 Cu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvwLTF/YUpusucxnWfO5BDXCMNh2/WY9f2hzq1Kk0Rs=;
 b=FM8zqi259t5I1XXSAqjur3Wx7Gya2at493M5d63ol3eqZN98G4/0QvudM4q2+yX220
 CUxWu6cOoMA6fQQ/Wvu42qzsvjqBnCAsIb/N+uG1xYuHCxFSbtAy5Gk4xh9A0dAeC66Y
 5dWi5II5ltalWGCe0xW+IxwRdQXv1mRIXD8W4K9AWdyDGO3l1ytHs8/ZMrqYL7K2lg19
 JRby1SjSe48lNNlSEjyYgEzogugBZjkmrkk7n14LxyuI/sxTmWRX6FdJ8HfesNdhZtUq
 mUHT5nVlxzvpBj/lsiLwwRyA0X8s0iUugM0J0tjwdvpJE9hZstqTrtlA2yEb9qoqNtTr
 2Kcw==
X-Gm-Message-State: AOAM531sQstDWw6qtggareEUfXZfkDyeD4Fbj4DPONGAlmo9kqQFKaaW
 aCRb6C7XVB/VlbPZ+gVzmYhChA==
X-Google-Smtp-Source: ABdhPJwGeekeTskVfEMcENcwN9AHHmuQ0iMv0RMtpgsSh8c0Rb9PwcizA2LdHJ6bShgip3t1O5mQVA==
X-Received: by 2002:a05:6000:154d:b0:207:9101:8f24 with SMTP id
 13-20020a056000154d00b0020791018f24mr3949863wry.317.1649436467657; 
 Fri, 08 Apr 2022 09:47:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a7bc090000000b0038e73023334sm9661463wmh.2.2022.04.08.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53BFF1FFBB;
 Fri,  8 Apr 2022 17:47:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 03/15] docs/devel: drop :hidden: and :includehidden: tags
Date: Fri,  8 Apr 2022 17:47:30 +0100
Message-Id: <20220408164742.2844631-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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


