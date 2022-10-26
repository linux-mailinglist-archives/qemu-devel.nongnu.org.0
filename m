Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3ED60E7A8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:52:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlGW-0007sA-Gn; Wed, 26 Oct 2022 14:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onlFz-0007WD-AP
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onlFc-0003Cr-S4
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666809340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DM01726EPIOf2VuUlrc2hSZMILvSJDV9Ushkp5iyHk=;
 b=DjFqHfc5I21SvpxGS+6kBqEpEBd40HVdUnhoYi4EEiB4GQXEkHyf0MJD7bJXoLPFSFO/0L
 Ne3OE5N2SenqEKPnfYw7eJ2cK/U0LXDoRv0QeHkT5FBRkgaatChaF27khIswobeRnavdK2
 j1yaqLQCwcEdREWiWG2kyNThPafJhCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-xxvPqVZvMC2rf0mqsyXbkw-1; Wed, 26 Oct 2022 14:35:36 -0400
X-MC-Unique: xxvPqVZvMC2rf0mqsyXbkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 707C5185A7AC;
 Wed, 26 Oct 2022 18:35:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C953C15BB4;
 Wed, 26 Oct 2022 18:35:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D36B21E65D7; Wed, 26 Oct 2022 20:35:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Subject: [PULL v2 24/28] qapi transaction: Elide redundant has_FOO in
 generated C
Date: Wed, 26 Oct 2022 20:35:28 +0200
Message-Id: <20221026183532.487708-25-armbru@redhat.com>
In-Reply-To: <20221026183532.487708-1-armbru@redhat.com>
References: <20221026183532.487708-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/transaction.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221018062849.3420573-25-armbru@redhat.com>
---
 blockdev.c             | 3 +--
 scripts/qapi/schema.py | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 6a3b8cdbc6..0900a38ca6 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1048,7 +1048,7 @@ static void blockdev_do_action(TransactionAction *action, Error **errp)
 
     list.value = action;
     list.next = NULL;
-    qmp_transaction(&list, false, NULL, errp);
+    qmp_transaction(&list, NULL, errp);
 }
 
 void qmp_blockdev_snapshot_sync(const char *device, const char *node_name,
@@ -2288,7 +2288,6 @@ static TransactionProperties *get_transaction_properties(
  * Always run under BQL.
  */
 void qmp_transaction(TransactionActionList *dev_list,
-                     bool has_props,
                      struct TransactionProperties *props,
                      Error **errp)
 {
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index f0726af876..3673296ad8 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/transaction.json',
             'qapi/ui.json',
             'qapi/virtio.json',
             'qga/qapi-schema.json']
-- 
2.37.3


