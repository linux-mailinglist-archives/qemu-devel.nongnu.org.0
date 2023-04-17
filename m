Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB986E50C2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:22:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUQW-0000Zp-DY; Mon, 17 Apr 2023 15:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poUQE-0000Fr-Bo
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:21:59 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poUQC-0007vO-GK
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:21:53 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u3so15081720ejj.12
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681759310; x=1684351310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDjuNP5wxVhovFPvM7m4qpDAg3jpnIG9FC53GI3D19c=;
 b=QiWhkZLkLtLeh6BEJ4+8WbQ+3J9/Z/Mr5qmx5QlP+fio4FFJ2P4EGmmMrZoFYdV4wD
 uT79YbuH8jICINymwhs6D/9+4v/6KppOYFLCuynuyMOJyURQBSJ1h4U74TVuYxzpGhXH
 MyuxVkc/emdCmi9PCp7Ts0Ujh/9hUWiCrpNy/yi6OJb3lEz65fGXS3FPSfL0qRaCBjtw
 fGvD5Qb6wR8/o+tF/oPxylzUMT1QsDCWrsJCTyQYd8E4k3R2TnCCRGJjN6KV+MvUzkq6
 TxQtvboFkyj26c9pSUWGlhFeNJqAbN51TVQ/2R/wU2YmHu8Hn1kSygZNJv8vBuvn1n1c
 LCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681759310; x=1684351310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDjuNP5wxVhovFPvM7m4qpDAg3jpnIG9FC53GI3D19c=;
 b=KHPC/UoHBFubYExy5YNv80m7mmbRpmSJVbHjnkjPLsGq1RHlMbUDiPKkxY4hYxtn72
 MQSfszteqWS2aILVxyThBuKvN5x+mc13NsNJEKAf5BzwQMHCIPpme8g8DZzxUBjQ37Ex
 ZtBsyLBV+ewa7KF4acc1NfZmKw8ydRgKJQCbVHnrg2mv5nbrYWceQehFs38GWIqanMSB
 hCgEo3NiW2gLgwy6rIFiqDjGgKj5EmVGL3wlBSGO06sTwZvB4n+VQvV2LhHDnaSnPRt3
 c4/EJLt9ZLI+BOonrGa+WXVN27MRNK3EF/c3rMnAcIhU6VhemExvJAyxhmVUge375GHd
 X/vw==
X-Gm-Message-State: AAQBX9fyAXRtH9KVGAQp/B4YjJ9wQIllV0XCBOKbk+bw8RP60A6vCFLt
 Mp0q2gQ/0S3qX65HQi1Dnvt/F6SIAtIRfQ==
X-Google-Smtp-Source: AKy350YdDVM3bg1pvjLEyF2wtIX/DkueJ95qqI4O7pVXhMFTDcRT5X7TnI2k7LWMXXjBjvkZogg3Ow==
X-Received: by 2002:a17:906:4a0f:b0:930:2e3c:c6aa with SMTP id
 w15-20020a1709064a0f00b009302e3cc6aamr8423651eju.49.1681759309953; 
 Mon, 17 Apr 2023 12:21:49 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-025-091.89.12.pool.telefonica.de. [89.12.25.91])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1709066b9300b0094a65f209d7sm6940134ejr.119.2023.04.17.12.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 12:21:49 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/2] ui/sdl2: Grab Alt+F4 also under Windows
Date: Mon, 17 Apr 2023 21:21:39 +0200
Message-Id: <20230417192139.43263-3-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417192139.43263-1-shentey@gmail.com>
References: <20230417192139.43263-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SDL doesn't grab Alt+F4 under Windows by default. Pressing Alt+F4 thus closes
the VM immediately without confirmation, possibly leading to data loss. Fix
this by always grabbing Alt+F4 on Windows hosts, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 ui/sdl2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8af8b89f1d..00aadfae37 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -859,6 +859,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
 #endif
+    SDL_SetHint(SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4, "1");
     memset(&info, 0, sizeof(info));
     SDL_VERSION(&info.version);
 
-- 
2.40.0


