Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C6395530
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 08:02:08 +0200 (CEST)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnb03-0005Si-IW
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 02:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lnapw-0005vn-Eg
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:40 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lnapt-00046c-9b
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:40 -0400
Received: by mail-pg1-x530.google.com with SMTP id 133so2502640pgf.2
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmenCGn6hkJyoe9wJa3dJxebrzaHoX1AC+ORo7H78fo=;
 b=fJugpbbdHrXH4QlzPGF0SaPoWsi22I6/P8vyvRUOy6A2wqqoNev3I+n5bpH0WGLiJN
 x8Fzo1JBOmd3t7SDnfgZUwMseKf6st+do50qnQeBucp5AcEJBe8op+4aJKsl++aJXEg8
 Vzd0449LSgQRUI6ByfC8Ou0BrHNq+SF74xdwjh5pRSYZgAlwHQBveqiP0pY9iHIKaJ2o
 nsTnb1wa2o5pBVO9/gU7dWwe+0GFsvEBbxoRNnNCW6+B2gyjoc44BCaKT8qki+MQPcXF
 yIfl0uTogimxNdjel1hv0biuBWt5hhyakx+NddBhMxGUMZUL+HT0kjHKXi+OsoKFig48
 uJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmenCGn6hkJyoe9wJa3dJxebrzaHoX1AC+ORo7H78fo=;
 b=MVLnfklAHaDWYC6CaTHFWGHAmgWS90/V4kt8d3qYkaX3d0kQxLh4uU/YEUpXVpSWDf
 oRbOaoHt4nhf7K8Yz2S0rectUvYPF0QFAk6ULcgJ2JOPsukxwilrhY9Cz+yDBRJQG8N+
 W0djdFF03Izp8R+iieAMqatP9bdTIcddMVh9p8zxIIaRHI95rEGabK8JgoHOwk76whbE
 yCgqJ52nfXX3etUPgJpZg5oktig2m0b4v+6i4+4wEhtR/D56v2lEm45M6lEz9cgOnNH7
 CzbwanVcxQLkyzne6auzr2Tug1+tgSpUUT56lS/xcyO4qaCGHbcdHEtOdlCDwwlIs8E9
 gXfA==
X-Gm-Message-State: AOAM532Y4z5bi1HkvPt/Yc/++/m2aQtg6LAs4Y82rh5pdY7fNx8sKGKc
 3Zn3HSyl1zgxFkEIM7eeAwGVAQ==
X-Google-Smtp-Source: ABdhPJzOVNzPJGNqYL7i6uZ6Xpht9PuMAB9XqEb9mPhw2VZVp73ZBijwvt12diDAQXdobqBz50utyw==
X-Received: by 2002:a63:e642:: with SMTP id p2mr20601455pgj.316.1622440295174; 
 Sun, 30 May 2021 22:51:35 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.232.60])
 by smtp.googlemail.com with ESMTPSA id x23sm9968431pje.52.2021.05.30.22.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 22:51:34 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anirban.sinha@nokia.com>
To: anirban.sinha@nokia.com
Subject: [PATCH v1] hw/input/ps2: Use ps2_raise_irq() instead of open coding it
Date: Mon, 31 May 2021 11:21:25 +0530
Message-Id: <20210531055125.148282-1-anirban.sinha@nokia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Inspired-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210513171244.3940519-1-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/ps2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 5cf95b4dd3..8dd482c1f6 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -217,7 +217,7 @@ void ps2_queue(PS2State *s, int b)
     }
 
     ps2_queue_noirq(s, b);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_2(PS2State *s, int b1, int b2)
@@ -228,7 +228,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)
 
     ps2_queue_noirq(s, b1);
     ps2_queue_noirq(s, b2);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
@@ -240,7 +240,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
     ps2_queue_noirq(s, b1);
     ps2_queue_noirq(s, b2);
     ps2_queue_noirq(s, b3);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
@@ -253,7 +253,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
     ps2_queue_noirq(s, b2);
     ps2_queue_noirq(s, b3);
     ps2_queue_noirq(s, b4);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 /* keycode is the untranslated scancode in the current scancode set. */
-- 
2.25.1


