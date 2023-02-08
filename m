Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC568EAC0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:15:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXJ-0003Na-GA; Wed, 08 Feb 2023 04:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXG-0003MZ-4q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:39 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXC-0007nT-HE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mraN7Ic70VtB13cyaAQRXY1FQck+jIZgkWRIwSOiejs=; b=lt7NejM40EhNO7tJ1jhC09bpy3
 mXRYi6yQEe0qcauUkF3qCpD7p4I7wqSRVQ/DmeOfFyA0DrCBTGe569q+/EjPAyljtaxU7SRZh7UjQ
 P9+AC2Q61fAxjdw+E8hJSDECFq2gApMr9Q1PT7Y/qowwWqwmJGMYHMorIOTOJ2zowrNk=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/12] target/tricore: Fix OPC2_32_RCRW_INSERT translation
Date: Wed,  8 Feb 2023 10:14:13 +0100
Message-Id: <20230208091422.1243084-4-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778821, da=163456737, mc=14, sc=0,
 hc=14, sp=0, fso=778821, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/653
Message-Id: <20230202120432.1268-4-kbastian@mail.uni-paderborn.de>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 8de4e56b1f..6149d4f5c0 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -5805,8 +5805,8 @@ static void decode_rcrw_insert(DisasContext *ctx)
 
         tcg_gen_movi_tl(temp, width);
         tcg_gen_movi_tl(temp2, const4);
-        tcg_gen_andi_tl(temp3, cpu_gpr_d[r4], 0x1f);
-        gen_insert(cpu_gpr_d[r3], cpu_gpr_d[r1], temp2, temp, temp3);
+        tcg_gen_andi_tl(temp3, cpu_gpr_d[r3], 0x1f);
+        gen_insert(cpu_gpr_d[r4], cpu_gpr_d[r1], temp2, temp, temp3);
 
         tcg_temp_free(temp3);
         break;
-- 
2.39.1


