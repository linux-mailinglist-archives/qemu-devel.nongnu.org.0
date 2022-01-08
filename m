Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40C488445
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:43:54 +0100 (CET)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Dsn-0005D3-Ia
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dov-0006hd-UI
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: from [2a00:1450:4864:20::530] (port=45007
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dou-0006ok-Fk
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: by mail-ed1-x530.google.com with SMTP id w16so34339395edc.11
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7cxUbOU/d0PmlHVogfci1RL4+M00MXtpxpVMs5qcbZQ=;
 b=XJ58WugmAuzvFMLppOp13v8EZJXOLRcCxiMuDPE9J9JuYIostWu8SoNA1rCoKRCR9S
 fe8iWVl+8TD/RDRgb90hVXd4gOuKummOhk8QuTO2QxShVaNjya/danyH7XSPkWrG4xnY
 rPlQm9oc3xQ7BP7VuxhQ4Esc/AE+VxDEY0czHoVu5IwVfFqDtIm1fQ15KT4HxqrCRCyC
 9WsYIA3R651cT/XhWepHYHGF6k3U8XoWGg0vNSBFvO7SJ9k2L5dntYTIxnygG9oLm9TA
 DzgZYpEfIL9CTePUIK+PvKiBbR2g+gf8VuCYP9NqgNnbTbXwk1BV2AlS0D5PhvmX7/Aj
 9Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cxUbOU/d0PmlHVogfci1RL4+M00MXtpxpVMs5qcbZQ=;
 b=3LR4ZFyU5+cJo47sbkxHNEu+Xck025lJQECbaBgxt2/Ai9aEnmOMtdEgQh4+N41/1w
 JebttE/gKb5rSf3Fd2K3wZJGR4eE8buBzxsdDjq4vy2h7WVj1YA+Ztoj1eGz2yuTIKHN
 BdU1S0SWdyaMwfvYuh87xJJy6EAazp+G6r8K6s9vPLB6TPAulIbriy8rIumCXKeuBfeN
 7V87/9Wk3b2Ze1KPPR/E0t+yUZqytTq8ehVGJzvKOOjVki+57uI5CglzdAU3BmJKr7vl
 /W22OHuo7Hd58n7VhqddRbwFbulgHAcnwOGVPtLfDO1qUnsiBVFpCWNekwtMIs34t/qt
 sAxw==
X-Gm-Message-State: AOAM530JVjK+mTMSxC14BQh8LqdDv1LMngtNHcKALwQgh8kzXs9ZI9Jh
 jk5GyTbVRF0eyhNibPmKCGaOTCytcsA=
X-Google-Smtp-Source: ABdhPJx5PjHl3JhcJ/ZXmAWad2NQoAmC6WLo/Y0/2euJiCnGHWT+x5+gqEWNmIJYsFUemskdUjS40g==
X-Received: by 2002:aa7:ce88:: with SMTP id y8mr9127970edv.303.1641656391208; 
 Sat, 08 Jan 2022 07:39:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:a467:f77d:1:78f2:78aa:23a7:b824])
 by smtp.gmail.com with ESMTPSA id
 24sm599840ejg.47.2022.01.08.07.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:39:50 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org,
	dpetroff@gmail.com
Subject: [PATCH v4 5/5] ui/input-legacy: pass horizontal scroll information
Date: Sat,  8 Jan 2022 16:39:47 +0100
Message-Id: <20220108153947.171861-6-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108153947.171861-1-dpetroff@gmail.com>
References: <20220108153947.171861-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This code seems to be used by vmport hack, passing these values allows
to implement horizontal scroll support even when using vmport.
In case it's not supported horizontal scroll will act as a vertical one.

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 ui/input-legacy.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 9fc78a639b..46ea74e44d 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/qapi-commands-ui.h"
 #include "ui/console.h"
 #include "keymaps.h"
@@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev, QemuConsole *src,
                                     1,
                                     s->buttons);
         }
+        if (btn->down && btn->button == INPUT_BUTTON_WHEEL_RIGHT) {
+            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
+                                    s->axis[INPUT_AXIS_X],
+                                    s->axis[INPUT_AXIS_Y],
+                                    -2,
+                                    s->buttons);
+        }
+        if (btn->down && btn->button == INPUT_BUTTON_WHEEL_LEFT) {
+            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
+                                    s->axis[INPUT_AXIS_X],
+                                    s->axis[INPUT_AXIS_Y],
+                                    2,
+                                    s->buttons);
+        }
         break;
     case INPUT_EVENT_KIND_ABS:
         move = evt->u.abs.data;
-- 
2.32.0


