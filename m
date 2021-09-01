Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF483FD418
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:58:20 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLKCR-0006sX-UQ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLK8A-0002QQ-6x
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLK87-0000CX-SM
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630479230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvemVS7Bx4Kqr8JOF/DL8Yu75PEDJ8ZGIsup33PioRU=;
 b=KKlbPY8ou6Pw7XhS5M/hfLiKrUq1YbZ0Y/vj1YhVvxSBBItxMJ1dqakfvUO9dGWy93VNUK
 LqFJcGwebQPd9p05w/OpalD16aa7dr8jTv2SGWvW0IoA6UCaKZaUwD2nEdIu1KZjl3PvSR
 uH0izOhaEpyFyoS/pz+ydGWoEO0oIt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-1FGYxMDoPqqKptX0vuF-CQ-1; Wed, 01 Sep 2021 02:53:49 -0400
X-MC-Unique: 1FGYxMDoPqqKptX0vuF-CQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 321D61009446;
 Wed,  1 Sep 2021 06:53:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB07377708;
 Wed,  1 Sep 2021 06:53:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5563918000AE; Wed,  1 Sep 2021 08:53:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] uas: add stream number sanity checks.
Date: Wed,  1 Sep 2021 08:53:41 +0200
Message-Id: <20210901065342.3316013-2-kraxel@redhat.com>
In-Reply-To: <20210901065342.3316013-1-kraxel@redhat.com>
References: <20210901065342.3316013-1-kraxel@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Zhe <chenzhe@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tan Jingguo <tanjingguo@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device uses the guest-supplied stream number unchecked, which can
lead to guest-triggered out-of-band access to the UASDevice->data3 and
UASDevice->status3 fields.  Add the missing checks.

Fixes: CVE-2021-3713
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reported-by: Chen Zhe <chenzhe@huawei.com>
Reported-by: Tan Jingguo <tanjingguo@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210818120505.1258262-2-kraxel@redhat.com>
---
 hw/usb/dev-uas.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 263056231c79..f6309a5ebfdc 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -840,6 +840,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         }
         break;
     case UAS_PIPE_ID_STATUS:
+        if (p->stream > UAS_MAX_STREAMS) {
+            goto err_stream;
+        }
         if (p->stream) {
             QTAILQ_FOREACH(st, &uas->results, next) {
                 if (st->stream == p->stream) {
@@ -867,6 +870,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         break;
     case UAS_PIPE_ID_DATA_IN:
     case UAS_PIPE_ID_DATA_OUT:
+        if (p->stream > UAS_MAX_STREAMS) {
+            goto err_stream;
+        }
         if (p->stream) {
             req = usb_uas_find_request(uas, p->stream);
         } else {
@@ -902,6 +908,11 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         p->status = USB_RET_STALL;
         break;
     }
+
+err_stream:
+    error_report("%s: invalid stream %d", __func__, p->stream);
+    p->status = USB_RET_STALL;
+    return;
 }
 
 static void usb_uas_unrealize(USBDevice *dev)
-- 
2.31.1


