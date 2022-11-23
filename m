Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58663532A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 09:49:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxlQ1-0006wn-Pf; Wed, 23 Nov 2022 03:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1oxlPZ-0006v2-M9
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:47:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1oxlPU-0000w5-DX
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669193214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kB0aG3dBzUrlvCbL3IwXQbyv926TWrFNopUpwdSF90M=;
 b=XAV34KRoV+xgDoIzEgcjtJ/BlQZzulUX7RWpSKjE7d/m+aeJ2bvaWaZAB2/HA0HVH2J5pv
 ZUI/Eh8SzIHkfgOPj5E28/xklwHNH1gsGWJ7Ge5JDjqslv7/rm2ENqONmnCEoioAqBz2es
 u2IzTM64veZgB7esTRJDLhGkfOhC6BE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-0Io6TeUWMDqIuegY5kTLoQ-1; Wed, 23 Nov 2022 03:46:52 -0500
X-MC-Unique: 0Io6TeUWMDqIuegY5kTLoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF22F1C05EB2;
 Wed, 23 Nov 2022 08:46:51 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-193-203.brq.redhat.com [10.40.193.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1446F2024CBE;
 Wed, 23 Nov 2022 08:46:50 +0000 (UTC)
From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
To: qemu-devel@nongnu.org
Cc: j@getutm.app,
	kraxel@redhat.com,
	victortoso@redhat.com
Subject: [PATCH for 7.2] Revert "usbredir: avoid queuing hello packet on
 snapshot restore"
Date: Wed, 23 Nov 2022 09:46:48 +0100
Message-Id: <1689cec3eadcea87255e390cb236033aca72e168.1669193161.git.jtomko@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joelle van Dyne <j@getutm.app>

Run state is also in RUN_STATE_PRELAUNCH while "-S" is used.

This reverts commit 0631d4b448454ae8a1ab091c447e3f71ab6e088a

Signed-off-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Ján Tomko <jtomko@redhat.com>

The original commit broke the usage of usbredir with libvirt, which
starts every domain with "-S".

This workaround is no longer needed because the usbredir behavior
has been fixed in the meantime:
https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/61

Signed-off-by: Ján Tomko <jtomko@redhat.com>
---
 hw/usb/redirect.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 1bd30efc3e..fd7df599bc 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1280,8 +1280,7 @@ static void usbredir_create_parser(USBRedirDevice *dev)
     }
 #endif
 
-    if (runstate_check(RUN_STATE_INMIGRATE) ||
-        runstate_check(RUN_STATE_PRELAUNCH)) {
+    if (runstate_check(RUN_STATE_INMIGRATE)) {
         flags |= usbredirparser_fl_no_hello;
     }
     usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
-- 
2.38.1


