Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16C5EBEA0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:30:02 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6uf-0007Ay-Cn
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oa-0005kk-Fy
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oZ-0000L5-0C
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQSZ3YegllO8gYugV2LwNog3NGPPlbl9W71LJ6tpgkc=;
 b=Buo+7k55djmmSgmYHXhHFoDmD/MHeK/Ko73P6s6KvGsrFLBsf+b6nuWX5dZ3ckgqEOcP5Y
 lGQaBWcH2wONQxJMfyIMGEiXAvUtRYy1S4DvnWinBhkGbjfznnVLZb1z+PTkWK8hj25pJc
 6nNR7Irb4B37o+b/evqhUZiPN+FyZiQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-NoODQLMfOF2E7mSn3E7gRA-1; Tue, 27 Sep 2022 04:19:30 -0400
X-MC-Unique: NoODQLMfOF2E7mSn3E7gRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E1553C10224;
 Tue, 27 Sep 2022 08:19:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEC122087440;
 Tue, 27 Sep 2022 08:19:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DD7E218009A8; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Brown <mcb30@ipxe.org>
Subject: [PULL 18/24] usbnet: Detect short packets as sent by the xHCI
 controller
Date: Tue, 27 Sep 2022 10:19:06 +0200
Message-Id: <20220927081912.180983-19-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Brown <mcb30@ipxe.org>

The xHCI controller will ignore the endpoint MTU and so may deliver
packets of any length.  Detect short packets as being any packet that
has a length of zero or a length that is not a multiple of the MTU.

Signed-off-by: Michael Brown <mcb30@ipxe.org>
Message-Id: <20220906183053.3625472-4-mcb30@ipxe.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-network.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 155df935cd68..9d83974ec9f0 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1211,7 +1211,7 @@ static void usb_net_handle_dataout(USBNetState *s, USBPacket *p)
     s->out_ptr += sz;
 
     if (!is_rndis(s)) {
-        if (p->iov.size < 64) {
+        if (p->iov.size % 64 || p->iov.size == 0) {
             qemu_send_packet(qemu_get_queue(s->nic), s->out_buf, s->out_ptr);
             s->out_ptr = 0;
         }
-- 
2.37.3


