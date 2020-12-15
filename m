Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537C2DAE4C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:52:52 +0100 (CET)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAl1-0003fG-Ew
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgw-0008HC-Cj
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgu-0007HI-LF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu4gV/dipbPIP+N6xRJLWM5eaWb2SoyMOdSGji2ylcI=;
 b=Vpjp0EKmgiOfeo1hdibb8huqEgLRPzyiz4M07HMm3FLKePRhbfeWn6OvP6QmWhsO8zFX34
 lcFnremTqEjTk8ekaovGYiGvMWj3rSooQ0D985OGEBDTHw0IVHxw/Fok9C2tGIdTRG6y05
 zu83b3NLDE2tkbBcokGvAVvlkcIcm8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-aMPQGGotMKWVJBlsYr-4lA-1; Tue, 15 Dec 2020 08:48:31 -0500
X-MC-Unique: aMPQGGotMKWVJBlsYr-4lA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A63801B16;
 Tue, 15 Dec 2020 13:48:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F26719442;
 Tue, 15 Dec 2020 13:48:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C1F999D9D; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] audio: add sanity check
Date: Tue, 15 Dec 2020 14:48:26 +0100
Message-Id: <20201215134826.5504-8-kraxel@redhat.com>
In-Reply-To: <20201215134826.5504-1-kraxel@redhat.com>
References: <20201215134826.5504-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dann frazier <dann.frazier@canonical.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check whenever we actually found the spiceaudio driver
before flipping the can_be_default field.

Fixes: f0c4555edfdd ("audio: remove qemu_spice_audio_init()")
Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977301
Reported-by: dann frazier <dann.frazier@canonical.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20201215081151.20095-1-kraxel@redhat.com>
---
 audio/audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 0fdb808d6a57..b48471bb3f64 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1684,7 +1684,9 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
          * backend and this can go away.
          */
         driver = audio_driver_lookup("spice");
-        driver->can_be_default = 1;
+        if (driver) {
+            driver->can_be_default = 1;
+        }
     }
 
     if (dev) {
-- 
2.27.0


