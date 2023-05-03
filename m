Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D931E6F53D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:57:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IK-0000vU-L3; Wed, 03 May 2023 04:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8II-0000u0-9J
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:02 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IG-0006bY-O5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso47986445e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104219; x=1685696219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlOi6l8UvEFBC2jKg68o28dlg9N04vqro4+oQuR1jyc=;
 b=svXp2NcW/2K4VZhBDFcI+yZXo6hyeUZO6F1/DTPbMHit4yCFq0bHikXV80ftsYAgx+
 kFYzdRQNK/OYSLaKwj3jsfv7AWCHjI6auejMdyQgrH+bL4urFLC5WKI+JL3S9key2omx
 P+DeQTEoCkTYqQOLUh8gZon1LUqgWqS9oiEofwO9cfMfr7fC8rd/sTr2Z7w8C6VulEck
 zGavDp11A2+LDRITZeyUdX6MTwCY4/3JpmOlxRFu3s2Q+MBRcg42buzaMjGnnKrnu+Qf
 lvDq2CfQ7S3Ya4DqY7j05Uap+5+E5Q0OCjpjuB59kZtgjg3YxRJtDY9bkgU1RXbB0++o
 Dbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104219; x=1685696219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlOi6l8UvEFBC2jKg68o28dlg9N04vqro4+oQuR1jyc=;
 b=M6tTIOBRk6/8Nmj3rOfSOwqsION59zat9mz8ToMOMst6/ToOjSWmM78mQGDR2ESJs2
 oPK+fIB8OtJd050K1S597okZlhNdMobM4xujj+g2CefdJRXwsJoeCDj6ax4tlnf1Pn/J
 j/FySUkNdQ+5lZTfNL8xwe/5iDBGw0bEquOl+7jHWNxNYYfmEtcKqBNThBWtqlp0NnRz
 0LCdNRftYF9PTRORdGXilzKaymQoAMwQECq0HoGcR1OxyJImZ5NP+HqLTz5j13YUYW1Z
 Wbq3kyquQpJb7v4puICv6Zr5fl/bQDaTaDDO8EgA5hvbGO2+lqZxGYDEm9M/3qwJq/4o
 uG0A==
X-Gm-Message-State: AC+VfDzgOnv/Gz1/q6w9aKmBeqU4CzHuDij2OcRi6Oj8sAu/v4/+w7kf
 Nkn0hG7cqa0nnxQiHpDm8KkDXBsWG83QTAePN0eNaA==
X-Google-Smtp-Source: ACHHUZ5cWxLrLmM0FjHmJsd4wZCZkKY606ezGdt+6Twkbo3Eaafmu9xK2tYdBW0VgLZecPlOG6odzA==
X-Received: by 2002:a7b:cc1a:0:b0:3f0:9564:f4f6 with SMTP id
 f26-20020a7bcc1a000000b003f09564f4f6mr14414826wmh.1.1683104218884; 
 Wed, 03 May 2023 01:56:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:56:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 01/11] disas/riscv: Decode czero.{eqz,nez}
Date: Wed,  3 May 2023 09:56:47 +0100
Message-Id: <20230503085657.1814850-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d6b0fbe5e8..c0a8b1006a 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -935,6 +935,8 @@ typedef enum {
     rv_op_vsetvli = 766,
     rv_op_vsetivli = 767,
     rv_op_vsetvl = 768,
+    rv_op_czero_eqz = 769,
+    rv_op_czero_nez = 770,
 } rv_op;
 
 /* structures */
@@ -2066,7 +2068,9 @@ const rv_opcode_data opcode_data[] = {
     { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
     { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
     { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
-    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
+    { "czero.eqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "czero.nez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -2792,6 +2796,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 45: op = rv_op_minu; break;
             case 46: op = rv_op_max; break;
             case 47: op = rv_op_maxu; break;
+            case 075: op = rv_op_czero_eqz; break;
+            case 077: op = rv_op_czero_nez; break;
             case 130: op = rv_op_sh1add; break;
             case 132: op = rv_op_sh2add; break;
             case 134: op = rv_op_sh3add; break;
-- 
2.34.1


