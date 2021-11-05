Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736D445F1C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:23:36 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqlL-0005Y2-7T
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqgF-0000E7-8g
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:18:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqgD-0001z9-Aa
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636085896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kOU1CX4fyCr2d5Bv1PmQ4ov6jourOW2sM2oMBS2xWs=;
 b=I/PsSIkvPF8I0Qe3P+/itEyJmJbkRuXSivEGDHSZfRahPcldBfNRo/4vmLDZ44UbCaNORZ
 BepWMseaFd94jxSUcx9Tsulp3IShxdpY6aeU0hF4STUB8P4Ts0f44HopB0Km0WG6w5LIjY
 r66etgbbMkXPxPueglRfLjQso9d0xMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-kEoCD8LSOS-99Ujen9a2DA-1; Fri, 05 Nov 2021 00:18:15 -0400
X-MC-Unique: kEoCD8LSOS-99Ujen9a2DA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580C41808304;
 Fri,  5 Nov 2021 04:18:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-79.pek2.redhat.com [10.72.12.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C40F3652AC;
 Fri,  5 Nov 2021 04:18:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 2/2] Fix virtio-net-pci* "vectors" compat
Date: Fri,  5 Nov 2021 12:17:48 +0800
Message-Id: <20211105041748.1681-3-jasowang@redhat.com>
In-Reply-To: <20211105041748.1681-1-jasowang@redhat.com>
References: <20211105041748.1681-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Jean-Louis Dupond <jean-louis@dupond.be>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

hw_compat_5_2 has an issue: it affects only "virtio-net-pci"
but not "virtio-net-pci-transitional" and
"virtio-net-pci-non-transitional".  The solution is to use the
"virtio-net-pci-base" type in compat_props.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1999141

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Jean-Louis Dupond <jean-louis@dupond.be>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 948b3d9..26ec54e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -56,7 +56,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
-    { "virtio-net-pci", "vectors", "3"},
+    { "virtio-net-pci-base", "vectors", "3"},
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
-- 
2.7.4


