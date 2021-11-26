Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D545F112
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 16:49:59 +0100 (CET)
Received: from localhost ([::1]:33860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqdU6-0001CM-Ai
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 10:49:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noah@statshelix.com>)
 id 1mqbqU-0000ZD-IR
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 09:04:58 -0500
Received: from [2a00:1450:4864:20::42e] (port=39450
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noah@statshelix.com>)
 id 1mqbqR-0006cY-Pr
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 09:04:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a18so18892293wrn.6
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 06:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=statshelix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t+j80Fk+3jaZD/zDKWX85qIQ2pNzathu7Y5kH+2Tx0U=;
 b=NWpF0Y+CjwLRsw6i03isSw5UbQnho8qGp6P3Z0D/keyVtwbW3wOW7LSnPOf6XzJy86
 u9XMln7gtJ34wEAeQvaBA89HwTvi+NiSRub3d7IKBLIWeZyGp3mBTGOZChwblCN/TVF7
 R6LSkd2H4qcSvGQ/0OsvCo+eAlvKscxYaHs8CKgU1nFBYU5rC1XMgpR4TijnTzzGirmm
 NNY3R1TzZPo3kU4PuxHEiBOhKDIPTVtT8zwsxL2uzSzO46iJepiiwYV3CTFovDy2MgDm
 uJ4/+qFfV+7WPCitkdO30rdLHJz1iI8rtoVTPSq/dx3Ty/0gE5cXFkq6P7MNwaCYo2Pc
 sAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t+j80Fk+3jaZD/zDKWX85qIQ2pNzathu7Y5kH+2Tx0U=;
 b=BJQHqrR9baofC+n2mKBldt+3jK+453hq/qqIL64OmQ/AyyqYOEX8ReJlzyTMA6BGwg
 z4psGBJBmL96kpHTkpoBS4/jAdkN1oikRKSpjZm+8fnfEyi4HYHIWrUDX5mn45JBX3rd
 6zr4BoSgJKQod8Ct+42io0EImSyUfZXnn/DCfHj9CepppjzUwM+u9OMFziwnLoTtonzH
 Nvnm813WRZe5Ls1d+CYqU4fpx4Sp2kJyn94+b8xVGp7Ip3sEwwECm42VMSa6f7/JXpUL
 WrXNYqLP/+j9fiWKr1xWetgCj/vmMzrqNpi7PLl06fDnrMswSlZj8TFtonxIhupO7khm
 Qabg==
X-Gm-Message-State: AOAM5317yU9l+/hBUUc1ZWRMoUJsJznYLdf18I1OdLpbmtFkZ02r7Mk6
 8XEMC2de8XSCkjGsbyTS/gIJPaNXeIYYE7ni
X-Google-Smtp-Source: ABdhPJy9OBtCaet8kwbv0Yf0qlph3eV+fcnruRdywxkaR1SOmUxd60x2vnfnrgXczrZg/o/Zd13rQg==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr13953691wrf.410.1637935484464; 
 Fri, 26 Nov 2021 06:04:44 -0800 (PST)
Received: from glockingjay.. ([2a02:810d:f00:24c8::bce])
 by smtp.gmail.com with ESMTPSA id h17sm5661928wrp.34.2021.11.26.06.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 06:04:44 -0800 (PST)
From: Noah Bergbauer <noah@statshelix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hid: Implement support for side and extra buttons
Date: Fri, 26 Nov 2021 15:04:37 +0100
Message-Id: <20211126140437.79745-1-noah@statshelix.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=noah@statshelix.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Nov 2021 10:48:20 -0500
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
Cc: qemu-trivial@nongnu.org, Noah Bergbauer <noah@statshelix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simply set the respective bits and update the descriptor accordingly.

Signed-off-by: Noah Bergbauer <noah@statshelix.com>
---
 hw/input/hid.c   | 2 ++
 hw/usb/dev-hid.c | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index 8aab0521f4..e7ecebdf8f 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev, QemuConsole *src,
         [INPUT_BUTTON_LEFT]   = 0x01,
         [INPUT_BUTTON_RIGHT]  = 0x02,
         [INPUT_BUTTON_MIDDLE] = 0x04,
+        [INPUT_BUTTON_SIDE] = 0x08,
+        [INPUT_BUTTON_EXTRA] = 0x10,
     };
     HIDState *hs = (HIDState *)dev;
     HIDPointerEvent *e;
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 1c7ae97c30..bdd6d1ffaf 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -461,14 +461,14 @@ static const uint8_t qemu_mouse_hid_report_descriptor[] = {
     0xa1, 0x00,		/*   Collection (Physical) */
     0x05, 0x09,		/*     Usage Page (Button) */
     0x19, 0x01,		/*     Usage Minimum (1) */
-    0x29, 0x03,		/*     Usage Maximum (3) */
+    0x29, 0x05,		/*     Usage Maximum (5) */
     0x15, 0x00,		/*     Logical Minimum (0) */
     0x25, 0x01,		/*     Logical Maximum (1) */
-    0x95, 0x03,		/*     Report Count (3) */
+    0x95, 0x05,		/*     Report Count (5) */
     0x75, 0x01,		/*     Report Size (1) */
     0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
     0x95, 0x01,		/*     Report Count (1) */
-    0x75, 0x05,		/*     Report Size (5) */
+    0x75, 0x03,		/*     Report Size (3) */
     0x81, 0x01,		/*     Input (Constant) */
     0x05, 0x01,		/*     Usage Page (Generic Desktop) */
     0x09, 0x30,		/*     Usage (X) */
-- 
2.34.0


