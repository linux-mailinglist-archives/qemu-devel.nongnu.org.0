Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83150DB25
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:28:48 +0200 (CEST)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niu5N-0000zA-9o
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu06-0006UP-FW
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu01-0002fM-PX
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hI7bzsmky1WaiM9g+64rTyViI5OA6WYELvRET0z3sHg=;
 b=E1AmNwP1bR58CRtLy4uMz/ni+1rgsUQwTcIC4xTDIuCzoI98+Jb8zHAJrtO4GZe1DoM+Yn
 SF9CDd8WzZ0sxpHxhQbwlqJWH64ZprCcr0vOCEwb+z2+SQIcSijthVY5wT/kOUc09/8Zz/
 MW5Hpl1ey/dM5TgPHt5EiZEv+rzsNAA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-S4_3_mvePVOx_-zZ9fpZNA-1; Mon, 25 Apr 2022 04:22:07 -0400
X-MC-Unique: S4_3_mvePVOx_-zZ9fpZNA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m125-20020a1c2683000000b00391893a2febso6461316wmm.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hI7bzsmky1WaiM9g+64rTyViI5OA6WYELvRET0z3sHg=;
 b=rN476h4TpC7ATqFfm7kyibfCV4wcqUzXFvA0Qc8UaXbLcBbUTPuDiGIZ3HpQbw1L+M
 scVu0lQG5kum9M2j2+iq7LZZ/WPXcDX1lT9jm/J/dviENq1xZ1JLGp2KbH4yJKFGuZGG
 Jp9pX8bdlQDoXlBkFTOKTBEAwfarpbImQiGg3WRp/yq1kOCTf7TB0xxzomWNDswG2dP1
 Cjb/zzWLpnKjkuTLsxfbXvKKqroNAhaygjsBt/8lu/4T1rszsQ0mwPT6SvVM2RD5EPmJ
 ynkpz/N8SXpFypctv23ZAUaZuZ6zz+p3TP5G0USL4HRgMpWtfrnAk7rVJ6oAz6Zy901V
 9TsA==
X-Gm-Message-State: AOAM530Xd7WjO2PvfneSD0c3J9KGl1cg2Nl2Nb/3Nn0WHYgEtvKV80ZL
 a5s6sETV+WV7m/j3YnTwXXcaeC/dd18CCgnrOYparMm9Ft6UxBuHwsrudsnqM0ZlJ3SsOYoZgzB
 i582nWiFov9Z5GfI=
X-Received: by 2002:a05:6000:1e0a:b0:20a:be21:a20 with SMTP id
 bj10-20020a0560001e0a00b0020abe210a20mr13322002wrb.214.1650874926593; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHxLb1ml4Gw6ml6BSzUinBuwuxXjCE8aateQTla9rtNcglW4bqzlgWY0sQ5Y0KtT9KHds1jw==
X-Received: by 2002:a05:6000:1e0a:b0:20a:be21:a20 with SMTP id
 bj10-20020a0560001e0a00b0020abe210a20mr13321970wrb.214.1650874926384; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 z7-20020a7bc7c7000000b0038eaf85b0absm8065953wmk.20.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 99E2967B1B66;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/18] audio: Remove unused can_be_default
