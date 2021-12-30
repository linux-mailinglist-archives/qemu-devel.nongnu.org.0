Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9A4820E7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 00:56:13 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n35HI-0000dr-GG
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 18:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n35Fd-0008O0-GV
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 18:54:29 -0500
Received: from [2607:f8b0:4864:20::102f] (port=44549
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n35Fc-00079f-0I
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 18:54:29 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so7059415pji.3
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 15:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ce4EdEvJ54s5dx2BGommxFo4mh0NFq12faqUaOkjkjI=;
 b=CjdDUc46QN6KgW53A6Tml8tIFPrg68RvGuAgCzZu5rwvLzkKouZVXXn+3LQaLQvBNb
 FZVqZ8KRv8Lcsid1qD08pDWBaEwYkQJXgPHgMmjfU4E0Ov1mFfgHBXpSUQtqomCnXgSB
 bA0g+pZjFZsWnr/ZXCDQ49clpxHMzTprFda6zp6N7PqkPfqqqkj2lgh6YQA2onGBHppB
 CajPAt1pm9djUzsYhljUQc6oF9Kp9ivHT4UggA7uRvjB9sorGP/HI6fP8IxLmWwHwWu6
 LxL5vt57zna894xrotv7tBHl5YrSspvfSzQxoVgRwHY9nSl4zq2ysWD1ijKgKEnihGCe
 YMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ce4EdEvJ54s5dx2BGommxFo4mh0NFq12faqUaOkjkjI=;
 b=2cUbvMdCy67xplP7e+G5ShLa7QHp91h7BHtspV8oubOsf1VYAK4vhidTjI5ufcqHAb
 4UtYCUhOI0nC2vID+3Y6LMXe6s3ZS0xwUVPBlM6WfhUmfwi/5k8FIUrvp46v+kOkKISF
 jGs3K7yeajbyVlMsxXjsm8mVkr3cAEsaTAgJVIM4IZhz43hbhKu+r0MSvDz4xNfBDIw4
 7ETCR0og/WcKueibJ8qTVA+/n0Z1d54QKWFRYL1zlohGncBdwtW7Z2bxhlLiQOehu3gU
 wFzqYeqau1pE8ZzRQLcPxNiQaqtPnJKT82mZDeGQmY3V+F8m2NAm8DZzpWHYzqq+yy+R
 2l5Q==
X-Gm-Message-State: AOAM530FGREbOqLk+Gq8HKCSCXmyl8VnIZbSU06cHNlnHC6yeJIpzOzt
 2pqtji5cyKzexMgpTezEoD61qZwT+XyHtg==
X-Google-Smtp-Source: ABdhPJwsW3bMtdyHF2Ax+A6dnwppvMbc+k2vh6O+TpTFRhL2b4qjD2m0x5ptbpwLfH1OcSj5FyFrYQ==
X-Received: by 2002:a17:902:b189:b0:143:8079:3d3b with SMTP id
 s9-20020a170902b18900b0014380793d3bmr33508867plr.71.1640908466250; 
 Thu, 30 Dec 2021 15:54:26 -0800 (PST)
Received: from stoup.hsd1.or.comcast.net
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id u71sm23421858pgd.68.2021.12.30.15.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:54:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: Unconditionally use 90 second timeout
Date: Thu, 30 Dec 2021 15:54:24 -0800
Message-Id: <20211230235424.49155-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cross-i386-tci test has timeouts because we're no longer
actually applying the timeout that we desired.  Hack around it.

Fixes: 23a77b2d18b8 ("build-system: clean up TCG/TCI configury")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.target | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
---

This fixes the persistant timeouts that we've been seeing in
gitlab for the cross-i386-tci target.

---

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 63cf1b2573..0f8645f782 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -82,13 +82,12 @@ QEMU_OPTS=
 
 
 # If TCG debugging, or TCI is enabled things are a lot slower
-ifneq ($(CONFIG_TCG_INTERPRETER),)
+# ??? Makefile no longer has any indication that TCI is enabled,
+# but for the record:
+#   15s    original default
+#   60s    with --enable-debug
+#   90s    with --enable-tcg-interpreter
 TIMEOUT=90
-else ifneq ($(CONFIG_DEBUG_TCG),)
-TIMEOUT=60
-else
-TIMEOUT=15
-endif
 
 ifdef CONFIG_USER_ONLY
 # The order we include is important. We include multiarch first and
@@ -144,7 +143,6 @@ PLUGINS=$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c)))
 $(foreach p,$(PLUGINS), \
 	$(foreach t,$(TESTS),\
 		$(eval run-plugin-$(t)-with-$(p): $t $p) \
-		$(eval run-plugin-$(t)-with-$(p): TIMEOUT=60) \
 		$(eval RUN_TESTS+=run-plugin-$(t)-with-$(p))))
 endif
 
-- 
2.25.1


