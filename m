Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D736E50C0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:22:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUQR-0000Fl-EY; Mon, 17 Apr 2023 15:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poUQC-0000Fb-Qx
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:21:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poUQB-0007vD-80
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:21:52 -0400
Received: by mail-ej1-x635.google.com with SMTP id ud9so66882334ejc.7
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681759309; x=1684351309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THKXDGcAzs96r2S6UQiFVZFfNh0FZnvDmU09b9bBVHo=;
 b=MXS8hN1LfvLJHmy+MpBF2gj4ec4bt9ByJA7FmBh696hff8E4rzPRpq93rN3gt0l9Bz
 Rcx/ptA6pkrLM+ZChQ8xFmL5vZtheOBvu1DYWjDhelkTDu1iWsGNv+7QwRVvERYlaJze
 SqL1VHbsWlPWDORai2VP5mdLVtQ3Iakgu3Oy710rQKaDdk8fI4XVudMlzOfuY2lGgtsa
 tzwnnZXBJkLKQXgCyXWpwXRJyyUDVCAq8E2anc3nieNT+IfXoQ7btkoHbmqbeB1uRCCG
 hYwYy9hubUH8upgl25lWA4zGSPKH1RjwSIbMwut9UqExNidNqZX4CczviLRGdvdT9gt1
 kOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681759309; x=1684351309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THKXDGcAzs96r2S6UQiFVZFfNh0FZnvDmU09b9bBVHo=;
 b=WVIbSW5sFUo8R0rRVohvyHB0VlqTNJRDHIzcd913BFyu25WJOuWBys9pGmQs2m5sc+
 ukr07AZpAQyESMjD91oRtVBcCtd40JZpsecDtTU17vr85NS1WHgOx4og6t1znU49/XY6
 4sxk1rtE6u6H+Vhv37kdlQqzU6/6juiZlp0LSykM0EWoFRLhEiMpOBp/9PuprtAEwKx6
 tj3ZvzbyIFkOrwdk51VUje1WOkgjUfHFDdHWMbG6akB+EmjoKbK7ElCMsOZ0TeRIaasV
 pA0GZUgfux+Q/UZGJOOdf7QYnxK+OjxVrQljjqR80t4FgTYl+8Gdw06RdyE7GsEX0oTo
 C8zg==
X-Gm-Message-State: AAQBX9dH1Af6A2Z/Mr6O2m3cNdIo50S8m30TqKi3PvyyALwUvo/8+9x1
 AoQXSw0hI2vMlZnVcrEsFqatZX5N+z1Z4Q==
X-Google-Smtp-Source: AKy350YcO9eLJJuTBH3gpXUqBGnPMI0RRvYQOYBsW8TeqyZEHSFozrDkg+VbkbCGTcAqy09aGsq+kw==
X-Received: by 2002:a17:906:1b07:b0:94e:d951:d4e7 with SMTP id
 o7-20020a1709061b0700b0094ed951d4e7mr8779878ejg.59.1681759309020; 
 Mon, 17 Apr 2023 12:21:49 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-025-091.89.12.pool.telefonica.de. [89.12.25.91])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1709066b9300b0094a65f209d7sm6940134ejr.119.2023.04.17.12.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 12:21:48 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/2] ui/sdl2: Grab Alt+Tab also in fullscreen mode
Date: Mon, 17 Apr 2023 21:21:38 +0200
Message-Id: <20230417192139.43263-2-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417192139.43263-1-shentey@gmail.com>
References: <20230417192139.43263-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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

By default, SDL grabs Alt+Tab only in non-fullscreen mode. This causes Alt+Tab
to switch tasks on the host rather than in the VM in fullscreen mode while it
switches tasks in non-fullscreen mode in the VM. Fix this confusing behavior
by grabbing Alt+Tab in fullscreen mode, always causing tasks to be switched in
the VM.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 ui/sdl2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index b12dec4caf..8af8b89f1d 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -856,6 +856,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
 #endif
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
+#ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
+    SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
+#endif
     memset(&info, 0, sizeof(info));
     SDL_VERSION(&info.version);
 
-- 
2.40.0


