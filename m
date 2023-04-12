Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14556DFFFB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:35:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhB3-0004hD-MJ; Wed, 12 Apr 2023 16:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhB1-0004gd-4W
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:47 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhAz-0000RP-GD
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a342f15e4so240036266b.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681331683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSExnx5QC9RqN2HqXaE0eED1yYxvpJdGPWDYki2hz1Q=;
 b=rRkepYbY3sOmcpIlUVtCmWdZqt/jshNZS+eplM0WfyvUTFIPhzobK5u/RyABcllQR+
 wH4Jaagx/TXlWUdKsZODS5a2d9vHk6T3j9E3lVvHWRjVIj1YcR2f7CZIlkpIrioJqPb/
 5B1EWC2vzNNgbi7THldAzT6vY9BxQ5ASB3F5mIsJNJik+HG5P4/cmabpxf2LiieJAx5s
 3Qn0ZL+j8mI0m2sZezmMEIycPF7PfFMhmAiLYtF4rLGo7UdtNW8W0QCvud8Jjq+r0C24
 ZNWdYiA1ZtrLWqsupDxHWdBAMKEVuFsSflVY7dwt7X5KbHiEO5+Qs7rl3Cm8VhWFFGqm
 wUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSExnx5QC9RqN2HqXaE0eED1yYxvpJdGPWDYki2hz1Q=;
 b=FXCNVt8qNkCU2GGWr+bagwIoi5UZi+6S5rabdZGP6r5PQYQLtA9/TKu+C6uko/ivyI
 BLEga5xz+Bgx2F+FCOGQabD4safIOKuFl3jd4UEavEIWY/PsA0Rsx83hx0ALfV22vTBL
 JRaXikWbR6Kj6rWS1Xq7vO/CHAifmCLQR7jINeo6FhbP5yIE38MU7gqWJBunp/JqQjjS
 4EWUZeP1yFJaR81j/2KYBspqiFmzHJF0wTbbTYmjw5aE/wvCS8FZXlQenaHX2Hg23Bn4
 6UodcE23cyQojVVXNAGh6h3nnsQm2EdSEKb9YkS9zQlJiPtuvArhYLCLr+DSaWh2lFyN
 VOIw==
X-Gm-Message-State: AAQBX9fw5IYmWiCUTy/uXnbjy7yyAU/j1BxOTCbDkrPUze6ZFwA99WJQ
 46B7TF4mZs5rvfVQDVgnHa/bi8Hag+8=
X-Google-Smtp-Source: AKy350YxltZUyK5UvvKOrKl4WbZ4RYDM5akskR1tb8rrgPLxqB7gk6eaub19bjVOGyIbVYYWI6/5GQ==
X-Received: by 2002:aa7:d891:0:b0:4fa:ee01:a0cb with SMTP id
 u17-20020aa7d891000000b004faee01a0cbmr18216940edq.32.1681331683701; 
 Wed, 12 Apr 2023 13:34:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-055-150.89.12.pool.telefonica.de. [89.12.55.150])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a170906358800b0094a6f908b8bsm4093562ejb.166.2023.04.12.13.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 13:34:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/3] ui/sdl2: Grab Alt+F4 also under Windows
Date: Wed, 12 Apr 2023 22:34:24 +0200
Message-Id: <20230412203425.32566-3-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412203425.32566-1-shentey@gmail.com>
References: <20230412203425.32566-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 91705e4bce..0031f9bca2 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -857,6 +857,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #endif
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
+    SDL_SetHint(SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4, "1");
     memset(&info, 0, sizeof(info));
     SDL_VERSION(&info.version);
 
-- 
2.40.0


