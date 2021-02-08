Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5147313CEA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:14:15 +0100 (CET)
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B38-0006zv-Pf
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94lD-00023h-IY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94ky-0002bR-0D
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7EjN/BVvI2LI8U3n5kPOXaqjdiqQ9k1KV92LfmtmpM=;
 b=bMgnRN6GlSu+3nKu7Cx0tpTDfjTszQn8ZDTVh6PNNCmv3fMnFmNPyduw5YkOHxXrxzzPME
 bQRw0bnmxSo9ekgVnqAIblVTWCNRIjSo0QXDu0IKmUU/jAMcv96mZS0z0MlImg2mYLTLG7
 PCrRfqy3UZH0eqPfsDW7TUCUR0eGoqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-WrSx8MpfPK-ll2qNgIJQWg-1; Mon, 08 Feb 2021 06:31:00 -0500
X-MC-Unique: WrSx8MpfPK-ll2qNgIJQWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D69EB804023;
 Mon,  8 Feb 2021 11:30:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4CD4101F92F;
 Mon,  8 Feb 2021 11:30:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 23/27] migration: introduce a delete_snapshot wrapper
Date: Mon,  8 Feb 2021 11:29:14 +0000
Message-Id: <20210208112918.185058-24-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Make snapshot deletion consistent with the snapshot save
and load commands by using a wrapper around the blockdev
layer. The main difference is that we get upfront validation
of the passed in device list (if any).

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210204124834.774401-10-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/snapshot.h | 13 +++++++++++++
 migration/savevm.c           | 14 ++++++++++++++
 monitor/hmp-cmds.c           |  2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index 3bdbef435b..e72083b117 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -48,4 +48,17 @@ bool load_snapshot(const char *name,
                    bool has_devices, strList *devices,
                    Error **errp);
 
+/**
+ * delete_snapshot: Delete a snapshot.
+ * @name: path to snapshot
+ * @has_devices: whether to use explicit device list
+ * @devices: explicit device list to snapshot
+ * @errp: pointer to error object
+ * On success, return %true.
+ * On failure, store an error through @errp and return %false.
+ */
+bool delete_snapshot(const char *name,
+                    bool has_devices, strList *devices,
+                    Error **errp);
+
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 0b27a8c55a..0c5d61ae20 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3071,6 +3071,20 @@ err_drain:
     return false;
 }
 
+bool delete_snapshot(const char *name, bool has_devices,
+                     strList *devices, Error **errp)
+{
+    if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
+        return false;
+    }
+
+    if (bdrv_all_delete_snapshot(name, has_devices, devices, errp) < 0) {
+        return false;
+    }
+
+    return true;
+}
+
 void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
 {
     qemu_ram_set_idstr(mr->ram_block,
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 15d4e039ac..3c88a4faef 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1159,7 +1159,7 @@ void hmp_delvm(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
     const char *name = qdict_get_str(qdict, "name");
 
-    bdrv_all_delete_snapshot(name, false, NULL, &err);
+    delete_snapshot(name, false, NULL, &err);
     hmp_handle_error(mon, err);
 }
 
-- 
2.29.2


