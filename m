Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E96EA9B8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:55:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppKz-0006Uf-J2; Fri, 21 Apr 2023 07:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pppKu-0006SG-M5; Fri, 21 Apr 2023 07:53:57 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pppKp-0003wG-TQ; Fri, 21 Apr 2023 07:53:56 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2869361849;
 Fri, 21 Apr 2023 14:53:41 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id SrdkeT1Ona60-vFiC0ibA; Fri, 21 Apr 2023 14:53:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682078020; bh=wOEhVxYAGrqJSK7lXVEC9QcMv1ttXSR+FUXx6lSrPEc=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=qq8SGLmD2JVaM7t80ya4M/ujAN3Ppqbv2RLBHX9AFqRQFWm1elF/Et1AzmOqCRzmk
 Fme7M4UZrqsHH3HYYhdY3Zxf6sjIlHd9Vfh7+06OvviVQvznnpP9SIHwFORIqfwklv
 GTETlMjniIoqNMI1uqG8wy+qIrGvQN6Y3CpPGoRM=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 alexander.ivanov@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v8 3/5] blockdev: qmp_transaction: refactor loop to classic for
Date: Fri, 21 Apr 2023 14:53:25 +0300
Message-Id: <20230421115327.907104-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421115327.907104-1-vsementsov@yandex-team.ru>
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
---
 blockdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 2174ab2694..89c573a094 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2375,7 +2375,7 @@ void qmp_transaction(TransactionActionList *actions,
                      struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *act = actions;
+    TransactionActionList *act;
     bool has_properties = !!properties;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
@@ -2395,14 +2395,11 @@ void qmp_transaction(TransactionActionList *actions,
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


