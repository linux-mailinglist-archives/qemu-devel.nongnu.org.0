Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E828164B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:14:19 +0200 (CEST)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMlG-0006Y2-Ia
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIX-0002QV-VZ
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIW-0004er-3v
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+0IVPVrWYAXkjq1i1jXx2xPWV/FewGcA9ZQUtQX4sKc=;
 b=blwTqRdgtwJxy04qB3Vf0080UvQ5mAALcVZ5pW38y3/gYP/P7uZZnRrupajSy/6o5dvBbG
 wlWRttC45KA0l+sKW16XvAdBwj1wWLuHkMFu5m1IztMho2R6f8UGpePr7jyUxh7k0tJPGq
 elfJtomym6Pq2hl/3vdxwoX1EBSQGmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-fmKv0q2VP-OALJ3dVle7Bw-1; Fri, 02 Oct 2020 10:44:33 -0400
X-MC-Unique: fmKv0q2VP-OALJ3dVle7Bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A4B81CAFB;
 Fri,  2 Oct 2020 14:44:31 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC22C5D9D3;
 Fri,  2 Oct 2020 14:44:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/37] block/export: Add query-block-exports
Date: Fri,  2 Oct 2020 16:43:36 +0200
Message-Id: <20201002144345.253865-29-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a simple QMP command to query the list of block exports.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200924152717.287415-25-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json | 32 ++++++++++++++++++++++++++++++++
 block/export/export.c  | 23 +++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 76e014c406..91b042b453 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -245,3 +245,35 @@
 ##
 { 'event': 'BLOCK_EXPORT_DELETED',
   'data': { 'id': 'str' } }
+
+##
+# @BlockExportInfo:
+#
+# Information about a single block export.
+#
+# @id: The unique identifier for the block export
+#
+# @type: The block export type
+#
+# @node-name: The node name of the block node that is exported
+#
+# @shutting-down: True if the export is shutting down (e.g. after a
+#                 block-export-del command, but before the shutdown has
+#                 completed)
+#
+# Since:  5.2
+##
+{ 'struct': 'BlockExportInfo',
+  'data': { 'id': 'str',
+            'type': 'BlockExportType',
+            'node-name': 'str',
+            'shutting-down': 'bool' } }
+
+##
+# @query-block-exports:
+#
+# Returns: A list of BlockExportInfo describing all block exports
+#
+# Since: 5.2
+##
+{ 'command': 'query-block-exports', 'returns': ['BlockExportInfo'] }
diff --git a/block/export/export.c b/block/export/export.c
index 8702c233f3..657bb58b51 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -286,3 +286,26 @@ void qmp_block_export_del(const char *id,
 
     blk_exp_request_shutdown(exp);
 }
+
+BlockExportInfoList *qmp_query_block_exports(Error **errp)
+{
+    BlockExportInfoList *head = NULL, **p_next = &head;
+    BlockExport *exp;
+
+    QLIST_FOREACH(exp, &block_exports, next) {
+        BlockExportInfoList *entry = g_new0(BlockExportInfoList, 1);
+        BlockExportInfo *info = g_new(BlockExportInfo, 1);
+        *info = (BlockExportInfo) {
+            .id             = g_strdup(exp->id),
+            .type           = exp->drv->type,
+            .node_name      = g_strdup(bdrv_get_node_name(blk_bs(exp->blk))),
+            .shutting_down  = !exp->user_owned,
+        };
+
+        entry->value = info;
+        *p_next = entry;
+        p_next = &entry->next;
+    }
+
+    return head;
+}
-- 
2.25.4


