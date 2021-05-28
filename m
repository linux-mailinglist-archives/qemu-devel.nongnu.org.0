Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C117339442E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:25:45 +0200 (CEST)
Received: from localhost ([::1]:41514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdQm-00084K-SB
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNV-0003zD-LI
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNU-0001rz-2C
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622211737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pd+QmVgA1uX4NS1J5obOlelK6DlI/Xr4wVltSdty+l0=;
 b=DHyepadWeyVsUG0PNJAdNsKK7LHKNnwnAwNike1gpYAvhRkeBwuj5D7yyNvLj87oNfgpa+
 YxeJsWAz/FVvQvgYlha9K/GFzQ12SXOysDjbXN9eiainCYnt3a6brMb96D+BoYsjkRrT7c
 qqFslePC9pZ4EF6GY6wNsUDp2Qd2fuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-J1J7RTUmNmelqFIRwQy19w-1; Fri, 28 May 2021 10:22:13 -0400
X-MC-Unique: J1J7RTUmNmelqFIRwQy19w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E00C107ACE4;
 Fri, 28 May 2021 14:22:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D4E460CD0;
 Fri, 28 May 2021 14:22:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C2942180079C; Fri, 28 May 2021 16:22:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only when
 told to
Date: Fri, 28 May 2021 16:22:01 +0200
Message-Id: <20210528142202.2154592-3-kraxel@redhat.com>
In-Reply-To: <20210528142202.2154592-1-kraxel@redhat.com>
References: <20210528142202.2154592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ruimei Yan <ruimei.yan@windriver.com>

At present MSI / MSI-X interrupts are triggered regardless of the
irq level. We should have checked the level to determine whether
the interrupt needs to be delivered.

The level check logic was present in early versions of the xhci
model, but got dropped later by a rework of interrupt handling
under commit 4c4abe7cc903 ("xhci: rework interrupt handling").

Fixes: 4c4abe7cc903 ("xhci: rework interrupt handling")
Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210521024224.2277634-1-bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci-pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 9421734d0fe2..b6acd1790c1a 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -67,12 +67,13 @@ static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
          msi_enabled(pci_dev))) {
         pci_set_irq(pci_dev, level);
     }
-    if (msix_enabled(pci_dev)) {
+
+    if (msix_enabled(pci_dev) && level) {
         msix_notify(pci_dev, n);
         return;
     }
 
-    if (msi_enabled(pci_dev)) {
+    if (msi_enabled(pci_dev) && level) {
         msi_notify(pci_dev, n);
         return;
     }
-- 
2.31.1


