Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B864C4EC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUW-0003Zh-HN; Wed, 14 Dec 2022 02:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUP-0003W3-JT
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUK-0003gS-Dp
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rewWDc0nig3TSt5RMtP2IHBgkB7HPsHvjxTex93NkvM=;
 b=eqob1MAIwxkF3a1ng3q72TC8FoP9QC/IPij+wccSx2UUYqgFuH72ihgwXzAqdePpiDSJ1U
 b6k8lGfAZKMywYaLYw9rwX/PcY/vdq4l71PvL0hfFYBB1oC2crp0NnSK+dhloV4qePw6jz
 7fJPyA3uunZjiCbr//efOBwjNcdcSDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-G9P68N-2NZOn5t-oOdJFrA-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: G9P68N-2NZOn5t-oOdJFrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A34CA85CCE0;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7724279A1;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8EA3721E60CB; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/30] qapi transaction: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:17 +0100
Message-Id: <20221214074721.731441-29-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221104160712.3005652-27-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


