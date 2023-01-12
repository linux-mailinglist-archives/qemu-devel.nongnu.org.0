Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E666771F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyVC-0006At-7c; Thu, 12 Jan 2023 09:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pFyV4-00067d-70
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:24:14 -0500
Received: from mail-4316.protonmail.ch ([185.70.43.16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pFyV1-0001A1-7h
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:24:13 -0500
Date: Thu, 12 Jan 2023 14:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1673533447; x=1673792647;
 bh=jzRXI+dfaF1mI0VwGJa+yoybW5kWXm9mLZMxrL3uYiU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=jWm9EsdMkStfuzmg9DUk5zfvi+jjrpl4BvpInXglPl5jwFKin6b8woQfRjPaK2ZY9
 yWI52Nee42aPB9SJt7ozImFUWwCOqa/But8XVLGmAaDcX6MbLMYx37jyFNP9JWh0bY
 q1riK5jvuMLnXxNKrJVYs4BHY6Z3F/c3Phd0ky7bTsX1jydkGZxuSUCS0C6R8OQquB
 6AmEN0+cF9iGf1zyrQcHP3tfR/Fb4XXTqsY6Tc5Hq7p5ZW4K+oord1P+oLSqoJVDXZ
 voVLalNmy5wns5/1NYH77+gCHK0oc9wqROBrXKKgAk889Iosu1MtEE/FauGVImiBHF
 Qg3GRs5+laUnA==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: eitan_eliahu@hotmail.com, Anton Kochkov <anton.kochkov@proton.me>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH] target/tricore: Fix OPC1_16_SRO_LD_H translation
Message-ID: <20230112142258.514079-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.16;
 envelope-from=anton.kochkov@proton.me; helo=mail-4316.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Eitan Eliahu <eitan_eliahu@hotmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/652
---
 target/tricore/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index df9e46c649..b2a5e11778 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3878,7 +3878,7 @@ static void decode_sro_opc(DisasContext *ctx, int op1=
)
         gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_UB);
         break;
     case OPC1_16_SRO_LD_H:
-        gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_LESW)=
;
+        gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 2, MO_L=
ESW);
         break;
     case OPC1_16_SRO_LD_W:
         gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 4, MO_L=
ESL);
--
2.39.0



