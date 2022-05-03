Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B967518718
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:45:38 +0200 (CEST)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltmS-0003nG-TC
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nltkB-0002HA-Sk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:43:16 -0400
Received: from m15111.mail.126.com ([220.181.15.111]:29824)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nltk2-0004vV-J0
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=shyin
 oA/BzJRG0Lh9xHl9YIIQkCXjtX/QzuzzlN1/pE=; b=Xhi/BJcQXrxMGCOsjl9eD
 9pHsdsww7Nprjxni5A6AE3JiQSqYazOS9xch72EWvQIsN8aqtrkk9KTQ95Fo/U6K
 jDzOlHcf25IZcCqY0fTZFVeNS7yb0TiRMVlFlsCl8YJQtz8ElgtsC+GOVj1023dq
 Tivboex2pdf4C+R1kecBWM=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp1 (Coremail) with SMTP id C8mowAD31d5mP3FimWYfBg--.7431S2;
 Tue, 03 May 2022 22:42:48 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: nihui <shuizhuyuanluo@126.com>
Subject: [PATCH] target/mips: Fix FTRUNC_S and FTRUNC_U trans helper
Date: Tue,  3 May 2022 22:42:41 +0800
Message-Id: <20220503144241.289239-1-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAD31d5mP3FimWYfBg--.7431S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW5JF4UGrykKF1DZr4xZwb_yoWDZrg_J3
 4Igr1ktF4jgr4ayF4Ykr1UKFy0kFn0kr1Fvws8A3y3W395Gas0ga1DGFZ5uFy5Crs3ArsI
 vFnI93sxtF1IkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_IzutUUUUU==
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbi7gn1eltC+GYJnwAAs5
Received-SPF: pass client-ip=220.181.15.111;
 envelope-from=shuizhuyuanluo@126.com; helo=m15111.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the FTRUNC_S and FTRUNC_U trans helper problem.

Signed-off-by: nihui <shuizhuyuanluo@126.com>
---
 target/mips/tcg/msa_translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 0b3dd0957c..1bcdbb1121 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -752,8 +752,8 @@ static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
 }
 
 TRANS(FCLASS,   trans_msa_2rf, gen_helper_msa_fclass_df);
-TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_fclass_df);
-TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
+TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
+TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_u_df);
 TRANS(FSQRT,    trans_msa_2rf, gen_helper_msa_fsqrt_df);
 TRANS(FRSQRT,   trans_msa_2rf, gen_helper_msa_frsqrt_df);
 TRANS(FRCP,     trans_msa_2rf, gen_helper_msa_frcp_df);
-- 
2.25.1


