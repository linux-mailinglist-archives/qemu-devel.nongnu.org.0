Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AA650F4B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQY-0002la-OI; Mon, 19 Dec 2022 10:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQQ-0002g3-NW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQO-0000ba-NW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGb8EsvCLDZKFHBORG6IvQ8r89fYsv8L+hwGeHibn5s=;
 b=VGIumZLC7LLwwJB2jY0bKK9bFhOBFx/HdO6YjfwrTlhqZroiPdajBr06dGAceKnD9Se+NU
 GT9e8qxGyXFuZIBG6sBzGRdmFE1LOaKuNpf5CvORggqh+GEAoxItZ0PjQI/Nn0UgxIgMOz
 heC+9waPuXFLymBs8Dkac1zZfQepPWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-W8wWch6uN0eXxhZi0O6WeQ-1; Mon, 19 Dec 2022 10:51:23 -0500
X-MC-Unique: W8wWch6uN0eXxhZi0O6WeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EBC385A588;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 036CC1121314;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 65DE121E6699; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 08/13] pci: Fix silent truncation of pcie_aer_inject_error
 argument
Date: Mon, 19 Dec 2022 16:51:15 +0100
Message-Id: <20221219155120.2273041-9-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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

PCI AER error status is 32 bit.  The HMP command supports both
symbolic and numeric error status: anything that isn't a known
symbolic value is parsed as number with strtol().  Issues:

* Empty argument yields value zero.

* Range errors from strtol() are ignored, value is UINT32_MAX.

* Values not representable in uint32_t are silently truncated.

Fix to reject such input by switching to strtoui().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221201121133.3813857-9-armbru@redhat.com>
---
 hw/pci/pcie_aer.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index eff62f3945..58d20816d6 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -30,6 +30,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pcie_regs.h"
 #include "qapi/error.h"
+#include "qemu/cutils.h"
 
 //#define DEBUG_PCIE
 #ifdef DEBUG_PCIE
@@ -963,6 +964,7 @@ static int do_pcie_aer_inject_error(Monitor *mon,
     const char *id = qdict_get_str(qdict, "id");
     const char *error_name;
     uint32_t error_status;
+    unsigned int num;
     bool correctable;
     PCIDevice *dev;
     PCIEAERErr err;
@@ -983,14 +985,13 @@ static int do_pcie_aer_inject_error(Monitor *mon,
 
     error_name = qdict_get_str(qdict, "error_status");
     if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
-        char *e = NULL;
-        error_status = strtoul(error_name, &e, 0);
-        correctable = qdict_get_try_bool(qdict, "correctable", false);
-        if (!e || *e != '\0') {
+        if (qemu_strtoui(error_name, NULL, 0, &num) < 0) {
             monitor_printf(mon, "invalid error status value. \"%s\"",
                            error_name);
             return -EINVAL;
         }
+        error_status = num;
+        correctable = qdict_get_try_bool(qdict, "correctable", false);
     }
     err.status = error_status;
     err.source_id = pci_requester_id(dev);
-- 
2.37.3


