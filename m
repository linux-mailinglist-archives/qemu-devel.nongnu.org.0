Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB8619CC1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:14:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzEn-0000QD-OD; Fri, 04 Nov 2022 12:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzEH-0008BT-WA
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzE5-0007et-3F
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9LvSJ3NtKIhQw05v5s2Epts4+SnnDPBbYWoqyZ+i5A=;
 b=KOpdu8wgssksloJwJJetAMqz4rUdyX8u/Mdv8DV17y/3XFqHqy+ZJJ5hsZJ3avHD1hatKn
 GTiD8hl4xeqXdSaqsve4SNaVmv817rAJRnjwbX5EwipjlZrT2foPD0WnA1L/IS9tshzRke
 kO1ybITzxduwygrQlYAzPyH6/+xxpp0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-JzXi3lXQMr2Ymyzi-ym0ZQ-1; Fri, 04 Nov 2022 12:07:16 -0400
X-MC-Unique: JzXi3lXQMr2Ymyzi-ym0ZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DED5101A58E;
 Fri,  4 Nov 2022 16:07:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA611140EBF5;
 Fri,  4 Nov 2022 16:07:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71F2621E60CD; Fri,  4 Nov 2022 17:07:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v3 26/30] qapi transaction: Elide redundant has_FOO in
 generated C
Date: Fri,  4 Nov 2022 17:07:08 +0100
Message-Id: <20221104160712.3005652-27-armbru@redhat.com>
In-Reply-To: <20221104160712.3005652-1-armbru@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In qmp_transaction(), we can't just drop parameter @has_props, since
it's used to track whether @props needs to be freed.  Replace it by a
local variable.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 blockdev.c             | 4 ++--
 scripts/qapi/schema.py | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 59753400e9..75eef8535e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1048,7 +1048,7 @@ static void blockdev_do_action(TransactionAction *action, Error **errp)
 
     list.value = action;
     list.next = NULL;
-    qmp_transaction(&list, false, NULL, errp);
+    qmp_transaction(&list, NULL, errp);
 }
 
 void qmp_blockdev_snapshot_sync(const char *device, const char *node_name,
@@ -2289,11 +2289,11 @@ static TransactionProperties *get_transaction_properties(
  * Always run under BQL.
  */
 void qmp_transaction(TransactionActionList *dev_list,
-                     bool has_props,
                      struct TransactionProperties *props,
                      Error **errp)
 {
     TransactionActionList *dev_entry = dev_list;
+    bool has_props = !!props;
     JobTxn *block_job_txn = NULL;
     BlkActionState *state, *next;
     Error *local_err = NULL;
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


