Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219C2F0665
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:21:55 +0100 (CET)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXr8-0005g4-Dr
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZU-0002Jw-SS
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:41 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZN-0005bv-3F
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:39 -0500
Received: from fwd36.aul.t-online.de (fwd36.aul.t-online.de [172.20.26.137])
 by mailout11.t-online.de (Postfix) with SMTP id 7611542542EE;
 Sun, 10 Jan 2021 11:03:31 +0100 (CET)
Received: from linpower.localnet
 (G0bPiEZ68haCtw5n1t2vu2C2KE5qBrRHMCpjq6qzN7UG4xmB9n0l8IWELlvgsgTgEj@[93.236.152.29])
 by fwd36.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZJ-4DUxZw0; Sun, 10 Jan 2021 11:03:29 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1268D2006C3; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 20/23] dsoundaudio: replace GetForegroundWindow()
Date: Sun, 10 Jan 2021 11:02:36 +0100
Message-Id: <20210110100239.27588-20-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: G0bPiEZ68haCtw5n1t2vu2C2KE5qBrRHMCpjq6qzN7UG4xmB9n0l8IWELlvgsgTgEj
X-TOI-EXPURGATEID: 150726::1610273009-00004FB0-0A17421E/0/0 CLEAN NORMAL
X-TOI-MSGID: 01c17d62-0b6f-4f4c-9b16-14ca2d3fc521
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 audio/dsound_template.h | 2 +-
 audio/dsoundaudio.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/dsound_template.h b/audio/dsound_template.h
index 9c5ce625ab..0678f2de38 100644
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
index 4cdf19ab67..0fbdf770ac 100644
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
2.26.2


