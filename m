Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022B5623102
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoS1-00040y-Rd; Wed, 09 Nov 2022 12:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osoQz-0003nc-2O
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:22 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osoQx-0001AD-C1
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 187-20020a1c02c4000000b003cf9c3f3b80so1689280wmc.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBlWL4FLtY8mNZis1U2K8M01p6OCavCbUHNH6wH10ks=;
 b=cnIOyNhigbJdv0VAYsfj2TpeBr28bxf6/i7swW4drNVDB7CKtQl8NC+hq3G2zXNEwi
 Dh86RL2wu8YYOp/nN/QP+Ngd+IRhO7ErUTg/cLfae9naJKUExA7gvZzQZkP8pkrb1yZA
 e8w0GKFLje1kg1VBr2ymkQgtp4tL8fj9xlQq1Eqj4Dt5xpMgYQS7n1Ok4Ul5yVueXRig
 F0Vbtx/6dAI3FiaABJZKP7J1Y00f8+pKI3PJqgNwrAgMmqEQttZjPpp+ylqpmr3ElT/x
 1kCqwzqy2Kk2Niafw5+rZepuv4NBktFc2jBB7l8ROpVlUvU2I5QavdORt0BNsMiWgVBS
 FVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBlWL4FLtY8mNZis1U2K8M01p6OCavCbUHNH6wH10ks=;
 b=FT11A2YamsAkG8Qdfrmx6dHg/JXQ6leiQdwnVvWr/0FdSwcgc8dHl1HLs5HA9x7NdY
 DLgK2CMWptgbDIUT+MIrP2rnKi4KI6VBHUPPstTBvpnqug8K0eg1lmjpXd7I4ajRhUOC
 QrLh4CZvcXPjUhConepzvqaS3V7hCeLYjNiI5pCcVIYpT9LHoftuOuMasO5NpaeLfnMs
 lSRur6hfr9vsQ8jq2McjGGjQckVm+DJYO+mefZUoqhP4WQkbQBM5kFwxd945tGcDIVEr
 ZfBN8++pwPKvkSKgF+W0Hu5XJjLX3ZateEDxsqwoZIlIAHQisJl0uL89Uc6msyu//qKN
 HCYQ==
X-Gm-Message-State: ACrzQf2qzCnyVv8v8AeGF18SCTTnYFarBAzv+h8tnxVFOFTNZq2IiXpI
 Wt62C/9SQ4kALWOBcRoCCwW4QBup2wFmmg==
X-Google-Smtp-Source: AMsMyM5r3v9Z4lkxTX8QFE3z8lQC4EqraqO4MmpCkVw/ebor3yhFuarqmetLOcYXCwSTYQpQf+C2pg==
X-Received: by 2002:a05:600c:3482:b0:3cf:6af4:c4fa with SMTP id
 a2-20020a05600c348200b003cf6af4c4famr938490wmq.117.1668013213636; 
 Wed, 09 Nov 2022 09:00:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003c6b9749505sm2514932wmq.30.2022.11.09.09.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 09:00:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 2/2] hw/input/ps2.c: Convert TYPE_PS2_{KBD,
 MOUSE}_DEVICE to 3-phase reset
Date: Wed,  9 Nov 2022 17:00:09 +0000
Message-Id: <20221109170009.3498451-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109170009.3498451-1-peter.maydell@linaro.org>
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Convert the child classes TYPE_PS2_KBD_DEVICE and
TYPE_PS2_MOUSE_DEVICE to the 3-phase reset system.  This allows us to
stop using the old device_class_set_parent_reset() function.

We don't need to register an 'exit' phase function for the
subclasses, because they have no work to do in that phase.  Passing
NULL to resettable_class_set_parent_phases() will result in the
parent class method being called for that phase, so we don't need to
register a function purely to chain to the parent 'exit' phase
function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/ps2.h |  2 +-
 hw/input/ps2.c         | 31 ++++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index ff777582cd6..cd61a634c39 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -36,7 +36,7 @@
 struct PS2DeviceClass {
     SysBusDeviceClass parent_class;
 
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 /*
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 47a5d68e300..3253ab6a92c 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1042,13 +1042,16 @@ static void ps2_common_post_load(PS2State *s)
     q->cwptr = ccount ? (q->rptr + ccount) & (PS2_BUFFER_SIZE - 1) : -1;
 }
 
-static void ps2_kbd_reset(DeviceState *dev)
+static void ps2_kbd_reset_hold(Object *obj)
 {
-    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
-    PS2KbdState *s = PS2_KBD_DEVICE(dev);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(obj);
+    PS2KbdState *s = PS2_KBD_DEVICE(obj);
 
     trace_ps2_kbd_reset(s);
-    ps2dc->parent_reset(dev);
+
+    if (ps2dc->parent_phases.hold) {
+        ps2dc->parent_phases.hold(obj);
+    }
 
     s->scan_enabled = 1;
     s->translate = 0;
@@ -1056,13 +1059,16 @@ static void ps2_kbd_reset(DeviceState *dev)
     s->modifiers = 0;
 }
 
-static void ps2_mouse_reset(DeviceState *dev)
+static void ps2_mouse_reset_hold(Object *obj)
 {
-    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
-    PS2MouseState *s = PS2_MOUSE_DEVICE(dev);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(obj);
+    PS2MouseState *s = PS2_MOUSE_DEVICE(obj);
 
     trace_ps2_mouse_reset(s);
-    ps2dc->parent_reset(dev);
+
+    if (ps2dc->parent_phases.hold) {
+        ps2dc->parent_phases.hold(obj);
+    }
 
     s->mouse_status = 0;
     s->mouse_resolution = 0;
@@ -1245,10 +1251,12 @@ static void ps2_mouse_realize(DeviceState *dev, Error **errp)
 static void ps2_kbd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
 
     dc->realize = ps2_kbd_realize;
-    device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, ps2_kbd_reset_hold, NULL,
+                                       &ps2dc->parent_phases);
     dc->vmsd = &vmstate_ps2_keyboard;
 }
 
@@ -1262,11 +1270,12 @@ static const TypeInfo ps2_kbd_info = {
 static void ps2_mouse_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
 
     dc->realize = ps2_mouse_realize;
-    device_class_set_parent_reset(dc, ps2_mouse_reset,
-                                  &ps2dc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, ps2_mouse_reset_hold, NULL,
+                                       &ps2dc->parent_phases);
     dc->vmsd = &vmstate_ps2_mouse;
 }
 
-- 
2.25.1


