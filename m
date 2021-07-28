Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BF3D85BD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 04:01:44 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8YtC-0005NO-UL
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 22:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m8YrQ-0004Fx-Us
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 21:59:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m8YrO-0004vo-Op
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 21:59:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso2006778pjo.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 18:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1TAkuPQZVIxLJEmozC8tyHj+++XkXGY7EC20rblwvQ=;
 b=rCcLVEXptziY2kWewP129GI2F6+zv/fqlPGNSpB0D9dqfgIYi30WHzP8yE8tvvygiN
 ZroaJj/W8j7ad9/9DxoF9QUYwRpVV71TQKI62ol++u4ty2l1zFhCYamDklIiD2VVbcEC
 ZyOIwlVYJbbB9cuKH5vWzBTOHsoUJlLr5g5QWGsxWEYj63RCfrvQk7VjqJvlo6AFYips
 u5dpVkwp5tAlgNwICwppCRy0hndcAuHAe/fPAwD9PHlqOKBxtaR+eTAFoySac3JpepRE
 2cOWJI8JaseRAi7t0UbfxmmMTDAYv1eWs62VhEtawMiGeb7rMtJGIIEAXsQr8OVy+/s4
 mZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1TAkuPQZVIxLJEmozC8tyHj+++XkXGY7EC20rblwvQ=;
 b=YiRgyfMh270Jf6hVnKKGLUZpNvD523f4sK/qceYm46JnjjDS1ndIJ2jsUhqsDHL4gG
 a0Uh8Pfw0F4Y9hf3jPvRmpO4CotEar2UxdBumpstKOM7hENWOD7m9CrlXbT91F/FlJop
 duIU0lZuWFGdK/7DpVFXLh77szAv1IvOsthKqAzBYJ3e9CGp2Og9s8vPujc9K1ff1KCi
 KPYLeOiFxKof/f31HFdlTZh1NMAwsUrp2/H0U6jWF1N7x+56gSXpJd+QzM6UQgSFIRyD
 lREDL4YE6C6689nxSQ3lB3LCh9gr1UMA7WzJZVSVHILrRoTJjbRUs/Cq5Rfr66Ipm6fY
 7zBg==
X-Gm-Message-State: AOAM533Iju9cRBMBYaTRc4L+t3yOefsdXnYbNvq7le0Fhe1BvRZktiPZ
 6ZjZMYF7HtnNdp5VFpIssbg5zeMSr90qRg==
X-Google-Smtp-Source: ABdhPJzLV0Se7VvgVlZdk1vAW/dWTOcUIt1/0YKUwcrKufWkv9BVUDUYzfUXi5B5Iy5XSeq2WJH6Rw==
X-Received: by 2002:a17:90a:3b4f:: with SMTP id
 t15mr4294925pjf.85.1627437587947; 
 Tue, 27 Jul 2021 18:59:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:5d28:f5a2:7589:a0b2])
 by smtp.gmail.com with ESMTPSA id 30sm5956238pgq.31.2021.07.27.18.59.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Jul 2021 18:59:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Use qemu_input_map_osx_to_qcode
Date: Wed, 28 Jul 2021 10:59:35 +0900
Message-Id: <20210728015935.25984-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/cocoa used to have a conversion table from macOS keycode to QKeyCode.
It is an unnecessary redundancy as ui/input-keymap.c already has such a
table. Worse, I added an incorrect mapping of kVK_JIS_Eisu and
kVK_JIS_Kana with commit 708b72557ff510493ab3653c7a1ebfe983009469.
According to the following documentations, the definitions in
ui/keycodemapdb/keymaps.csv, which ui/input-keymap.c uses, are correct:
https://developer.apple.com/documentation/uikit/uikeyboardhidusage/uikeyboardhidusagekeyboardlang1?language=objc
https://developer.apple.com/documentation/uikit/uikeyboardhidusage/uikeyboardhidusagekeyboardlang2?language=objc
https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/keyboard-japan-ime

Use qemu_input_map_osx_to_qcode to eliminate the redundancy and
incorrect mappings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 129 +----------------------------------------------------
 1 file changed, 2 insertions(+), 127 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index e8e46e309ef..fcc7a4ff249 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -142,138 +142,13 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
     return val;
 }
 
