Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF13366057
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:40:10 +0200 (CEST)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwED-00059k-4g
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9M-0002M4-In
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:08 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9K-0001yt-Uf
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g9so22870275wrx.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/jch+x5fbHSlYAP492qo4ieSnFpYCmcLlzP1woMe5g=;
 b=SQ/YZd2/QPWD2zEgQSFyfFGlDpAs0O6FQlPkAmqvtyClzPENQ/oJb209qlU1foDRdd
 41xwsKFUhJj6OtpL1PlLVv1w/qz2s0x6MHPm9jHAcDmKHJiM8FhCqLSLCtSIZ6kiNJkW
 5S9Fkfuw1VCLmefuoUgyhtNfPJsbpKAd4wIVa5hcPjahnw0ixC150M07QQyZUMucd8Bf
 aJCFHtNDgSBQGfVhJ16K2EPke8/UbTnHadIaCiQc0t9i1cvT2OtJjcX1KqyI3rDehtXT
 73cfZY6z9GJxJy5jPOR2Mrfx0VwXD1/0wibasW5Stj38nLJi1f6ftIkP2J0JBGID1ZY1
 yBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v/jch+x5fbHSlYAP492qo4ieSnFpYCmcLlzP1woMe5g=;
 b=ZYemlrH0GiHG2J5ZUi6m5cWFHVEZ+5n2K1+4JQWPdWoelF/lYJ1CvrZeOK+lg5OS8N
 hn+BaLVrRC6bo2cpEVrf27+DGYc/FMGKzAf2w/50n7jZZPBTey65I9/uaH3GQYte/xxV
 C7aoVOl5CsgZFcG2TJkCP9V++gd8uAjxtpVW3X0V2v33X91/+8IhmdPt3KuZt0zSKHeY
 8DbZpT0WaqoREo2A5PLiUA9c9M7Nc45VMSbvxFLbvDlABSlSUSI0Xt7OyKh/Ay9yGC7u
 ZzTYbRqZyevopMjfawkEtEFSGADQKH/YljqIkNPcYZ3UK8r3JnvcTvIRR0cU/iR3erVc
 qdkw==
X-Gm-Message-State: AOAM531TOpl71iZuU9Nc33QOs+Vw+u236EEP3xNPy0lQagKUjt7ujTvY
 2e9DrYLD60HpWzUMO52GewgToUkVQa2Xbg==
X-Google-Smtp-Source: ABdhPJw1TTuxVm409ql8MquDA/Qigto69Hw1EPNo9ctIzNLv8VKpDYiZTOuP4RBjW6s/wfafF+qjJw==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr21935671wru.415.1618947305254; 
 Tue, 20 Apr 2021 12:35:05 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c2sm4279989wmr.22.2021.04.20.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:35:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/mips: Simplify CP0 check in nanoMIPS P.LS.E0 EVA
 pool
Date: Tue, 20 Apr 2021 21:34:50 +0200
Message-Id: <20210420193453.1913810-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420193453.1913810-1-f4bug@amsat.org>
References: <20210420193453.1913810-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nanoMIPS P.LS.E0 pool contains the EVA instructions,
which are privileged. Simplify by moving the CP0 check
at the top of the pool swich case.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9acca6ef045..03fb67f6f22 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20906,27 +20906,24 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             case NM_P_LS_E0:
+                check_cp0_enabled(ctx);
                 switch (extract32(ctx->opcode, 11, 4)) {
                 case NM_LBE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_ld(ctx, OPC_LBE, rt, rs, s);
                     break;
                 case NM_SBE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_st(ctx, OPC_SBE, rt, rs, s);
                     break;
                 case NM_LBUE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_ld(ctx, OPC_LBUE, rt, rs, s);
                     break;
                 case NM_P_PREFE:
                     if (rt == 31) {
                         /* case NM_SYNCIE */
                         check_eva(ctx);
-                        check_cp0_enabled(ctx);
                         /*
                          * Break the TB to be able to sync copied instructions
                          * immediately.
@@ -20935,39 +20932,32 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     } else {
                         /* case NM_PREFE */
                         check_eva(ctx);
-                        check_cp0_enabled(ctx);
                         /* Treat as NOP. */
                     }
                     break;
                 case NM_LHE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_ld(ctx, OPC_LHE, rt, rs, s);
                     break;
                 case NM_SHE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_st(ctx, OPC_SHE, rt, rs, s);
                     break;
                 case NM_LHUE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_ld(ctx, OPC_LHUE, rt, rs, s);
                     break;
                 case NM_CACHEE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     check_nms_dl_il_sl_tl_l2c(ctx);
                     gen_cache_operation(ctx, rt, rs, s);
                     break;
                 case NM_LWE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_ld(ctx, OPC_LWE, rt, rs, s);
                     break;
                 case NM_SWE:
                     check_eva(ctx);
-                    check_cp0_enabled(ctx);
                     gen_st(ctx, OPC_SWE, rt, rs, s);
                     break;
                 case NM_P_LLE:
@@ -20975,13 +20965,11 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     case NM_LLE:
                         check_xnp(ctx);
                         check_eva(ctx);
-                        check_cp0_enabled(ctx);
                         gen_ld(ctx, OPC_LLE, rt, rs, s);
                         break;
                     case NM_LLWPE:
                         check_xnp(ctx);
                         check_eva(ctx);
-                        check_cp0_enabled(ctx);
                         gen_llwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5));
                         break;
                     default:
@@ -20994,13 +20982,11 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     case NM_SCE:
                         check_xnp(ctx);
                         check_eva(ctx);
-                        check_cp0_enabled(ctx);
                         gen_st_cond(ctx, rt, rs, s, MO_TESL, true);
                         break;
                     case NM_SCWPE:
                         check_xnp(ctx);
                         check_eva(ctx);
-                        check_cp0_enabled(ctx);
                         gen_scwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5),
                                  true);
                         break;
-- 
2.26.3


