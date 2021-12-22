Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFC47D97E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 00:02:13 +0100 (CET)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Ace-00085S-VI
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 18:02:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWv-0002Hs-NJ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:22 -0500
Received: from [2a00:1450:4864:20::52d] (port=33591
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWr-0002QG-GL
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:14 -0500
Received: by mail-ed1-x52d.google.com with SMTP id m21so15518986edc.0
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cxUbOU/d0PmlHVogfci1RL4+M00MXtpxpVMs5qcbZQ=;
 b=moN6KU4+YvVIqByUQn17MphwX+4S+pZFeXc+JlWhqJgmU9YjXxz0i5JAtw+ipJC8AW
 LKXND+kI7xKFQz/kA/ITuKEW7TXyOOfL1fHy6ymDxTEy/FI4koX52iUZTv6dHcUYWIp6
 zgn3p1BXFvMvatEpPQZuQtCwejZt4Pz5MSYFwGlkADHRjoYywfoPtChA2cE8uxO4kTLe
 5ooeHzVEYXjZ2syro5MjRp9ll2LoLnIKl8weG1GIGE/ZEuj0kHyxv2h2gGsaHumC+OBW
 Fv3U+BqyWQ3tGUkmDLmG9+jff8OQQpGPo6/mt2ONLsHV8ZQDJ5vv8xRfSyEcfgdNx5rp
 X21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cxUbOU/d0PmlHVogfci1RL4+M00MXtpxpVMs5qcbZQ=;
 b=OYOfmjYXBnrCTShCTEVxdYa513ismQXTSyhkqbSAGloivZoZB3ZK2vzIu3+OvCZzWm
 y0tRinHMJ6Fs6Njz0jvdNjmRXfr2EL/Aftmplqb480T0hLM3fRsgdX3IxqATt0B64IJO
 +/M2XD7JrWRArFEuHuUQ4gjL6CaPXQUtzqA326dl30wP8Utk7W78f3f/kB5llDWQ5fOJ
 x4ZRx3ic5FTIvC5/ZKA4q/sk8X/BmfbXObY2Ln/QMUf7hk5fnb/U6yaNHM5A+fEgKdtj
 ejt2UZ64mqj3DU9o5NBRDIr675+VLvqBvEBlM3DahCfbxqnOKHXxcUM/lW9ACt5zOj9h
 cJew==
X-Gm-Message-State: AOAM532/E2qDZ4OQvXCk2L3R8LS8yw6F5v91HNEHC2A5r2VtO0LFJ5CC
 6B1GOKRiNRHHwd+CNheRQu1KSbfH5w8=
X-Google-Smtp-Source: ABdhPJw2BGSAJkRiN5zlRWYpNoHKAYPKrHtu8UYpYQ2Iqiw8JBzLZwW07cPGrX143tFJJhM+DVIOEA==
X-Received: by 2002:a17:907:96a0:: with SMTP id
 hd32mr3938838ejc.677.1640213771060; 
 Wed, 22 Dec 2021 14:56:11 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:deba:f393:276b:fad2])
 by smtp.gmail.com with ESMTPSA id gv11sm1097226ejc.135.2021.12.22.14.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:56:10 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] ui/input-legacy: pass horizontal scroll information
Date: Wed, 22 Dec 2021 23:56:06 +0100
Message-Id: <20211222225606.1359162-6-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222225606.1359162-1-dpetroff@gmail.com>
References: <20211222225606.1359162-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
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


