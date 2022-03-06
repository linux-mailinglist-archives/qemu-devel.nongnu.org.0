Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75534CEE75
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:26:19 +0100 (CET)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0GY-0006Cm-SG
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:26:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0A8-0001kq-7M; Sun, 06 Mar 2022 18:19:41 -0500
Received: from [2a00:1450:4864:20::42d] (port=41953
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0A6-0007Vw-Mk; Sun, 06 Mar 2022 18:19:39 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i8so20640036wrr.8;
 Sun, 06 Mar 2022 15:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VwmaLZzHsZKPGjUk5pNKJd1rzr4Iit854/BbqGnfSU=;
 b=iwWbmFWJvd07m7vNd8U/FDWSszOgSLgRhhiJlPlPKZ1aRtLn7880CAGPhO3oEAfe1g
 0/exm/VoR/7VGOGVHwGlLaWV67C6YZZnimHVCAFvF5HDDuEHEZt+qUbQpL8+Gjf4iuLg
 r0byVpegparZSqrFmN4KaMeZ2uvMqeepSGXH935dFeCKFAR4bSBqO8n60BRQcKW2/CQh
 v0u9Rk2PBDMCNNqxox643eMONnU72eXdKK1CrDCQCypxrYU3s+ht7WZT1iet1135UZIg
 9JUP1HTxQHfX2/r+YghmhtBY6hlHcmYZXdWKGlk5V12I622KaVQ/2mjH8pMKgBjCb3pQ
 +SSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VwmaLZzHsZKPGjUk5pNKJd1rzr4Iit854/BbqGnfSU=;
 b=AVl4DeaWaT3DZCt/AayaVIhfSMgALprXaBG3XNAjXa55hqzpa/80lUlkzipNDgcluZ
 RyPIdAdIJFF7m2Xurs9W1MHwB7y6umnpP0WrlD+NJfn2Ty1Io4JC8Vw/3JR71lbZB4xp
 HqjzVibF7cU2q8lVimm7sCW84AYKcqWknTYxzT76TywMwNoK2bf4kIOzUYpNaEMBX5XA
 ioWXxaD5Wjzm0UDpxkhfGBXD7vKE9bYqeyrNm3P+GboOfJrukoSpC4GmUhMCI2+hSyRE
 OtWFn/dgqJAEEXF+r90Y9jYbDjoHjUp/PZYUi8w302LZAVK8YTKVsMAPcNdu2dZ7Edu+
 QInw==
X-Gm-Message-State: AOAM531fFVn64YFyxYZ9+UQ/klHC0m+PslGchEas2lLR+Ucrx0dZxMsf
 YzmScAdrEucmvtVoGVWLK/4QgEkD8+s=
X-Google-Smtp-Source: ABdhPJytl164XtFy/guGDwE/v15+vZK+uTA9vRdMtihjNhUGfLFRRq9wfFNyVRXyjvoSjJo6vtJ25Q==
X-Received: by 2002:a5d:624d:0:b0:1e6:f18c:d264 with SMTP id
 m13-20020a5d624d000000b001e6f18cd264mr6439794wrv.546.1646608776936; 
 Sun, 06 Mar 2022 15:19:36 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b001f07772457csm6700292wrp.101.2022.03.06.15.19.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/22] ui/cocoa: release mouse when user switches away from
 QEMU window
Date: Mon,  7 Mar 2022 00:17:50 +0100
Message-Id: <20220306231753.50277-20-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Carwyn Ellis <carwynellis@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 319af5045b..31f0846c30 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1264,6 +1264,7 @@ QemuCocoaView *cocoaView;
 - (void) applicationWillResignActive: (NSNotification *)aNotification
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
+    [cocoaView ungrabMouse];
     [cocoaView raiseAllKeys];
 }
 
@@ -2066,6 +2067,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
         });
     }
+
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
-- 
2.34.1


