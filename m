Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70627C1D2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 12:02:16 +0200 (CEST)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNCSd-0007re-3x
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 06:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNCO7-0002iw-70
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNCO4-0000q9-Sz
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:57:34 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601373451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INR8IeW6lroyzPbDpx6fKgZS8ntG12gXbdx7c+M4hDo=;
 b=NMzCa3hMNO1O1MocDPntMs4FfrlXbDu7pK6QUvrFBK9XVNjODLLQMS7EP91uvbWaDKwfbT
 1MFFIyelXdTP298yBKIqu2EuX/eiT+6tTwPPSVoGI8IjlA1APDSY6JBRAjOIkAyOdYV5k4
 4XSafGQ/mQn5drWWDRpFe0A6JXrpDT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-nfwdISjPPXCCf_u3ruHiSg-1; Tue, 29 Sep 2020 05:57:29 -0400
X-MC-Unique: nfwdISjPPXCCf_u3ruHiSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B997185A0D9;
 Tue, 29 Sep 2020 09:57:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0477BE42;
 Tue, 29 Sep 2020 09:57:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCF0E31FCE; Tue, 29 Sep 2020 11:57:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] ppc/pseries: enable big-endian-framebuffer quirk for
 bochs-display and virtio-vga
Date: Tue, 29 Sep 2020 11:57:17 +0200
Message-Id: <20200929095717.26745-10-kraxel@redhat.com>
In-Reply-To: <20200929095717.26745-1-kraxel@redhat.com>
References: <20200929095717.26745-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Already done for stdvga and secondary-vga, bochs-display and virtio-vga
support the big-endian-framebuffer property too.  Fixes blue console
background at boot (offb firmware console).

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1881912
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200928085335.21961-3-kraxel@redhat.com
---
 hw/ppc/spapr_pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 4d97ff6c70f2..5db912b48c41 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2464,7 +2464,9 @@ static int spapr_switch_one_vga(DeviceState *dev, void *opaque)
     bool be = *(bool *)opaque;
 
     if (object_dynamic_cast(OBJECT(dev), "VGA")
-        || object_dynamic_cast(OBJECT(dev), "secondary-vga")) {
+        || object_dynamic_cast(OBJECT(dev), "secondary-vga")
+        || object_dynamic_cast(OBJECT(dev), "bochs-display")
+        || object_dynamic_cast(OBJECT(dev), "virtio-vga")) {
         object_property_set_bool(OBJECT(dev), "big-endian-framebuffer", be,
                                  &error_abort);
     }
-- 
2.27.0


