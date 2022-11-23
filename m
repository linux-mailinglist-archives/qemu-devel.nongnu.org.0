Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493FE636231
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqza-0004DX-4e; Wed, 23 Nov 2022 09:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzW-0004D1-Bn
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzU-0002vR-Jn
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669214683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClgLGlNFppL+f9GqoLlnC9ozfhCP4kc7vlhVVHewrAQ=;
 b=hO/zsUPigBx//VtmUi/ELKrDrs9cr+BMlrGLUGo9alfQhOax7aOSEwUVF2DAq6z0eJVM9y
 R53e2RS1ttcWVwJDAo4fFzXr+O13HImXKJ12y/mRwBzdbS82WRtAyn5S0T0vEENIbNXtQO
 8pOY+PwkPssxcRQCNuNrlgInvEAvtsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-zKaqyknkO_G0hNvo63gTrg-1; Wed, 23 Nov 2022 09:44:42 -0500
X-MC-Unique: zKaqyknkO_G0hNvo63gTrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54D448065EA;
 Wed, 23 Nov 2022 14:44:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15F13111E410;
 Wed, 23 Nov 2022 14:44:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7028A1800613; Wed, 23 Nov 2022 15:44:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
Subject: [PULL 1/7] Revert "usbredir: avoid queuing hello packet on snapshot
 restore"
Date: Wed, 23 Nov 2022 15:44:30 +0100
Message-Id: <20221123144436.2141069-2-kraxel@redhat.com>
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
References: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Message-Id: <1689cec3eadcea87255e390cb236033aca72e168.1669193161.git.jtomko@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 1bd30efc3ef0..fd7df599bc0b 100644
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


