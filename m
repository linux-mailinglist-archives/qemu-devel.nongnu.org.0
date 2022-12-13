Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B764BE6B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:30:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmd-0000aQ-PA; Tue, 13 Dec 2022 16:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmb-0000ZY-FS
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:49 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5CmZ-0003Bt-Qo
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:49 -0500
Received: by mail-oi1-x22b.google.com with SMTP id t62so1010905oib.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u4Ky9gC35TAkBsuNbUJu2Aor4xy7gS6Z6s1EhQume6U=;
 b=oD6eZdeIJj+22opYimFKb4iAGMx2kgqr+sjRTrG41pIDYtz9li2BFiqoLhO5gAMEMP
 Wn611PgtHe9GcmZELCBTU1WQtpd5ivt3qswvQk/HNUdHP3PN+V6iVoHPLaWIx7jj6DEN
 R55PlVn6UYOginAoCyilb5kfBfPiuSFzn+jz65q2a2lDaiWTnbUUNIvzuI2L4eKsWBWT
 arT3alA9+/j5uw5bfPKT/2R2KSKIg6m9ZsMnCdMXKnmMG4U4YrnvsYXSt7pml38+dWWy
 UJZeKLM6mlPfwncoNrwrg8ho9Z97ig1BY6BEsl2VWCLGu/aXSTYes184q2E10ka8WX7W
 CkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4Ky9gC35TAkBsuNbUJu2Aor4xy7gS6Z6s1EhQume6U=;
 b=gs0xjmavqqlw6O0fQvigJyAvYstaaPhfQf+noer0wP3jb4UgNjRrMaNck2YDYEZ4aU
 peyUG4BrouFQCRH2tvOHEJbwR+Bbm0Y8km4aKOSHhL7Q1BhUfeCUzSD0RKOYiZId3WN5
 nYauPCBmN2/wXo8jgOAH2gC4PhzqHF4sa4nd0jk9mS/MMwctEJVRzx3/1F5HWVPpGn5X
 pFxQHpbQAlNdcEmba9J61QenzhdsEHTF7ezRmXgxSU5xnm1fJnA/azVnjU0G1exObUfN
 KT4KuRBXk8BIKk3qUxjk1YMt3YdCXUChUZubr5gyGQAqsanIirTXdmr4SgF4tC7hv6Gj
 UOUQ==
X-Gm-Message-State: ANoB5pkMWNYWJKpC6etBXlOJCENdSayPhMRCu3qjDdxqKrNnZUw2fcST
 cOLbs50GlihRjRo903hCiLp6j54ES0YXlsv1Eps=
X-Google-Smtp-Source: AA0mqf5DmdpLuFzSJ+caLMCC+maoyVhG0fYsBqtvTVM14acnRDmAyTP6asMBHiPOK4VijOO4izWRrA==
X-Received: by 2002:aca:f057:0:b0:35b:dea6:18fa with SMTP id
 o84-20020acaf057000000b0035bdea618famr8897962oih.36.1670966746314; 
 Tue, 13 Dec 2022 13:25:46 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/27] tcg: Remove check_regs
Date: Tue, 13 Dec 2022 15:25:17 -0600
Message-Id: <20221213212541.1820840-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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


