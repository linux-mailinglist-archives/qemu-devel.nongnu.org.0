Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EC3B78AD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:30:27 +0200 (CEST)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJRC-0001y4-IH
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwO-00041S-Sd
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwD-0002xv-OT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id d1so37356plg.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geg8YV4vkZJiwMubrDP+L2xIQBW7poD/N+KgWkQ7RQQ=;
 b=w5neFRv8BuwUC6mqB1YSyUowxF1dgD25fXXl0uyPWM9F1/yOyqpyn9A6xCwsv/UW7X
 oU8MpLqM3xIFJd88C4i3JjPcpGPIePCSwkRJ0zg7O5RH1ETPtvoDYKoLDiHpU3AvyNnZ
 1IwUB8hhTrKtnmon2URReGTUBAHSVTdPb5wQwnpjrcYGTxyf+XLNEj6xP1c/H4efxAuF
 csD3rMolq6caXAh0wot4eKDIc+OCUl7IUexAG51bwz0mSee5qe5NpCyppFkkl8v2xc/p
 QdLIosDAFoVjW+XOmyj00YAsp3SImrquPGEiqiWIgbRlCto6VLC2DkTLSu9Lryt1VmEc
 g4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geg8YV4vkZJiwMubrDP+L2xIQBW7poD/N+KgWkQ7RQQ=;
 b=exu/8fZjbCuHBWytoKqvBA7HDs5YSH3R6H/nLjLPrF/cBC+smjTgk+hggif7IIximD
 o72qSKAuMrlUGp2i2p/l29PkwlJ+ruKvmvVMxgMRoolkcS/9ZMCAhCgmySXzIPBassDj
 n7VKAfo4GjIorsP5iU6pa2toUEBV4KQamGA259o+1MWWAG5Ad+gpfgeUQy69snG2Qntx
 C4OfhF7bNWG+YLRLtkdBz2AvodKMiXdVIkDrVA81PYt/aNlGpl95hoEg+UymGKU+i+s6
 TZveGWQ3nn24DdxLY5TMvDh0syfZWkqzmc9t+1RzH1WSz4r/7oNXazW4Xv3ni4ntwCGR
 1G0w==
X-Gm-Message-State: AOAM531e+XI8aVsdeFzMPYFuOMsypk2my1YtqeMfTsb/cYvs8ByRB/mw
 3IJsfspWqwjr9N9crLimA6roGn88Guz3ig==
X-Google-Smtp-Source: ABdhPJzgnW6QtKvqoH2En/3m7OSIlLq8mXO3s0YZtdberMUxRVRl5Bt4ICdssxijUH/N66QOcE3RCg==
X-Received: by 2002:a17:902:bd96:b029:129:d5d:668b with SMTP id
 q22-20020a170902bd96b02901290d5d668bmr1763126pls.5.1624993103718; 
 Tue, 29 Jun 2021 11:58:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/63] tcg/ppc: Split out tcg_out_bswap32
Date: Tue, 29 Jun 2021 11:54:35 -0700
Message-Id: <20210629185455.3131172-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ad46ce32ca..28b8671cba 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -807,6 +807,27 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
 }
 
+static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+    /*
+     * Stolen from gcc's builtin_bswap32.
+     * In the following,
+     *   dep(a, b, m) -> (a & ~m) | (b & m)
+     *
+     * Begin with:                              src = xxxxabcd
+     */
+    /* tmp = rol32(src, 8) & 0xffffffff             = 0000bcda */
+    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);
+    /* tmp = dep(tmp, rol32(src, 24), 0xff000000)   = 0000dcda */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);
+    /* tmp = dep(tmp, rol32(src, 24), 0x0000ff00)   = 0000dcba */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);
+
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2799,24 +2820,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap16_i64:
         tcg_out_bswap16(s, args[0], args[1]);
         break;
-
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
-        /* Stolen from gcc's builtin_bswap32 */
-        a1 = args[1];
-        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
-
-        /* a1 = args[1] # abcd */
-        /* a0 = rotate_left (a1, 8) # bcda */
-        tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
-        /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 0, 7);
-        /* a0 = (a0 & ~0x0000ff00) | ((a1 r<< 24) & 0x0000ff00) # dcba */
-        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
-
-        if (a0 == TCG_REG_R0) {
-            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
-        }
+        tcg_out_bswap32(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.25.1


