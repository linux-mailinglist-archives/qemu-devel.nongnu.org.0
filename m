Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35FB63A272
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5u-0005NB-5c; Mon, 28 Nov 2022 03:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5p-0005JJ-5f
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5g-0008IF-Fw
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoMkM51YXOHRxxs/Q58nlVDBV1L5s3ub5jjAv2hYOQc=;
 b=K1TeDf4jMfeEFuaVo9QQd6y5jPHWJMA/rbMV9ZzB1cDXLXaXWe2axH7iDXAqykuvAKne66
 DCNmdgjjJo+AV8G2bWi/QQGzjTo1oCouBVQdiG8zhzyBjovHsRmeRQP3lDORuFRq70Qw9r
 T3qXoQKMbkgX1QlU8Y1o9sWFhgL2BYM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-k2WnzBexPAOpySRXiOqjjg-1; Mon, 28 Nov 2022 03:02:10 -0500
X-MC-Unique: k2WnzBexPAOpySRXiOqjjg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BB281C0515A;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E764B400F;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 964FB21E65C6; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 06/12] pci: Deduplicate get_class_desc()
Date: Mon, 28 Nov 2022 09:01:56 +0100
Message-Id: <20221128080202.2570543-7-armbru@redhat.com>
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

pcibus_dev_print() contains a copy of get_class_desc().  Call the
function instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 81ffc74925..6711a75098 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2409,15 +2409,12 @@ uint8_t pci_find_capability(PCIDevice *pdev, uint8_t cap_id)
 static void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 {
     PCIDevice *d = (PCIDevice *)dev;
-    const pci_class_desc *desc;
+    int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
+    const pci_class_desc *desc = get_class_desc(class);
     char ctxt[64];
     PCIIORegion *r;
-    int i, class;
+    int i;
 
-    class = pci_get_word(d->config + PCI_CLASS_DEVICE);
-    desc = pci_class_descriptions;
-    while (desc->desc && class != desc->class)
-        desc++;
     if (desc->desc) {
         snprintf(ctxt, sizeof(ctxt), "%s", desc->desc);
     } else {
-- 
2.37.3


