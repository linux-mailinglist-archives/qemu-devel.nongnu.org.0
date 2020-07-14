Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A5421E4C7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 02:49:10 +0200 (CEST)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv989-0000dy-1w
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 20:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=457b4eeb6=alistair.francis@wdc.com>)
 id 1jv91s-0005vJ-Rf
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 20:42:40 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=457b4eeb6=alistair.francis@wdc.com>)
 id 1jv91q-0008Or-Rm
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 20:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594687359; x=1626223359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXSZcRXg15OipwdCW8WzVkF8p3aOIw9mUtt4EreI9JE=;
 b=bl1RLLlg8AiI6ZYTgyjRIk8JaPSrXpsk8twS7064eezZQzUgCYazqpqf
 inbFYsk1nIjVxKUVJwhd/mFsmX6AMTJJfG98F+YvyBcoF95Zz+kBjezYg
 qEw+zz5AdUexDSicfGX+qWgmdD+BJnfxEjlhGFvvFpoyuHLJlqPEZuol9
 9YvjPC28CLwjht+zdb98/kKz6QWYObOmVWv8lqZJa+X2YiHRpre/gJacO
 gAXX/qzFVLyraTzwhDhyAcOuK1CeiHnqgGRy2tumPc8yOicBIWSKbLWiN
 Z13y0NOc9E4srlwMc+Y/79hGu5yWYQpTdFrQIFifcjrREW9qrigTRojRh Q==;
IronPort-SDR: LefF5gXf2PZXjm3fo/lZwOe50krRFsDUggKTFZZtyKwtjDlwXC3sR3qZBmQOVrKuQQlKn5gloK
 bzJ1IAHvgCLBTVrZSwR0BSQAXpYVB2cY8BQguQx3k/7xCUB1d+nSvk237bSESLjOSwX1QD4b0S
 Er43U4e0UddfkcV/+APxCWHFmFUYPuP1xzQ18rQWwT4sgTbOFgeJfn13RgZaNpLT8Uo57c1HZk
 WrH4w6RJr0/eKEcNTK1T4JKCU9eh/INvTRMx7QE/t/lgytXyC4WfF9GtioInDwWM9Otj+lN008
 kUM=
X-IronPort-AV: E=Sophos;i="5.75,349,1589212800"; d="scan'208";a="142511926"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2020 08:42:29 +0800
IronPort-SDR: NBEs80AlU08iXQ3qVfROSj/vrhSaIzfp4oYDV9IoIsYple1og0hdMOaX3sF5cXMwSEH0qxMyvI
 VAu8mE48Y4IVr7rrotNyYMS9UM0ABCRwA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 17:30:57 -0700
IronPort-SDR: HFJU4Ca9Mx66YoU6neAAKqfa0IIOmx5QGI540uwtxyxaQofDwArAJeP9+x8fzHAp+3oBjqAZJd
 JGoVtIPE8GnQ==
WDCIronportException: Internal
Received: from usa002626.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.178])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Jul 2020 17:42:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] target/riscv: fix rsub gvec tcg_assert_listed_vecop
 assertion
Date: Mon, 13 Jul 2020 17:32:47 -0700
Message-Id: <20200714003254.4044149-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714003254.4044149-1-alistair.francis@wdc.com>
References: <20200714003254.4044149-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=457b4eeb6=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 20:42:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

gvec should provide vecop_list to avoid:
"tcg_tcg_assert_listed_vecop: code should not be reached bug" assertion.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200710104920.13550-2-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index dc333e6a91..433cdacbe1 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -958,22 +958,27 @@ static void gen_rsub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
                                TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
+    static const TCGOpcode vecop_list[] = { INDEX_op_sub_vec, 0 };
     static const GVecGen2s rsub_op[4] = {
         { .fni8 = gen_vec_rsub8_i64,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs8,
+          .opt_opc = vecop_list,
           .vece = MO_8 },
         { .fni8 = gen_vec_rsub16_i64,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs16,
+          .opt_opc = vecop_list,
           .vece = MO_16 },
         { .fni4 = gen_rsub_i32,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs32,
+          .opt_opc = vecop_list,
           .vece = MO_32 },
         { .fni8 = gen_rsub_i64,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs64,
+          .opt_opc = vecop_list,
           .prefer_i64 = TCG_TARGET_REG_BITS == 64,
           .vece = MO_64 },
     };
-- 
2.27.0


