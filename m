Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2765185C0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 15:41:04 +0200 (CEST)
Received: from localhost ([::1]:52912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlsly-0006EC-OH
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nlsje-0004HY-22
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:38 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:53347)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nlsjZ-0003rv-NU
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HFpcS
 +pGqSJ5jr/A4X6ZFFO6aiKYct6QTiXhYjB3Vxk=; b=evpCmtx4fLmcpawcTUWsN
 TLVbumC5u8d5DcdwYIlyf7pmitXYneGK4qjZGguZokCX58/SvogUGSZrQzcRT3bb
 TaSKWq6Hq7qYgUMHT+Xu7PYrPbjnexzReNvSETzdrtkUtbb64gahNob7YSLrEmd8
 L578cWCKn1WKIU4G2r82DQ=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp2 (Coremail) with SMTP id DMmowABHS_38KHFixa2dBA--.22839S4;
 Tue, 03 May 2022 21:07:09 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: Ni Hui <shuizhuyuanluo@126.com>
Subject: [PATCH 3/4] target/mips: Fix msa checking condition in
 trans_msa_elm_fn()
Date: Tue,  3 May 2022 21:07:07 +0800
Message-Id: <20220503130708.272850-3-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503130708.272850-1-shuizhuyuanluo@126.com>
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHS_38KHFixa2dBA--.22839S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyfZF1fGFWrArW3Xry8AFb_yoW3Jrc_Cw
 1xCr4kKr45WF429a1DCr1xGr18AFykur1Fy3Z7A3yYgaykurW8JrykWF1kuFn8u34fAFy3
 A39Iqry0gF4fCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_HUDJUUUUU==
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbi7hX1eltC+GVfFAAAs7
Received-SPF: pass client-ip=220.181.15.112;
 envelope-from=shuizhuyuanluo@126.com; helo=m15112.mail.126.com
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

From: Ni Hui <shuizhuyuanluo@126.com>

Fix issue that condition of check_msa_enabled(ctx) is reversed
that causes segfault when msa elm_fn op encountered.

Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
---
 target/mips/tcg/msa_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index aa45bae0aa..92ccc6f921 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -599,7 +599,7 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
         return false;
     }
 
-    if (check_msa_enabled(ctx)) {
+    if (!check_msa_enabled(ctx)) {
         return true;
     }
 
-- 
2.25.1


