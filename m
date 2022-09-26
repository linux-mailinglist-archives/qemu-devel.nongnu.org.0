Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D65E9F40
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:22:39 +0200 (CEST)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclG2-0005Mf-II
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpr-0005UE-69
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpo-0003nK-Gd
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0m00e7GaD8cqnM2csAfgTfw2hXblEpsI8UlNCemk+ag=;
 b=Wf+op7UGTc1kOqG4W3ChJfB/ITnM6W0AqbNZuH6X5eDtcwhzZ3TY8kHDaOgJ3miCfv84LT
 a8QuGhejkNsm7FYCuD1FeSD2mRfEA/RVYWHAC/Hcr96D551XzNJyvSmnO160DTnBkizici
 pgqdzKGvThQSKeTV1KnGMz922AAvfWI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-7mTSscTjOAmwuz9ehVwhAw-1; Mon, 26 Sep 2022 05:55:25 -0400
X-MC-Unique: 7mTSscTjOAmwuz9ehVwhAw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43CA61C13941;
 Mon, 26 Sep 2022 09:55:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 863BC49BB60;
 Mon, 26 Sep 2022 09:55:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B639518030B8; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 14/25] usb/msd: move usb_msd_packet_complete()
Date: Mon, 26 Sep 2022 11:54:58 +0200
Message-Id: <20220926095509.3759409-15-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Change ordering to avoid adding forward declarations in
following patches.  Fix comment code style while being
at it.  No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220830063827.813053-2-kraxel@redhat.com>
---
 hw/usb/dev-storage.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 98639696e6d8..140ef2aeaa80 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -177,6 +177,20 @@ static const USBDesc desc = {
     .str   = desc_strings,
 };
 
+static void usb_msd_packet_complete(MSDState *s)
+{
+    USBPacket *p = s->packet;
+
+    /*
+     * Set s->packet to NULL before calling usb_packet_complete
+     * because another request may be issued before
+     * usb_packet_complete returns.
+     */
+    trace_usb_msd_packet_complete();
+    s->packet = NULL;
+    usb_packet_complete(&s->dev, p);
+}
+
 static void usb_msd_copy_data(MSDState *s, USBPacket *p)
 {
     uint32_t len;
@@ -208,18 +222,6 @@ static void usb_msd_send_status(MSDState *s, USBPacket *p)
     memset(&s->csw, 0, sizeof(s->csw));
 }
 
-static void usb_msd_packet_complete(MSDState *s)
-{
-    USBPacket *p = s->packet;
-
-    /* Set s->packet to NULL before calling usb_packet_complete
-       because another request may be issued before
-       usb_packet_complete returns.  */
-    trace_usb_msd_packet_complete();
-    s->packet = NULL;
-    usb_packet_complete(&s->dev, p);
-}
-
 void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
-- 
2.37.3


