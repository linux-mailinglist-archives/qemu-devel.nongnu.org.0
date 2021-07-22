Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3793D20E1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:30:00 +0200 (CEST)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6V1j-00048D-DB
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhuguanghong@uniontech.com>)
 id 1m6UzM-0003LT-Bz
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:27:35 -0400
Received: from smtpbg704.qq.com ([203.205.195.105]:58834
 helo=smtpproxy21.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhuguanghong@uniontech.com>)
 id 1m6UzI-0006v2-GA
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:27:30 -0400
X-QQ-mid: bizesmtp33t1626946032tp68cdww
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 22 Jul 2021 17:27:06 +0800 (CST)
X-QQ-SSF: 01400000008000303000B00A0000000
X-QQ-FEAT: PML9g4LxpBraKjgmxosHu4KPxTyyZSOeyFrPLytEn4++MRXVhq/DUzmfKrrI7
 wJKzhGV/oyH4pkvf/UpvaprX5Sy3+seH/avmOkMGOCnF9N2hIHBI5O2Xx3QTRfmJciUnK2C
 czw8RNZaIkwWn+X+wagcwZCh+veMJn3/7ytbEfpttlyw5LISyZHga9eeLb5dzpR08t4m/JD
 g7l9C9lW5J1zuBhfUcTC+sFk2yIxC5I3KoELkqxHcF0H91PpTNlIFc6BVwhuAm0AIfva/w2
 fq4ploUl7upzEp9sFjwy6FJBlQ/un7nc5mS5n23mHd0IOGc048Fl1Q5Akb7yc3VCeWook6G
 DbLuLnJ4Z0ITCSwa3I=
X-QQ-GoodBg: 2
From: zhuguanghong <zhuguanghong@uniontech.com>
To: pbonzini@redhat.com,
	berrange@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH] qom/object.c 	How about using G_LOCK ? thread safety
Date: Thu, 22 Jul 2021 17:27:03 +0800
Message-Id: <20210722092703.27038-1-zhuguanghong@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=203.205.195.105;
 envelope-from=zhuguanghong@uniontech.com; helo=smtpproxy21.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhuguanghong <zhuguanghong@uniontech.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: zhuguanghong <zhuguanghong@uniontech.com>
---
 qom/object.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index 6a01d56546..dc0a363ed0 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -73,15 +73,19 @@ struct TypeImpl
 };
 
 static Type type_interface;
+G_LOCK_DEFINE (GHashTable_mutex);
 
 static GHashTable *type_table_get(void)
 {
     static GHashTable *type_table;
+    G_LOCK ( GHashTable_mutex);	
 
     if (type_table == NULL) {
         type_table = g_hash_table_new(g_str_hash, g_str_equal);
     }
 
+    G_UNLOCK ( GHashTable_mutex);	
+
     return type_table;
 }
 
-- 
2.20.1




