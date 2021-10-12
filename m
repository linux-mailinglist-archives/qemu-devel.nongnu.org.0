Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5687642A36C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:37:33 +0200 (CEST)
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maG68-0007u0-Dd
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiY-0000Bx-IB
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiW-0007TT-VV
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p13so80331024edw.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4xhAlgOh6fkBzCyCRH3NBrlBdiFPisuQXWGp83dUS78=;
 b=m/wJc27ybXCTKVdkXuR0xvmM0t/Fx4UpQybiHyJfQ0WILT/1RtFS/rufds+ftYmo+w
 eYl5pRklga2+JTA/Ag2ttS6/IyS18kMVufNlB29o881zImK91ZwF6yKms/CclNFvhiF+
 otUES18N457Pusy/9q0ANXLTk0YnTCTzRLrXCtxPsK1DfjSpfbc6aWdeo7ElwNAKZE2g
 uqV12yX8DKwoU5ttPnV02gCAKMMNkefzFBA5U8KS5Q13hc6T3fuPw6bZYR3e+hLzLX0G
 +sCzB4ZaXVRRp1/26AcXX4WedfHyHxhj6RdHpwRkq1cUBbXNg5v4W2oWn6B6uzyVmTn5
 rg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4xhAlgOh6fkBzCyCRH3NBrlBdiFPisuQXWGp83dUS78=;
 b=yTPVRFjSwj3eNZpzTMs7A4fE/Ibtc7M24iiYXYxPYBCIxymF/kBBWRzlQoD/TgRzid
 x8iR/hyDCVp21WB0sDgyj7iQQPQ6D+NS0jebdWvaSz3g5SZj8oAQvPGWvhsSIdxUZze3
 yN+PM4geW613u6BVxRlgVf+glrChIhdIpguWajbyW2wU7QoIG3ZAPP5JiZ7A+Y4UBsNw
 w4bwcv+FUG1QhuEOPQ7KQf1AKRbB43wAB24c5n17H0zYR8uORwFoggtpTwTC6kdH85xJ
 h1QPq0Bg/5obQ4CvIIIfn0PIHNOAgltDJKisVXQsPPMiqaTEEgtrhW/v9+a05KHWUTEB
 AT8w==
X-Gm-Message-State: AOAM532C9KE0i4kAfKugK70wFAANnecnKGAtQau3ZXw0B9hSk1Q8vT70
 w8OuNVqhCUkB4y5skLc7TEfNEGf5uwc=
X-Google-Smtp-Source: ABdhPJxjM2fMi+MtVtC5+ICctRcXSxOHpynIpCanM/nNKW4Wt2z4tx7qKlS80d571lDtTC6FBNKKFQ==
X-Received: by 2002:a17:907:784f:: with SMTP id
 lb15mr31346859ejc.260.1634037187546; 
 Tue, 12 Oct 2021 04:13:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] meson: define symbols for all available audio drivers
Date: Tue, 12 Oct 2021 13:12:42 +0200
Message-Id: <20211012111302.246627-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
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
Message-Id: <20211007130630.632028-5-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index af3cd677f4..c0c5b7b9da 100644
--- a/meson.build
+++ b/meson.build
@@ -1217,6 +1217,9 @@ if have_system
     'pa': pulse.found(),
     'sdl': sdl.found(),
   }
+  foreach k, v: audio_drivers_available
+    config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), v)
+  endforeach
 
   # Default to native drivers first, OSS second, SDL third
   audio_drivers_priority = \
@@ -1239,9 +1242,6 @@ if have_system
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



