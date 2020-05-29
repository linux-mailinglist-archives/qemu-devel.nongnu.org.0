Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201101E768B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 09:23:19 +0200 (CEST)
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeZMM-0003qW-6V
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 03:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jeZLH-0002d5-MC
 for qemu-devel@nongnu.org; Fri, 29 May 2020 03:22:11 -0400
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16]:58542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jeZLE-0000db-W2
 for qemu-devel@nongnu.org; Fri, 29 May 2020 03:22:09 -0400
Received: from pova.uni-paderborn.de ([131.234.189.23]
 helo=localhost.localdomain)
 by mail.uni-paderborn.de with esmtp (Exim 4.93 doohan)
 id 1jeZLA-000ReD-HA
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:22:04 +0200
Received: from mail.uni-paderborn.de by pova with queue id 3989683-2
 for qemu-devel@nongnu.org; Fri, 29 May 2020 07:22:03 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/tricore: Don't save pc in generate_qemu_excp
Date: Fri, 29 May 2020 09:21:44 +0200
Message-Id: <20200529072148.284037-2-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529072148.284037-1-kbastian@mail.uni-paderborn.de>
References: <20200529072148.284037-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.5.29.71818, AntiVirus-Engine: 5.74.0,
 AntiVirus-Data: 2020.5.29.5740000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=6374307, da=78345988,
 mc=148, sc=3, hc=145, sp=2, fso=6374307, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
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
Cc: kbastian@mail.uni-paderborn.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

EXCP_DEBUG is the only user. If we encounter a jump in tricore-gdb it's
target was overwritten by generate_qemu_excp() and we would never leave.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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


