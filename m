Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D37675848
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIt7a-000430-Vo; Fri, 20 Jan 2023 10:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pIt7Y-00042U-9f
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:16:00 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pIt7W-00078R-A5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:16:00 -0500
Received: by mail-ej1-x62c.google.com with SMTP id ud5so14783686ejc.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 07:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QyADo8rV6n7VFmc6NHVuVNWiz2JftjzpgOovc7sRpb4=;
 b=iGqBuQ5Zvc11VTxTWgCldVpqPleLlsTTEgJubylrMJBQy1gwUN49f+BtUTFfogchjh
 JsPIOlyn5+cr6lRAKyKPJWMJq/FsvGrINnGQWVwaLPdEiyZ9Mm8dO3FrbNttSSWZPIDP
 8mgeJRj+hrT+rsR4qVHtZB8XwL5UYsVsiawmcIBIVkM12R0+ZVejqKMZ0VKNKeUIZa3n
 SxCwXtCqQYglDBGz3q7X+2GyPqN03PXmzt1t9MoYVPtej6G08a/WKG6G1vqpxW5rmudS
 JTx5VumKSsSPd/iu6jTEXRy6H1g3IA0L8+P1lq8SUqWvQWtGFjZl15Wz4JbiDhAv9i8U
 8/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QyADo8rV6n7VFmc6NHVuVNWiz2JftjzpgOovc7sRpb4=;
 b=l17/gARTeDji/NE9EqXZ9DQJtD0LryCJXwBmdHlZU3J9yZPRdPqtUfeurZHntwZGq7
 mJ/U8ka1gGJKB5lhuafLblzXd0n3atRAr1jPAXtfewgNUCaQMauAy0nYPiMQZ7hd9EvP
 /QHtaQUKbl/0GAC1F+VHt3ERpe6cJ2nm0jO+Z6YGvuG1XoebW5UP6ePEPULBghi4tTsS
 4xfTb5owoau81e3imXS/6bVCx3jOoXsSayeIucWpocx0UsL40/Yte8OzcJs6mnYHYu6C
 CbFthRJRmCE1WcIRbEi4UeMvK+L4PPTDQ42/u7Gt0shaMiIawTeayzByUWpk0Ev7kqWl
 9Fig==
X-Gm-Message-State: AFqh2kqvWWfb2I6zy2CUa5ib8AYOYA/lmQ715Ov+SPA+bTZyw6lWHTXF
 CuKxqWsI3bvpLzKC+P7DsXGkGouDQHqn9rOazYM=
X-Google-Smtp-Source: AMrXdXugOAbRlpjm11c68fRhVETEyLE7nbbXI6LXHgqSSCRFLDwsENdrHdxVJKugFoc0dSbJnh9+jw==
X-Received: by 2002:a17:907:c30c:b0:86c:cbfd:936 with SMTP id
 tl12-20020a170907c30c00b0086ccbfd0936mr19092854ejc.11.1674227754926; 
 Fri, 20 Jan 2023 07:15:54 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170906538d00b0085a958808c6sm13395436ejo.7.2023.01.20.07.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:15:54 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v1] target/riscv: update disas.c for xnor/orn/andn and slli.uw
Date: Fri, 20 Jan 2023 16:15:51 +0100
Message-Id: <20230120151551.1022761-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x62c.google.com
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

The decoding of the following instructions from Zb[abcs] currently
contains decoding/printing errors:
 * xnor,orn,andn: the rs2 operand is not being printed
 * slli.uw: decodes and prints the immediate shift-amount as a
            register (e.g. 'shift-by-2' becomes 'sp') instead of
	    interpreting this as an immediate

This commit updates the instruction descriptions to use the
appropriate decoding/printing formats.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 disas/riscv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d216b9c39b..ddda687c13 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1626,9 +1626,9 @@ const rv_opcode_data opcode_data[] = {
     { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "xnor", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "orn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "andn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
@@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] = {
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-- 
2.34.1


