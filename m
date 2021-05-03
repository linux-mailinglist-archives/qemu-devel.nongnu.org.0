Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F223712E9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:20:47 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUkw-0003ng-9J
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldUfY-0007CV-A5
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:15:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldUfV-0005z3-A6
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620033308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beuHHcBhpTIhiCGL3twD1YqDRs3Mka47JpkK6KzdabU=;
 b=BhhaWPh/8mc6UmM8mWmTfdXEH4OKr0lOOyijfoPFAB/mCnKkTeCbmi5qLL8ff2Jj+rmztU
 XC3sJOB+SExXTm/7XUnWBuSVjhsMc+Q/i8a6B4SfKbBWu0+UwGR80Idc1CTTe/cdM5xGNd
 eGq2WaK3ZYBVtg2dk2nfDDoIze+/aIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-x_qh_vncMD-3OeJpVrVhNg-1; Mon, 03 May 2021 05:15:06 -0400
X-MC-Unique: x_qh_vncMD-3OeJpVrVhNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D09CD1883525;
 Mon,  3 May 2021 09:15:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E35794EF97;
 Mon,  3 May 2021 09:14:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0929180079B; Mon,  3 May 2021 11:14:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] usb: limit combined packets to 1 MiB
Date: Mon,  3 May 2021 11:14:46 +0200
Message-Id: <20210503091446.2137206-6-kraxel@redhat.com>
In-Reply-To: <20210503091446.2137206-1-kraxel@redhat.com>
References: <20210503091446.2137206-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

usb-host and usb-redirect try to batch bulk transfers by combining many
small usb packets into a single, large transfer request, to reduce the
overhead and improve performance.

This patch adds a size limit of 1 MiB for those combined packets to
restrict the host resources the guest can bind that way.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/combined-packet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
index 5d57e883dcb5..e56802f89a32 100644
--- a/hw/usb/combined-packet.c
+++ b/hw/usb/combined-packet.c
@@ -171,7 +171,9 @@ void usb_ep_combine_input_packets(USBEndpoint *ep)
         if ((p->iov.size % ep->max_packet_size) != 0 || !p->short_not_ok ||
                 next == NULL ||
                 /* Work around for Linux usbfs bulk splitting + migration */
-                (totalsize == (16 * KiB - 36) && p->int_req)) {
+                (totalsize == (16 * KiB - 36) && p->int_req) ||
+                /* Next package may grow combined package over 1MiB */
+                totalsize > 1 * MiB - ep->max_packet_size) {
             usb_device_handle_data(ep->dev, first);
             assert(first->status == USB_RET_ASYNC);
             if (first->combined) {
-- 
2.30.2


