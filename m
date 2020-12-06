Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63CA2D0677
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 19:17:54 +0100 (CET)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klybY-0003kn-BY
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 13:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1klyaW-0003JW-8z; Sun, 06 Dec 2020 13:16:48 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <darrell.walisser@gmail.com>)
 id 1klyaS-0006bV-Nc; Sun, 06 Dec 2020 13:16:48 -0500
Received: by mail-ej1-x643.google.com with SMTP id ga15so16247769ejb.4;
 Sun, 06 Dec 2020 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=a4JN0QR0CcYpWvQZfmGCqf33++HzeYudhU70aHOHqmY=;
 b=keIOdO2j3Dq/e3SlDvESO3z0Df1Fe+DkJLQMrbc7jZHxRdOeiMU12Xi8wrFc8vJaPe
 V7Ktz2Oh4YckKIFibpsPk4d3tlEJpm+VufHvvSqNF+HspXsDlK4HilvLgyS5YKQAQhJ/
 uIxVrUfelcCO3ElOsflxf+43zYn8p7bTwxJeeoBb36R9WajTgxw6tixTTSxh2nexN9G3
 33UiMnQKuBUVQGcO6rHJxsSA8vYXjF4rovFk+IJy5x13wi0DH1vSmblS1nixb3AQXg+S
 BQXHdveXARIzO7fQ2OFU0j/fmrikXN06n6bMyZF0sNUXmDfmzYmbBV9OLy8xk5X2hjQO
 IxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=a4JN0QR0CcYpWvQZfmGCqf33++HzeYudhU70aHOHqmY=;
 b=eUxsVR+WCwY7FIcwZymHP+7vQGPBxFpb2hBge/Z0OCTBg7rW75lPwaBGXDWLEsMS+w
 ysYh8BwdHo8iVCUgwrG7Fk4/3tIlP1a14AF0NnzP/oeEor0xG76oZglz+YMM0VkP1LzP
 nFBhuXnz5/WoYUYA3VxDGc5ik20Dvbzkk7fOY5X7et4qSLwAmcih9o2F1dYx7/NLgjsz
 sLcif4HGTbcpFQhG7I0W2y2A/djG8LfSQH0f7OQaDzEamSVUCNHBMIUqHpo+knrHYtRj
 E+Qn0vUYCLAeiEvseReQFBeL5WFm8E/vd5V2PHNAlxobCe6pagaVQRTIigCYu3rxaRqw
 uRig==
X-Gm-Message-State: AOAM532QwWTTb8sLz9XmpXPMTZ4X1/fppMGN91P43/grH/OqHhDGC4BU
 ikn7bq9VXJ2fB199xMapH6f/JF7V+2mHEoBfdpULpItjYK8=
X-Google-Smtp-Source: ABdhPJx0sK46VRvZdc1yDuy004ek9k42/EDci0HQXTZmko2F9HavZ2jnKNXOOMqwoj1vn2xkIXqjbwo4dwRPckvEBT0=
X-Received: by 2002:a17:906:4e50:: with SMTP id
 g16mr16660049ejw.191.1607278601046; 
 Sun, 06 Dec 2020 10:16:41 -0800 (PST)
MIME-Version: 1.0
From: Darrell Walisser <darrell.walisser@gmail.com>
Date: Sun, 6 Dec 2020 13:16:30 -0500
Message-ID: <CAPDU3-+Q+7zC8e9pmXuaMqmefP_9jrg4kEFMH_=gQZLGskHkjA@mail.gmail.com>
Subject: [PATCH] sdl2: Add extra mouse buttons
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=darrell.walisser@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sends mouse buttons 4 and 5, aka "SIDE" and "EXTRA" to the guest

Signed-off-by: Darrell Walisser <darrell.walisser@gmail.com>
---
 ui/sdl2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 189d26e2a9..a578017268 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -275,6 +275,8 @@ static void sdl_send_mouse_event(struct
sdl2_console *scon, int dx, int dy,
         [INPUT_BUTTON_LEFT]       = SDL_BUTTON(SDL_BUTTON_LEFT),
         [INPUT_BUTTON_MIDDLE]     = SDL_BUTTON(SDL_BUTTON_MIDDLE),
         [INPUT_BUTTON_RIGHT]      = SDL_BUTTON(SDL_BUTTON_RIGHT),
+        [INPUT_BUTTON_SIDE]       = SDL_BUTTON(SDL_BUTTON_X1),
+        [INPUT_BUTTON_EXTRA]      = SDL_BUTTON(SDL_BUTTON_X2)
     };
     static uint32_t prev_state;

-- 
2.25.1

