Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459B519580
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:34:37 +0200 (CEST)
Received: from localhost ([::1]:36984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4qZ-0008L9-8w
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nm4pj-0007fW-CP
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:33:43 -0400
Received: from m15113.mail.126.com ([220.181.15.113]:26325)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nm4pe-0005tw-2m
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZYNTd
 apQKGsEx0hTfsnMJyXhaK6iKBfCJTpJFvGolug=; b=pO5oS7TLXUwkBAfPanL0W
 wfMUYzoeOWOGsSQ15DXBRss7Wv9x1rRPFBI1mryQ6DeqNUyhM9Byjj4aDd0iGW09
 XDNez07OVT/qNuL6aZ/0FA69MPYr6ZMEiIY6i0GyJE9CpEuIjrXY3Qwhw+hE0+rH
 NXSxyAIMafijxf4MTgjQbQ=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp3 (Coremail) with SMTP id DcmowAAXJ5_05XFirnPRBA--.47075S2;
 Wed, 04 May 2022 10:33:25 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: nihui <shuizhuyuanluo@126.com>
Subject: [PATCH] target/mips: Fix store adress of high 64bit in
 helper_msa_st_b()
Date: Wed,  4 May 2022 10:33:19 +0800
Message-Id: <20220504023319.12923-1-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAAXJ5_05XFirnPRBA--.47075S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy3KFy8JFWDuF1fWw18uFg_yoWfJwc_Ww
 4I9rs2y390gF4jvF4rAr1xtr1xCr4kAr9Iya1jyrnag348ta43Ww1DtF4fCas09a43Jr15
 tanxAryfXa13ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCPfQ5UUUUU==
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbiHBb2elpEGjn42wAAsY
Received-SPF: pass client-ip=220.181.15.113;
 envelope-from=shuizhuyuanluo@126.com; helo=m15113.mail.126.com
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

This patch fix the issue that helper_msa_st_b() write high 64bit
data to where the low 64bit resides, leaving high 64bit undefined.

Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
---
 target/mips/tcg/msa_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 4dde5d639a..736283e2af 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -8329,7 +8329,7 @@ void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
 
     /* Store 8 bytes at a time.  Vector element ordering makes this LE.  */
     cpu_stq_le_data_ra(env, addr + 0, pwd->d[0], ra);
-    cpu_stq_le_data_ra(env, addr + 0, pwd->d[1], ra);
+    cpu_stq_le_data_ra(env, addr + 8, pwd->d[1], ra);
 }
 
 void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
-- 
2.25.1


