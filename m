Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9D564F39
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:03:44 +0200 (CEST)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8H3X-000588-CN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzx-0002Jf-GL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzv-0007fu-I8
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzR7lYIrafuFhi1VuHjtQYaaEQWBZ0qYMLjB0IZb8uo=;
 b=KPmlEV1rNGCaanr6dJ20XbgvEgYYrHAVcMpEAFSJbyu6o1qKHmkXkM13vEJMGdQJkMAwjI
 OM5wVyKH/0ociGxviMuNRxKuW4h9jssdCB/JH/DB/3YMz2FjunWdRljkveGOJGQUvlobMD
 gcKIVz4/FkJ3StcE68uucIpeZL3aRZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-WFnVCIgAPtuB7q4rXI5Rcw-1; Mon, 04 Jul 2022 03:59:53 -0400
X-MC-Unique: WFnVCIgAPtuB7q4rXI5Rcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 473CC80390C;
 Mon,  4 Jul 2022 07:59:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12FB718EB7;
 Mon,  4 Jul 2022 07:59:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DA16C180079E; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: [PULL 6/8] hw/usb/canokey: fix compatibility of qemu-xhci
Date: Mon,  4 Jul 2022 09:59:44 +0200
Message-Id: <20220704075946.921883-7-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

XHCI wont poll interrupt IN endpoint if NAKed, and needs wakeup

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YqcqSHNpI7sXRNpZ@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/canokey.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 86548923eb16..8da0d65556af 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -103,6 +103,13 @@ int canokey_emu_transmit(
             pbuf, size);
     key->ep_in_size[ep_in] += size;
     key->ep_in_state[ep_in] = CANOKEY_EP_IN_READY;
+    /*
+     * wake up controller if we NAKed IN token before
+     * Note: this is a quirk for CanoKey CTAPHID
+     */
+    if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
+        usb_wakeup(usb_ep_get(&key->dev, USB_TOKEN_IN, ep_in), 0);
+    }
     /*
      * ready for more data in device loop
      *
@@ -208,6 +215,22 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
             key->ep_out_size[ep_out] = out_len;
             canokey_emu_data_out(ep_out, NULL);
         }
+        /*
+         * Note: this is a quirk for CanoKey CTAPHID
+         *
+         * There is one code path that uses this device loop
+         * INTR IN -> useful data_in and useless device_loop -> NAKed
+         * INTR OUT -> useful device loop -> transmit -> wakeup
+         *   (useful thanks to both data_in and data_out having been called)
+         * the next INTR IN -> actual data to guest
+         *
+         * if there is no such device loop, there would be no further
+         * INTR IN, no device loop, no transmit hence no usb_wakeup
+         * then qemu would hang
+         */
+        if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
+            canokey_emu_device_loop(); /* may call transmit multiple times */
+        }
         break;
     case USB_TOKEN_IN:
         if (key->ep_in_pos[ep_in] == 0) { /* first time IN */
-- 
2.36.1


