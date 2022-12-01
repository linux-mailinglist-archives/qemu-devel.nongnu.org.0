Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8A63F067
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iPp-0004EM-JV; Thu, 01 Dec 2022 07:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPn-0004Dy-7F
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPl-0008D0-08
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YixPRplXpwk1IUhyR7iCRWD6GAOzLbqkxOvf6Rkgyt4=;
 b=jH4IAiCPW6vywgw12WgK4DXNU9l9H3stpVUk6LnNxXXcmKBRsLHvNcoxoX29jN2KkUdiH5
 EMrXbH2P0OyujMZn2X3a5TXMV9GHYDIiE3P2BpUK1xDQIr5Dkj1AhLc8x4rW4/bwkUtL0w
 iJO85r/sOTcmpm6I++J0GR5gRKrcWKI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-HzsFXjvMN9yzz5zXlqDEZA-1; Thu, 01 Dec 2022 07:11:37 -0500
X-MC-Unique: HzsFXjvMN9yzz5zXlqDEZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D39C29AB402;
 Thu,  1 Dec 2022 12:11:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EDEA2166B49;
 Thu,  1 Dec 2022 12:11:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E561C21E6681; Thu,  1 Dec 2022 13:11:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 04/13] pci: Make query-pci stub consistent with the real one
Date: Thu,  1 Dec 2022 13:11:24 +0100
Message-Id: <20221201121133.3813857-5-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

QMP query-pci and HMP info pci can behave differently when there are
no PCI devices.  They can report nothing, like this:

    qemu-system-aarch64 -S -M spitz -display none -monitor stdio
    QEMU 7.1.91 monitor - type 'help' for more information
    (qemu) info pci

Or they can fail, like this:

    qemu-system-microblaze -M petalogix-s3adsp1800 -display none -monitor stdio
    QEMU 7.1.91 monitor - type 'help' for more information
    (qemu) info pci
    PCI devices not supported

They fail when none of the target's machines supports PCI, i.e. when
we're using qmp_query_pci() from hw/pci/pci-stub.c.

The error is not useful, and reporting nothing makes sense, so do that
in pci-stub.c, too.

Now qmp_query_pci() can't fail anymore.  Drop the dead error handling
from hmp_info_pci().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 8 +-------
 hw/pci/pci-stub.c     | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 5adfe4f57f..e915fb9fe7 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -105,14 +105,8 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
 void hmp_info_pci(Monitor *mon, const QDict *qdict)
 {
     PciInfoList *info_list, *info;
-    Error *err = NULL;
 
-    info_list = qmp_query_pci(&err);
-    if (err) {
-        monitor_printf(mon, "PCI devices not supported\n");
-        error_free(err);
-        return;
-    }
+    info_list = qmp_query_pci(&error_abort);
 
     for (info = info_list; info; info = info->next) {
         PciDeviceInfoList *dev;
diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 3a027c42e4..f29ecc999e 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -21,9 +21,7 @@
 #include "qemu/osdep.h"
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
-#include "qapi/error.h"
 #include "qapi/qapi-commands-pci.h"
-#include "qapi/qmp/qerror.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
@@ -33,7 +31,6 @@ bool pci_available;
 
 PciInfoList *qmp_query_pci(Error **errp)
 {
-    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
-- 
2.37.3


