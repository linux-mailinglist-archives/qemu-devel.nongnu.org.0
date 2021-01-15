Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDB2F7D41
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:55:14 +0100 (CET)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PZJ-0002FY-NK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3I-0006vO-Vp
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003JP-4R
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzwoiS4AvB1DAMeelsnbRmyDx1AnnwrHSMYkLdfdsh0=;
 b=GcRZwz+KWztTjBHElUJJ+cAuAB7Yjjs+jFC1MD0u3pLg1tkzHV0DSO63Iqzt1pJazYVHAH
 EgdnQ0NsE3CheOoIOB8xCJ1tXTKmpUKoT0fAVPY36afPiDRYHrju/7jWSUVI6XIgB14BC5
 gK3MrdZY+MdpDBOWngAu4/0bP/INjQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-ahIgUiTWMKiraCMc7byzLQ-1; Fri, 15 Jan 2021 08:21:57 -0500
X-MC-Unique: ahIgUiTWMKiraCMc7byzLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDF1BCE642;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D6F71C89;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E4961800D4F; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] dsoundaudio: replace GetForegroundWindow()
Date: Fri, 15 Jan 2021 14:21:36 +0100
Message-Id: <20210115132146.1443592-21-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

GetForegroundWindow() doesn't necessarily return the own window
handle. It just returns a handle to the currently active window
and can even return NULL. At the time dsound_open() gets called
the active window is most likely the shell window and not the
QEMU window.

Replace GetForegroundWindow() with GetDesktopWindow() which
always returns a valid window handle, and at the same time
replace the DirectSound buffer flag DSBCAPS_STICKYFOCUS with
DSBCAPS_GLOBALFOCUS where Windows only expects a valid window
handle for DirectSound function SetCooperativeLevel(). The
Microsoft online docs for IDirectSound::SetCooperativeLevel
recommend this in the remarks.

This fixes a bug where you can't hear sound from the guest.

To reproduce start qemu with -machine pcspk-audiodev=audio0
-device intel-hda -device hda-duplex,audiodev=audio0
-audiodev dsound,id=audio0,out.mixing-engine=off
from a shell and start audio playback with the hda device in the
guest. The guest will be silent. To hear guest audio you have to
activate the shell window once.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-20-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsound_template.h | 2 +-
 audio/dsoundaudio.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/dsound_template.h b/audio/dsound_template.h
index 9c5ce625ab91..0678f2de38be 100644
--- a/audio/dsound_template.h
+++ b/audio/dsound_template.h
@@ -205,7 +205,7 @@ static int dsound_init_out(HWVoiceOut *hw, struct audsettings *as,
         NULL
         );
 #else
-    bd.dwFlags = DSBCAPS_STICKYFOCUS | DSBCAPS_GETCURRENTPOSITION2;
+    bd.dwFlags = DSBCAPS_GLOBALFOCUS | DSBCAPS_GETCURRENTPOSITION2;
     hr = IDirectSound_CreateSoundBuffer (
         s->dsound,
         &bd,
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 4cdf19ab6799..0fbdf770ac75 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -347,7 +347,7 @@ static int dsound_open (dsound *s)
     HRESULT hr;
     HWND hwnd;
 
-    hwnd = GetForegroundWindow ();
+    hwnd = GetDesktopWindow();
     hr = IDirectSound_SetCooperativeLevel (
         s->dsound,
         hwnd,
-- 
2.29.2


