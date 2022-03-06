Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18BF4CEE73
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:25:21 +0100 (CET)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Fc-0004oA-RA
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:25:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09Q-00086k-UO; Sun, 06 Mar 2022 18:18:56 -0500
Received: from [2a00:1450:4864:20::330] (port=46833
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09P-0007Rj-BW; Sun, 06 Mar 2022 18:18:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so8291839wmp.5; 
 Sun, 06 Mar 2022 15:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Tp3WhNKm8JxXl/T2EoFZ8o3VjhBm7jaY9n4gps6ekw=;
 b=c5vj0Ib1OzUvzJdZ7tINjDtHZ03sVw7XitsvE8MwOUnaSZ834UgQQdX92QJZ8/2JGY
 s8tqyrbeVsEIpv0aFptI+vX8NWxjt3HwuE9VC158hdXEWgMkLgm5P+hAfbyZxTFLZTRI
 Yt02OFOf8HuLzEh8zGsfzj1Sip+G3V6e05NGGA9vjT3aXa+84kq7v/7cqX5VtAuebCI3
 bO+WD3UKfr3mdT1GLy7DR1KxaCO777/S73jxHOoWrsCpRPP5T6rrAXDoOX7+2pTJSaNC
 WfNzJlwusJreLT9vfQmBnTIb+4c3aBZ+l28tEX8U6sxVaA+qlpSHTVR0BphIV2zpcrGJ
 34Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Tp3WhNKm8JxXl/T2EoFZ8o3VjhBm7jaY9n4gps6ekw=;
 b=HQSUnW912pjns4PtujndawVlHb9QO3AhYCQqjC93QnhblB6jYPlywJl6DdWc4urFO/
 gI5Ik6cw4eMnAThAFYzqUbWHS6zBoIsycvwbJHP//MQrHeCLqqyvzJsY31oYEoYy9EgS
 hp5LpV8pKiEobn0/J+/EP34nps2V6Izr2AZQAEKDv2DgPO1AIwQ/6+AAuYgf8OD9hUS9
 uP4xb9KlTnaqrgRt0RVUfKPFCbODPBh/X7kxQOSot5GVQmwouKBWoBy+F6Te48nZgcwC
 1SC/IPVWT01wCbEamc7yypPxNiSHSyorFoiTcmn13k1SM5jpZGqyHAppH8TxPcrJABp3
 XyqQ==
X-Gm-Message-State: AOAM530tOnii+LzSqPQsT2gG/M8ec9RpeL/iZ5ICE7OGHLHVynwhOLMC
 u0nT1AmQfo/Sj9tz9vjzkKViPKK4LSA=
X-Google-Smtp-Source: ABdhPJwTK+JYPiA2tUiszKvVTa18E5BjmwJ4PKdxqbUBPSFN/Aah+X5bzr1AAXY66NXMWW9J+f4c6Q==
X-Received: by 2002:a05:600c:1d91:b0:389:ac07:37eb with SMTP id
 p17-20020a05600c1d9100b00389ac0737ebmr344171wms.133.1646608733617; 
 Sun, 06 Mar 2022 15:18:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 186-20020a1c19c3000000b0038990c0925fsm6001041wmz.14.2022.03.06.15.18.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/22] coreaudio: Always return 0 in handle_voice_change
Date: Mon,  7 Mar 2022 00:17:42 +0100
Message-Id: <20220306231753.50277-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

handle_voice_change() is a CoreAudio callback function as of CoreAudio type
AudioObjectPropertyListenerProc, and for the latter MacOSX.sdk/System/
Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
says "The return value is currently unused and should always be 0.".

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220306123410.61063-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/coreaudio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 23d7593eb9..3186b68474 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -545,7 +545,6 @@ static OSStatus handle_voice_change(
     const AudioObjectPropertyAddress *in_addresses,
     void *in_client_data)
 {
-    OSStatus status;
     coreaudioVoiceOut *core = in_client_data;
 
     qemu_mutex_lock_iothread();
@@ -554,13 +553,12 @@ static OSStatus handle_voice_change(
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
2.34.1


