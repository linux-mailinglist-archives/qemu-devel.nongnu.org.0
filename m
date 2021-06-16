Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21E3A9D54
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:15:59 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWKk-0001Ly-LD
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWJS-0000ZU-GG
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:14:38 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWJQ-0002uK-JV
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:14:38 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so4066866pjz.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KiCtd/82OEsoiGmj6vjLWKI276blLEeFQOTQwsXW8aE=;
 b=U6WaWeVZyWyoN17C4jeCMlGxyD2JQH+ff5HnE2wD024qQSV8bIw+JdtdV8W77bDYqC
 Wu6OEz43sw9zY61x5Dv7m3DeDItZj1/LZS6ZtaQ6KG7L/E5NaE72ABUueVu6ANzAH0qz
 jU0MVTr6mSExuXqApnAvRGAIA3kTdKVU0Ecgj4soS2Djjgt7XYWwE7fUn3cYGz4k3KuK
 PGsroIhS3mfpZ/mF4aVRGwYAySMdvu6K9a/cJzY3VcSAAtieXaMf+SOyw8Y/hvtc+E12
 27vKlCexX2zDYX38QQGTVSb6Uy47/mcH/R0Kcn0YKPp8Qqi1DMaG0yVF24QyT9QSbSFF
 89LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KiCtd/82OEsoiGmj6vjLWKI276blLEeFQOTQwsXW8aE=;
 b=fJtbmr/6OV/xmEqcax0SHsC7zrRnFY7WWdoN2PsnBaFqJYpOvsA212f/NniPHJbjkv
 HOcDe9QPHazztDpHCws72tQGsRS0A1+1W4X/dZ2UQPLKXYmUSmjlK0fpY1GFnOEtW2xS
 cwk5SL72VMAsowsgGyVGOK8/cg2IcmWvh71qgxMfzad1JajpBf2q6ebbyFGxEEKeFf3s
 4k2SE+FAzWjV4ujF67Nz7vlMPEfAGGG5H2DzNCJOajmn89gX6B4HqCakFwrfiT4xC+ua
 BYPqjVpGtQI7bZTRMZwpEHhTcavQoN4dLzSQTbOzsi8nm0hwzyBRoSFtM0d3Yk13iTPM
 cMnQ==
X-Gm-Message-State: AOAM530ci3sSFJ/mDL4UjN/OOkV5SBfG1B4T+RWJOrjQdkwVQ4TlSo5l
 ISZprecj9dgs2KFk5VnpSUuILq9x1xSrig==
X-Google-Smtp-Source: ABdhPJxdVzff/DWmFko1IQkHcxntteua3w9290mAs6wBNVMbTr+zJG72K/1bHw9XUcB43pUjBpuOvA==
X-Received: by 2002:a17:90a:66c9:: with SMTP id z9mr10028pjl.122.1623852874571; 
 Wed, 16 Jun 2021 07:14:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id g9sm222721pgk.79.2021.06.16.07.14.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:14:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] audio: Fix format specifications of debug logs
Date: Wed, 16 Jun 2021 23:14:11 +0900
Message-Id: <20210616141411.53892-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/audio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 534278edfed..6eba208cdba 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -704,7 +704,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
 
     if (live == hwsamples) {
 #ifdef DEBUG_OUT
-        dolog ("%s is full %d\n", sw->name, live);
+        dolog ("%s is full %zu\n", sw->name, live);
 #endif
         return 0;
     }
@@ -994,7 +994,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     ldebug (
-        "%s: get_avail live %d ret %" PRId64 "\n",
+        "%s: get_avail live %zu ret %" PRId64 "\n",
         SW_NAME (sw),
         live, (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame
         );
@@ -1021,7 +1021,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf->size - live;
 
 #ifdef DEBUG_OUT
-    dolog ("%s: get_free live %d dead %d ret %" PRId64 "\n",
+    dolog ("%s: get_free live %zu dead %zu ret %" PRId64 "\n",
            SW_NAME (sw),
            live, dead, (((int64_t) dead << 32) / sw->ratio) *
            sw->info.bytes_per_frame);
-- 
2.30.1 (Apple Git-130)


