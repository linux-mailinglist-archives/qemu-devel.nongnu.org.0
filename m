Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079456DFFFD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:35:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhB2-0004gv-SC; Wed, 12 Apr 2023 16:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhB0-0004gP-QO
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:46 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhAy-0000RA-I4
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id z9so5002929ejx.11
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681331682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBi57RubtRq0TtlG9oGfWf0snZrujl3dgxBWHg38KOI=;
 b=PycmZW/pTpReAEZ5DUfhBzqZAqT2mfBn/gI97FQVPGnYFfzkkVyhmk/CIYGkG8cnaM
 EtucgedJybI/J2b4zOQKRaf0xshH/Wv2i6gMkzJewTiFR0Ec1K751Tjm1xBTG75ImQDO
 cxPthamacuxLpLKI60bkTJdLlZUNDaVN3AVzfVHe0+auaAxWMUTzbmxyTPlrgkiFLHwE
 uT3+HNKkNwMbA6txRB8Graxc+TPq7zU3GAbzo4njNJQ/JV0sd2tyNsvJWKuFijp11tOw
 mJIfyylUkzLq3XybEuabURW0Wwcoz0cC/8FarF++RQn9MdcEbUzfekP29FoMPO1NiVcP
 yzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBi57RubtRq0TtlG9oGfWf0snZrujl3dgxBWHg38KOI=;
 b=i8RWKaJmGKYc0EIqH69UZZggC/SHNXRHOtESMpdmaF8APeZy4iqZToE6wONWqp9V6x
 RzEEd1CXYbt4jcs+XLtgtnlw4gHlrJAYDp9uqiLZ4D52qrfK7oxkFhHZl08ZX8qzvyaU
 2tQtuvgxs6Zj3QwzFeWiGisEoMjikUbCOX5Kds9O1aDiXqYf+iPGDGFSOMxkDSrj+uUx
 sXvaArJnN+QYqkjIGApCrOrh7V1McXtM27/DsECgPgsXU93EgVeQ/3EfolCtayo5ztdb
 n3pyXleFM5qamXbVwEjRVbrkbuM8AIekGAiAOT0B61+2YuKWdw6Tsr2Vpuo1StdWYQiG
 oVYg==
X-Gm-Message-State: AAQBX9cq+/UF2vhERf9lltaz7G/Z/njEBDX5346uhkUPBRMnh0WEGmky
 QZ/fFceIxlFAJltyJr2+KltWM4uTHRM=
X-Google-Smtp-Source: AKy350bDxGlN9HNrh+GQ2dTSDnSyzVQBp4NsXnugKAO123rozI0paeioCNbe+L5oZhc3ildI5YPS/A==
X-Received: by 2002:a17:906:81c1:b0:94c:2548:395 with SMTP id
 e1-20020a17090681c100b0094c25480395mr135819ejx.52.1681331682597; 
 Wed, 12 Apr 2023 13:34:42 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-055-150.89.12.pool.telefonica.de. [89.12.55.150])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a170906358800b0094a6f908b8bsm4093562ejb.166.2023.04.12.13.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 13:34:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/3] ui/sdl2: Grab Alt+Tab also in fullscreen mode
Date: Wed, 12 Apr 2023 22:34:23 +0200
Message-Id: <20230412203425.32566-2-shentey@gmail.com>
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

By default, SDL grabs Alt+Tab only in non-fullscreen mode. This causes Alt+Tab
to switch tasks on the host rather than in the VM in fullscreen mode while it
switches tasks in non-fullscreen mode in the VM. Fix this confusing behavior
by grabbing Alt+F4 in fullscreen mode, always causing tasks to be switched in
the VM.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 ui/sdl2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index b12dec4caf..91705e4bce 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -856,6 +856,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
 #endif
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
+    SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
     memset(&info, 0, sizeof(info));
     SDL_VERSION(&info.version);
 
-- 
2.40.0


