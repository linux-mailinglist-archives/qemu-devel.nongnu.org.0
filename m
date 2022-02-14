Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7A4B5AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:47:55 +0100 (CET)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhKE-0002Sy-H6
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYV-0004Ge-0j; Mon, 14 Feb 2022 13:58:35 -0500
Received: from [2607:f8b0:4864:20::630] (port=44572
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYS-0006Wg-My; Mon, 14 Feb 2022 13:58:34 -0500
Received: by mail-pl1-x630.google.com with SMTP id y18so11250484plb.11;
 Mon, 14 Feb 2022 10:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRI6UGAn4vjJdciiBP0mAxumIP6lTNDE1aSs08ebrks=;
 b=hx9IkA13Ae3fSfvbHKziWXGWNycJDg6Ny6aIn0H1LfMsfIxrK29GFaZLkUxnJP7W3X
 KO6+0RdB0b7CoLu0/H6k/m5U3UH4hayxtqgjTtpvDt13HCtsVBfLOWfR2INqvzapehsV
 kGCFY15Ujgst1xwTubThPGkXYiOMJQNI+AWQoH6yoq/JeLgxqkZs9ZGEGsOr9pOwiWIs
 vuFsJgjyNFFc5215iGdRtaaOsf4ak35gZZhnIHjIatvo40oxzN6iS6LTRyROUplhMYoF
 kEUFlBOQLoGuW5IqTyQ1MHF5IGMr1veCY7q/sXL5WnToq6k5S0269oE8dec2MaKAdc07
 XvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cRI6UGAn4vjJdciiBP0mAxumIP6lTNDE1aSs08ebrks=;
 b=1rrIsbvCeQeKQWsl865Qqr9/qPeSLZuJFSwhaIMXXW7tDlHxu/DjMrhUhvTrWvLMuk
 q68a8RdUww5epN03jeRv6/X8pmmH/8tgHz6rFNeuqrHTfwwBBDxuuK1GLeDVXnEgZ4jY
 IyqQ/gGrKFfOgN4OuySG0g6c7A55AW+aQxAtqarGEzcu8WLOIK6uUOeIY6sn1LZgaKm2
 /ap77Qby1hIcZRKhVTHkD84nRw/dlAGENQqYxyy6khCsVpmS6ZBlmRGQ+xz89JXsr5Tu
 1HOcW8zQSPx1Z3sU3uVsrC16KGGzuruaqArxy2gs4GH4QnPuGb4oOU/CMa/ie1L0NANJ
 ZQnw==
X-Gm-Message-State: AOAM530/EWf6BT6SgzDsbH7z+BirBgkgH2VYdRk2JFlSGDmvmBiKauzO
 tEilh3UKWSiq+cHZ+BtBvHSKwaugyZ4=
X-Google-Smtp-Source: ABdhPJyfQhH3/sY+tPyqsC6RJjgAx+ARUHgbUNbeA1rOEE4neXuaavZ+OrRIGECOtDgcK411IdXcww==
X-Received: by 2002:a17:902:cec4:: with SMTP id
 d4mr201208plg.158.1644865110889; 
 Mon, 14 Feb 2022 10:58:30 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id x12sm293056pgp.25.2022.02.14.10.58.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:58:30 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 14/16] ui/cocoa: Do not alert even without block devices
Date: Mon, 14 Feb 2022 19:56:03 +0100
Message-Id: <20220214185605.28087-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220213021418.2155-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index becca58cb7..6cadd43309 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1713,11 +1713,6 @@ static void addRemovableDevicesMenuItems(void)
 
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
-    if(currentDevice == NULL) {
-        NSBeep();
-        QEMU_Alert(@"Failed to query for block devices!");
-        return;
-    }
 
     menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
 
-- 
2.34.1


