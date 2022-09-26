Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24935EA0B8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:41:09 +0200 (CEST)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclXx-0004jG-0s
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpr-0005VR-HG
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpo-0003nM-L4
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQSZ3YegllO8gYugV2LwNog3NGPPlbl9W71LJ6tpgkc=;
 b=RYLgegSoC9WCkwYKc8E7OwvnMdQMxlhaGivTpWIi5rznriDizahVUwk/AJ4iQ/jwne9qPP
 XqyBe9qbRWB+N3reiClzOWIIFK1p6kFGxbbsIlGZ3jH/aSapBtdWv+tvL6LCq6u3v+U/S/
 5kgxD1/1gE0UrwTCscBhLNoS8Th6TSc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-vx-1sEZ2N_28NO1ZvTBTWw-1; Mon, 26 Sep 2022 05:55:29 -0400
X-MC-Unique: vx-1sEZ2N_28NO1ZvTBTWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8673886463;
 Mon, 26 Sep 2022 09:55:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88646140EBF4;
 Mon, 26 Sep 2022 09:55:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0CBD2180A400; Mon, 26 Sep 2022 11:55:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Brown <mcb30@ipxe.org>
Subject: [PULL 19/25] usbnet: Detect short packets as sent by the xHCI
 controller
Date: Mon, 26 Sep 2022 11:55:03 +0200
Message-Id: <20220926095509.3759409-20-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


