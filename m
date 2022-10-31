Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F524613788
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:12:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZC-00019j-Bn; Mon, 31 Oct 2022 09:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYf-0007wU-Mq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001FG-BA
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id v7so1331121wmn.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsUrSxO/fDhmm3Ram+m3iS+dupkr822w/hREuK9Soas=;
 b=ygSohuBhA+8pxZE08YR7lkYEn8Xb0c2rqQjtViSlAfSM6oM3r3Xf6Emr/QQSJvVFTI
 /OND+Bpa3QxshJkBI+hTm9AWOXfgdmg7nuczoGWn1Pnvuwz9DZAVzGILZY6DYu7SpcJj
 oecYpuKUzzkvqMhXpqIcoeGbATwZ8RMe7ataqSVjdJcPlxR+rh85K+wVX8fouCUuIxdy
 2CuP7L2M77lAX2u4W5aQY7Y7xayVjgklDkQk2nopzxziZYOOfBEvtxpvxkXZKMEDw90w
 XmOUsfXbOcPhvwKgd8oEqKOWbnZQ1cMA35G+BUmN0Jm29gIesq71aLuafpA9+MkASe8k
 fV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jsUrSxO/fDhmm3Ram+m3iS+dupkr822w/hREuK9Soas=;
 b=bCCeFaUSk0v8n/dHIWJmUrb/rditvpfBaA3BsSnoknw7zSTea5fFZA9UoOGXIavvtN
 W//J+dYUftWa1M/zyX9L51AKOxFSh6zklV4yfW09HdLlL4hbnykmkSFwe24XAbcwQ0UI
 BsEKDoemnfgNS4SttIzpGMqg3ZrepYlKm+Ru7ugiwKDYcTBra8ES6hmTp9TyVOZKWyLN
 lwxiDqBJVaght9kNt3ySLylrhgfQxm6Ayt61mlFosS13gyjg+IssrFoccfmPqdzwHWch
 EeG0xN+FTS+aa8KaUcb1YZyB06ICQjgEg+DolAS9jBudMgWzdu4dY+ezpBtI7HmMy15y
 gl2w==
X-Gm-Message-State: ACrzQf0+zFDQJp+/Y7aXxqVqISjYZPSPZjLyK6bNh9+FZZTvXt3oR+hm
 TMQPuDEV/ElhgVXuII9Op/NT0Q==
X-Google-Smtp-Source: AMsMyM4yiFNZe/7uRMDbQ5m+5jeoYHwrEX+UQK3wDch4XFL66KFdJb9JiuDQefxYcOzqmOafOJQt9g==
X-Received: by 2002:a05:600c:5d3:b0:3cf:6ca4:b615 with SMTP id
 p19-20020a05600c05d300b003cf6ca4b615mr4752064wmd.185.1667221814392; 
 Mon, 31 Oct 2022 06:10:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a5d698d000000b0022cc3e67fc5sm6876627wru.65.2022.10.31.06.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63A0A1FFBC;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 04/31] tests/docker: update test-mingw to run single build
Date: Mon, 31 Oct 2022 13:09:43 +0000
Message-Id: <20221031131010.682984-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

While the test-build test happily run for mingw the test-mingw case
runs more of the packaging inline with what our CI does. It however
fails if we don't find both compilers and expects to be run on a
docker image with both.

Remove that distinction and make it work more like the other build
test scripts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-3-alex.bennee@linaro.org>

diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index 0bc6d78872..18366972eb 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -13,14 +13,12 @@
 
 . common.rc
 
-requires_binary x86_64-w64-mingw32-gcc
-requires_binary i686-w64-mingw32-gcc
+requires_binary x86_64-w64-mingw32-gcc i686-w64-mingw32-gcc
 
 cd "$BUILD_DIR"
 
-for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
-    TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
-        build_qemu --cross-prefix=$prefix \
+TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
+build_qemu \
         --enable-trace-backends=simple \
         --enable-gnutls \
         --enable-nettle \
@@ -29,8 +27,6 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
         --enable-bzip2 \
         --enable-guest-agent \
         --enable-docs
-    install_qemu
-    make installer
-    make clean
-
-done
+install_qemu
+make installer
+make clean
-- 
2.34.1


