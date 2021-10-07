Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072F4253CD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:12:49 +0200 (CEST)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTCa-0003TW-63
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6h-00029E-4p
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:43 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6f-0007Mk-94
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:42 -0400
Received: by mail-ed1-x530.google.com with SMTP id l7so23127430edq.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVlTEKspqDgNLmcgjTl/5S2TMmoesf/a0v+UFUMZ2ao=;
 b=JL/IX28tFpkhEkWWPdC8MI9Q170iw2nL1jaI/gc+u05ZAV/pD4BOvp06Fm7An1zVZu
 /lYyfgvwTsSgRw6B6LrF6tipdTPvf5aGNC30XufCzmTMfVrs4l+TOaHXT05MUwtorPDa
 ox07I5OtT/7tWeXLKaKMcf9KJ7/e/LJWIHUAH89cBkUbH0HZTbniROacjpWl669eZz/y
 qMxQPzg9U2jy9Dp4maKukIjJbTVsorrZq0T5h9l4ZgU1tAEOFFCI/f3Ietsx1hh+ZIx5
 e0cxm4n4kmYcSyr1TUwiOEgENemz5tJV5icL/B/4kax9gBe9UNBq2c5vClXirmhaareF
 DDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OVlTEKspqDgNLmcgjTl/5S2TMmoesf/a0v+UFUMZ2ao=;
 b=8E+yY8zyfvnGCKuHpGVgRg+ojey3cPo8/HWxMnFEYY5z6gilu/CkAkkdCTo2wpdbYc
 r/6jg8TRk2f9u1feC6olKu0/kY/1noHSKu0U4uTMWSIfAsevPKPeipMP/gleCicsmcr1
 WA+pmh2wt8OIDgiwHK3Zp70L7DXeg9QCiY6WL+Djzy/xEJJ49OpEA3LYnPBPO4WWxDny
 if4Mk8OwWUX8gtpwO+D3OXMax3PpjnRYSoCfd48sEy2ggPI20gLRW1nK8iL0Ps2YJJ5T
 vtywsOIW1yxJkgzwx1V5CAsdVfsHXQL4hTLLbXzzUHvz9l0yJn65yhtEwlZENWvfWToC
 vdkw==
X-Gm-Message-State: AOAM5324HITgyQALiCiE11kzBwAeYB2NGTxbx4vH8DBZfyBeVtgzNXgY
 7q5qp+XKzwQeF9b4u/zRHUef5B0T0EU=
X-Google-Smtp-Source: ABdhPJyRjF/ORRTHb9/Qjdx66U/DvIZ0vpiXwZsB4V1uRtPyjkpFP/6w+xLHPJezDdCee7g+EVI+TA==
X-Received: by 2002:a50:d885:: with SMTP id p5mr6071269edj.255.1633611997475; 
 Thu, 07 Oct 2021 06:06:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ca4sm10167543ejb.1.2021.10.07.06.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:06:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/24] meson: define symbols for all available audio drivers
Date: Thu,  7 Oct 2021 15:06:10 +0200
Message-Id: <20211007130630.632028-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All drivers are now built by default if the corresponding libraries
are available, similar to how all other modules behave;
--audio-drv-list only governs the default choice of the audio driver.

Adjust the CONFIG_AUDIO_* preprocessor symbols so that they are
based on library availability rather than --audio-drv-list, so that
the tests and -audiodev help follow the new logic.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 13b725181a..0e9733a833 100644
--- a/meson.build
+++ b/meson.build
@@ -1219,6 +1219,9 @@ if have_system
     'pa': pulse.found(),
     'sdl': sdl.found(),
   }
+  foreach k, v: audio_drivers_available
+    config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)
+  endforeach
 
   # Default to native drivers first, OSS second, SDL third
   audio_drivers_priority = \
@@ -1241,9 +1244,6 @@ if have_system
     endif
   endforeach
 endif
-foreach k: audio_drivers_selected
-  config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), true)
-endforeach
 config_host_data.set('CONFIG_AUDIO_DRIVERS',
                      '"' + '", "'.join(audio_drivers_selected) + '", ')
 
-- 
2.31.1



