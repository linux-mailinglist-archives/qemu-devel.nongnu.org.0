Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CA127AD7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 13:16:55 +0100 (CET)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiHDB-0002qU-W0
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 07:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iiHAs-0000eI-41
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:14:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iiHAq-0001Hi-Rc
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:14:29 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55698)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iiHAq-0001D4-DQ
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:14:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id q9so8723044wmj.5
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 04:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mqhw4oMb9/NPBlcysMR2z8rn68YPooniQZ6sAVo6tJ0=;
 b=ZjNjiRx8twV7r7+gDAfFetdXMlwhJqPIbx6ucz1bkg2WTBQ65zsfXdZ6bWzGg75osI
 RveYQ69dK0KRWzVlr3gAANejDTCO64FH6EL9b2yVg0r6cxKTVjJmKgalnVs/ItXs/ntF
 ZiVEUaxfhtoseX0kfUa/hRkvCcR850ZvKCguWrAhZVzC29VPnHB+5/+aRgH82mguyjlZ
 l7tTyKH0C6cpSl16+rcUKLr+yPYwZQXlNJ2j2gff//6IOWb+yDcTnM105NcBEpg8gxNW
 Xrst8kRSTF6jTMtz0VrZrKr2LG83544ls95VrKT5lihLI9ozgPGjgPR/9S0TFyHcgQVc
 NQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mqhw4oMb9/NPBlcysMR2z8rn68YPooniQZ6sAVo6tJ0=;
 b=PeNL8FJUbIDxiZ8cnwsvwjygV8fT6pakWnCNNrAdnVJTqvzCwgmuzKOUkwAf/lfnE2
 8DLahxGOU2VQqWGL96YxAvmoSwLM7ujWAiSOYwPvKBkeC4Cb5bNKpWEhAxHxT0bXSZN/
 r2oLndpNA460N5TxCZExYPjfe0S/B6ui/HzLU/gk0oT53cUnbvhiWNUX1S6d1cXMcimX
 JqIBg44Z1jsL05Es4BlqWpzyBvYLQpQDzeL8BVBrZ5iWblUxgj0EjvXfPOU5or8dnDRn
 TaxWxBSLkaY+QX8IEo6ZfJwDZkoniOShWzM2bvBz6b4H+hJcowMWa8nKD6hyACnnbtVJ
 kc3g==
X-Gm-Message-State: APjAAAUTvKpQS9mMGQuls4NP/dBiU3XasGFq0e+p0lglbkBrs3X/WmFE
 l78EVlufT1aYZtqX5eK/yspJqQ==
X-Google-Smtp-Source: APXvYqz3zKpcyP9wMce69R4A7l/cxBKZ8dSDb/dkeA+A0nj9+W4tUOSWZQkpxTtcP1Y+94wzhehxkw==
X-Received: by 2002:a05:600c:54b:: with SMTP id
 k11mr15752965wmc.63.1576844067287; 
 Fri, 20 Dec 2019 04:14:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o4sm9334239wrx.25.2019.12.20.04.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 04:14:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 585F51FF9D;
 Fri, 20 Dec 2019 12:04:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/21] tests/tcg: add a configure compiler check for
 ARMv8.1 and SVE
Date: Fri, 20 Dec 2019 12:04:30 +0000
Message-Id: <20191220120438.16114-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220120438.16114-1-alex.bennee@linaro.org>
References: <20191220120438.16114-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: damien.hedde@greensocs.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 luis.machado@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need this for some tests later. The docker images already
support it by default.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 210e68396f2..e0d1fbb182f 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -216,6 +216,20 @@ for target in $target_list; do
       echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
     fi
     echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+
+    # Test for compiler features for optional tests. We only do this
+    # for cross compilers because ensuring the docker containers based
+    # compilers is a requirememt for adding a new test that needs a
+    # compiler feature.
+    case $target in
+        aarch64-*)
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -march=armv8.1-a+sve -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+            fi
+        ;;
+    esac
+
     enabled_cross_compilers="$enabled_cross_compilers $target_compiler"
     got_cross_cc=yes
     break
-- 
2.20.1


