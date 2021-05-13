Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43737FC82
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:27:38 +0200 (CEST)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF7Z-0005G0-DC
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEtJ-0006JO-6X; Thu, 13 May 2021 13:12:53 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEtF-00032t-MY; Thu, 13 May 2021 13:12:50 -0400
Received: by mail-ed1-x52d.google.com with SMTP id l7so31849093edb.1;
 Thu, 13 May 2021 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/l1vSGEiJ7pZLCdjOLk0Fo0Jde9DV8raYEKhS8kK0n4=;
 b=UCuXATJrpEf6Tqty49vUtWYai1jZMQx1i2smCXijmf7FkPCd3aZf/vG8Hvana7MNI3
 aZxYPJYac0jgNDZaeIzIKZRXk2Zjccq5slRFK9DAW7uGrUk3Mv3JMJ7DfD1y6mpDOf9+
 YqSPNIX4tcq7IFslmcVsh0GHcTmWW15croSSJHEqHFNbUiI8xieThjnzxFIvTDXQWQ93
 us6kMR/DPArmPn0egiBYo+YoEzkJHY+dc0ocB90WQYqKT42GxY/fKIf7Ksfc+RKAZiGu
 UcW48BmZ0oCdl11S0LUbRgjvBMBX+ibdVthCcusp/McaZb6eaDMg6lnz6aOP7TljO7RE
 opEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/l1vSGEiJ7pZLCdjOLk0Fo0Jde9DV8raYEKhS8kK0n4=;
 b=X2y13qIHX1f8pQKgGFce3cLhJz2X7U+RwBDGUO2Iqd9w3a6d7terlCBycCY7filu9A
 axdRStuuM5AsuqMGiZBV1sut4VKBE+1899lrVLM4y8bT1cV8+8v3gFFCpxxuwPh2L1Ww
 8m9QDm4UAYBNXLKj6dp3+Czic69U5MCOKhx+c7F5dv8EDbuj3Zybr8TwNp8SZk/9zeN+
 ej4jp0rigJrngAjwdKujQt4u1ETkm5FmtgK71AZfFBFFHnYg4vbd4OUOFAHJLZw7cyet
 Zv8kojffZ3eolIePQBZneCiZS/xW5wVYVdurBlrNgTFHPTlfn78oTvjLnLKyZZgJdeH+
 g05Q==
X-Gm-Message-State: AOAM531pdqRXrJxdbngYQPqGJiwcmvYwKg6MpmFMh9hOUHbeu6xH6eqt
 z+S5BZRZ7tdAz+OS7VRyiEeGQ6dHXMHCQg==
X-Google-Smtp-Source: ABdhPJysbxDRCUlTUBLPmSlsj+lOMRGc/o3fzkjAiNDuRH6wO6lg5aAGZL2IFNzm2XMypzrdEXFr4w==
X-Received: by 2002:aa7:d9ca:: with SMTP id v10mr52277751eds.272.1620925966650; 
 Thu, 13 May 2021 10:12:46 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id bw26sm2116597ejb.119.2021.05.13.10.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:12:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/input/ps2: Use ps2_raise_irq() instead of open coding it
Date: Thu, 13 May 2021 19:12:44 +0200
Message-Id: <20210513171244.3940519-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inspired-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/ps2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 72cdb80ae1c..02d7e5da723 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -213,7 +213,7 @@ void ps2_raise_irq(PS2State *s)
 void ps2_queue(PS2State *s, int b)
 {
     ps2_queue_noirq(s, b);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_2(PS2State *s, int b1, int b2)
@@ -224,7 +224,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)
 
     ps2_queue_noirq(s, b1);
     ps2_queue_noirq(s, b2);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
@@ -236,7 +236,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
     ps2_queue_noirq(s, b1);
     ps2_queue_noirq(s, b2);
     ps2_queue_noirq(s, b3);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
@@ -249,7 +249,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
     ps2_queue_noirq(s, b2);
     ps2_queue_noirq(s, b3);
     ps2_queue_noirq(s, b4);
-    s->update_irq(s->update_arg, 1);
+    ps2_raise_irq(s);
 }
 
 /* keycode is the untranslated scancode in the current scancode set. */
-- 
2.26.3


