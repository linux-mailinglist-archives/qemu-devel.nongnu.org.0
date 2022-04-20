Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F39508F83
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:34:25 +0200 (CEST)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF9l-0002nd-1e
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkp-0001j6-V7
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:40 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEko-0001YO-6r
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id i27so5148101ejd.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6oZK93Q7Oeo4Gko9Rhbk80LRDXtr6TuNPVGAvD0uAo=;
 b=LY6o4i3lYA7dwux/U/FYoQ8TSXIqMG+xfK55se/D1qKx0Oj+r3bQ/FrjFpFJ+VN4IN
 4D2fhnXbEFxRoe7GBko+CFlq17eHl0+AtScTr6difLJ/PJIY+LftLgTTi0BScz+nydyq
 cJSQOkRE8kubqvy8dIRSpiTlLjXs8fRhbmwAAAtpw1aiYHsz4su8R6d6jWldMFWkwlUN
 XMXkw+6DStBVEsiyZvtOrPSf3ZzRyGvoa9da0TQEM70F0vtl6m86gpF7R8knEfRmwWZR
 vPSJHOKX4WlJRTH5ORM/6tmvuVoJ7bW+sDc6A9OjcqwAZyZc3SVA1cvu0PK7VvTwilGJ
 TWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6oZK93Q7Oeo4Gko9Rhbk80LRDXtr6TuNPVGAvD0uAo=;
 b=amHwQMmhyOJL8+dabe/+wCuJP2Dhzl486DdDMkmfBO6NBUEWgU0S7tIQXIUelMRvcy
 5hCXE4zAFHaIIlT/6LTN4JiDwMj/++qkfY+VvEkgDii9RRogiErEgd1HxUcKYGwkT/li
 sfoxGxn2jO6oqI5qg5prVMZKeZ7cU9A8H/U6o+rFXutPWzCqAj9+4UwzIMaylXdXsTm3
 cUDxecv+TZPvrVh6drdkC0bi0LErsz8fEkIy8qCLJ5/QQ4CxG2CgGSBKQfu0Ra1tnipX
 B+IexNCd0HNYzkY6S45kXLJMA5LZ+U+Lx0Aka4QAxhUImlIgrj4lIEMjYgmOWEbXUPzQ
 lLIg==
X-Gm-Message-State: AOAM530egDkz5UK9DR8CzPQnJ7aY/BnpJQ1H8J1UD5U4Hj++rtiKnYfC
 iZ5+5U6I0msOUoRAPp0RZJJ5ig==
X-Google-Smtp-Source: ABdhPJxZFkIiv/PvlqzCQqdotB8c5B+QBP8oFSvt9w4krWFW7OgqOllX8kjYUQ5uRk96xgSusqbRhw==
X-Received: by 2002:a17:906:7210:b0:6d6:7881:1483 with SMTP id
 m16-20020a170906721000b006d678811483mr19407287ejk.227.1650478116737; 
 Wed, 20 Apr 2022 11:08:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ch26-20020a0564021bda00b00422dfcce6e2sm8096410edb.50.2022.04.20.11.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 974121FFBB;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 03/25] docs/devel: drop :hidden: and :includehidden: tags
Date: Wed, 20 Apr 2022 19:08:10 +0100
Message-Id: <20220420180832.3812543-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was confusing and in the case of qtest was hiding the details of
the qgraph sub-document in the qtest pages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-4-alex.bennee@linaro.org>

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


