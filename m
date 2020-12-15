Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681682DA909
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:13:10 +0100 (CET)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5SH-0006cm-Fh
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5RI-0006Dq-Kf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:12:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5RG-0001df-Dd
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:12:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608019921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FO1pFTDJZZUM7IN4j5Gc9n9+4n9xWN86FKVZ6kDk6Yw=;
 b=Cdu0aC8GHdlH85KNLAskTnzR6AL6hp93Fjtuf6nKRJ1qvdWtq9fhEAG8qhzzXQH+2GWVud
 K15WsmuTfvLzhC3bKynPyVWiw3J1vU7jEJZZU0yZmj77wGQyAxA8pKFmvu9tAziIjQExea
 UGsMX5i7Cwfee0GIR94kKRTa5hl5eXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-sz-vQfmxOvCs-E2OkU8BAA-1; Tue, 15 Dec 2020 03:11:57 -0500
X-MC-Unique: sz-vQfmxOvCs-E2OkU8BAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA5A2801817;
 Tue, 15 Dec 2020 08:11:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94894E70A;
 Tue, 15 Dec 2020 08:11:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B18A111AB8; Tue, 15 Dec 2020 09:11:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] audio: add sanity check
Date: Tue, 15 Dec 2020 09:11:51 +0100
Message-Id: <20201215081151.20095-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
---
 audio/audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 46578e4a583b..973804620d7b 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1709,7 +1709,9 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
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


