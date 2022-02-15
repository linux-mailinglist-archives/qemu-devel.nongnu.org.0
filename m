Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6C4B65FB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:25:27 +0100 (CET)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt9K-0006Yg-Fb
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:25:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsp1-0002bz-Gz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:27 -0500
Received: from [2607:f8b0:4864:20::42f] (port=39523
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoy-0002DN-4q
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:27 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m22so14380072pfk.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hwDMbE3LpDB4vudQxm6+URmPG25hAHbBrpGsaG8baq4=;
 b=TiSQ4xMVKybegMSLR6fzpr1VXx7wwP7jKoOuKTtgt4LyiZmVxHtwFRGXCjNjXzbqxx
 WgiVf/wzPo/aLYAMpvS9idTR1sZQILlqKFCCyFqE2ikeIB+i3C+5oYtMMumEWScgvuZb
 Gthn8w5PLJte0xoKGotuS0wcaMmVJOZASpQXxu/4Dx/szeH3l2fCLdLoveOutElnE8Rr
 5KbexKeFr6o467qF7N7Fd6xNK1Qaoz4ywJKYUor03O8BwmgJKWx8dmBFCU2pjvxXFLUW
 wRB8YMTt0v13inW5O5GDOsmS0Jupvi4PzR9VSxjovbWHruArAOBTx2jy4IoIshTD5DIW
 Cpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hwDMbE3LpDB4vudQxm6+URmPG25hAHbBrpGsaG8baq4=;
 b=E4xGjXh1itG3Hakpoh+IGtgZ5En4zTVxHEiA5u+r8Ok5gB1+3Ige9s1gLx5lqBdHqd
 iNZDRvf9/6p5QJWLbiMSBcFCuovEBBNbP91I/IBzWsdZ2IKyI5KkFpd6IIuMmW3q4CZb
 FoOiyE8edxGxyBloywlm0MZFnoGFN41A+pS9BqP8Qnvk7W0KLNaf10Z6AMcRXFt9F5yt
 BKlHxXY3qjp5EEK82qrAPYIl+z8MMOqHtJ9/keRFSOd4E0YJfu3knz6NaD1J9S3jDKvx
 BfGQJXVFxfic02CU6ilcumtXNZULzzcBR5TEOsziskrSShC2RKAR8lcfHPyBBqk2kcHA
 ZsmQ==
X-Gm-Message-State: AOAM5334CYWwUyUzP/k2x3yOrfFFqXMtfBFEZTlxNZ74G5JdQ7w6f31h
 RUm+Ajm0XlsuPS/x/RTXTXRC2y4A6TU=
X-Google-Smtp-Source: ABdhPJzQegNXIqgZF3L87kUqN7nC4TNttZolpvPcMBp8cXNjFyiGgAPfnJHJsmooQkv3XsrXbTRe8g==
X-Received: by 2002:a65:4001:: with SMTP id f1mr2570889pgp.438.1644912261752; 
 Tue, 15 Feb 2022 00:04:21 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id fz21sm6216412pjb.35.2022.02.15.00.04.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <roman@roolebo.dev>
Subject: [PATCH v6 08/15] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Tue, 15 Feb 2022 09:03:00 +0100
Message-Id: <20220215080307.69550-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When building on macOS 12 we get:

  audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
      kAudioObjectPropertyElementMaster
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      kAudioObjectPropertyElementMain
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
      kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
      ^

Replace by kAudioObjectPropertyElementMain, redefining it to
kAudioObjectPropertyElementMaster if not available.

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Suggested-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/coreaudio.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e50..1faef7fa7a 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
     bool enabled;
 } coreaudioVoiceOut;
 
+#if !defined(MAC_OS_VERSION_12_0) \
+    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
+#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
+#endif
+
 static const AudioObjectPropertyAddress voice_addr = {
     kAudioHardwarePropertyDefaultOutputDevice,
     kAudioObjectPropertyScopeGlobal,
-    kAudioObjectPropertyElementMaster
+    kAudioObjectPropertyElementMain
 };
 
 static OSStatus coreaudio_get_voice(AudioDeviceID *id)
@@ -69,7 +74,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSizeRange,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
@@ -86,7 +91,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSize,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
@@ -103,7 +108,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSize,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectSetPropertyData(id,
@@ -121,7 +126,7 @@ static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyStreamFormat,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectSetPropertyData(id,
@@ -138,7 +143,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyDeviceIsRunning,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
-- 
2.34.1


