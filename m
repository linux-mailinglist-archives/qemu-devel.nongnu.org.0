Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0924D9C27
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:27:05 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7Ca-0008N4-CP
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:27:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6j5-00067f-MD
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:35 -0400
Received: from [2607:f8b0:4864:20::42f] (port=42948
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6j4-0008Mx-86
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:35 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g19so19516828pfc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bJ+xYho0owtYa0dAkkWst9IQeYoMpitj3quG69XsFTE=;
 b=FEt7vJYIU0dLuI6rQPnJnUehNYMEF2DrG2iwESnmN91V82hN9/u+EMpbbtqJsDLsMK
 ryxDQ7IdURiHBgng91TQBxvl/p2Av9bKfOwHG4T1QIOxQF5qjSafTi4pk49akShcpSDF
 RAST8CtJO20W3QZfWkqXfXZPqKY9Ezqk54vdwmVjywEhTjfLf/2IPXp51ZV+0jajybOR
 VizefuUbx2hAHe9KuCWcL1ZCnZ6cK4FlnJB96HZWz0WUFIEDd+67xrYUa8hA6mT2EtAU
 b/G+ZFs0HQXpdmz6jCy9+2CDRHstJSnxVIE+fJ5IP7aZG6ivUNk4mIwLBQiKu10oYjI5
 RA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJ+xYho0owtYa0dAkkWst9IQeYoMpitj3quG69XsFTE=;
 b=oTIF9EUuCqsCao1NsV2tQ4awGW2WWgFFZay56lTERs5wDyl89GFAWuwWpN2KL5ZU2f
 5CRjwjHPCClc54FCwdBTpvfWUpH3pLtIZfgamM97EVLEhn267F7e1Q5qX5LrQrY4PtuI
 Lqe+0JFiLqU6145U4J9uw7kQ7qG24cu3B+L1qnl3mvDyKS1zOhncV91Rj2Li4Bj4tkfq
 cTOOJ2ufSC+q7HbcLN6q+lzN314oni3JUHq+si1SPUY5i+FqHxK9T0SxLeP9l/HEqm/S
 Sm536NH2fFh5xGQwLtt9cSR+IIRnCRuQR6WxZ3hZmfag52xCYKMD2tvlG+Za00CJtJeJ
 HA/A==
X-Gm-Message-State: AOAM531XBMp3+v9O03Pvz/fR/cLGwognb5/lug0WXyyDMRdQ8QnTjo+J
 yLxaPuqkQUhqg8iAqvsxAskuviJqUoY=
X-Google-Smtp-Source: ABdhPJzLbVcXv+z6L9N8QueG8Q+9AC3NGhBr2OCoHIdPaFfJY8sa6oUIPGMb+hI1ArVzWIalMv3QeQ==
X-Received: by 2002:aa7:9e07:0:b0:4f6:a7e3:1b57 with SMTP id
 y7-20020aa79e07000000b004f6a7e31b57mr27926193pfq.13.1647348992689; 
 Tue, 15 Mar 2022 05:56:32 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a63af4f000000b0037c8875108dsm20460209pgo.45.2022.03.15.05.56.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:56:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] ui/cocoa: release mouse when user switches away from
 QEMU window
Date: Tue, 15 Mar 2022 13:53:47 +0100
Message-Id: <20220315125350.82452-19-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Carwyn Ellis <carwynellis@gmail.com>

This resolves an issue where using command-tab to switch between QEMU
and other windows on the host can leave the mouse pointer visible.

By releasing the mouse when the user switches away, the user must left
click on the QEMU window when switching back in order to hide the
pointer and return control to the guest.

This appraoch ensures that the calls to NSCursor hide and unhide are
always balanced and thus work correctly when invoked.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 1aa51c42dc..d20c74d938 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1261,6 +1261,7 @@ QemuCocoaView *cocoaView;
 - (void) applicationWillResignActive: (NSNotification *)aNotification
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
+    [cocoaView ungrabMouse];
     [cocoaView raiseAllKeys];
 }
 
@@ -2000,6 +2001,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
         });
     }
+
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
-- 
2.34.1


