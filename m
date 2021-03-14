Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66D33A864
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:59:44 +0100 (CET)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYlz-0002GQ-Me
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHK-0006QE-1W
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:02 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHH-0008K1-QR
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:01 -0400
Received: by mail-qk1-x72f.google.com with SMTP id z190so29892186qka.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ikw13dOWP7lAlgKFWW7kJaboNeemcm515c1euWh3qoM=;
 b=XbhgSV0+XSAV3sXwI0vtpgVL+rOXB5MIKHC9EmSPetHvOchpFtEnUbij/s39OiPeqR
 xqzWkP148XpBe4jlXW+UyugLp9TLHda45zw7AWYUQ7jzl1kOP9ebuLXelTTiwtrmyGAp
 /UuJzkG+sH0mOjAltt/HGXckk+IrI9xY7I1pkZM0dKe2oNHJdlKFZrp6omVL3kmgK79J
 ytbBtPUeTVJDtqyyVPcZow6RFmt+IchKj5OnJijMecIa6MWkXrwfyjUGyWwGlrvIVRfo
 OFgiBIhWFn04e2j2BYKZ0Z2VtDPjg77ZGKhTuA1OUc9pyeQc2FN3g/sEcSihTH0rMG61
 r1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ikw13dOWP7lAlgKFWW7kJaboNeemcm515c1euWh3qoM=;
 b=KNl8I4eK6c9SbLaZyPKXECO92aY8Z4osbPtDErIJVsYGomFMsAtYvoHX6LhKbouA9u
 n+5a3Ol96kbPPaRBcRCrH/uA7wDZr+bGyCOiq2kAUNSJ4UWlY4G7tZPbQWkqKrq9N3WH
 rEYDzLb1wa4/50d0ZV8mAjdTNCyFEKQau6dD9BLpyr5gJNbD0wVuX60yf/yfQnMJ1FIs
 uafJkxvK84dSglpLDCZYuU3hnksxGOUEduM9df5Z/YSAlMSkqRqJouMQqPYx1kqmqJ4S
 R79RdT7E/bqOCOKAkDs7j4cj/BP5Im0Wxftyg3LZwD6Rv0sDxXOIdh8K6526gEWnwBJX
 ohkw==
X-Gm-Message-State: AOAM533ZVKOYUMcd8PB2525/azGzmgkIwS4lBQ+RTmYA9fpJMmTNnur9
 w5E6eIvw9KvlvyfW5MegYqZkyaBWQ6QU4qTK
X-Google-Smtp-Source: ABdhPJzBHS9tvbMYGkQbIYSp130yJNGn4It37GzCfEAEaoZlYQxkWipSwo5gvy3KFVYFuzRx0U4Meg==
X-Received: by 2002:a37:a404:: with SMTP id n4mr22138457qke.439.1615757279036; 
 Sun, 14 Mar 2021 14:27:59 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/29] tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/
Date: Sun, 14 Mar 2021 15:27:24 -0600
Message-Id: <20210314212724.1917075-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These variables belong to the jit side, not the user side.

Since tcg_init_ctx is no longer used outside of tcg/, move
the declaration to tcg/internal.h.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 1 -
 tcg/internal.h            | 1 +
 accel/tcg/translate-all.c | 3 ---
 tcg/tcg.c                 | 3 +++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a19deb529f..eef8857cca 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -690,7 +690,6 @@ static inline bool temp_readonly(TCGTemp *ts)
     return ts->kind >= TEMP_FIXED;
 }
 
-extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
 extern const void *tcg_code_gen_epilogue;
 extern uintptr_t tcg_splitwx_diff;
diff --git a/tcg/internal.h b/tcg/internal.h
index f9906523da..181f86507a 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -27,6 +27,7 @@
 
 #define TCG_HIGHWATER 1024
 
+extern TCGContext tcg_init_ctx;
 extern TCGContext **tcg_ctxs;
 extern unsigned int tcg_cur_ctxs;
 extern unsigned int tcg_max_ctxs;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 40aeecf611..b32760c253 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -218,9 +218,6 @@ static int v_l2_levels;
 
 static void *l1_map[V_L1_MAX_SIZE];
 
-/* code generation context */
-TCGContext tcg_init_ctx;
-__thread TCGContext *tcg_ctx;
 TBContext tb_ctx;
 
 static void page_table_config_init(void)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 65f9cf01d5..77335fb60f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -149,6 +149,9 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
+TCGContext tcg_init_ctx;
+__thread TCGContext *tcg_ctx;
+
 TCGContext **tcg_ctxs;
 unsigned int tcg_cur_ctxs;
 unsigned int tcg_max_ctxs;
-- 
2.25.1


