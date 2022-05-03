Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909A5185CA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 15:43:33 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlsoO-0001pc-B1
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 09:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nlsje-0004HV-4z
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:38 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:53345)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nlsjY-0003rr-TS
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=If2wa
 A1PweNdR5yGz0DyotDbZr7af0MFUW7ATFRjzIE=; b=efmHq2V032yxHs2UQ2+k0
 EsaSq17HN2e6naauf0TOlZZwf4FP0tH1Kn3qiwJKcT0engT4mIBHPDvK1gKmJF8Q
 YmtZprWnkLQlnJB85fm4xM+4ty/l/GYWKoUA4NMnTjse3q0wykjcjaKbXf6FUt16
 Oy0rTQnT7tFbRI3uzBTihA=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp2 (Coremail) with SMTP id DMmowABHS_38KHFixa2dBA--.22839S2;
 Tue, 03 May 2022 21:07:09 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: Ni Hui <shuizhuyuanluo@126.com>
Subject: [PATCH 1/4] target/mips: Fix SAT_S trans helper
Date: Tue,  3 May 2022 21:07:05 +0800
Message-Id: <20220503130708.272850-1-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHS_38KHFixa2dBA--.22839S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4rKryfAFWfZFy7CFW3Jrb_yoWDZrXEqr
 4xur1ktr1j9r43tF47K3WUKF1xKw1qkrnaka1DA3sxW3s7Ja4YqF4kWF95uFy5CFs0vrnx
 A3ZIqw13tFy2kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_hSdPUUUUU==
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbiWBP1el1w9jbfkgABsl
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

Fix the SAT_S and SAT_U trans helper confusion.

Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
---
 target/mips/tcg/msa_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 7576b3ed86..76307102f2 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -399,7 +399,7 @@ TRANS(BSETI,    trans_msa_bit, gen_helper_msa_bseti_df);
 TRANS(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
 TRANS(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
 TRANS(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
-TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_s_df);
 TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
 TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
 TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
-- 
2.25.1


