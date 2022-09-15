Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE85BA206
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:53:42 +0200 (CEST)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvrh-0007Ru-VI
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhs-0001vz-Kg
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhm-0000Ih-E2
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xE0BU9nOVJEQ28AgpXRV0OPhcbvFY7KhQBI93Kie7mE=;
 b=Us0JaO/BXDt2i/MtaFB5YgSOxRM8WS7vDf5okiGiCyHXOTkbOnlxY1L7jqfv5gHKJIQstE
 ZvF0Tu3VuZtii5vg5zCVzsBksC2sf8Yhu95jPQVnDu5+zh5t3HtWr/038/QrKNDlD2wjUB
 UsZlyZOqs16DOsGrluLiI7BomYxPCAo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-_QHVXzfoONy1zglsDsg4Vw-1; Thu, 15 Sep 2022 16:43:24 -0400
X-MC-Unique: _QHVXzfoONy1zglsDsg4Vw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF191C07599;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9990A492B04;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1C20021E6614; Thu, 15 Sep 2022 22:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH 24/27] qapi transaction: Elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:43:14 +0200
Message-Id: <20220915204317.3766007-25-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 blockdev.c             | 3 +--
 scripts/qapi/schema.py | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index c1259f6bf1..9aac4e057c 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1039,7 +1039,7 @@ static void blockdev_do_action(TransactionAction *action, Error **errp)
 
     list.value = action;
     list.next = NULL;
-    qmp_transaction(&list, false, NULL, errp);
+    qmp_transaction(&list, NULL, errp);
 }
 
 void qmp_blockdev_snapshot_sync(const char *device, const char *node_name,
@@ -2293,7 +2293,6 @@ static TransactionProperties *get_transaction_properties(
  * Always run under BQL.
  */
 void qmp_transaction(TransactionActionList *dev_list,
-                     bool has_props,
                      struct TransactionProperties *props,
                      Error **errp)
 {
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 2bec0588c8..7fb24c2e5b 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/transaction.json',
             'qapi/ui.json',
             'qga/qapi-schema.json']
         if self.info and any(self.info.fname.endswith(mod)
-- 
2.37.2


