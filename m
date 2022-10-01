Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB775F1CEA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:44:45 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedjQ-0005Tm-8S
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCU-0003Mi-Do
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:43 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCS-0004I4-OW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:42 -0400
Received: by mail-qt1-x82f.google.com with SMTP id e20so4082421qts.1
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8MfuyolaoDT+tZpZqL/C4qLqklcFNW0LgruPwvffFJY=;
 b=wurZlAXwCCkX41HgmB72WCLBVwJFA9PjNs0h1VrpDAUvOdtJKDqU8UcPG0ZSp6Blbc
 c9YszLUv/xrdE5mWR+75uaG6VZWZ6GwqW4maAzcTrsx3326YsVv9UXDBMjnn1dZg50SX
 tISqwQ/n/uQh4Vxi6jXI3RBzHEykRX6A2f1q6jmTmuTkeDDnKC69ShBakYJOiqNgDwz7
 SyN4I5TDIxuUEOmKr7R/9Iely77KhDPuTfhGRTfm3N7L5lgngkF82SldOZyVHS29mTBJ
 HLN2ea/Hs7FQmFi31muMpHN8aKI6RxH72swcMdTJHrgnfYLvS9vyHQogSj2tdFiYS26N
 /pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8MfuyolaoDT+tZpZqL/C4qLqklcFNW0LgruPwvffFJY=;
 b=dByyfxiwve7rrZNp/wMbyBSNs4MO6QjJHFl6h+PUssjTBoh9U4zzYXaoAovBz5EW9E
 9tJJ/L2gpf3U7sps4r+ton+KvaRxcko/4XxplS0W4f4iycqoiN2lrkZaS9Y4Y5Z3800U
 SM3VF6SIoaIAsCHW72ylnYV5frsbqVna8EFUMVVQ3hmIE5LAamKacCBWwT1chlgSw2Us
 aQY0xtZW/ilMEjq/wHHfJU1FHlx7NF+kvuT0j95zFe9QOB0t3sTAh/tr4Rs4EsWlzRAG
 dQW+NiBlOb6k2DZK3ompT836ZSc9P2Q3VzhIZ+QJcJVeAg5YMWakBHhdYUJ4E32J1bm4
 Mptg==
X-Gm-Message-State: ACrzQf2aGwgP/vXC48Kq6hSGB+hfFwLPGQEC9WRC3HFYxepJilzY/FmQ
 i87fNly6QNODwzz2uqeWPRickPXzII7YJ77I
X-Google-Smtp-Source: AMsMyM4Vy1VX9v8j3RcnmDC/lNcSUeUlEFmv7N7Ju8gCUFPticHI/8LcWkJICldjskc+Eeu86rL8NA==
X-Received: by 2002:ac8:5d49:0:b0:35c:f197:e81d with SMTP id
 g9-20020ac85d49000000b0035cf197e81dmr10676718qtx.125.1664633439724; 
 Sat, 01 Oct 2022 07:10:39 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 25/26] target/i386: Inline gen_jmp_im
Date: Sat,  1 Oct 2022 07:09:34 -0700
Message-Id: <20221001140935.465607-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand this function at each of its callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f08fa060c4..689a45256c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -517,19 +517,14 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
-static void gen_jmp_im(DisasContext *s, target_ulong pc)
-{
-    tcg_gen_movi_tl(cpu_eip, pc);
-}
-
 static void gen_update_eip_cur(DisasContext *s)
 {
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
 }
 
 static void gen_update_eip_next(DisasContext *s)
 {
-    gen_jmp_im(s, s->pc - s->cs_base);
+    tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
 }
 
 static int cur_insn_len(DisasContext *s)
@@ -2767,17 +2762,17 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_update_cc_op(s);
     set_cc_op(s, CC_OP_DYNAMIC);
     if (!s->jmp_opt) {
-        gen_jmp_im(s, dest);
+        tcg_gen_movi_tl(cpu_eip, dest);
         gen_eob(s);
     } else if (translator_use_goto_tb(&s->base, dest))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
-        gen_jmp_im(s, dest);
+        tcg_gen_movi_tl(cpu_eip, dest);
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         /* jump to another page */
-        gen_jmp_im(s, dest);
+        tcg_gen_movi_tl(cpu_eip, dest);
         gen_jr(s);
     }
 }
-- 
2.34.1


