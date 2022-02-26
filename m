Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD1F4C550F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 11:04:29 +0100 (CET)
Received: from localhost ([::1]:60136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNtwC-0005pY-7i
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 05:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNtup-00057v-VJ
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 05:03:03 -0500
Received: from [2607:f8b0:4864:20::62d] (port=41498
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNtuo-0002P6-FH
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 05:03:03 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z2so6767093plg.8
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DzWVoZSuDOk9YJksxa9DZxNO1Zv8zRAqEBE/V7Q9ITM=;
 b=m2nJbs6CcP3Cc+i7Uu0gmwyZyz0+AkGMrY6mzSQiPXHw5XwCbQw199r9v+zmUXHby2
 im+MoNLEjS2aqfWj02oYJKgKSUpeS8aH/uz4dk8d3ajZb56bZZPDj0J2bzsPeSZz46Gd
 sxJOIKlJCdmlL3p6CO2nljVMAHmUdWY3cxlQ6wQEOYcoetSLKZp+iFwa0enY0g1oDte6
 1DzZDRAWym9JThVXtp85FjDy/JDxuh0IA4QrpP/Bpk0yUnYCwi/6qublc3a8GQY5AkSm
 OsFDm5YVWLd08spKBptjwucewbTs2k7//7zffXREGAuJhYlTB2TGmaXLQANGirT+SeGj
 SGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DzWVoZSuDOk9YJksxa9DZxNO1Zv8zRAqEBE/V7Q9ITM=;
 b=d8kAlCTowx1eEOSOGpLG3auwLqiKfUAHyyveD8y3ERdfv1088UQIrcZJsW3j1InTsK
 mj6QiTH1EFqJWpaYFC8f58DS4OUAIU52dIKYDg3b0R30xlXpTkFA/T8/NQn8AkGEMIw8
 wrrfEn2/coCMadQIGzAMb8VNtDdLM0aqBiC5UAlymEbxHsp8FWlDO9LJ0V7mpjwDJJ0h
 dnTcvAlkthoofVQc04Mlm8utqtC3SsijHOwQOWlL963egAZ3oe5rmf47DH/bZkH0NH2O
 4QhWGdNCzs98Cq1891/LKxfQa1HoKd0uU2GzFfAlLgft87z0MdGw4D6MKJBKrbLq7MWJ
 wZAw==
X-Gm-Message-State: AOAM531yMTKZHCEHW/uJE3aMglgH2ArZs/2yJnYKmtZ3vG5r+lYyHv4k
 K2bujm7hSjJylUB/VlGIvwlyE5ngdqQ=
X-Google-Smtp-Source: ABdhPJxhkiQhNzspcr2xmbseguoUkYoUCFbDcgEfDVancjmhZ6wAIhtiogn4squGzuWoaLnQ89ektg==
X-Received: by 2002:a17:902:c7c2:b0:14f:dbe9:e3fe with SMTP id
 r2-20020a170902c7c200b0014fdbe9e3femr11325124pla.121.1645869780788; 
 Sat, 26 Feb 2022 02:03:00 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a63af0e000000b003732348b995sm4895690pge.12.2022.02.26.02.02.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 02:03:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] coreaudio: Notify error in coreaudio_init_out
Date: Sat, 26 Feb 2022 19:02:48 +0900
Message-Id: <20220226100248.26847-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
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