-// Mac to QKeyCode conversion
-static const int mac_to_qkeycode_map[] = {
-    [kVK_ANSI_A] = Q_KEY_CODE_A,
-    [kVK_ANSI_B] = Q_KEY_CODE_B,
-    [kVK_ANSI_C] = Q_KEY_CODE_C,
-    [kVK_ANSI_D] = Q_KEY_CODE_D,
-    [kVK_ANSI_E] = Q_KEY_CODE_E,
-    [kVK_ANSI_F] = Q_KEY_CODE_F,
-    [kVK_ANSI_G] = Q_KEY_CODE_G,
-    [kVK_ANSI_H] = Q_KEY_CODE_H,
-    [kVK_ANSI_I] = Q_KEY_CODE_I,
-    [kVK_ANSI_J] = Q_KEY_CODE_J,
-    [kVK_ANSI_K] = Q_KEY_CODE_K,
-    [kVK_ANSI_L] = Q_KEY_CODE_L,
-    [kVK_ANSI_M] = Q_KEY_CODE_M,
-    [kVK_ANSI_N] = Q_KEY_CODE_N,
-    [kVK_ANSI_O] = Q_KEY_CODE_O,
-    [kVK_ANSI_P] = Q_KEY_CODE_P,
-    [kVK_ANSI_Q] = Q_KEY_CODE_Q,
-    [kVK_ANSI_R] = Q_KEY_CODE_R,
-    [kVK_ANSI_S] = Q_KEY_CODE_S,
-    [kVK_ANSI_T] = Q_KEY_CODE_T,
-    [kVK_ANSI_U] = Q_KEY_CODE_U,
-    [kVK_ANSI_V] = Q_KEY_CODE_V,
-    [kVK_ANSI_W] = Q_KEY_CODE_W,
-    [kVK_ANSI_X] = Q_KEY_CODE_X,
-    [kVK_ANSI_Y] = Q_KEY_CODE_Y,
-    [kVK_ANSI_Z] = Q_KEY_CODE_Z,
-
-    [kVK_ANSI_0] = Q_KEY_CODE_0,
-    [kVK_ANSI_1] = Q_KEY_CODE_1,
-    [kVK_ANSI_2] = Q_KEY_CODE_2,
-    [kVK_ANSI_3] = Q_KEY_CODE_3,
-    [kVK_ANSI_4] = Q_KEY_CODE_4,
-    [kVK_ANSI_5] = Q_KEY_CODE_5,
-    [kVK_ANSI_6] = Q_KEY_CODE_6,
-    [kVK_ANSI_7] = Q_KEY_CODE_7,
-    [kVK_ANSI_8] = Q_KEY_CODE_8,
-    [kVK_ANSI_9] = Q_KEY_CODE_9,
-
-    [kVK_ANSI_Grave] = Q_KEY_CODE_GRAVE_ACCENT,
-    [kVK_ANSI_Minus] = Q_KEY_CODE_MINUS,
-    [kVK_ANSI_Equal] = Q_KEY_CODE_EQUAL,
-    [kVK_Delete] = Q_KEY_CODE_BACKSPACE,
-    [kVK_CapsLock] = Q_KEY_CODE_CAPS_LOCK,
-    [kVK_Tab] = Q_KEY_CODE_TAB,
-    [kVK_Return] = Q_KEY_CODE_RET,
-    [kVK_ANSI_LeftBracket] = Q_KEY_CODE_BRACKET_LEFT,
-    [kVK_ANSI_RightBracket] = Q_KEY_CODE_BRACKET_RIGHT,
-    [kVK_ANSI_Backslash] = Q_KEY_CODE_BACKSLASH,
-    [kVK_ANSI_Semicolon] = Q_KEY_CODE_SEMICOLON,
-    [kVK_ANSI_Quote] = Q_KEY_CODE_APOSTROPHE,
-    [kVK_ANSI_Comma] = Q_KEY_CODE_COMMA,
-    [kVK_ANSI_Period] = Q_KEY_CODE_DOT,
-    [kVK_ANSI_Slash] = Q_KEY_CODE_SLASH,
-    [kVK_Space] = Q_KEY_CODE_SPC,
-
-    [kVK_ANSI_Keypad0] = Q_KEY_CODE_KP_0,
-    [kVK_ANSI_Keypad1] = Q_KEY_CODE_KP_1,
-    [kVK_ANSI_Keypad2] = Q_KEY_CODE_KP_2,
-    [kVK_ANSI_Keypad3] = Q_KEY_CODE_KP_3,
-    [kVK_ANSI_Keypad4] = Q_KEY_CODE_KP_4,
-    [kVK_ANSI_Keypad5] = Q_KEY_CODE_KP_5,
-    [kVK_ANSI_Keypad6] = Q_KEY_CODE_KP_6,
-    [kVK_ANSI_Keypad7] = Q_KEY_CODE_KP_7,
-    [kVK_ANSI_Keypad8] = Q_KEY_CODE_KP_8,
-    [kVK_ANSI_Keypad9] = Q_KEY_CODE_KP_9,
-    [kVK_ANSI_KeypadDecimal] = Q_KEY_CODE_KP_DECIMAL,
-    [kVK_ANSI_KeypadEnter] = Q_KEY_CODE_KP_ENTER,
-    [kVK_ANSI_KeypadPlus] = Q_KEY_CODE_KP_ADD,
-    [kVK_ANSI_KeypadMinus] = Q_KEY_CODE_KP_SUBTRACT,
-    [kVK_ANSI_KeypadMultiply] = Q_KEY_CODE_KP_MULTIPLY,
-    [kVK_ANSI_KeypadDivide] = Q_KEY_CODE_KP_DIVIDE,
-    [kVK_ANSI_KeypadEquals] = Q_KEY_CODE_KP_EQUALS,
-    [kVK_ANSI_KeypadClear] = Q_KEY_CODE_NUM_LOCK,
-
-    [kVK_UpArrow] = Q_KEY_CODE_UP,
-    [kVK_DownArrow] = Q_KEY_CODE_DOWN,
-    [kVK_LeftArrow] = Q_KEY_CODE_LEFT,
-    [kVK_RightArrow] = Q_KEY_CODE_RIGHT,
-
-    [kVK_Help] = Q_KEY_CODE_INSERT,
-    [kVK_Home] = Q_KEY_CODE_HOME,
-    [kVK_PageUp] = Q_KEY_CODE_PGUP,
-    [kVK_PageDown] = Q_KEY_CODE_PGDN,
-    [kVK_End] = Q_KEY_CODE_END,
-    [kVK_ForwardDelete] = Q_KEY_CODE_DELETE,
-
-    [kVK_Escape] = Q_KEY_CODE_ESC,
-
-    /* The Power key can't be used directly because the operating system uses
-     * it. This key can be emulated by using it in place of another key such as
-     * F1. Don't forget to disable the real key binding.
-     */
-    /* [kVK_F1] = Q_KEY_CODE_POWER, */
-
-    [kVK_F1] = Q_KEY_CODE_F1,
-    [kVK_F2] = Q_KEY_CODE_F2,
-    [kVK_F3] = Q_KEY_CODE_F3,
-    [kVK_F4] = Q_KEY_CODE_F4,
-    [kVK_F5] = Q_KEY_CODE_F5,
-    [kVK_F6] = Q_KEY_CODE_F6,
-    [kVK_F7] = Q_KEY_CODE_F7,
-    [kVK_F8] = Q_KEY_CODE_F8,
-    [kVK_F9] = Q_KEY_CODE_F9,
-    [kVK_F10] = Q_KEY_CODE_F10,
-    [kVK_F11] = Q_KEY_CODE_F11,
-    [kVK_F12] = Q_KEY_CODE_F12,
-    [kVK_F13] = Q_KEY_CODE_PRINT,
-    [kVK_F14] = Q_KEY_CODE_SCROLL_LOCK,
-    [kVK_F15] = Q_KEY_CODE_PAUSE,
-
-    // JIS keyboards only
-    [kVK_JIS_Yen] = Q_KEY_CODE_YEN,
-    [kVK_JIS_Underscore] = Q_KEY_CODE_RO,
-    [kVK_JIS_KeypadComma] = Q_KEY_CODE_KP_COMMA,
-    [kVK_JIS_Eisu] = Q_KEY_CODE_MUHENKAN,
-    [kVK_JIS_Kana] = Q_KEY_CODE_HENKAN,
-
-    /*
-     * The eject and volume keys can't be used here because they are handled at
-     * a lower level than what an Application can see.
-     */
-};
-
 static int cocoa_keycode_to_qemu(int keycode)
 {
-    if (ARRAY_SIZE(mac_to_qkeycode_map) <= keycode) {
+    if (qemu_input_map_osx_to_qcode_len <= keycode) {
         error_report("(cocoa) warning unknown keycode 0x%x", keycode);
         return 0;
     }
-    return mac_to_qkeycode_map[keycode];
+    return qemu_input_map_osx_to_qcode[keycode];
 }
 
 /* Displays an alert dialog box with the specified message */
-- 
2.30.1 (Apple Git-130)


