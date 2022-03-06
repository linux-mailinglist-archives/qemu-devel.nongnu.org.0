Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D04CEE86
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:33:18 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0NJ-00072f-UD
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:33:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09w-0001JZ-VN; Sun, 06 Mar 2022 18:19:28 -0500
Received: from [2a00:1450:4864:20::42c] (port=44900
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09v-0007Ur-KX; Sun, 06 Mar 2022 18:19:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u1so20633966wrg.11;
 Sun, 06 Mar 2022 15:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6yzxNN4URFUXGYJVg6HXHnx+8jkgJa6W3GmcO3omPgk=;
 b=qsNX8Od7AjCy3B5qP+PENH7QIaHfNhlA51qbjwfNoKQ81KLFvEEE3Ea7i+rjeIVOcQ
 CDvZLja0vZSPy8ofdO4b2y7HxKO+bOiPddmOouKQgNX76X/LGLinggGJfsK+51yoPB8+
 Q2P1Sj1lqMBEIWy70H/0M19MXUQkpa2nmp4O+KSN5xjB++Cl9YP3+eu4wx5JvJtnANxb
 Dz718Nem/JYPmgN+AsGw2uPh6m9FJIEHRATnxwISDmYkJJIrsmy7L90LQfZ4yPInv7JZ
 sGaX7kt2Ku6qgCmbp24TaKC+taqnO3SdN0k3CQdczpO5H9/9lRwmdQsLmxIWxe5CN9pK
 MegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6yzxNN4URFUXGYJVg6HXHnx+8jkgJa6W3GmcO3omPgk=;
 b=CcmhiUCYQMKhcN1/kBmp5b0i1kyibnlL3UDupC8SfzFNJfBnBNnawMxwBRi9KoL49q
 vBbf6m6eZfk9HFXAY7NB0m2lB4pzlB01jbOS1+AcHfpsgC9MqBx6orfSrckyoqDnCnHQ
 vpRPJLDtKclYTp8L9BJetsnL7K5kQfs4yIP19qYEyza1cYT49d6rxPY3vbFceLfkuJDn
 VvKn8f52HFP8HhWaV3kVS1kFtrBx/AMhdn5NqHNU7yqMrw/mztJa7aemJ3faWY4fzMZn
 rhLcoP02u7thZ5VHZBSojWdEEibotO9UG1+dnoGZTFrM67TjvZx8p+4UchnBfvoEC7ZS
 EZqQ==
X-Gm-Message-State: AOAM530yWmhT6yftpP2CXkpK0f/JE54xA8OdQ/UI7iC8K6oSEfnO1jDe
 5INL0GkQ9/GTFVNOK8mBxTHCD6C0Q/s=
X-Google-Smtp-Source: ABdhPJxZOyp3sGnLEKw22IOMkyflcxZZoQimRKU98FpUcUS+h14lHRJUPgXiTjYC6OcoHWSFby43ZQ==
X-Received: by 2002:a05:6000:1206:b0:1f1:e68d:a72b with SMTP id
 e6-20020a056000120600b001f1e68da72bmr3884072wrx.368.1646608765901; 
 Sun, 06 Mar 2022 15:19:25 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a1ca103000000b0038993e53be7sm5285907wme.39.2022.03.06.15.19.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/22] ui/cocoa: Constify qkeycode translation arrays
Date: Mon,  7 Mar 2022 00:17:48 +0100
Message-Id: <20220306231753.50277-18-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 8ab9ab5e84..a6db8ebfb6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -671,7 +671,7 @@ QemuCocoaView *cocoaView;
 
     /* translates Macintosh keycodes to QEMU's keysym */
 
-    int without_control_translation[] = {
+    static const int without_control_translation[] = {
         [0 ... 0xff] = 0,   // invalid key
 
         [kVK_UpArrow]       = QEMU_KEY_UP,
@@ -686,7 +686,7 @@ QemuCocoaView *cocoaView;
         [kVK_Delete]        = QEMU_KEY_BACKSPACE,
     };
 
-    int with_control_translation[] = {
+    static const int with_control_translation[] = {
         [0 ... 0xff] = 0,   // invalid key
 
         [kVK_UpArrow]       = QEMU_KEY_CTRL_UP,
-- 
2.34.1


