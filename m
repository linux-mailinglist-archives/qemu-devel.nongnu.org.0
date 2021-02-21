Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C610320BF7
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:14:46 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsJh-0005HV-Bi
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDsCK-0007gf-Sb; Sun, 21 Feb 2021 12:07:12 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:46209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDsCG-0003eN-8j; Sun, 21 Feb 2021 12:07:06 -0500
Received: by mail-io1-xd2b.google.com with SMTP id u8so10800444ior.13;
 Sun, 21 Feb 2021 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=Xkevp8Xfi1yzAoWO5a8ydhbt8R69O7jarAH71I7QoHg=;
 b=GTG5CEpEt4pQzGnkzzrNeTdNpy60lQazPxAtYXSfIXa0LzC3ZaDSrkP1K53mcj2xF5
 GQWNq96cLaDOntm8XIcxxkb1TrgsxLjAsW5cPxl6K9U3xxgTw7NrQO00JtLiSp5A0+bV
 K2nOAkexz+EacKanKbq9FyNNXhPC9rji5djjOFbySs9hMECL7OhH/r5uuxIw9OJN2Aum
 0H7OHaNtkuUbD9FE/GQxTnwzY9U9jY5N4/TcosNVRmCxdCbH5AE4pkwOvFsVTMGvXOKk
 TNz2DMsjNhLeJY0qnIcjweGOPP9Gi8DroH3t5po04IfIugiDr+iQSHpS9VHNTW7zCkxD
 +Cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=Xkevp8Xfi1yzAoWO5a8ydhbt8R69O7jarAH71I7QoHg=;
 b=jBdWvfhbDwhPwHIj8qpbf73C2c9N1FXhmVUjrnbUy7ZYdpz/lfxVFZQDSDCeYerIKO
 WihaD1dvKpDThBm/pAkVww5i/rELAxdDRnW/smajPRbWS5FZyetQYLOmSyMSDbvUOBq2
 zHac1+ekCQqsKKJJ0763YnOfK2P0a6wNOsnrVKuOumPEJ87dhVPok6XriOqHjQSMKoRk
 UcVxJOFEA/JlpLb3MJnZNPHZZyQ42fkRTTX0QHeClmW4h01lseI+NcoFwKulXn46G8JS
 AWOBR+A+cIFT1afZbptY82FoW4VhhPoQLIfnyqYmYmahGxv3kTgibYaUWrxjlD/qht+O
 T4UQ==
X-Gm-Message-State: AOAM53161TuOG7wXr7hBN4dogZfNB1UM/IEJTHugK4Yg+3ve9KgrrqVI
 EMO0zbQd3fGKpQSDDKECfdI=
X-Google-Smtp-Source: ABdhPJyX07S5/G6vtejeoKEnxxSDJFN35L2KETLR5eUL1nZvQAmx9+dZ7xiT2GuAybQ9LuIe8ZMtwg==
X-Received: by 2002:a5d:818b:: with SMTP id u11mr11925069ion.59.1613927219332; 
 Sun, 21 Feb 2021 09:06:59 -0800 (PST)
Received: from gastly (c-67-177-215-41.hsd1.co.comcast.net. [67.177.215.41])
 by smtp.gmail.com with ESMTPSA id k125sm11728178iof.14.2021.02.21.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 09:06:58 -0800 (PST)
Received: from zack by gastly with local (Exim 4.92)
 (envelope-from <zpmarvel@gmail.com>)
 id 1lDsC9-0003T3-5L; Sun, 21 Feb 2021 10:06:57 -0700
From: Zack Marvel <zpmarvel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: vte: fix sending multiple characeters
Date: Sun, 21 Feb 2021 10:06:13 -0700
Message-Id: <20210221170613.13183-2-zpmarvel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210221170613.13183-1-zpmarvel@gmail.com>
References: <161392666438.21706.4757518764617915041@c667a6b167f6>
 <20210221170613.13183-1-zpmarvel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=zpmarvel@gmail.com; helo=mail-io1-xd2b.google.com
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
Reply-To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zack Marvel <zpmarvel@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the GTK UI with libvte, multicharacter keystrokes are not
sent correctly (such as arrow keys). gd_vc_in should check the
CharBackend's can_receive instead of assuming multiple characters can be
received. This is not an issue for e.g. the SDL UI because
qemu_chr_be_write is called with len=1 for each character (SDL sends
more than once keystroke).

Modify gd_vc_in to call qemu_chr_be_write multiple times if necessary.

Buglink: https://bugs.launchpad.net/qemu/+bug/1407808

Signed-off-by: Zack Marvel <zpmarvel@gmail.com>
---
 ui/gtk.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc240120..bad716f136 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1786,7 +1786,16 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
         }
     }
 
-    qemu_chr_be_write(vc->vte.chr, (uint8_t  *)text, (unsigned int)size);
+    int remaining = size;
+    uint8_t* p = (uint8_t *)text;
+    while (remaining > 0) {
+        int can_write = qemu_chr_be_can_write(vc->vte.chr);
+        int written = MIN(remaining, can_write);
+        qemu_chr_be_write(vc->vte.chr, p, written);
+
+        remaining -= written;
+        p += written;
+    }
     return TRUE;
 }
 
-- 
2.20.1


