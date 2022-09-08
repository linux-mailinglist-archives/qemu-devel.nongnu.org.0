Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32015B1E01
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:08:18 +0200 (CEST)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHGT-0007DZ-Ex
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oWGlA-0004BK-Ml
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:36:06 -0400
Received: from m15113.mail.126.com ([220.181.15.113]:6507)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>) id 1oWGl4-00016Y-Mk
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=E9rgI
 7sw8eIi/uU0satMAovQ4EYJV/3fw0YimVC6b7g=; b=CSBw4xxNh0PJcxn79fWJj
 wKO+dOqbk5EArD1ul/cAXsNNDi8DzTazYbLiFJP9qbcI2bxQS//pIJLrvBLwb1eA
 xz271wSw4XQ+gQ575QsqtW9ySyxwZZbGK4FZ6UqC7ye2KnTMWTAkkhE5w7MjXblD
 qFEgz5MR9ZnBXGWVzHvrpM=
Received: from localhost.localdomain (unknown [58.56.96.29])
 by smtp3 (Coremail) with SMTP id DcmowAB3pMCY4RljnnDNBA--.1718S2;
 Thu, 08 Sep 2022 20:35:38 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: stefanha@redhat.com, fam@euphon.net, eblake@redhat.com,
 vsementsov@yandex-team.ru, jsnow@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, liuhaiwei <liuhaiwei@inpsur.com>,
 liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH] =?UTF-8?q?migrate=20block=20dirty=20bitmap:=20Fix=20the?=
 =?UTF-8?q?=20block=20dirty=20bitmap=20can't=20to=20migration=5Fcompletion?=
 =?UTF-8?q?=20when=20pending=20size=20=20larger=20than=20threshold=20size?=
 =?UTF-8?q?=20=20:=201=E3=80=81dirty=20bitmap=20size=20big=20enough=20(suc?=
 =?UTF-8?q?h=20as=208MB)=20when=20block=20size=201T=202=E3=80=81we=20set?=
 =?UTF-8?q?=20the=20migrate=20speed=20or=20the=20bandwith=20is=20small=20e?=
 =?UTF-8?q?nough(such=20as=204MB/s)?=
Date: Thu,  8 Sep 2022 08:35:25 -0400
Message-Id: <20220908123525.197397-1-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAB3pMCY4RljnnDNBA--.1718S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gryxtr13XFWxtF48XryDGFg_yoWfurb_Kw
 4kGa1xJry7AwnxCF98Xr15Jrn8A34kC3WxW3yIq34UXa48AasrWw4v9rZaqrZ7JFZrCFy3
 G34rXryvyFs3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnCPfDUUUUU==
X-Originating-IP: [58.56.96.29]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/xtbBGgN21l-HZzbQaAAAsI
Received-SPF: pass client-ip=220.181.15.113;
 envelope-from=liuhaiwei9699@126.com; helo=m15113.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Sep 2022 08:59:46 -0400
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

From: liuhaiwei <liuhaiwei@inpsur.com>

so we set the fake pending size when pending size > threshold size

Signed-off-by: liuhaiwei <liuhaiwei@inpsur.com>
Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
---
 migration/block-dirty-bitmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..6086d8d1c3 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -782,7 +782,10 @@ static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
     }
 
     qemu_mutex_unlock_iothread();
-
+    /*we set the fake pending size  when the dirty bitmap size more than max_size(bandwith of speed) */
+    if(pending > max_size && max_size == 0){
+        pending = max_size - 1;
+    }
     trace_dirty_bitmap_save_pending(pending, max_size);
 
     *res_postcopy_only += pending;
-- 
2.27.0


