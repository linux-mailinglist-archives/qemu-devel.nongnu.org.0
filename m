Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE32C20EA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 14:50:55 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEv8g-0003tu-Ej
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 08:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1iEv54-0002Nj-4h
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 08:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1iEv51-00027Q-52
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 08:47:09 -0400
Received: from shirlock.uni-paderborn.de ([131.234.189.15]:41538)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1iEv4v-00022P-Da
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 08:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJUElLN09OsStykJVTrFAUySCt2ro7+Jw9XBc9S/If8=; b=X89+3w++vRtJTYx4SMUaIUyvZg
 YKfLX9vpFERCSjadW+AcbxBXvpSkxG55K2HF9ElHWSo87Rs9fz5HuYWVncC5FC5Ro9d97fDx/PmH2
 0pdSOXpUoLqoW0QJ+EimefJGe3TBf1V9M4hDKbv+APqiWUVLKu8f/ECB6AyRqRzHvZOw=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/tricore: Don't save pc in generate_qemu_excp
Date: Mon, 30 Sep 2019 14:46:39 +0200
Message-Id: <20190930124643.179695-2-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930124643.179695-1-kbastian@mail.uni-paderborn.de>
References: <20190930124643.179695-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.9.30.123917, AntiVirus-Engine: 5.65.0,
 AntiVirus-Data: 2019.9.30.5650000
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 131.234.189.15
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
Cc: david.brenken@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

EXCP_DEBUG is the only user. If we encounter a jump in tricore-gdb it's
target was overwritten by generate_qemu_excp() and we would never leave.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index c574638c9f..c556e9a7ab 100644
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
2.23.0


