Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CF4899B7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:22:05 +0100 (CET)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uce-0007F2-E5
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRu-00007k-Br
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:58 -0500
Received: from [2a00:1450:4864:20::42b] (port=36492
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRZ-0008Tg-8H
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:58 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r10so19019417wrc.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ytK9KYzbdIauT6uBw9oxJi+tTQp7kAtiRaxptTl3zRc=;
 b=fXUdvQvOlCSS0lFG+V1hPvdhRjB3er6VvruMzqCWzWxX+Ba+meW81nj7JmXOpPAFzf
 5jl5UfDCaEi6lhBRyZJzNF8CrDV6v3ZmZtjtoZ8OT8PhpqmOiTT/50hPN6amC5GMjUau
 TBDrpI4B7uE+c6WEzScqJd8eANyfLkgzYbf6jQVSvCMxrXlF69m99Lg4LdjOne7x+sGV
 Dhu8gbIbCwotdBicjJqfwwzCziis/YmrEjv/gWbj4AvcHMPH+VOJpOrQJNawMqe2tt8+
 2PxHX+9B2pXFmk/HH/YbIdcotEfQSlqYoWIfr6brYHaEZiA1ioSAAJikVAe09p3dg2Ka
 p7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ytK9KYzbdIauT6uBw9oxJi+tTQp7kAtiRaxptTl3zRc=;
 b=aS2o69y/NMKYje2kwMmouq5U5MO2qUPZqhs+SgOu9XYT1O03vqOAAtp48H2rguQO0W
 3w4fIcgPGIdq2MnAPu7LYGMxDxYuZi4Pwl/XzDJoFeaSIGuIsCjEy7xM/s/m0H+xotV0
 dV+bt3ItolOLinPQpwOU1aM9AxMHT4asx5lbke6b22zLW/CF62ftLrb5U58DMN+vz44m
 M082U+eueZHv20jf3h2K7jsOauNVAs+8G6p1QJ97rdJAOMd+mvedwycGwGNWrY8VI9RN
 rgt9MoiSKhGc1Efke0nFBIxJyirtF0okRvkI/v7lliTMxt49z+sF3VMwEXbTIy1zQ+ET
 dcxg==
X-Gm-Message-State: AOAM530pbf+Ow2UIgO97h3iXXOfQAVdPNKUo/MTNmqVeNJna+JAPthMB
 4+9rERCxWQ2xWOQzEGpRsA/00nSBNQC0AA==
X-Google-Smtp-Source: ABdhPJw2uW5XGtzfsdrBthGNN4PwgF3o+F0s+1GxM2p+u+7V3YlBRynnlOznPYdlYcjxvOSErNXH3Q==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3587578wrv.619.1641820228577; 
 Mon, 10 Jan 2022 05:10:28 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id az1sm6762949wrb.104.2022.01.10.05.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 5/7] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Mon, 10 Jan 2022 14:09:59 +0100
Message-Id: <20220110131001.614319-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on macOS 12 we get:

  audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
      kAudioObjectPropertyElementMaster
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      kAudioObjectPropertyElementMain
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
      kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
      ^

Replace by kAudioObjectPropertyElementMain, redefining it to
kAudioObjectPropertyElementMaster if not available, using
Clang __is_identifier() feature (coreaudio is restricted to
macOS).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Checkpatch:

 WARNING: architecture specific defines should be avoided
 #10: FILE: audio/coreaudio.c:47:
 +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */

Should we define __is_identifier() to 0 for GCC on macOS?
---
 audio/coreaudio.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e507..73cbfd479ac 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
     bool enabled;
 } coreaudioVoiceOut;
 
+#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
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
@@ -69,7 +73,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSizeRange,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
@@ -86,7 +90,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSize,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
@@ -103,7 +107,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSize,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectSetPropertyData(id,
@@ -121,7 +125,7 @@ static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyStreamFormat,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectSetPropertyData(id,
@@ -138,7 +142,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyDeviceIsRunning,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
-- 
2.33.1


