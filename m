Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B25D47CACB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 02:32:32 +0100 (CET)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzqUZ-0003IN-KP
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 20:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5m-0001wO-Ny
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:54 -0500
Received: from [2a00:1450:4864:20::52b] (port=42655
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5l-0002cn-BJ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:54 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j21so1936038edt.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 17:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNUOMlWMNoT3Tx0C1/hM96AtvAu+OAY3yfRdp65RX3Q=;
 b=lnum82wiVyMTPhOHsesNKDuiMcNC+47ok/e3nMDYN2ESIlrmyXKbxhlLpd8I2UJaBu
 cv30Kx0OlVRwrWBKmwnVWNMdgegjPbsHw4NriQCbU+StJIrj9e3MG8tleWTDSkztBLxN
 4MC1E8MJrTU83WlnzOTXWFC9HnM4aUQCJ/kBF80RpWkSVVOFOvQfw/6hgHI5UuXoA0sn
 VbRHbDZ3eIbk/2jxPBan+ORylq8s+4agrVPi1RN6s92vHUwYFzjHK76HGQk5tEez7dQz
 NPuZjWQkz9E6Ixd63w2gI2NIVVafO7RPGMW/PQkUcpvOpVtSn3rzkKeBn+uBlowNqJZQ
 t5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNUOMlWMNoT3Tx0C1/hM96AtvAu+OAY3yfRdp65RX3Q=;
 b=b0ndnRNbglOC57Pd7cFYaPA+/crMVGmuwuQd073qImXnkiqAwnk3GadxDI88TF+hdc
 UsXPcyq5JzD9AmDOY8B5V1JudzrqZGI7AZUJXLmRucpv2ZnFqURMBu2lp1YrPEWHLl14
 /SjpRk+cVuv3XOWHQLWYElVzRCq3xGFvh9fSaVTXwhQTZayiQUCCDVmZVohFe9Kl0s2P
 yH4kvE9Z/MvWA4Ps4WK4j6auOkcnTKn18LcGlPOQEknTQJaMPIxOT70teOkOlq08wHQm
 ayemJa+W+LM/44ZpWgW6Xe4glQKgBaZIDYSfSGHn6uUsq+bsrbtLs5kldX6O6zbnnIKN
 4YnA==
X-Gm-Message-State: AOAM5339RxH5u+CyCGTupXn9Pigr6riCN9TIYlF33dv1/XQ4YfznqkKQ
 WqsSqlHatfGZ0Np7FWBQbi9NaGmO2RM=
X-Google-Smtp-Source: ABdhPJz8iKy3e+lsOj+92e8oguknqGEj5pMcyYDwhBfWVojESpVkEgWTmQC/RN2cbF7G6ednumy1KQ==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr765720edb.360.1640135211971; 
 Tue, 21 Dec 2021 17:06:51 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:e6fc:be30:e400:3c3])
 by smtp.gmail.com with ESMTPSA id nb20sm125199ejc.25.2021.12.21.17.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 17:06:51 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] ui/input-legacy: pass horizontal scroll information
Date: Wed, 22 Dec 2021 02:06:47 +0100
Message-Id: <20211222010647.1332479-5-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222010647.1332479-1-dpetroff@gmail.com>
References: <20211222010647.1332479-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 20:24:48 -0500
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
 ui/input-legacy.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 9fc78a639b..2c9a215d7f 100644
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
@@ -216,6 +231,7 @@ QEMUPutMouseEntry *qemu_add_mouse_event_handler(QEMUPutMouseEvent *func,
     QEMUPutMouseEntry *s;
 
     s = g_new0(QEMUPutMouseEntry, 1);
+    qemu_log("qemu_add_mouse_event_handler %s", name);
 
     s->qemu_put_mouse_event = func;
     s->qemu_put_mouse_event_opaque = opaque;
-- 
2.32.0


