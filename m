Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AD212217
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:22:07 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqxI6-0001Xf-2I
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6H-0006th-5p
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26548
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx67-00010t-S3
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orLEs/st4z+98WKKkXWW9yD1S/2gZlu3UTgztQYfRnU=;
 b=V5/jgcJEQxENLx9q3/LE4ylREr+jD7NbvyuNDYI6OjVuIHWdtvBKWVPqanF7dP+dOr8HGV
 o1Vmvus9NTQXR0LYeq6WnkS/wDNK8QGgrwzkCPnQr8MuGEALc+YGw661obUMbv0lpwLBOk
 8HohO2ivtE0QaWzpaT+JXWFm9QdPPeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-eJEVdWM0PKSq13EEX8PGRg-1; Thu, 02 Jul 2020 07:09:39 -0400
X-MC-Unique: eJEVdWM0PKSq13EEX8PGRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67BAB10059AA;
 Thu,  2 Jul 2020 11:09:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 299AB79229;
 Thu,  2 Jul 2020 11:09:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A83E1138483; Thu,  2 Jul 2020 13:09:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] amd_iommu: Fix amdvi_realize() error API violation
Date: Thu,  2 Jul 2020 13:09:26 +0200
Message-Id: <20200702110931.2953148-24-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

amdvi_realize() is wrong that way: it passes @errp to qdev_realize(),
object_property_get_int(), and msi_init() without checking it.  I
can't tell offhand whether qdev_realize() can fail here.  Fix by
checking it for failure.  object_property_get_int() can't.  Fix by
passing &error_abort instead.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200630090351.1247703-22-armbru@redhat.com>
---
 hw/i386/amd_iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index b26d30da57..087f601666 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1549,7 +1549,9 @@ static void amdvi_realize(DeviceState *dev, Error **errp)
 
     /* This device should take care of IOMMU PCI properties */
     x86_iommu->type = TYPE_AMD;
-    qdev_realize(DEVICE(&s->pci), &bus->qbus, errp);
+    if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
+        return;
+    }
     ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
                                          AMDVI_CAPAB_SIZE, errp);
     if (ret < 0) {
@@ -1578,7 +1580,7 @@ static void amdvi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, AMDVI_BASE_ADDR);
     pci_setup_iommu(bus, amdvi_host_dma_iommu, s);
-    s->devid = object_property_get_int(OBJECT(&s->pci), "addr", errp);
+    s->devid = object_property_get_int(OBJECT(&s->pci), "addr", &error_abort);
     msi_init(&s->pci.dev, 0, 1, true, false, errp);
     amdvi_init(s);
 }
-- 
2.26.2


