Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4363A26F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5q-0005Jj-5q; Mon, 28 Nov 2022 03:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5j-0005HU-U5
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5h-0008IQ-9m
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0g3mdWQWgww8n+FGFHWIsjNHNcqysuQT+Exj9YJ4EA=;
 b=eNFHVJdR1a/XngUmMh09yNGFd61lIE2Ho9xGgVAUOGw+GKopJZj/F4rytysmsBMYj31w9A
 uowwDB1cZbunGWLN5qnoAMC1G5U8tvP15eNWwMY8WQZFtHkhYb+nsWzh8OswJ9L4xCSScV
 T6UZfAeX4pljKPuscFPAK5DpjbmEJgk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-G0IdT9VEPTawsfc9b3KS4w-1; Mon, 28 Nov 2022 03:02:10 -0500
X-MC-Unique: G0IdT9VEPTawsfc9b3KS4w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BB0F3C3C162;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522B54B4013;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1F7821E65CB; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 11/12] pci: Rename hmp_pcie_aer_inject_error()'s local
 variable @err
Date: Mon, 28 Nov 2022 09:02:01 +0100
Message-Id: <20221128080202.2570543-12-armbru@redhat.com>
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
References: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I'd like to use @err for an Error *err.  Rename PCIEAERErr err to
aer_err.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index b03badb1e6..0807a206e4 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -167,7 +167,7 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
     unsigned long num;
     bool correctable;
     PCIDevice *dev;
-    PCIEAERErr err;
+    PCIEAERErr aer_err;
     int ret;
 
     ret = pci_qdev_find_device(id, &dev);
@@ -194,34 +194,34 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
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


