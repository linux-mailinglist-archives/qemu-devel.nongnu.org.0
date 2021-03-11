Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E22337891
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:56:30 +0100 (CET)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNfp-0000rQ-Ng
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN2D-0003EX-9r
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:15:33 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN28-0001Pq-HK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:15:33 -0500
Received: by mail-pf1-x42f.google.com with SMTP id x7so11235485pfi.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=od/ubjSu0OOHMmkpTjRC1G/py4pzQgwR44+oIjfe5mM=;
 b=jGonowbcqcECP+YxjQ5MESN98M7w1e6Zwag+IiLFceBznq3oSbrPqERkV3X+R4Hmsr
 elm5h+JAyWJq3Rlmjtpny9UB9n1UwFTVH4ZdPAcZa6cI4pbJkEuhQ0no41OqN21RLxAP
 JcoT/BG+BJ1CyshQ4xGdimNg8AJlV3dbOb6OIScxYBF+sJgQmkfrQ6RI2Q0rZiX1scsb
 BxA5vb6VD/lqnDLtgtJPnlONK1mM771pVVN5vzNuo9wN07X85/smGseTz3kdylYv06tr
 JVVUqcR+T/qhNxBEKPg8WKvUXN/EOY/lPUzvLJLNKQWyNOM7nwiOr38RZ3yjYVtOWTQS
 Wi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=od/ubjSu0OOHMmkpTjRC1G/py4pzQgwR44+oIjfe5mM=;
 b=ifBc6XpJFuIq0T+93lnux+n+/da6y3t71HOqCSa0jEmAQt3JaqY3BKmQXf4LnwZoZZ
 PIWC+qlwuw7e+/qx24yDhYlq+QRCK5P4lvjdvTZXXp74HCIbQNWENVX7QLp5GTm/WCXT
 QMdUryjZfXgmbkBMTqyFZvoosCLS908hwnC93lDvdvCk+CXa4Dw7iUWEYhLBmY6Yoi4e
 8OJrFp+grHYTRaL0KsfEZoVyL6maH+A5QDDgr9z+dn8l0AV35bND6ZBjnA2YTGSa9kjg
 LcQ4zCQzbU+42g2qQD+7pFhYqklj4pwiY8PGR8hDaIcPzUSl2b2016i+NHpwafpfzU2b
 7R3w==
X-Gm-Message-State: AOAM532Bpr6TebkEKibTH2emCxUe4B5t/pYEyJp/zvYBl5iopst0dq7G
 yy/JROHFLVI88ECKT0uXUxUFlsQROfuMrw==
X-Google-Smtp-Source: ABdhPJwUiyqGZ8TXVNGRorLOBpk4h+PAGfaSyTKR3qOtyjiK1j9nmi+IL3xeBuyJls4Asrxan3wfmQ==
X-Received: by 2002:a63:e511:: with SMTP id r17mr7634839pgh.163.1615475726613; 
 Thu, 11 Mar 2021 07:15:26 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:a00f:6b19:eaae:a18e])
 by smtp.gmail.com with ESMTPSA id j3sm2716732pjf.36.2021.03.11.07.15.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:15:26 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 1/3] coreaudio: Drop support for macOS older than 10.6
Date: Fri, 12 Mar 2021 00:15:10 +0900
Message-Id: <20210311151512.22096-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42f.google.com
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


