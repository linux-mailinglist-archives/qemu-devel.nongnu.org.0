Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9563FFDE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymT-0002Ym-Uy; Fri, 02 Dec 2022 00:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymQ-0002Xd-HE
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:10 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymO-0003KV-II
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:10 -0500
Received: by mail-pf1-x42b.google.com with SMTP id h28so3939006pfq.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XdAPKgeyOkFvmEss0CQhRTt3F29HQLEXkOvnMKESb/A=;
 b=ViPOMohUvT459K+5hxWhQd0M0L9Ga4elTM3cM24XCh0JrZ6P9bssQ+pws7plyxKR0A
 HwqWe+63WaaCnOk71WK8PwcHaVlaow6ojFPiSDCThljiOMSlkGVD4uM2ctikc2Eg6gzf
 U8LUM0XUA3IaM6Oe0C3MuYEIGX5Zq+O31+P431CZzA8hYnRB5lxZyLqd3CFN1XIoqhTD
 SJXMGEXxkDRIQIyeHr/qi6WwiyhudEw0cenKav2ELq/OFDsSKE9gfL9ksZwVh7aB7oV5
 UTAZtIZ020RNV/f3ATVXoD9Lq4yebQtFTFJ0udKyWiuU7ozXL7qLN/Y/liasHeZcQcBI
 xZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdAPKgeyOkFvmEss0CQhRTt3F29HQLEXkOvnMKESb/A=;
 b=eMdZmL1sL2JrcjqzmZTFyL8gaEpgoSk5MFBFzdPeyJSVpMP5W64hSTUyWpw7MvsnXi
 YYC9CuPJbHQA+t/IyBQm3GNAs5gGoN0L6PqIA5f58oEv2yFC/lnFZLlE5I3zI2Yi18EE
 BRmiNFtWUXJqb94NlddMta6+bOPdnm6QBrfjiyotsLyzGczIySoc42NQ+p/dqec6jAjk
 TL0MzTPN1fHZ7Ssq8JCSTHfjA7euzF8BxytNMuv+YchMGDygFlnGOsnXt3Vw633BsZpJ
 cbYo+ojav55Io0vI6nxkAAB/kP0UesUWZyJHL04CqV3u5kZH5jiMQz8kPT92rMBHI9Va
 YvKw==
X-Gm-Message-State: ANoB5pmXelxzssyIY6HcJSzYHaFIny2IonSfgWkd5pWVPa/mswcmlxUc
 ZE8PDksbuOIiOd0sD9o56UQ8ZhUjWX1kEIeJ
X-Google-Smtp-Source: AA0mqf7Uy8+VGC8OSFed7MBJEw8ggAi7975BxDlF+0rNGGERobRFxCR3Y1pU5OL0GpC0bUWiP9zNtw==
X-Received: by 2002:a63:fc63:0:b0:478:18d6:ad22 with SMTP id
 r35-20020a63fc63000000b0047818d6ad22mr20919970pgk.492.1669959607165; 
 Thu, 01 Dec 2022 21:40:07 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/34] tcg: Remove check_regs
Date: Thu,  1 Dec 2022 21:39:31 -0800
Message-Id: <20221202053958.223890-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We now check the consistency of reg_to_temp[] with each update,
so the utility of checking consistency at the end of each
opcode is minimal.  In addition, the form of this check is
quite expensive, consuming 10% of a checking-enabled build.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 76 -------------------------------------------------------
 1 file changed, 76 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c075c97050..cfcf959894 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2917,79 +2917,6 @@ static bool liveness_pass_2(TCGContext *s)
     return changes;
 }
 
-#ifdef CONFIG_DEBUG_TCG
-static void dump_regs(TCGContext *s)
-{
-    TCGTemp *ts;
-    int i;
-    char buf[64];
-
-    for(i = 0; i < s->nb_temps; i++) {
-        ts = &s->temps[i];
-        printf("  %10s: ", tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
-        switch(ts->val_type) {
-        case TEMP_VAL_REG:
-            printf("%s", tcg_target_reg_names[ts->reg]);
-            break;
-        case TEMP_VAL_MEM:
-            printf("%d(%s)", (int)ts->mem_offset,
-                   tcg_target_reg_names[ts->mem_base->reg]);
-            break;
-        case TEMP_VAL_CONST:
-            printf("$0x%" PRIx64, ts->val);
-            break;
-        case TEMP_VAL_DEAD:
-            printf("D");
-            break;
-        default:
-            printf("???");
-            break;
-        }
-        printf("\n");
-    }
-
-    for(i = 0; i < TCG_TARGET_NB_REGS; i++) {
-        if (s->reg_to_temp[i] != NULL) {
-            printf("%s: %s\n",
-                   tcg_target_reg_names[i],
-                   tcg_get_arg_str_ptr(s, buf, sizeof(buf), s->reg_to_temp[i]));
-        }
-    }
-}
-
-static void check_regs(TCGContext *s)
-{
-    int reg;
-    int k;
-    TCGTemp *ts;
-    char buf[64];
-
-    for (reg = 0; reg < TCG_TARGET_NB_REGS; reg++) {
-        ts = s->reg_to_temp[reg];
-        if (ts != NULL) {
-            if (ts->val_type != TEMP_VAL_REG || ts->reg != reg) {
-                printf("Inconsistency for register %s:\n",
-                       tcg_target_reg_names[reg]);
-                goto fail;
-            }
-        }
-    }
-    for (k = 0; k < s->nb_temps; k++) {
-        ts = &s->temps[k];
-        if (ts->val_type == TEMP_VAL_REG
-            && ts->kind != TEMP_FIXED
-            && s->reg_to_temp[ts->reg] != ts) {
-            printf("Inconsistency for temp %s:\n",
-                   tcg_get_arg_str_ptr(s, buf, sizeof(buf), ts));
-        fail:
-            printf("reg state:\n");
-            dump_regs(s);
-            tcg_abort();
-        }
-    }
-}
-#endif
-
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
     intptr_t off, size, align;
@@ -4328,9 +4255,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
             tcg_reg_alloc_op(s, op);
             break;
         }
-#ifdef CONFIG_DEBUG_TCG
-        check_regs(s);
-#endif
         /* Test for (pending) buffer overflow.  The assumption is that any
            one operation beginning below the high water mark cannot overrun
            the buffer completely.  Thus we can test for overflow after
-- 
2.34.1


