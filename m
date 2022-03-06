Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7A4CEB91
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 13:35:29 +0100 (CET)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQq6i-0002Lp-U3
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 07:35:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQq5a-0001gz-U8
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:34:18 -0500
Received: from [2607:f8b0:4864:20::62f] (port=41939
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQq5Z-0007X7-Fm
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:34:18 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z3so3081868plg.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dFq4Jtg9XcjbpPHRmk8BQl6Noicw3RrPpsMAdtiMA7Y=;
 b=DZdiR+aTXRnGLF1VbpXyadHUicS/BZ5TMzKiPQke4ocfetdPKl/nhVRYCl3XhZUSZ6
 kFyD6RZY0uL50B2LNmgeuiHIje4K9EzHL+CCpQr9uqrdXKCpiKaXZn7bj0Tn5QoinHhK
 ReeiV52mMtyg9j5MpjpiuVUOebHGwoUuMAQ1/tJJdD1LCtnjkn2FO+YPHiWICQVza6Fm
 18DeIe1VbSwXF3DHsUdtya+ZiEpqC78o7Nu1KhQ+XC10uEOWp6HffPVlXa9LnglOg3lK
 pLhKTPP2+2KfncbxMzyXXQjFFSi8CrBrB4ys1JDteZwn/wxLsaObqXfraC0hnF3xOf6R
 1enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dFq4Jtg9XcjbpPHRmk8BQl6Noicw3RrPpsMAdtiMA7Y=;
 b=nAs6KRX6OFvyzGMopcmYK/NKnTm4aaiPsyEv3rY9uFTG6Rf9NJFdKsckRwy3lqDkOy
 Ci16oVJGB0ihX/JSthEwLHtgrMJyg8WZJPsClRlXoOO4JP6BOmdiNngkvwIbE72ASo1a
 VwHRF921JhKTzqepjirk91ZF4JHaCJYjmbo8Wm6b8fo+5VGfeZzyot27WcjpKhxd2bbo
 4Dm0FQ3hxflWirZ1ytOYwgnyXJqmvzqndkHNIRjFV5taX4HJ6gVeHQrwMQDUPGJAYkr3
 PONoXzFFXDZe6DkUlXRfxwbjkX7hH9aKQ7xABHeF9eTK8o570nuJeCZ2r8WIL/ghgS5z
 1X7w==
X-Gm-Message-State: AOAM530akC7EvXoCFESv8n6fp/vQ4QuVHzu0DggnLKvaK7nMlybilPtT
 qRUxw0JCmJ1qRbc/wb/qdYiyhS7lQ44=
X-Google-Smtp-Source: ABdhPJy02R8H/px62MlWFBMrVTf508flEmZrHb8gZTa9OqrcLYqMlYCLoAll65tgN8jttjwWwyTLyg==
X-Received: by 2002:a17:903:2285:b0:151:ae75:21c6 with SMTP id
 b5-20020a170903228500b00151ae7521c6mr7562532plh.32.1646570055764; 
 Sun, 06 Mar 2022 04:34:15 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9574:a172:f92a:5d0f])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a63f94b000000b00373c5319642sm9208442pgk.93.2022.03.06.04.34.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 04:34:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] coreaudio: Always return 0 in handle_voice_change
Date: Sun,  6 Mar 2022 21:34:10 +0900
Message-Id: <20220306123410.61063-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

handle_voice_change() is a CoreAudio callback function as of CoreAudio type
AudioObjectPropertyListenerProc, and for the latter MacOSX.sdk/System/
Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
says "The return value is currently unused and should always be 0.".

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 0f19d0ce01c..91445096358 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -540,7 +540,6 @@ static OSStatus handle_voice_change(
     const AudioObjectPropertyAddress *in_addresses,
     void *in_client_data)
 {
-    OSStatus status;
     coreaudioVoiceOut *core = in_client_data;
 
     qemu_mutex_lock_iothread();
@@ -549,13 +548,12 @@ static OSStatus handle_voice_change(
         fini_out_device(core);
     }
 
-    status = init_out_device(core);
-    if (!status) {
+    if (!init_out_device(core)) {
         update_device_playback_state(core);
     }
 
     qemu_mutex_unlock_iothread();
-    return status;
+    return 0;
 }
 
 static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
-- 
2.32.0 (Apple Git-132)


