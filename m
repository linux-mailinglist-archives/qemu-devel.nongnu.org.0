Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57320350F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 12:46:46 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJyP-0003s7-Gi
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 06:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnJut-0007Vr-3Y
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:43:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnJun-0005Ns-NR
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592822581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1d4+AqSDqGfJkeEjnBYPQYUUDp1KXCUfhn2k6CKug8=;
 b=EQ4PsEOzdRg/YnDdyLDmKYS1s3tiN9Yob9q8XibECXkv8CwZw8ctf9DpKoAI53j+HW9nNi
 6UUGwUNj8Iug8hGSz74i8YdW9WqJLnQOtQJ2xS5FRSpF8+dCe7Y8BXuvJJT0yasf0V1BWo
 vB/oQouyAhgAvgdRqOWvJHnVDdP+Jz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-mYjWCdYOOxWyDYcdn8lXlQ-1; Mon, 22 Jun 2020 06:42:59 -0400
X-MC-Unique: mYjWCdYOOxWyDYcdn8lXlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61A85184D142;
 Mon, 22 Jun 2020 10:42:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 869D85BAE8;
 Mon, 22 Jun 2020 10:42:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 082B21138470; Mon, 22 Jun 2020 12:42:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/22] pci: Delete useless error_propagate()
Date: Mon, 22 Jun 2020 12:42:30 +0200
Message-Id: <20200622104250.1404835-3-armbru@redhat.com>
In-Reply-To: <20200622104250.1404835-1-armbru@redhat.com>
References: <20200622104250.1404835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jens Freimann <jfreimann@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Jens Freimann <jfreimann@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b22dedc88c..de0fae10ab 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2123,7 +2123,6 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         if (!pci_bus_is_express(pci_get_bus(pci_dev))) {
             error_setg(errp, "failover primary device must be on "
                              "PCIExpress bus");
-            error_propagate(errp, local_err);
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
@@ -2131,7 +2130,6 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         if (class_id != PCI_CLASS_NETWORK_ETHERNET) {
             error_setg(errp, "failover primary device is not an "
                              "Ethernet device");
-            error_propagate(errp, local_err);
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
@@ -2141,7 +2139,6 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         } else {
             error_setg(errp, "failover: primary device must be in its own "
                               "PCI slot");
-            error_propagate(errp, local_err);
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
-- 
2.26.2


