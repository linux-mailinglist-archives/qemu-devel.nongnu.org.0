Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881915A354
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 20:18:00 +0200 (CEST)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgvRf-00079I-NT
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 14:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55058)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgul7-0000K5-Kq
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 13:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgul4-0000oq-Ab
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 13:34:01 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41719)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgul4-0000o4-4i
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 13:33:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so3320102pff.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 10:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jNAXnuen/EqceGboq9jqUh/HLce5kvK8361K7LpbToc=;
 b=ZaesYLaFQX2sPJwRbH56qeVNW8Ngyz9uyBTzQNRuuMGvZEE97178R6XAN/3RoqCKJB
 UIHh/QUlDdqRYGdfXtcxT6rhiZjNUb/0qLV47CMJWmXjd7EL07DKQeDiTulOt77PcA+P
 LJBNV84CusUMTHag1kNRlJlK32MPV3mWRgJNVnypL3pvpMA1xFPUdx/zAdH2j/G5sZw7
 hvCrF2sSKGG2YiuOrhDPsS5e67eMrKfEurMKFIxDsYrbPwUa+aCl5arEaCvOCxdSGEPv
 90aUkKaIbsJEz031+XLHiYl+OFfIRsHjhD5dK5vVuciKsJqmnUANC5p2Ncu44q9CnL8z
 MjAQ==
X-Gm-Message-State: APjAAAXypcMWlD9VwXA+5dHz2NKemi51KWuYMj1xvCFclcTC0cEREJIY
 Ao+7F7aWIAcCfeTbsXZRq+rQu59sKmVxO5uY
X-Google-Smtp-Source: APXvYqwnP2hFW/AtATyhQwBOpKJnrqrl4lTyuacxW6X//VtVHbcz2SjozV4/ZtCOlODuDTzATX7Ktg==
X-Received: by 2002:a63:fa0d:: with SMTP id y13mr10325843pgh.258.1561743236575; 
 Fri, 28 Jun 2019 10:33:56 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id l68sm4845500pjb.8.2019.06.28.10.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:55 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:20 -0700
Message-Id: <20190628173227.31925-28-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-devel] [PULL 27/34] disas/riscv: Fix `rdinstreth` constraint
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
Cc: "Wladimir J. van der Laan" <laanwj@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 Michael Clark <mjc@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Wladimir J. van der Laan" <laanwj@gmail.com>

The constraint for `rdinstreth` was comparing the csr number to 0xc80,
which is `cycleh` instead. Fix this.

Signed-off-by: Wladimir J. van der Laan <laanwj@gmail.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 disas/riscv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d37312705516..278d9be9247e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -614,7 +614,8 @@ static const rvc_constraint rvcc_rdtime[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc01, r
 static const rvc_constraint rvcc_rdinstret[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc02, rvc_end };
 static const rvc_constraint rvcc_rdcycleh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
 static const rvc_constraint rvcc_rdtimeh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc81, rvc_end };
-static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
+static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0,
+                                                  rvc_csr_eq_0xc82, rvc_end };
 static const rvc_constraint rvcc_frcsr[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x003, rvc_end };
 static const rvc_constraint rvcc_frrm[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x002, rvc_end };
 static const rvc_constraint rvcc_frflags[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x001, rvc_end };
@@ -1038,7 +1039,7 @@ const rv_opcode_data opcode_data[] = {
     { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai,
       rv_op_srai, rv_op_srai, rvcd_imm_nz },
     { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi,
-      rv_op_andi, rv_op_andi, rvcd_imm_nz },
+      rv_op_andi, rv_op_andi },
     { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_sub, rv_op_sub },
     { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xor, rv_op_xor },
     { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or, rv_op_or },
-- 
2.21.0


