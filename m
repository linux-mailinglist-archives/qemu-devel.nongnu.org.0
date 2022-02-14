Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060034B5A9C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:41:23 +0100 (CET)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhDu-0000nZ-1v
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:41:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXt-0002Zh-Eq; Mon, 14 Feb 2022 13:57:57 -0500
Received: from [2607:f8b0:4864:20::1029] (port=46950
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXr-0006TA-SD; Mon, 14 Feb 2022 13:57:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso40323pjh.5; 
 Mon, 14 Feb 2022 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+pya3JYgV6ZzPzcXKvqBqTPUHPFc2/HxKii/23sPW7g=;
 b=PzWiyhE3N1ftrbT0xEmJWUnJaas4xUnN7WcFyyB9ah0YZpgqpDB+JPgTzaSVqmKmh0
 DC+Xw1mhUtattXqr4Jiei9ZsA4+DVBTGV8hN73z5rX7TpoO+mtcl3R+gUMczmpB8IgL9
 ss1+3UniSwtk+h18nI+8sS36yAdKef3ORhExqfZIm3FWFb23Ldvj9fZlhR57GKOvlAgx
 1t9GqSps8CxgNp7Gz6thM7o2Ug81HGgBAn3pJtV8htf54LKgDboVq9yj/dQ4pDJHD5TJ
 iwn1lWqUSacRxvdtGxuK8Sy0vLd1MYv1jNdM0zxlDLfZ5AiSyoam4CGPwo9tiOhLE0FB
 9Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+pya3JYgV6ZzPzcXKvqBqTPUHPFc2/HxKii/23sPW7g=;
 b=pnPApCezVChw85MpJCNAjBXsDpsBdw0VjEtbzhI3nRJlH+KmRjg/eR9hHrCCRmSw0q
 Pj1KD/wOAQQYEYaGC+GJdXG3kkv9se/lIE6rx7fDE61P7dZC3ZmMnIXAzckmsk5Y9egw
 Cx443RJ0OQlCo8x1cFojgZpDX+SyOME9Br7ztieAvNvAlpT3G+/cZChKYlsk4B0L60+c
 3nqwaP6uKKLd1Zbzz3IlcllfInnG7HSrKO/yNrlMHSyvPYfc0rIDC6/Dj0nm4+eIvA3b
 +ED5Bticf6RfPzn0vcEIsA6hkYtXv59wv4CDrSEWilvmzulB4RdphItrQRnT2+MeBUuH
 eMiA==
X-Gm-Message-State: AOAM530jqTirxsGHx6WAbo8y36aSrRiuaM40EfXtLtR6kSf0as8mYYLd
 Rfq4woUnrRuXC/QT47nw9tNAAq5SKpY=
X-Google-Smtp-Source: ABdhPJxVS8TdW9CqE1jImC3IL2qDYnwCDWtOgO7txSrwIDeoTGWrHKTk8cA+HaZcYdMNLV7TbyzUIw==
X-Received: by 2002:a17:90b:1e4b:: with SMTP id
 pi11mr33772pjb.124.1644865071679; 
 Mon, 14 Feb 2022 10:57:51 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id v20sm14666531pju.9.2022.02.14.10.57.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:57:51 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <roman@roolebo.dev>
Subject: [PATCH v5 10/16] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Mon, 14 Feb 2022 19:55:59 +0100
Message-Id: <20220214185605.28087-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
index d8a21d3e50..5b3aeaced0 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
     bool enabled;
 } coreaudioVoiceOut;
 
+#if !defined(MAC_OS_VERSION_12_0) \
+    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
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


