Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1442769FA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 09:03:49 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLLIA-0003BW-Qx
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 03:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1kLLF8-0000Z2-VW
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1kLLF6-0005H2-V0
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600930835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQLMvXv0mUTil+NTyNbK8XITxK8lzlUehkO/ZxdRbFw=;
 b=aMl57rKCQH5JDVitz8GwMjj85yGpR1I/iOhJxw3Doi3EYziXYTs0FRmUFgxcBMWg35t5hX
 xXJD6/L4WbOVgt39in9ZcuEAQFf7Guiot8QZ+xJiK9dXohZw9lxZaT53O9ySVHw3vLEtXh
 3o5LavSkx07qxH9eHjyFP65vwzAREls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-F3VBvfzJN9yoivFLgfIQag-1; Thu, 24 Sep 2020 03:00:33 -0400
X-MC-Unique: F3VBvfzJN9yoivFLgfIQag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C383510BBED7;
 Thu, 24 Sep 2020 07:00:32 +0000 (UTC)
Received: from pc-72.home.com (unknown [10.40.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1192573668;
 Thu, 24 Sep 2020 07:00:30 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 1/7] hw/acpi/pcihp: Enhance
 acpi_pcihp_disable_root_bus() to support Q35
Date: Thu, 24 Sep 2020 09:00:07 +0200
Message-Id: <20200924070013.165026-2-jusual@redhat.com>
In-Reply-To: <20200924070013.165026-1-jusual@redhat.com>
References: <20200924070013.165026-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
'acpi-root-pci-hotplug' flag.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/acpi/pcihp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 39b1f74442..ff23104aea 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -107,13 +107,14 @@ static void acpi_set_pci_info(void)
 static void acpi_pcihp_disable_root_bus(void)
 {
     static bool root_hp_disabled;
+    Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
 
     if (root_hp_disabled) {
         return;
     }
 
-    bus = find_i440fx();
+    bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
         qbus_set_hotplug_handler(BUS(bus), NULL);
-- 
2.25.4


