Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379275B1FB3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:54:32 +0200 (CEST)
Received: from localhost ([::1]:47764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHzD-00072R-CK
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oWHoB-00019R-UC; Thu, 08 Sep 2022 09:43:07 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:62335)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>)
 id 1oWHo4-0005Lv-NC; Thu, 08 Sep 2022 09:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=q39WI
 ljGeJlOyOA2Eu7qdBOmPg95WDfA7A74F/yEeII=; b=UDI9QBJFjewTigCnNuUKs
 wGgjOj3eSenubr+C0pPJjfh5GLVFYW6yNGYNYcIuVjSjYTA5OwP+lHkXftvNg7DU
 4LIILalszHEU0TQzjLShBn/KJLtDGIl/AuGnrjhRhTDsWj2ZeDOLzy0lPzqYfQ0B
 I+JwnB+0xG0HKUI8oPVUBE=
Received: from localhost.localdomain (unknown [58.56.96.29])
 by smtp2 (Coremail) with SMTP id DMmowACnNLFY8Rlj5ZvCBA--.12758S2;
 Thu, 08 Sep 2022 21:42:48 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: stefanha@redhat.com, fam@euphon.net, eblake@redhat.com,
 vsementsov@yandex-team.ru, jsnow@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, liuhaiwei <liuhaiwei@inspur.com>,
 liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH] migrate block dirty bitmap: Fix the block dirty bitmap can't
 to migration_completion when pending size larger than threshold size
Date: Thu,  8 Sep 2022 09:42:36 -0400
Message-Id: <20220908134236.541312-1-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowACnNLFY8Rlj5ZvCBA--.12758S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW5tF4kGF48Gr4xurW5Awb_yoWDZwc_Kw
 48Ga1xG347AwnxCF98Xr15Jrn8A34kC3W7W3yIqFyxXa48AasrGw4vvrs3trs7XFWDCrW3
 W3yrXFy2yrn8GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5j385UUUUU==
X-Originating-IP: [58.56.96.29]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbiuBl21mJVlRRhcwAAsl
Received-SPF: pass client-ip=220.181.15.112;
 envelope-from=liuhaiwei9699@126.com; helo=m15112.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: liuhaiwei <liuhaiwei@inspur.com>

1、dirty bitmap size big enough (such as 8MB) when block size 1T ;
2、we set the migrate speed or the bandwith is small enough(such as 4MB/s)
so we set the fake pending size when pending size > threshold size

Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
---
 migration/block-dirty-bitmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..40f5a1aaf9 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -782,7 +782,10 @@ static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
     }
 
     qemu_mutex_unlock_iothread();
-
+    /*we set the fake pending size  when the dirty bitmap size more than max_size */
+    if(pending > max_size && max_size != 0){
+        pending = max_size - 1;
+    }
     trace_dirty_bitmap_save_pending(pending, max_size);
 
     *res_postcopy_only += pending;
-- 
2.27.0