Date: Mon, 25 Apr 2022 10:22:00 +0200
Message-Id: <31616bc6be45ba26e96beb54f7278d618f15a5fe.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no fallback mechanism and default-guessing this is now
not used and can be safely removed.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/alsaaudio.c   | 1 -
 audio/audio_int.h   | 1 -
 audio/coreaudio.m   | 1 -
 audio/dbusaudio.c   | 1 -
 audio/dsoundaudio.c | 1 -
 audio/jackaudio.c   | 1 -
 audio/noaudio.c     | 1 -
 audio/ossaudio.c    | 1 -
 audio/paaudio.c     | 1 -
 audio/sdlaudio.c    | 1 -
 audio/wavaudio.c    | 1 -
 11 files changed, 11 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 4a61378cd757..edbee63f97c5 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -933,7 +933,6 @@ static struct audio_driver alsa_audio_driver = {
     .init           = alsa_audio_init,
     .fini           = alsa_audio_fini,
     .pcm_ops        = &alsa_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof (ALSAVoiceOut),
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 2a6914d2aa65..082b13247657 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -148,7 +148,6 @@ struct audio_driver {
     void (*set_dbus_server) (AudioState *s, GDBusObjectManagerServer *manager);
 #endif
     struct audio_pcm_ops *pcm_ops;
-    int can_be_default;
     int max_voices_out;
     int max_voices_in;
     int voice_size_out;
diff --git a/audio/coreaudio.m b/audio/coreaudio.m
index 4695291621a3..e5612138a74b 100644
--- a/audio/coreaudio.m
+++ b/audio/coreaudio.m
@@ -673,7 +673,6 @@ static void coreaudio_audio_fini (void *opaque)
     .init           = coreaudio_audio_init,
     .fini           = coreaudio_audio_fini,
     .pcm_ops        = &coreaudio_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = 1,
     .max_voices_in  = 0,
     .voice_size_out = sizeof (coreaudioVoiceOut),
diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c
index a3d656d3b017..bbcad7051413 100644
--- a/audio/dbusaudio.c
+++ b/audio/dbusaudio.c
@@ -638,7 +638,6 @@ static struct audio_driver dbus_audio_driver = {
     .fini            = dbus_audio_fini,
     .set_dbus_server = dbus_audio_set_server,
     .pcm_ops         = &dbus_pcm_ops,
-    .can_be_default  = 1,
     .max_voices_out  = INT_MAX,
     .max_voices_in   = INT_MAX,
     .voice_size_out  = sizeof(DBusVoiceOut),
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 3fb67ec3eed4..311e34218465 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -721,7 +721,6 @@ static struct audio_driver dsound_audio_driver = {
     .init           = dsound_audio_init,
     .fini           = dsound_audio_fini,
     .pcm_ops        = &dsound_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = 1,
     .voice_size_out = sizeof (DSoundVoiceOut),
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 5bdf3d7a78d6..fd2d2fd5acb7 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -669,7 +669,6 @@ static struct audio_driver jack_driver = {
     .init           = qjack_init,
     .fini           = qjack_fini,
     .pcm_ops        = &jack_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof(QJackOut),
diff --git a/audio/noaudio.c b/audio/noaudio.c
index 84a6bfbb1c87..111aef4a24ce 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -135,7 +135,6 @@ static struct audio_driver no_audio_driver = {
     .init           = no_audio_init,
     .fini           = no_audio_fini,
     .pcm_ops        = &no_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof (NoVoiceOut),
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 8e075edb70d6..31b582e8e4b5 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -781,7 +781,6 @@ static struct audio_driver oss_audio_driver = {
     .init           = oss_audio_init,
     .fini           = oss_audio_fini,
     .pcm_ops        = &oss_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof (OSSVoiceOut),
diff --git a/audio/paaudio.c b/audio/paaudio.c
index e91116f2396c..38f09017eb96 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -928,7 +928,6 @@ static struct audio_driver pa_audio_driver = {
     .init           = qpa_audio_init,
     .fini           = qpa_audio_fini,
     .pcm_ops        = &qpa_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof (PAVoiceOut),
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 68a237b76b45..5177e31d9b4a 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -493,7 +493,6 @@ static struct audio_driver sdl_audio_driver = {
     .init           = sdl_audio_init,
     .fini           = sdl_audio_fini,
     .pcm_ops        = &sdl_pcm_ops,
-    .can_be_default = 1,
     .max_voices_out = INT_MAX,
     .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof(SDLVoiceOut),
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index ac666335c783..4e176500fc92 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -208,7 +208,6 @@ static struct audio_driver wav_audio_driver = {
     .init           = wav_audio_init,
     .fini           = wav_audio_fini,
     .pcm_ops        = &wav_pcm_ops,
-    .can_be_default = 0,
     .max_voices_out = 1,
     .max_voices_in  = 0,
     .voice_size_out = sizeof (WAVVoiceOut),
-- 
2.35.1


