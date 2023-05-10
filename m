Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96BD6FE132
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:09:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPE-0006rL-O2; Wed, 10 May 2023 11:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwlPC-0006q0-0E; Wed, 10 May 2023 11:07:02 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwlP0-0001TQ-BV; Wed, 10 May 2023 11:07:01 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a884:0:640:947b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0731D5EC41;
 Wed, 10 May 2023 18:06:39 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown [2a02:6b8:b081:2::1:11])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id P6XgPR0OpqM0-NZaHfJiA; 
 Wed, 10 May 2023 18:06:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683731198; bh=nvoPU4S7do5RGX01Rb8JMhvLZHytwNpwMwx5W9ccy6I=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=lWsz/EANzQlx1nGycEkLOqDqJd9ZYeSzpqYDR2AUHvTO8iVyc7eP+sLvz265zb5jK
 iC3zrOAAjKYZKWPzN3wiQxkhGkkhw9eW75v/1g8mejMP1wx7Ipfrn98H2rJouXPM/D
 eFCRkbcJu04BNCuQ/FitGBANrhHcDXk+cpzywXIk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: [PATCH v9 3/6] blockdev: qmp_transaction: refactor loop to classic for
Date: Wed, 10 May 2023 18:06:21 +0300
Message-Id: <20230510150624.310640-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510150624.310640-1-vsementsov@yandex-team.ru>
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f72084d206..f236e5c27e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2367,7 +2367,7 @@ void qmp_transaction(TransactionActionList *actions,
                      struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *act = actions;
+    TransactionActionList *act;
     bool has_properties = !!properties;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
@@ -2387,14 +2387,11 @@ void qmp_transaction(TransactionActionList *actions,
     bdrv_drain_all();
 
     /* We don't do anything in this loop that commits us to the operations */
-    while (NULL != act) {
-        TransactionAction *dev_info = NULL;
+    for (act = actions; act; act = act->next) {
+        TransactionAction *dev_info = act->value;
         const BlkActionOps *ops;
         BlkActionState *state;
 
-        dev_info = act->value;
-        act = act->next;
-
         assert(dev_info->type < ARRAY_SIZE(actions_map));
 
         ops = &actions_map[dev_info->type];
-- 
2.34.1


