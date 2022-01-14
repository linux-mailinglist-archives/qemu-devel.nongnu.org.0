Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700548E4E1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:32:28 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8H4T-0005Vx-5f
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:32:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUv-0007fp-RP
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUs-0007Wv-BV
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OY/0q0GPYBK1CVgyaF/NDYNAj75lk/8K3vToFljb66A=;
 b=IsMwZ2c4KFulzRGokN9eQb4RrJzRnna/znp4DU6JJimCfv4QDPMp7qlQwOd0fwIluhg8+z
 NBAlZ/TYDDWQgsSsun2zYbcF0WtPIWtfnwi+rHPystYjwL1Ghg3MX6gFv/rdAU750R9dFI
 FoZT3YeRuVqyjkoT6bsDgnduqdDQEB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-o_T8ZJzHOJWkYZrVzf8t_w-1; Fri, 14 Jan 2022 01:55:30 -0500
X-MC-Unique: o_T8ZJzHOJWkYZrVzf8t_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26E54189DF42;
 Fri, 14 Jan 2022 06:55:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C0178DA8;
 Fri, 14 Jan 2022 06:55:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 68D501800850; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] ui/cocoa: pass horizontal scroll information to the
 device code
Date: Fri, 14 Jan 2022 07:53:23 +0100
Message-Id: <20220114065326.782420-18-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Petrov <dpetroff@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Petrov <dpetroff@gmail.com>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
Message-Id: <20220108153947.171861-3-dpetroff@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b45..ac18e14ce01c 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -970,21 +970,27 @@ QemuCocoaView *cocoaView;
              */
 
             /*
-             * When deltaY is zero, it means that this scrolling event was
-             * either horizontal, or so fine that it only appears in
-             * scrollingDeltaY. So we drop the event.
+             * We shouldn't have got a scroll event when deltaY and delta Y
+             * are zero, hence no harm in dropping the event
              */
-            if ([event deltaY] != 0) {
+            if ([event deltaY] != 0 || [event deltaX] != 0) {
             /* Determine if this is a scroll up or scroll down event */
-                buttons = ([event deltaY] > 0) ?
+                if ([event deltaY] != 0) {
+                  buttons = ([event deltaY] > 0) ?
                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
+                } else if ([event deltaX] != 0) {
+                  buttons = ([event deltaX] > 0) ?
+                    INPUT_BUTTON_WHEEL_LEFT : INPUT_BUTTON_WHEEL_RIGHT;
+                }
+
                 qemu_input_queue_btn(dcl.con, buttons, true);
                 qemu_input_event_sync();
                 qemu_input_queue_btn(dcl.con, buttons, false);
                 qemu_input_event_sync();
             }
+
             /*
-             * Since deltaY also reports scroll wheel events we prevent mouse
+             * Since deltaX/deltaY also report scroll wheel events we prevent mouse
              * movement code from executing.
              */
             mouse_event = false;
-- 
2.34.1


