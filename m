Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540834CE984
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 07:45:00 +0100 (CET)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQkdX-0002fb-BI
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 01:44:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQkYm-0001pm-QI
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 01:40:04 -0500
Received: from [2607:f8b0:4864:20::436] (port=35813
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQkYk-00084I-GT
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 01:40:04 -0500
Received: by mail-pf1-x436.google.com with SMTP id k1so11132025pfu.2
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HTLEBVVUP63tP1xLu1KzIkJIxJT1Z+lLEvU3ugv9XII=;
 b=If2qea7yCSyEAPiedl59m1LBvMQNc9eCjFNpYjGa5oz/poFOvNq01Jid5AGkJdOlU8
 acQ+YFc8sPHN/EQeXegt7eB0PBNcdQfJCbTRrl6H52TZsh2UlCrQffJctORAQMbqANTg
 2xAmIHObF9lVxHxHq+GI9oeft9MFOp44ExOTDQ3vDlkIHRZHhNOD1mzlm58VGnQJm2pm
 s4hZGF+UGXcLBx0T2WP+2xJiwjIpp+yhT1pHyG6OzwocWVeBjl04uOSS4RwPf9m4dCm6
 j0S8ZA+3gMswqECAY01BIQI/ekJ8ekZIYFJ6o48EV6yyRPX8D1zOvtZC2PinpacVuJx5
 u4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HTLEBVVUP63tP1xLu1KzIkJIxJT1Z+lLEvU3ugv9XII=;
 b=u6edrG9y5chDnAlxEmsvQ07CQVVy0mR9D6oyNqMId6c3bAF4BmCATSpHXNLVFs5Msx
 CWWaoA32+PPE6MKQPTouwyLyRz8sxxFGzKKH2Ei0LAV/I3mUuMEU/KqMr+cMUvPOOoaJ
 EVL6+FA/NMXYC8ftMsoS2++c875RMLrnjgzOc1L/HQTjIchYeJ3SEcL+nbuZZKCGeyUM
 6Ot4qQ8bfN3yfgo9rk/UzU4mTPEU6gjsxUEetygxZdAXJ/WgKkhNAAFO80pxMwXWSJzZ
 Q/ENOeh5uYacd/XRiKnk2+8ER4TzzCS2zft1cMlgPL3PQ2mMGRZ9Ms9pgG1vW1UGmniT
 XVmg==
X-Gm-Message-State: AOAM532Xco3/Y8UOrnimyXBkWo1bqTIsiCxj4ALnxgrDO2j5WUuoArh9
 KuIC9R4LI6QpcMHOvPZGQdj3qBj6fOI=
X-Google-Smtp-Source: ABdhPJwayK6OBUqlux60h9frFEqxe0NW/Rae6kgdFORdOwPsM2QLkOQDxGfdevhDLIW6r/T4ov39jw==
X-Received: by 2002:a63:83c8:0:b0:37d:b33a:3cf8 with SMTP id
 h191-20020a6383c8000000b0037db33a3cf8mr5241656pge.5.1646548800787; 
 Sat, 05 Mar 2022 22:40:00 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:f82b:4f21:14ee:1481])
 by smtp.gmail.com with ESMTPSA id
 rm8-20020a17090b3ec800b001bb82a67816sm8819805pjb.52.2022.03.05.22.39.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Mar 2022 22:40:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] coreaudio: Always return 0 in handle_voice_change
Date: Sun,  6 Mar 2022 15:39:49 +0900
Message-Id: <20220306063949.28138-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
says:
> The return value is currently unused and should always be 0.

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


