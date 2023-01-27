Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810B67E48B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNSW-0004Wb-3f; Fri, 27 Jan 2023 07:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pLNST-0004Vt-AZ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:03:53 -0500
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pLNSR-0004J0-RB
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H370LhQ61nDDU928MpRo9UPAj+vWrg8521o6RJ4mr4Q=; b=Dy46R8hEUVxC0etOIuNt5i3J2A
 6y3Gfq2Xs69+ddt38xw7IWkDa7yYE3wcOeiEqeAxqgyudSoD8Okd7pf6MMTMZ3cCyvnQtOSMAwdPD
 7KnkUjzqt5syf9FKVCimo1+aQVQkyn7FaHnG2KVOKDPcuLUdo3AAEfemf8tZ3UkuBBT0=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de,
	anton.kochkov@proton.me
Subject: [PATCH 5/5] target/tricore: Fix OPC2_32_BO_LD_BU_PREINC
Date: Fri, 27 Jan 2023 13:03:28 +0100
Message-Id: <20230127120328.2520624-6-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
References: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.1.27.115416, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

we were sign extending the result of the load, while the instruction
clearly states that the result should be unsigned.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index b8e0969079..c17d19b83e 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -4964,7 +4964,7 @@ static void decode_bo_addrmode_ld_post_pre_base(DisasContext *ctx)
         tcg_gen_addi_tl(cpu_gpr_a[r2], cpu_gpr_a[r2], off10);
         break;
     case OPC2_32_BO_LD_BU_PREINC:
-        gen_ld_preincr(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], off10, MO_SB);
+        gen_ld_preincr(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], off10, MO_UB);
         break;
     case OPC2_32_BO_LD_D_SHORTOFF:
         CHECK_REG_PAIR(r1);
-- 
2.39.1


