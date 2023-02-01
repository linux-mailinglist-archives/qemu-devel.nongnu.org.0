Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319067E48A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNSV-0004WH-AH; Fri, 27 Jan 2023 07:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pLNSR-0004UW-Bb
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:03:51 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pLNSO-0004IC-KH
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dX5IykZSmSQdWSaRObNjieDh40fxb8ijl2TYd8L6SrY=; b=cv5/3kwHDq1JOJaO86y0RU3LuM
 U/T2pX/Km4vWnjGfN2l06xg4iHYCWraNZCA+t4dLq4/oiiRqlsDJWNtQTl96tWvarGQfHT8LZ9r/d
 e/kUyb/VbpK7m2K3mlDuQYc19LfaGI4eHvDOOaGnN5eXRKQ/px3fA61wgZOYTN49/zLk=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de,
	anton.kochkov@proton.me
Subject: [PATCH 1/5] target/tricore: Fix OPC2_32_RCRW_IMASK translation
Date: Fri, 27 Jan 2023 13:03:24 +0100
Message-Id: <20230127120328.2520624-2-kbastian@mail.uni-paderborn.de>
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
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
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

we were mixing up the "c" and "d" registers. We used "d" as a
destination register und "c" as the source. According to the TriCore ISA
manual 1.6 vol 2 it is the other way round.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/653
---
 target/tricore/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index df9e46c649..8de4e56b1f 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -5794,11 +5794,11 @@ static void decode_rcrw_insert(DisasContext *ctx)
 
     switch (op2) {
     case OPC2_32_RCRW_IMASK:
-        tcg_gen_andi_tl(temp, cpu_gpr_d[r4], 0x1f);
+        tcg_gen_andi_tl(temp, cpu_gpr_d[r3], 0x1f);
         tcg_gen_movi_tl(temp2, (1 << width) - 1);
-        tcg_gen_shl_tl(cpu_gpr_d[r3 + 1], temp2, temp);
+        tcg_gen_shl_tl(cpu_gpr_d[r4 + 1], temp2, temp);
         tcg_gen_movi_tl(temp2, const4);
-        tcg_gen_shl_tl(cpu_gpr_d[r3], temp2, temp);
+        tcg_gen_shl_tl(cpu_gpr_d[r4], temp2, temp);
         break;
     case OPC2_32_RCRW_INSERT:
         temp3 = tcg_temp_new();
-- 
2.39.1


