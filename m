Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578A121222A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:24:56 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqxKp-00076e-Bz
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6F-0006pk-JD
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60565
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx66-0000zy-Iq
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ht/7Dy/qwWPUyUse4K7PXyUG1r99rkVd8mQxIfUH/Os=;
 b=N+LfrD/l7UYOHRd5yeryDEpx9KNXUpW10Dz57QnpygpCMx3pSos04tRYW5z12xymXaKrCD
 nEK+i3BDP9kvc0+NvMCqGEOp6SVTZNT5630EiiMKdtZL0C5z4rxeoRKIfHfRxIiN3uzT1J
 dq9XviK62xfU21r69DUd+V3YBaqgq4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-KarHKY-JONeioJyC1Qyv7w-1; Thu, 02 Jul 2020 07:09:39 -0400
X-MC-Unique: KarHKY-JONeioJyC1Qyv7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97291186A206;
 Thu,  2 Jul 2020 11:09:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A295C1D3;
 Thu,  2 Jul 2020 11:09:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 971851138470; Thu,  2 Jul 2020 13:09:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] pci: Delete useless error_propagate()
Date: Thu,  2 Jul 2020 13:09:07 +0200
Message-Id: <20200702110931.2953148-5-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
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
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20200630090351.1247703-3-armbru@redhat.com>
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


