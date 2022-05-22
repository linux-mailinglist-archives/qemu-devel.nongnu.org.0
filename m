Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB8530538
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:39:02 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqTl-0002V0-IW
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAk-0006oD-D9; Sun, 22 May 2022 14:19:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAf-0003XG-TK; Sun, 22 May 2022 14:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=je3lDS41Aa2q6ws8CdoU2eWSveN8fY5JhhbQYGiKCeQ=; b=nMyxJ5RhRHcl+7ICcnGB12aUba
 hq2pLX6XAjqQ+ey8fdtNU71jqLivJIE+O6LkmCJK6+qpOo+K7ldRLQvwjwVWrSMEWuor9dOnJIoXm
 kQ08vb2XwF3E4ZL0zWSLOMYu1eM2xq7c3BUFpyUOt+zgVF2VnReomZQEYb9Jhnsxp1r4dZWOwqXwh
 fzpcboVBr5iRwONIzQm1EKzcCjAgt8Z13LgTRv24ukF5rG6MST3U/mUlkymkFN9CrSeZJNlwEwUth
 /+NXumJPw/KYdsJXsqMX+7r/9zFz2GYhu8sy3h+Wlx176XyIW9U02EyHEIkoxfsklHHk+U6i3Cuyl
 OL8FrEYCmvVpwPUJynOF2HJJJf6v83eVaq8RBMJZpL0SoUL+tHwMFJqiA0u1R1YMaVZcylGLCYNYj
 MB+lUnnjJcv6GkOG+B2ZBvOAmZ28uZjDbN790/TnQlhkLNfiHxTjQcKj2kODZhv0P6kH2b+QlAcDJ
 JEeSzUcuUra/4JugXJVqcU5K+hZW9vbPJNxa92K6+tBjHxZXsI6Oj9PVdUrvQGWtV/c5Oqk11nzK8
 doSI4q5M9dC/UAuJhxdjXWuKMEW2mQ8HpBDAi6ewgYNRPNr9k89Vp1BgZBIls/XMQOpZ2T/oYqTQo
 QXdH2QA+eh7tE7DXdm5/4llOc+1+JpT2gltDa5UOo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9W-0007pH-SV; Sun, 22 May 2022 19:18:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:53 +0100
Message-Id: <20220522181836.864-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/50] ps2: introduce PS2DeviceClass
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is in preparation for allowing the new PS2_KBD_DEVICE and PS2_MOUSE_DEVICE
QOM types to reference the parent PS2_DEVICE device reset() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/input/ps2.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 1a3321d77e..0493b78812 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -33,6 +33,10 @@
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
 
+struct PS2DeviceClass {
+    DeviceClass parent_class;
+};
+
 /*
  * PS/2 buffer size. Keep 256 bytes for compatibility with
  * older QEMU versions.
@@ -54,7 +58,7 @@ struct PS2State {
 };
 
 #define TYPE_PS2_DEVICE "ps2-device"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+OBJECT_DECLARE_TYPE(PS2State, PS2DeviceClass, PS2_DEVICE)
 
 struct PS2KbdState {
     PS2State parent_obj;
-- 
2.20.1


