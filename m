Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056303542FA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:48:14 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQWT-00042D-23
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHR-0001WY-VG
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:42 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHJ-0001p4-2u
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o6so2862562wmq.3
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JhZpQG5mMQ79/nAvtg+AVfjzq1Z9qY3ELTdEF/RZurI=;
 b=bRQJfs+9hOPjRSgH4Dezuzkx4Qb9ShCQl2ywFsRc6XoicFmhFf8YH/BFyLAEq+u3If
 teP6xDCajIgsq8T09jexafqKPjgDDSJAlkKdYFCbWojtfyzjGXugIVXuj30LhZp68POu
 GT78PyegC0t5KaXOr9QW62gETyka5bRoiRYsKYbkk5xxGE56L1RB4XAhzO/CEXxJynQZ
 uRZCw0yH/AX6limoUJkj9krHKyi/vk1alkJ3mVPBAbgv8XMsicUquKZdzcnbaw4M/X7p
 PSogNtOX4xfoGBuL+g32wv/rtqQPZ7GdpXY3HZz6HKCfQgEm5EM7Hh/eLFriB750MQKp
 gIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JhZpQG5mMQ79/nAvtg+AVfjzq1Z9qY3ELTdEF/RZurI=;
 b=YM8ECHvriJ40GacTle9RMeN1PCKy3iALhzVIyUsqOKiZRaesRGMe0s9P/nEwm4GeCH
 OwbrMQ3hMWDLTW6pZcU5ItaP0XxWUwFN//lfCdodAYX6JgRyjUaqqjR42PfMWzHGV9SC
 a+WLAwoPBvf8iWopTgxZ12Ak4m0I62A5zOMY86qAkpfFJrkvC8rItj8yeAVzNq1XAIZw
 VNL1djEIwA3uE/sqnZQ3sXmekcSK7klNcmIRbsb6VdyAiWW0/ofOb4tPla9F97QmvRDY
 uEdAM0+MYJfEJPdjOMJjCuacstzSAKd+xztdDbAqUGeF9ACEBfd0GIIuSvOAPNHcTKWj
 m1YQ==
X-Gm-Message-State: AOAM531XOdp6alFm/9DcRRlfl1tT96JBDU0l7y07bN48tyZULoGvdFZo
 bfiqLSFF4ahmlqoryx3spJj8zjLpqTUz6A==
X-Google-Smtp-Source: ABdhPJzOEX98nZVcBJbwT2Gj5t1w+ohBeRR6WbLF+RlwTHhQqEj7XSOwe0dFktufEw2eyL5DKd3ANg==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr25533609wmq.29.1617633151703; 
 Mon, 05 Apr 2021 07:32:31 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:31 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 21/27] arcv3: TCG instruction generator changes
Date: Mon,  5 Apr 2021 15:31:32 +0100
Message-Id: <20210405143138.17016-22-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 target/arc/translate.c | 180 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/target/arc/translate.c b/target/arc/translate.c
index 1712fcc9c3..6b2102394f 100644
--- a/target/arc/translate.c
+++ b/target/arc/translate.c
@@ -303,6 +303,15 @@ static bool read_and_decode_context(DisasContext *ctx,
                                         cpu_ldl_code(ctx->env,
                                         ctx->cpc + length));
         length += 4;
+#ifdef TARGET_ARCV3
+    } else if(ctx->insn.signed_limm_p) {
+        ctx->insn.limm = ARRANGE_ENDIAN(true,
+                                        cpu_ldl_code (ctx->env,
+                                        ctx->cpc + length));
+        if(ctx->insn.limm & 0x80000000)
+          ctx->insn.limm += 0xffffffff00000000;
+        length += 4;
+#endif
     } else {
         ctx->insn.limm = 0;
     }
@@ -747,7 +756,14 @@ arc_gen_SR(DisasCtxt *ctx, TCGv src2, TCGv src1)
 {
     int ret = DISAS_NEXT;
 
+#ifdef TARGET_ARCV2
+    writeAuxReg(src2, src1);
+#elif TARGET_ARCV3
+    TCGv temp = tcg_temp_local_new();
+    tcg_gen_andi_tl(temp, src1, 0xffffffff);
     writeAuxReg(src2, src1);
+    tcg_temp_free(temp);
+#endif
     return ret;
 }
 int
@@ -770,6 +786,169 @@ arc_gen_SYNC(DisasCtxt *ctx)
 }
 
 
+#ifdef TARGET_ARCV3
+/*
+ * The mpyl instruction is a 64x64 signed multipler that produces
+ * a 64-bit product (the lower 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv_i64 lo = tcg_temp_local_new_i64();
+    TCGv_i64 hi = tcg_temp_local_new_i64();
+
+    tcg_gen_muls2_i64(lo, hi, b, c);
+    tcg_gen_mov_tl(a, lo);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * The mpyml instruction is a 64x64 signed multipler that produces
+ * a 64-bit product (the higher 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYML(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv lo = tcg_temp_local_new();
+    TCGv hi = tcg_temp_local_new();
+    tcg_gen_muls2_i64(lo, hi, b, c);
+    tcg_gen_mov_tl(a, hi);
+
+    tcg_temp_free(hi);
+    tcg_temp_free(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * The mpymul instruction is a 64x64 unsigned multipler that produces
+ * a 64-bit product (the higher 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYMUL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv lo = tcg_temp_local_new();
+    TCGv hi = tcg_temp_local_new();
+
+    tcg_gen_mulu2_i64(lo, hi, b, c);
+    tcg_gen_mov_tl(a, hi);
+
+    tcg_temp_free(hi);
+    tcg_temp_free(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * The mpymsul instruction is a 64x64 signedxunsigned multipler that
+ * produces * a 64-bit product (the higher 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYMSUL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv lo = tcg_temp_local_new();
+    TCGv hi = tcg_temp_local_new();
+    tcg_gen_mulsu2_tl(lo, hi, b, c);
+    tcg_gen_mov_tl(a, hi);
+
+    tcg_temp_free(hi);
+    tcg_temp_free(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * a = b + (c << 32)
+ */
+int
+arc_gen_ADDHL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv shifted = tcg_temp_local_new();
+    tcg_gen_shli_tl(shifted, c, 32);
+    tcg_gen_add_tl(a, b, shifted);
+
+    tcg_temp_free(shifted);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+#endif
+#ifdef TARGET_ARCV2
+
 /*
  * Function to add boiler plate code for conditional execution.
  * It will add tcg_gen codes only if there is a condition to
@@ -1208,6 +1387,7 @@ arc_gen_VSUB4H(DisasCtxt *ctx, TCGv dest, TCGv_i32 b, TCGv_i32 c)
     }
     return DISAS_NEXT;
 }
+#endif
 
 int
 arc_gen_SWI(DisasCtxt *ctx, TCGv a)
-- 
2.20.1


