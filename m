Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249263A27D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5s-0005Lf-8U; Mon, 28 Nov 2022 03:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5i-0005HK-OY
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5g-0008IA-AY
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiV381FEMUW8USBkyYlMbdFlQZtTMO8VF3FTuVpmWuw=;
 b=bwDRt8daqGog6fxiW817D7Ad3mzL66pJgW7Y7ZpWcDN8+5heifKQa3H4jjfB43pKCirAur
 a2982bj+jM62/sSgqPgp4SsRfPz0f6F79Wq7++z6rLl0rrTRnOqsKXIF2Qh1XcdkJitG1G
 2rtjb086vrJu3/pERAqtV+qKeW1blnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-UK-DP4DAOMeQ1w6_YSaRGg-1; Mon, 28 Nov 2022 03:02:10 -0500
X-MC-Unique: UK-DP4DAOMeQ1w6_YSaRGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79794185A79C;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51EBF2166B2B;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B19421E65C8; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 08/12] pci: Fix silent truncation of pcie_aer_inject_error
 argument
Date: Mon, 28 Nov 2022 09:01:58 +0100
Message-Id: <20221128080202.2570543-9-armbru@redhat.com>
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
References: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

PCI AER error status is 32 bit.  When the HMP command's second
argument parses as a number, values greater than ULONG_MAX get
rejected, but values between UINT32_MAX+1 and ULONG_MAX get silently
truncated.  Fix to reject them, too.

While there, use qemu_strtoul() instead of strtoul() so checkpatch.pl
won't complain.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pcie_aer.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index eff62f3945..ccca5a81cc 100644
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
+    unsigned long num;
     bool correctable;
     PCIDevice *dev;
     PCIEAERErr err;
@@ -983,14 +985,14 @@ static int do_pcie_aer_inject_error(Monitor *mon,
 
     error_name = qdict_get_str(qdict, "error_status");
     if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
-        char *e = NULL;
-        error_status = strtoul(error_name, &e, 0);
-        correctable = qdict_get_try_bool(qdict, "correctable", false);
-        if (!e || *e != '\0') {
+        if (qemu_strtoul(error_name, NULL, 0, &num) < 0
+            || num > UINT32_MAX) {
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


