Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C1627691B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 08:39:49 +0200 (CEST)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLKuy-0003cc-6r
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 02:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKje-0000KB-Ed
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 02:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjW-0001ib-Pz
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 02:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600928878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mXW4YbhE8P8wqeut/V/y0A0w6VnjkPD/xM+kYr67uo=;
 b=a7wrk8n1NMN01WfFLyZWifjuunMoZ/UDwqM2vYDNRcv+iLbMgHGQ592+8sVy2jNTxKgnRs
 LtSpkVg31Khy+Lc8kJ4ey7PEHK1kxCE6rgvOXH4B0RZ444HNXL0ra/4P6YLhi9TdCCnRXN
 BB+/MV9qbaNMMdpa7G0kxCeCqUX4E2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-nHoY7tMjMQyDgi0HBaz6fg-1; Thu, 24 Sep 2020 02:27:56 -0400
X-MC-Unique: nHoY7tMjMQyDgi0HBaz6fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FD04801AC5;
 Thu, 24 Sep 2020 06:27:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8DC60E1C;
 Thu, 24 Sep 2020 06:27:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A5EB31F09; Thu, 24 Sep 2020 08:27:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] acpi/gpex: no reason to use a method for _CRS
Date: Thu, 24 Sep 2020 08:27:33 +0200
Message-Id: <20200924062734.22978-11-kraxel@redhat.com>
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... just to return something which is constant anyway.

-            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
-            {
-                Return (ResourceTemplate ()
-                {
-                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
[ ... ]

+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
[ ... ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 6fb951a0c19f..dbb350a837f8 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -57,7 +57,6 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(method, aml_return(aml_int(cfg->ecam.base)));
     aml_append(dev, method);
 
-    method = aml_method("_CRS", 0, AML_NOTSERIALIZED);
     Aml *rbuf = aml_resource_template();
     aml_append(rbuf,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
@@ -89,8 +88,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                                     0x0000,
                                     cfg->mmio64.size));
     }
-    aml_append(method, aml_return(rbuf));
-    aml_append(dev, method);
+    aml_append(dev, aml_name_decl("_CRS", rbuf));
 
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
-- 
2.27.0


