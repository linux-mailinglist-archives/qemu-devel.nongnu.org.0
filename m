Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C83327D7F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:47:56 +0100 (CET)
Received: from localhost ([::1]:46530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh1n-0001CT-FQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lGh06-0008T8-MO
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:46:10 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lGh03-0002d4-22
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:46:10 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o38so11359493pgm.9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=od/ubjSu0OOHMmkpTjRC1G/py4pzQgwR44+oIjfe5mM=;
 b=sdWzhx55QHvidihaUNALFK6EgreepRVEtJ7BEQzNAG0icHbnyMOcEteqcc26WWSXSk
 8GL4+YGmmnurNEYDQtHAeSkKlURcyD2FTwU289nPX/WOEbV/A8ratXUf7yv0QJK9SuJY
 FmZ5bzz95espKhhxODbb8+JlWWm7mfxSKDAcbB6LuUPInr2yhVNlAEIPYEclEtwHIv4z
 RhRhHhXeaEXhV4UUqFWz+kqWn41dDuXQJMb8yi+jyJUO3y2zLra6kQ7RtskRfrBOGzem
 j/qdDIcSVpCIf8q/ES1y8BrADs3UxldSgJUi5m3l10fqjuefJdp8HpSWq90RGIJa9d2E
 MgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=od/ubjSu0OOHMmkpTjRC1G/py4pzQgwR44+oIjfe5mM=;
 b=AWyekxLyooZ2PUpf7+8tbZkBKWo5fP5gr1fsiLS1wV72X7gkwc05hGfGlxKqsEKQC4
 OazhBwQ8UpHzLrlHmmhPZnuzoCXELOEX+w/7DvQItdM5+tD0QpRtv5N0sCOuxAg4P2mw
 CV9ybZBd9eNU+Lhc2fOsDFLHQFSre3W+/6pVfhTZF9FT+ClRQT/jU/U1erVjjFEjDvqO
 A/rF/MZGhISzsjdgYbRjKD5vj1Qku6hO3IzcjwlGxg2vw0KwXfi63/uzy1INDeT6Mpv4
 Sm+Io+WddW7L8LCnTfRWdemG2GVwPtNd6M4Bch2tlYBmncMXWv3zYgvOVqIYXpbakb9k
 2M3g==
X-Gm-Message-State: AOAM5335z6jz7VbBf2b1TY1a8nqUFKTaVkmJUNizk6JS7ngLyRJgj12M
 e9NOihNG5W9YaTaNibFoB9LrgPHb/5mDMw==
X-Google-Smtp-Source: ABdhPJx44PcipcgD9KdML9gRUMDDrHk9yyhugoYrxxco+HKh0HhTG54VOWneeiyTGZKk+nSCoFJtRw==
X-Received: by 2002:a05:6a00:1507:b029:1e4:d81:5586 with SMTP id
 q7-20020a056a001507b02901e40d815586mr14997417pfu.53.1614599164008; 
 Mon, 01 Mar 2021 03:46:04 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:2504:67d:ba0f:9c4b])
 by smtp.gmail.com with ESMTPSA id l22sm17170321pjy.6.2021.03.01.03.46.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Mar 2021 03:46:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/2] coreaudio: Drop support for macOS older than 10.6
Date: Mon,  1 Mar 2021 20:45:53 +0900
Message-Id: <20210301114554.9430-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mac OS X 10.6 was released in 2009.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 103 ----------------------------------------------
 1 file changed, 103 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index b7c02e0e516..c5f0b615d64 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -32,10 +32,6 @@
 #define AUDIO_CAP "coreaudio"
 #include "audio_int.h"
 
-#ifndef MAC_OS_X_VERSION_10_6
-#define MAC_OS_X_VERSION_10_6 1060
-#endif
-
 typedef struct coreaudioVoiceOut {
     HWVoiceOut hw;
     pthread_mutex_t mutex;
@@ -45,9 +41,6 @@ typedef struct coreaudioVoiceOut {
     AudioDeviceIOProcID ioprocid;
 } coreaudioVoiceOut;
 
-#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_6
-/* The APIs used here only become available from 10.6 */
-
 static OSStatus coreaudio_get_voice(AudioDeviceID *id)
 {
     UInt32 size = sizeof(*id);
@@ -169,102 +162,6 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
                                       &size,
                                       result);
 }
-#else
-/* Legacy versions of functions using deprecated APIs */
-
-static OSStatus coreaudio_get_voice(AudioDeviceID *id)
-{
-    UInt32 size = sizeof(*id);
-
-    return AudioHardwareGetProperty(
-        kAudioHardwarePropertyDefaultOutputDevice,
-        &size,
-        id);
-}
-
-static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
-                                             AudioValueRange *framerange)
-{
-    UInt32 size = sizeof(*framerange);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        0,
-        kAudioDevicePropertyBufferFrameSizeRange,
-        &size,
-        framerange);
-}
-
-static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
-{
-    UInt32 size = sizeof(*framesize);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        false,
-        kAudioDevicePropertyBufferFrameSize,
-        &size,
-        framesize);
-}
-
-static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
-{
-    UInt32 size = sizeof(*framesize);
-
-    return AudioDeviceSetProperty(
-        id,
-        NULL,
-        0,
-        false,
-        kAudioDevicePropertyBufferFrameSize,
-        size,
-        framesize);
-}
-
-static OSStatus coreaudio_get_streamformat(AudioDeviceID id,
-                                           AudioStreamBasicDescription *d)
-{
-    UInt32 size = sizeof(*d);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        false,
-        kAudioDevicePropertyStreamFormat,
-        &size,
-        d);
-}
-
-static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
-                                           AudioStreamBasicDescription *d)
-{
-    UInt32 size = sizeof(*d);
-
-    return AudioDeviceSetProperty(
-        id,
-        0,
-        0,
-        0,
-        kAudioDevicePropertyStreamFormat,
-        size,
-        d);
-}
-
-static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
-{
-    UInt32 size = sizeof(*result);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        0,
-        kAudioDevicePropertyDeviceIsRunning,
-        &size,
-        result);
-}
-#endif
 
 static void coreaudio_logstatus (OSStatus status)
 {
-- 
2.24.3 (Apple Git-128)


