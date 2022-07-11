Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9AF56FCCD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:48:28 +0200 (CEST)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAq1j-0006F4-8b
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oApyR-00038j-Ko
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:45:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oApyM-0006b4-TK
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657532698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=is9XanqoG7jbc2HkDAP5RVT00ngVtMj2JbXCu+3UgNo=;
 b=LqEQ3kj6uGAAXW1YpJ5fmYDnhHrP7UJ0D/tAyX+yfFbGgE460N2nqmuMtolh7Ch3Y65MF9
 7A29Y+THjqkCkq9kILYBg55JTiP335HZCDJUWd11tmuTxF2fueInvxfwj2G41amZ3o7A9g
 gZcUYSUHxkaQPNM9SlPgjm2Q0XJLlyg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-TJPQmpinOp6rr3R7ctV7RA-1; Mon, 11 Jul 2022 05:44:39 -0400
X-MC-Unique: TJPQmpinOp6rr3R7ctV7RA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F5E5857AA0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 09:44:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EAD92166B26;
 Mon, 11 Jul 2022 09:44:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F23D1180039F; Mon, 11 Jul 2022 11:44:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>
Subject: [PATCH 1/2] usb: document guest-reset and guest-reset-all
Date: Mon, 11 Jul 2022 11:44:36 +0200
Message-Id: <20220711094437.3995927-2-kraxel@redhat.com>
In-Reply-To: <20220711094437.3995927-1-kraxel@redhat.com>
References: <20220711094437.3995927-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Suggested-by: Michal Prívozník <mprivozn@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/devices/usb.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 872d9167589b..18e7c8b4d716 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -353,3 +353,32 @@ and also assign it to the correct USB bus in QEMU like this:
         -device usb-ehci,id=ehci                             \\
         -device usb-host,bus=usb-bus.0,hostbus=3,hostport=1  \\
         -device usb-host,bus=ehci.0,hostbus=1,hostport=1
+
+``usb-host`` properties for reset behavior
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``guest-reset`` and ``guest-reset-all`` properties control
+whenever the guest is allowed to reset the physical usb device on the
+host.  There are three cases:
+
+``guest-reset=false``
+  The guest is not allowed to reset the (physical) usb device.
+
+``guest-reset=true,guest-resets-all=false``
+  The guest is allowed to reset the device when it is not yet
+  initialized (aka no usb bus address assigned).  Usually this results
+  in one guest reset being allowed.  This is the default behavior.
+
+``guest-reset=true,guest-resets-all=true``
+  The guest is allowed to reset the device as it pleases.
+
+The reason for this existing are broken usb devices.  In theory one
+should be able to reset (and re-initialize) usb devices at any time.
+In practice that may result in shitty usb device firmware crashing and
+the device not responding any more until you power-cycle (aka un-plug
+and re-plug) it.
+
+What works best pretty much depends on the behavior of the specific
+usb device at hand, so it's a trial-and-error game.  If the default
+doesn't work, try another option and see whenever the situation
+improves.
-- 
2.36.1


