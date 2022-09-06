Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699D5AE6F9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:55:04 +0200 (CEST)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXAQ-0005Mk-1I
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWm-0000Gs-IU
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWk-0003cG-Pb
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id b17so1317079wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=e4npXQ7DLvxtByjVYox+uTI8xWGyZxkDNG6TBVozSlU=;
 b=Z83udYujk4ZpZ+iWoJ6YIeTqUwY6+MIaEucDlXHjNa+AcYet5NaVyJtRqpspgmnZGV
 kkAOHg8Yq8NDyI47j9x1iiI8mv4MFd2Hq+kSctbpkLifCvq+5dJxlNV8O2wbrFqBloBc
 t9/QxApXtO4T/mwnXdoJFsv5KNy/wZPD7urfBtnq6Vl3ujXXhlg+tsyseycv16tKStWO
 82cSAar6fiDEmn75XTjHE7gZlssfLg6WFBE8+Tlx36UQC51AttFLaRiZNKfg5DSbY5+z
 BsHNbbMHN8uH2oxAh49toOQ4681XdkW2NjT2C29S9a5w2uPReqOhkyZzih88quj5Cemw
 rGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e4npXQ7DLvxtByjVYox+uTI8xWGyZxkDNG6TBVozSlU=;
 b=sAkDh/otVnb8d/QlUChdyOdOxvpYUM+A7KpAOOZ/xwdXtoTgnH07X1ufOYMfADGi/S
 QC0YoJeo+ZkEMfvCRcajArEIclf4j2znGIaJbsn1zbvCcB98m6zaTe5JtuwsxPQyXbDT
 91E1gQQmqfNyJvy1/7R70hDjPRf1VGBiyWNqFrv2Ai8TIxvFIA02fF988EyySsawy0mU
 CEhEaNGCI+ode91vy822jGTeFuRfFjBtgvzcIYeoVR+cJ1nfBQ93GIxzR4thhXw3QdUy
 GRjv1mF84yYGbpIxCw+iJUgiBnUnNmx+9PfJhC2agVSlgrdBk6zjeiwDAIQxI/f/iv59
 161w==
X-Gm-Message-State: ACgBeo2BYFrywtEiyPhG07mdXcapU3JoFWb/Fo8AYGWXSkPVupwBRoHP
 vxJHujr6YHV2TM4QdagNwdazaVbCtLi52g4I
X-Google-Smtp-Source: AA6agR6sgMAg989vTVuc30cGul4WOrCZDWD55JppIJA5ZvOWbCXNF6+TiGPnGraFYLmi49xEVSz5Xg==
X-Received: by 2002:a5d:6d07:0:b0:220:68a1:9ecb with SMTP id
 e7-20020a5d6d07000000b0022068a19ecbmr28045621wrq.116.1662458993305; 
 Tue, 06 Sep 2022 03:09:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 20/23] target/i386: Use gen_jmp_rel for gen_repz*
Date: Tue,  6 Sep 2022 11:09:29 +0100
Message-Id: <20220906100932.343523-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subtract cur_insn_len to restart the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e27f36e4e9..7a9e533c6e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -224,7 +224,6 @@ STUB_HELPER(wrmsr, TCGv_env env)
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
-static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
@@ -1277,7 +1276,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel(s, MO_32, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ(op) \
@@ -1297,7 +1296,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel(s, MO_32, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ2(op) \
@@ -2751,11 +2750,6 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_jmp_tb(s, dest, tb_num);
 }
 
-static void gen_jmp(DisasContext *s, target_ulong eip)
-{
-    gen_jmp_tb(s, eip, 0);
-}
-
 static inline void gen_ldq_env_A0(DisasContext *s, int offset)
 {
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
-- 
2.34.1


