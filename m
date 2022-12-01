Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC16563F0D5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iPz-0004Ib-PY; Thu, 01 Dec 2022 07:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPt-0004GJ-CG
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPp-0008F1-2G
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKPLxyfrtkL83JqU6yhe4o7v0+k6SPXp13TDygLQD4k=;
 b=ZTAGHf/w5VVucHNGjdFvBq4b0jwzEP+EecqJYcbL60j0p98lIbyrbtaz2ww/eeULpKE2OA
 bqyJ9DvyPm/eLY/xIzeMRqApk4YKs+HNFvePQF/N0y0bU03IYacBx39zTv62RpQJNQKIIV
 gGNEerojdC7es4paiie5homn0MG7cbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-IjJeAkB7MtSADqdV162zjA-1; Thu, 01 Dec 2022 07:11:41 -0500
X-MC-Unique: IjJeAkB7MtSADqdV162zjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5368185A792;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BF331120AA4;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 02F0F21E65CB; Thu,  1 Dec 2022 13:11:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 11/13] pci: Rename hmp_pcie_aer_inject_error()'s local
 variable @err
Date: Thu,  1 Dec 2022 13:11:31 +0100
Message-Id: <20221201121133.3813857-12-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I'd like to use @err for an Error *err.  Rename PCIEAERErr err to
aer_err.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci-hmp-cmds.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index a9a5bbb930..2dd65ca6ee 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -167,7 +167,7 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
     unsigned int num;
     bool correctable;
     PCIDevice *dev;
-    PCIEAERErr err;
+    PCIEAERErr aer_err;
     int ret;
 
     ret = pci_qdev_find_device(id, &dev);
@@ -193,34 +193,34 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
         error_status = num;
         correctable = qdict_get_try_bool(qdict, "correctable", false);
     }
-    err.status = error_status;
-    err.source_id = pci_requester_id(dev);
+    aer_err.status = error_status;
+    aer_err.source_id = pci_requester_id(dev);
 
-    err.flags = 0;
+    aer_err.flags = 0;
     if (correctable) {
-        err.flags |= PCIE_AER_ERR_IS_CORRECTABLE;
+        aer_err.flags |= PCIE_AER_ERR_IS_CORRECTABLE;
     }
     if (qdict_get_try_bool(qdict, "advisory_non_fatal", false)) {
-        err.flags |= PCIE_AER_ERR_MAYBE_ADVISORY;
+        aer_err.flags |= PCIE_AER_ERR_MAYBE_ADVISORY;
     }
     if (qdict_haskey(qdict, "header0")) {
-        err.flags |= PCIE_AER_ERR_HEADER_VALID;
+        aer_err.flags |= PCIE_AER_ERR_HEADER_VALID;
     }
     if (qdict_haskey(qdict, "prefix0")) {
-        err.flags |= PCIE_AER_ERR_TLP_PREFIX_PRESENT;
+        aer_err.flags |= PCIE_AER_ERR_TLP_PREFIX_PRESENT;
     }
 
-    err.header[0] = qdict_get_try_int(qdict, "header0", 0);
-    err.header[1] = qdict_get_try_int(qdict, "header1", 0);
-    err.header[2] = qdict_get_try_int(qdict, "header2", 0);
-    err.header[3] = qdict_get_try_int(qdict, "header3", 0);
+    aer_err.header[0] = qdict_get_try_int(qdict, "header0", 0);
+    aer_err.header[1] = qdict_get_try_int(qdict, "header1", 0);
+    aer_err.header[2] = qdict_get_try_int(qdict, "header2", 0);
+    aer_err.header[3] = qdict_get_try_int(qdict, "header3", 0);
 
-    err.prefix[0] = qdict_get_try_int(qdict, "prefix0", 0);
-    err.prefix[1] = qdict_get_try_int(qdict, "prefix1", 0);
-    err.prefix[2] = qdict_get_try_int(qdict, "prefix2", 0);
-    err.prefix[3] = qdict_get_try_int(qdict, "prefix3", 0);
+    aer_err.prefix[0] = qdict_get_try_int(qdict, "prefix0", 0);
+    aer_err.prefix[1] = qdict_get_try_int(qdict, "prefix1", 0);
+    aer_err.prefix[2] = qdict_get_try_int(qdict, "prefix2", 0);
+    aer_err.prefix[3] = qdict_get_try_int(qdict, "prefix3", 0);
 
-    ret = pcie_aer_inject_error(dev, &err);
+    ret = pcie_aer_inject_error(dev, &aer_err);
     if (ret < 0) {
         monitor_printf(mon, "failed to inject error: %s\n",
                        strerror(-ret));
-- 
2.37.3


