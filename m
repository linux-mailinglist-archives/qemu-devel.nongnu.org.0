Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3DA3AF93D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:23:39 +0200 (CEST)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTGT-0000Vs-Rg
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC0-0000an-2B
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:00 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBx-0005vc-QU
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:59 -0400
Received: by mail-pf1-x430.google.com with SMTP id y4so7872402pfi.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+KG72/HkSkkW/EnHZzWfX4mj5faPrZ7wY+xxoD2yGxc=;
 b=JlOIpEucQd8P4k6XJHgKOkW7/657SLlc+4BOqiEVC1UR9ucBkUJ6ks9NEynwscTfk+
 kRixLLObDJrev4biIDuwDgRv394CgZigmNiWo3YJQBOekFWB7u5JChURvEDOKZTLgPFc
 vb8HNS8lY7AVF+uDIAl7LHPHIoaP+zbQuBGnAl3HjCRPIOIcl1OyGF0RXvNNrioNCAPS
 NEWFZdR9n3PXUvVj1FFzWKbdbJigx8tVU966pY1E8qBrqmEwl24Y9oFELsywSn40xNtT
 butmFAfmtq1O1f20A9foT1khH/Hu4OpALcyR4NZxTLmycpQBGHnfNoxw+tXFxZYzBs5u
 qXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+KG72/HkSkkW/EnHZzWfX4mj5faPrZ7wY+xxoD2yGxc=;
 b=EppWhKtf6KzWREn/3D8irMUV8Sv9tt8X+Cw6z291Ar5B9genphzDiZLLEUpR4n3Wb2
 vvTnaMM9YLtty1mklbAz5Hqndmyv6Vpf/h7kzBq5uZzZT/7cpTu1cDCQ8RLJ78pqvTm8
 Rn4WITRoQC6LMjM2HPBOhsOL7NP5Vcx7EueGtvBNXcMa2bJeTXo+naEVn+50fm4YLNFC
 VS6BV6ngLLeOBn+TwToiecVmkVl7v2FRznbAaZti8fssZRevsi85lGc8cVWL+vcZu7oH
 BF81naWqNalBGLmSabHSVnR//WHWrF/YfkvrBeQleXJHYTtXSWe3EkE2VR23qEWLwP/+
 F9kg==
X-Gm-Message-State: AOAM530oXdM2iNOHk5wkceZlzsM3btNAVH0w4p34d3OY5y86MCDAvUER
 FCC1618cAAbNcHMunU6RVe+QuNnR301D+A==
X-Google-Smtp-Source: ABdhPJyesAJRxSM6/WvFQQe3XCCmbyRJ3OFwrXcTHoQklYwkiJvEAPy56ioaYlPkk/bWT8TRWe7chw==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr586046pfe.37.1624317536535; 
 Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/29] tcg/ppc: Split out tcg_out_bswap16
Date: Mon, 21 Jun 2021 16:18:28 -0700
Message-Id: <20210621231849.1871164-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the use of a suitable temporary, we can use the same
algorithm when src overlaps dst.  The result is the same
number of instructions either way.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 50347182d7..ad46ce32ca 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -789,6 +789,24 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+    /*
+     * In the following,
+     *   dep(a, b, m) -> (a & ~m) | (b & m)
+     *
+     * Begin with:                              src = xxxxabcd
+     */
+    /* tmp = rol32(src, 24) & 0x000000ff            = 0000000c */
+    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);
+    /* tmp = dep(tmp, rol32(src, 8), 0x0000ff00)    = 000000dc */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2779,21 +2797,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        a0 = args[0], a1 = args[1];
-        /* a1 = abcd */
-        if (a0 != a1) {
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = (a0 & ~0xff00) | (a1 r<< 8) & 0xff00 # 00dc */
-            tcg_out_rlw(s, RLWIMI, a0, a1, 8, 16, 23);
-        } else {
-            /* r0 = (a1 r<< 8) & 0xff00 # 00d0 */
-            tcg_out_rlw(s, RLWINM, TCG_REG_R0, a1, 8, 16, 23);
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = a0 | r0 # 00dc */
-            tcg_out32(s, OR | SAB(TCG_REG_R0, a0, a0));
-        }
+        tcg_out_bswap16(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap32_i32:
-- 
2.25.1


