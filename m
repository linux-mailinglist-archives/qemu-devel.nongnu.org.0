Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3ED6593A6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:13:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rH-00034s-Jw; Thu, 29 Dec 2022 19:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rB-00032D-HU
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r9-0002fO-Az
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id p4so20796766pjk.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YysLimCJ4D81VkYcj5AOVk4+aaIq43s9xyiLUf2Ez/I=;
 b=PbcXKhfrjTsaaWzpbSo9BMYIneCH59FvPIX0/mSP2NPDW79W+ndziAl5ypeBZ+gv4y
 AF2RwRpA/kTsm+7zRlDTOQjVbOPBWhbkDauuR5fBsTn5u5HqtZ+D/qI6gYdsrUsbzZfy
 W9vQ2nejIGumvGC5WRovWUV8Tw0EbhK2qe7eJvd6JXjzAbZdTLG1A+vZ2n3JCKMqrkB4
 fWPUMRf8wKwcwa8Mc5ZUKuCzAs2kZ90m0izHsAM3cxYnqU7GmtXxH9axD+EbNDUw0iPv
 HSw6xl5L0njL+nhwW8ClOu6o2HlGUIhek2F92ueD/qqcF/t9tNtLlDYWk0FGIKgKDmRh
 vjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YysLimCJ4D81VkYcj5AOVk4+aaIq43s9xyiLUf2Ez/I=;
 b=XyVk9OisHS6gPaq/VTt5ofGc+cD/RNC7YnernSp/IrxvFd/J8IP3nfn4cBKsyY59Ze
 NfibGJE/7mW5E8SLXAmmbUoVymw6MtPlLxDWxayQZJnaSeHfVwvge5uyZ2wBCRU5lwsu
 Z2Z+b/Wph8j+zPQiooNGHHkvY0j4Pcrn+oUXpWydhqCi19PEzKz3uRb/6hktnaRwK5Xy
 /onKAF9wNH4+rzjbnx6p0M2vo3H2u0FYxZ2SJXJNutTLAnlSOGVOX7BG2p5+KfAEzxGU
 MVh31g59eZEdchQAXmE8eeyxlDOFWEf4Scmdr6r7SifoxzT97EgyFYL/amav8eD5Se6b
 4ilQ==
X-Gm-Message-State: AFqh2koU0aT6Wy/3cDI/lcpdAS0lAnHlr0exF1+pBXobBlHYB9p58/uh
 71EjoQv1O5XQCV2d9jvT2lCzj+7f12PJColN
X-Google-Smtp-Source: AMrXdXv8fbejrbJNzXeCdTC2wVoIVQ22FKKfn9D8956PdujT7o9N12Tz01XYoF7g3ZMnz7xVC60DUA==
X-Received: by 2002:a05:6a20:cf62:b0:b2:3dc7:9b31 with SMTP id
 hz34-20020a056a20cf6200b000b23dc79b31mr28522995pzb.18.1672358558562; 
 Thu, 29 Dec 2022 16:02:38 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 17/47] tcg: Remove check_regs
Date: Thu, 29 Dec 2022 16:01:51 -0800
Message-Id: <20221230000221.2764875-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 76 -------------------------------------------------------
 1 file changed, 76 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a1ae761a58..c330d114bc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2900,79 +2900,6 @@ static bool liveness_pass_2(TCGContext *s)
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
@@ -4297,9 +4224,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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


