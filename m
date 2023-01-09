Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F522663157
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRk-00032R-Uw; Mon, 09 Jan 2023 15:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRi-0002zG-GQ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:38 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRg-0007Pp-Nq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:38 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s8so2451504plk.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQBI7dFc7kEPaCFgnTuGOTxG1+cWJVCWRSLqHnmhHaM=;
 b=mSgoQdZAGFPyHy/K1k3k5fZJihneAhKlsarSudgxWO6hg2cRUw9DTBLQxDkpfJdud2
 iEEpwHG+STLd8nLgHY6/TEBTJkHYN3u6p4tCISQI+duMsbu07IdVbCQW6jgmI5WeOpmc
 igRoGvB7H3EnZM8o4AuuIbZAnimGlOzzraGZacrhEDt1hdCLozsME3Y910WE+79pKL5B
 52mac1qI3rF4sZ7KJTwBgoadfTktwd7E4d133XPh7mS84yAWhpfrYkKKOPzDBCeal5t3
 tTKOTHy+rMS03oPD9rdU9eE0J2Irov+5FxxZN193bwYtY8HGb0gkXTvbEeBjdsbraM5b
 DHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQBI7dFc7kEPaCFgnTuGOTxG1+cWJVCWRSLqHnmhHaM=;
 b=yhQRaManlRQY5e7jBGQjEkAjP9dmNL428xk9u/PV33rj0+qoKohlB6F4bezhS7+Suh
 4TyyL28UIoQQ8eYIFWm7kZlFL55I3meoECyLbd1lG/hzrV0JA9dmiKNVTCnNzWaHotrv
 3g+n+FNN69h0x+n7Lyu+v/It1vU5RrbbxxVcw4m6Q9y2EgADTSygkKkjda+lz0C35iXy
 eFsZWtffayqrtWLKlM/D/7F/x/Aiz4f7wj7utSV1YfyMqTwTG6J5TYNSXmHXxt2C4uRg
 CyOJAi1665MybBHtfeePg+IZcMsEJG2BE100sCg/NvDuu+NAHo+2Czmr+NUPX8pVP4eF
 BQKQ==
X-Gm-Message-State: AFqh2kof7omV8M9mLZVmdargaevp0Sm+jNIg3INS5kmiUh2toCBrgNVF
 2Cgev+vVnQx2eDUVDKBH4/K4LGn8UbUF6ss9
X-Google-Smtp-Source: AMrXdXs2ayp510MHkXdbm1cyZP7+tSQteH7W8cOI4otKk/+YCpjPXaKdux+LCyLTNDu3f5bwlTY6Rw==
X-Received: by 2002:a17:90b:4004:b0:226:c966:28a3 with SMTP id
 ie4-20020a17090b400400b00226c96628a3mr17091896pjb.25.1673294915498; 
 Mon, 09 Jan 2023 12:08:35 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 12/27] target/s390x: Use gen_psw_addr_disp in op_sam
Date: Mon,  9 Jan 2023 12:08:04 -0800
Message-Id: <20230109200819.3916395-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Complicated because we may now require a runtime jump.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 40 +++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 001cfa9162..624bd18735 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3924,7 +3924,7 @@ static DisasJumpType op_sacf(DisasContext *s, DisasOps *o)
 static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
 {
     int sam = s->insn->data;
-    TCGv_i64 tsam;
+    TCGLabel *fault = NULL;
     uint64_t mask;
 
     switch (sam) {
@@ -3939,20 +3939,36 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
         break;
     }
 
-    /* Bizarre but true, we check the address of the current insn for the
-       specification exception, not the next to be executed.  Thus the PoO
-       documents that Bad Things Happen two bytes before the end.  */
-    if (s->base.pc_next & ~mask) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
-    s->pc_tmp &= mask;
+    /*
+     * Bizarre but true, we check the address of the current insn for the
+     * specification exception, not the next to be executed.  Thus the PoO
+     * documents that Bad Things Happen two bytes before the end.
+     */
+    if (mask != -1) {
+        TCGv_i64 t = tcg_temp_new_i64();
+        fault = gen_new_label();
 
-    tsam = tcg_constant_i64(sam);
-    tcg_gen_deposit_i64(psw_mask, psw_mask, tsam, 31, 2);
+        gen_psw_addr_disp(s, t, 0);
+        tcg_gen_andi_i64(t, t, ~mask);
+        tcg_gen_brcondi_i64(TCG_COND_NE, t, 0, fault);
+        tcg_temp_free_i64(t);
+    }
+
+    update_cc_op(s);
+
+    tcg_gen_deposit_i64(psw_mask, psw_mask, tcg_constant_i64(sam), 31, 2);
+
+    gen_psw_addr_disp(s, psw_addr, s->ilen);
+    tcg_gen_andi_i64(psw_addr, psw_addr, mask);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
-    return DISAS_TOO_MANY;
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (mask != -1) {
+        gen_set_label(fault);
+        gen_program_exception(s, PGM_SPECIFICATION);
+    }
+    return DISAS_NORETURN;
 }
 
 static DisasJumpType op_sar(DisasContext *s, DisasOps *o)
-- 
2.34.1


