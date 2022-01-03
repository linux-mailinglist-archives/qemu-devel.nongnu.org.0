Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85873483639
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:35:45 +0100 (CET)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RFI-0006cy-Be
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:35:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RDA-0004bL-OR
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:32 -0500
Received: from [2607:f8b0:4864:20::630] (port=42563
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD8-00088z-AP
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:32 -0500
Received: by mail-pl1-x630.google.com with SMTP id u16so25299836plg.9
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PYKClXpJtU0sbwcLNNlE4HcrlQsUkribNTZlWe3q2PU=;
 b=d8N8L1K0aYrkfoQLM0BPBgIrjv5Z0FfBG7uqf1xEuqrYimGr0RW6ktXpI+z5hrbB8Z
 +pivI5t2VPtGmSKCc4W7rD6od5HowcKBEeP38wUBznQEkmzYr19TV4rUGBood4LLAB/v
 hW7Akp1e8vKhZmszS0wk1sSvHbQqy77kbHO3dGcB1knUQKq1I8De2k+6jbD1ugrvEFPb
 YbHWznRJGSZbJl+dgCahf/ftQtpztFVSmomU9bEPsgqDafaqk7Z1venJJZLkbJFVHS/a
 Zo7QaReVsjcKrLMn83Mgp0PQ5qAWeRcu2hi/g7EOOiL+iUuED5WJD5O4o9NaVU3+VQS7
 FByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYKClXpJtU0sbwcLNNlE4HcrlQsUkribNTZlWe3q2PU=;
 b=C1wphrfI9CMLusG23Qr2HRgcHCC2zJcqdLZnRbPTzUs9BhsJ9xiNFxUSiBBPuR+5KY
 Ml/+BcQRPCHcngSmgsRLE3yzbUyvmvtfuBDP7/bl4JgkSQbuLGnFZ/erAZ8kWVKuT2OD
 W2Ba/lMu+kDw/ruKuAG8Xvjf13syT8S/WDUBDA102B66IbhfzjitpRloRvrkZCzh/4d4
 FxHbaku2ZqkXQ1X7nV7RjZyOt89pZu/pYfB77ehQQu7w0Pd27+ljNsJgnkI1gDe4gdQE
 1kYXYydgSnZc1bvOhqUluAe8H6TQm1DUMDsaQinBAlwxvaSK94maNuhCkqCmp9OvuSQe
 jcZg==
X-Gm-Message-State: AOAM533ZWAa8F86twFQ4iNpdNZffcYeD0EEo2hpf3GEjU7zkag2F+N9l
 sy4VhXhFYLeVfG0gdgeERxutTxKMbQ7NOQ==
X-Google-Smtp-Source: ABdhPJwGD7WS4BGxapPmjUBj4447pK3pIdABr2lY+Jj8o1SgrRBRtrDza43UX3ne2d2h8VjAZ9X1uQ==
X-Received: by 2002:a17:902:9343:b0:148:a2e8:2c49 with SMTP id
 g3-20020a170902934300b00148a2e82c49mr46090317plp.152.1641231209081; 
 Mon, 03 Jan 2022 09:33:29 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm39348564pfk.171.2022.01.03.09.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:33:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] tests/tcg: Unconditionally use 90 second timeout
Date: Mon,  3 Jan 2022 09:33:24 -0800
Message-Id: <20220103173326.257152-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103173326.257152-1-richard.henderson@linaro.org>
References: <20220103173326.257152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cross-i386-tci test has timeouts because we're no longer
applying the timeout that we desired.  Hack around it.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Fixes: 23a77b2d18b8 ("build-system: clean up TCG/TCI configury")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.target | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

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


