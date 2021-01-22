Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F6300A52
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:56:21 +0100 (CET)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30fU-00039X-U4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YV-0003T1-1Y
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YO-0004ep-2v
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611337738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOmA4H82n53CHY8CKN/ropxq/3ofE9GWytjqV9yxWtc=;
 b=KImFS+k31csij9Qe//1GAwSECi1f80An9wW1tkav9j6tMy3wBGBx7J2Q+OmGR/rJ67PzhT
 33XySURLyI+afIfEn6bsKku8/5pxwyzGYwi0w7lMshDg+391ToNZh41UwpcDc7AdHgZ9zp
 P5jgADCWnbJ0iW4M77pr4lOk7iTZ3xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-V6apRFA_OJi8IA8HitLx8g-1; Fri, 22 Jan 2021 12:48:56 -0500
X-MC-Unique: V6apRFA_OJi8IA8HitLx8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A161107ACFA;
 Fri, 22 Jan 2021 17:48:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 930666F139;
 Fri, 22 Jan 2021 17:48:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 151481800389; Fri, 22 Jan 2021 18:48:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] hw/usb: Fix bad printf format specifiers
Date: Fri, 22 Jan 2021 18:48:43 +0100
Message-Id: <20210122174849.3936119-3-kraxel@redhat.com>
In-Reply-To: <20210122174849.3936119-1-kraxel@redhat.com>
References: <20210122174849.3936119-1-kraxel@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Alex Chen <alex.chen@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 20201119025751.45750-1-alex.chen@huawei.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/ccid-card-passthru.c   | 2 +-
 hw/usb/core.c                 | 4 ++--
 hw/usb/dev-smartcard-reader.c | 8 ++++----
 hw/usb/hcd-ehci.c             | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index c27c60269782..c1a90fcc7a52 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -336,7 +336,7 @@ static void passthru_apdu_from_guest(
     PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     if (!qemu_chr_fe_backend_connected(&card->cs)) {
-        printf("ccid-passthru: no chardev, discarding apdu length %d\n", len);
+        printf("ccid-passthru: no chardev, discarding apdu length %u\n", len);
         return;
     }
     ccid_card_vscard_send_apdu(card, apdu, len);
diff --git a/hw/usb/core.c b/hw/usb/core.c
index e960036f4d5c..c895522a1d5d 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -142,7 +142,7 @@ static void do_token_setup(USBDevice *s, USBPacket *p)
     setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
     if (setup_len > sizeof(s->data_buf)) {
         fprintf(stderr,
-                "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+                "usb_generic_handle_packet: ctrl buffer too small (%u > %zu)\n",
                 setup_len, sizeof(s->data_buf));
         p->status = USB_RET_STALL;
         return;
@@ -277,7 +277,7 @@ static void do_parameter(USBDevice *s, USBPacket *p)
     setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
     if (setup_len > sizeof(s->data_buf)) {
         fprintf(stderr,
-                "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+                "usb_generic_handle_packet: ctrl buffer too small (%u > %zu)\n",
                 setup_len, sizeof(s->data_buf));
         p->status = USB_RET_STALL;
         return;
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 946df9734a91..80109fa55168 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -945,7 +945,7 @@ static void ccid_on_apdu_from_guest(USBCCIDState *s, CCID_XferBlock *recv)
         return;
     }
     len = le32_to_cpu(recv->hdr.dwLength);
-    DPRINTF(s, 1, "%s: seq %d, len %d\n", __func__,
+    DPRINTF(s, 1, "%s: seq %d, len %u\n", __func__,
                 recv->hdr.bSeq, len);
     ccid_add_pending_answer(s, (CCID_Header *)recv);
     if (s->card && len <= BULK_OUT_DATA_SIZE) {
@@ -995,13 +995,13 @@ static void ccid_handle_bulk_out(USBCCIDState *s, USBPacket *p)
     if ((s->bulk_out_pos - 10 < ccid_header->dwLength) &&
         (p->iov.size == CCID_MAX_PACKET_SIZE)) {
         DPRINTF(s, D_VERBOSE,
-                "usb-ccid: bulk_in: expecting more packets (%d/%d)\n",
+                "usb-ccid: bulk_in: expecting more packets (%u/%u)\n",
                 s->bulk_out_pos - 10, ccid_header->dwLength);
         return;
     }
     if (s->bulk_out_pos - 10 != ccid_header->dwLength) {
         DPRINTF(s, 1,
-                "usb-ccid: bulk_in: message size mismatch (got %d, expected %d)\n",
+                "usb-ccid: bulk_in: message size mismatch (got %u, expected %u)\n",
                 s->bulk_out_pos - 10, ccid_header->dwLength);
         goto err;
     }
@@ -1202,7 +1202,7 @@ void ccid_card_send_apdu_to_guest(CCIDCardState *card,
         ccid_report_error_failed(s, ERROR_HW_ERROR);
         return;
     }
-    DPRINTF(s, 1, "APDU returned to guest %d (answer seq %d, slot %d)\n",
+    DPRINTF(s, 1, "APDU returned to guest %u (answer seq %d, slot %d)\n",
         len, answer->seq, answer->slot);
     ccid_write_data_block_answer(s, apdu, len);
 }
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index aca018d8b5f4..212eb05d3d3c 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1192,7 +1192,7 @@ static int ehci_init_transfer(EHCIPacket *p)
 
     while (bytes > 0) {
         if (cpage > 4) {
-            fprintf(stderr, "cpage out of range (%d)\n", cpage);
+            fprintf(stderr, "cpage out of range (%u)\n", cpage);
             qemu_sglist_destroy(&p->sgl);
             return -1;
         }
@@ -1598,7 +1598,7 @@ static int ehci_state_fetchentry(EHCIState *ehci, int async)
 
     default:
         /* TODO: handle FSTN type */
-        fprintf(stderr, "FETCHENTRY: entry at %X is of type %d "
+        fprintf(stderr, "FETCHENTRY: entry at %X is of type %u "
                 "which is not supported yet\n", entry, NLPTR_TYPE_GET(entry));
         return -1;
     }
-- 
2.29.2


