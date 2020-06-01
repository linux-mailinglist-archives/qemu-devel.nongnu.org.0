Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338471EA697
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 17:14:07 +0200 (CEST)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfm8c-0001dv-97
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 11:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jfm6Z-0007wF-9r
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 11:11:59 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18]:42082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jfm6X-0004e6-Pj
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 11:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQ2ZbxZi2QkV1rcFsEXnNbWnbVQZ4muPXiXcMCPVsM4=; b=THikc3ZoMpQKxemHEefOj/wSiv
 PMClKurFH7aIMSwg2DTvElVgHbqOGt+D2qW5U3fA/HAqPzIXWpHE8hirL87i7J7I48Hyajkfn1PWj
 w1z+pfYIg87CDsy7AqFlbOErJgBP2rO9SIf8zAsZERb9ZenU3SpKLZ2Ypqjc0nieOPsk=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] target/tricore: Don't save pc in generate_qemu_excp
Date: Mon,  1 Jun 2020 17:11:15 +0200
Message-Id: <20200601151119.33196-2-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601151119.33196-1-kbastian@mail.uni-paderborn.de>
References: <20200601151119.33196-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=6661696, da=78633377,
 mc=164, sc=3, hc=161, sp=1, fso=6661696, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.6.1.150616, AntiVirus-Engine: 5.74.0,
 AntiVirus-Data: 2020.6.1.5740002
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

EXCP_DEBUG is the only user. If we encounter a jump in tricore-gdb it's
target was overwritten by generate_qemu_excp() and we would never leave.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20200529072148.284037-2-kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 609d75ae8a..65a33e5ad8 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3264,7 +3264,6 @@ static void generate_trap(DisasContext *ctx, int class, int tin)
 static void generate_qemu_excp(DisasContext *ctx, int excp)
 {
     TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_save_pc(ctx->base.pc_next);
     gen_helper_qemu_excp(cpu_env, tmp);
     ctx->base.is_jmp = DISAS_NORETURN;
     tcg_temp_free(tmp);
-- 
2.26.2


