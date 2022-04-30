Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F3515E0B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:08:28 +0200 (CEST)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknlr-0000mv-8B
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAr-00055A-Vb
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAq-0006XJ-He
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:13 -0400
Received: by mail-pj1-x102f.google.com with SMTP id e24so9298872pjt.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/27qRMF/7/SVCIffe/0N75Mp/N/kT0yltHM3qggU1zM=;
 b=yQ/fel4m6s85ma0A3x/cRZwAJELQoIY1IJmGo7Ibtr1JyESfIxFHOmKYOjUFtRM7fj
 B1OsfgSVLloxJ73FrUkQfJ/oNzwY1DYtTNmxiAxVP6fzwiVVxMS0/N9bsMhaWAOHZg5N
 rx3HT8KNqAyMX6qqpDN28bdsnhOh8GBd6qYq1o/4VcOGXdN+zy0wk4+yqDPZ0LsS5pcs
 reRwtPmYXoMnR6TabcD4YfQmrF97d4INqvcw7eQZdrWxOnfUZA/SrmUoQV0iJp+aQ5k8
 fvvUnL5n7kD1IoJdnGsPqxWM7oEZcI9l2EpFiM3qIpYlSdgvotIYQXTeT9JHd2foxBsx
 23SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/27qRMF/7/SVCIffe/0N75Mp/N/kT0yltHM3qggU1zM=;
 b=6GC7aA1LKs/AX+1sHk5vcF2TSFeNK5Lwx/u5tDrxbVPtwYmfjYFXJszgY1zSn+3+jx
 OB6nhZIrBLnjZm/Tckd51upnq2my5K4mcbWXt9etz86QTS5dmHDcx5vx+inST7ISUJ06
 o7pJK3HLNnypEcOHrZ5PFP/TU8RpFZ2tLitT3ALTWv7kK2iDgaiTOhpiGNSGsqdBs0P+
 Nl86wde8XBWJzPMBvJjmctnj/jBSKRKpMRSz1M6bifKtsIkyx9vKs9Yjgji5J7AMER/z
 IDV25iYMlF5WSviIJ/rF7HTzQHW7Byzt9AMS2gWs48fZXSei1cwBxbF844qx6WXYqB0W
 cqhA==
X-Gm-Message-State: AOAM531NHPUPd3xZetXz12E1JM7Gb99CzhAw7Bn7yg6zCja0Q7YJmIRf
 wEavJkcbrvrojiwPrq9cCqc3lXnaRSqKzw==
X-Google-Smtp-Source: ABdhPJwPaObPWNVccq+J6KfWrkoHOGH/8hj2hwMr0rwSxdPj7ndYBjDo+HgBhyRM4M2Ev7AW0IhH6Q==
X-Received: by 2002:a17:902:8644:b0:15a:3b4a:538a with SMTP id
 y4-20020a170902864400b0015a3b4a538amr3729895plt.146.1651325411272; 
 Sat, 30 Apr 2022 06:30:11 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 38/43] target/m68k: Enable semihosting for non-coldfire
Date: Sat, 30 Apr 2022 06:29:27 -0700
Message-Id: <20220430132932.324018-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The libgloss m68k-semi.txt spec says that bkpt #0 may be
used when the halt insn is not available.  While halt is
available for 68060, continue to support bkpt #0 for all
m68k processors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index b7adc8f53d..51c546f26f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2775,6 +2775,15 @@ DISAS_INSN(swap)
 
 DISAS_INSN(bkpt)
 {
+#ifndef CONFIG_USER_ONLY
+    /* The non-ColdFire semihosting insn is bkpt #0. */
+    if (!m68k_feature(s->env, M68K_FEATURE_CF_ISA_A)
+        && !IS_USER(s)
+        && (insn & 7) == 0
+        && maybe_semihosting(s)) {
+        return;
+    }
+#endif
     gen_exception(s, s->base.pc_next, EXCP_DEBUG);
 }
 
-- 
2.34.1


