Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88554C55C2
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:02:22 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNvmH-0000fj-Uu
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvkC-0007eR-Kp
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:00:13 -0500
Received: from [2607:f8b0:4864:20::42b] (port=40517
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvk8-0004bQ-WE
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:00:10 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z15so6964505pfe.7
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MT2L/GEkaBKbf2/2cwVp0He9d9tNtyuAcdsC6kqSsVE=;
 b=pojliET3nQ62U/uUQtd2d8bkbRQwm1hvZ+B9nJ4jR4YNn2XmbwmJ48+W0bfH4NlAfO
 OACWW9t+haaRM8vkz6GMu4ATRMcXLnb6iP5DRMMY0zVP9j+4848uezMiZl6pBxKwAf37
 +LuTYO8HPQbPd2LGvxTCku+21YKHGtpAYkbIT5IZnVA4TYrEzallWwDoEBV91GU/R7T9
 njof8gL0fBZQViILnWOkksroZGQwlesklzB7juHjRAY/EA7WFnt3jC3x4+Fu82os6Zc9
 n/w7VCD+V0Zy2rt93gkcVDKjCwNU54SX42lCSGxoHpLLtLoYPHB5oKSN3rMFQZadJ4ic
 wXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MT2L/GEkaBKbf2/2cwVp0He9d9tNtyuAcdsC6kqSsVE=;
 b=BZZFM0Pf/2SytJNWeu3Eexl+gz9y0uLEJQPrDVbwb5eLEqkvoalkJhU346GUaHwoCu
 ycqhgXbHpvmDXXF6w9TqVRkfWg7COKOXp84bRiHhyBVCSgXgo+xAqbGnVA1IT66vfKRD
 dU/vOig8MZYFjdYE0gERQI5w9vW3yWOMvN88uSXHMxZpuAMiWJjw6ixEYMQ3coTBYU18
 /UK7pkoI5mfcfeAp2TNRg2c1gNuAVHxPBlTsJRZYGg3/mKW08BuwfpqXRZbA1wdFshvP
 CF5uJkjV92gqt4QyB2DY8QKx9GFApEHTZtD3WoF8cDNaWyiaH1AIHzfo1SZUMLKV+yJV
 ixrQ==
X-Gm-Message-State: AOAM532HgYZiM7Y/D90YZG422n08pE8UNlsfg32A2uqoVgIA6OScnN1E
 rfUUL0pjcHauhE4pAAyJrBLLRC6ViIg=
X-Google-Smtp-Source: ABdhPJwfpxCMgP8sHMjsQDaa6iZY95mWwkm0fad6Lqs/mdR/PgXe1Gz6H1eFvOS3k+lYNYP80Q96lA==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr12313444pfk.47.1645876806796; 
 Sat, 26 Feb 2022 04:00:06 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 124-20020a620582000000b004dee0e77128sm6180557pff.166.2022.02.26.04.00.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:00:06 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] coreaudio: Notify error in coreaudio_init_out
Date: Sat, 26 Feb 2022 20:59:53 +0900
Message-Id: <20220226115953.60335-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
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

Otherwise, the audio subsystem tries to use the voice and
eventually aborts due to the maximum number of samples in the
buffer is not set.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 audio/coreaudio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e507..d7cfdcc4fc4 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -604,6 +604,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
             coreaudio_playback_logerr(status,
                                       "Could not remove voice property change listener\n");
         }
+
+        return -1;
     }
 
     return 0;
-- 
2.32.0 (Apple Git-132)


