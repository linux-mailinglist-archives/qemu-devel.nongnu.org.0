Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9130359579
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:29:55 +0200 (CEST)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkeQ-0001Dy-Uf
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZ5-0004V7-ED; Fri, 09 Apr 2021 02:24:23 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZ3-0001SS-3j; Fri, 09 Apr 2021 02:24:23 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u21so6814776ejo.13;
 Thu, 08 Apr 2021 23:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KM2bACU647mjpsDpzpNgymCuMSg/hlg69APP0D5FAlI=;
 b=sFsdBlHqI21NWowVevVCbm58EHUNmABa9M6WocYFi0KlG8UcktrHQ6dA24yFL9Kfut
 AGiwUyj51uwNwKBMADtr2QtgftcEzFSQEeP4rLDEmGs5KhG6aq1JOB1TKc9217SujshR
 /DrYAK6bYKUk7fp3PUwZ/ipDa7Kf7qjOIzzZAe3v9Ov4tou288F6U08Hnw1ifN7cxjzm
 H04m9Ed+rzkoxNM/uo0szEazltGW1TG1mU9IXbJv4dveMd0kzwPHy5bVqLCbQLDyiRgk
 5NoRdDFn/rXkTqnVtPDrXSp7o1EjpMWsFIOspacJrtKqFk9CLjLxvhizxOYJJqvDjmkF
 7jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KM2bACU647mjpsDpzpNgymCuMSg/hlg69APP0D5FAlI=;
 b=kR2qbPq+Ziw8+v6SI4J3W10L4ex9hAPF/iwaPP0fLNLnfCr66Ihmq7LuYWnTxD7ZgZ
 CZe/OC4HSX5wR5QV5kxk9RUHXtbGht1tDcv/4IYtzGlCirLf0uh9XNqkUGOyuPAJXyT6
 GwRtcsz9k8kebZQMt90kcx0bZEGqzEcQORb3Nho1xUWWQFfSKMjml5HjD1b21PjvL69H
 5OnkL1KEsfCI6HYtBIjUXIPRdwykgaVvnn4BIm7R5rmYHCfZvbiMSNmJKw82Y64RaeYS
 iZp4Hs4T9CJq8qpRo2Zw1nSV/MGYzPZ7C9RlFhB7Bf4g+lYCqYQbCvIKrmIVHdl5wnZw
 xi5A==
X-Gm-Message-State: AOAM532IXY9p1lZBrUToq0mb//MRAV6ZB++w2l5chvN6FFVMBFvdyBwr
 VW3ebQDC6N56OX4ybYmPYP9vceg0079mQw==
X-Google-Smtp-Source: ABdhPJwiRa54IKzddTIhrI/nF3QxHryStq4E2A8ggC91kqfZ0uZGo4RAzlzbujk3D5oF0Py4M6iagA==
X-Received: by 2002:a17:906:eb88:: with SMTP id
 mh8mr14958512ejb.74.1617949459153; 
 Thu, 08 Apr 2021 23:24:19 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a9sm846600eda.13.2021.04.08.23.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 3/9] hw/arm: Use new
 machine_create_constant_clock() helper
Date: Fri,  9 Apr 2021 08:23:55 +0200
Message-Id: <20210409062401.2350436-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the newly added machine_create_constant_clock() helper
to create the SYSCLKs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 6 ++----
 hw/arm/mps2.c    | 3 +--
 hw/arm/musca.c   | 6 ++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 3fbe3d29f95..86481fbe40d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -740,10 +740,8 @@ static void mps2tz_common_init(MachineState *machine)
     }
 
     /* These clocks don't need migration because they are fixed-frequency */
-    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
-    clock_set_hz(mms->sysclk, mmc->sysclk_frq);
-    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
-    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
+    mms->sysclk = machine_create_constant_clock(machine, "SYSCLK", mmc->sysclk_frq);
+    mms->s32kclk = machine_create_constant_clock(machine, "S32KCLK", S32KCLK_FRQ);
 
     object_initialize_child(OBJECT(machine), TYPE_IOTKIT, &mms->iotkit,
                             mmc->armsse_type);
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 81413b7133e..5d9250da615 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -143,8 +143,7 @@ static void mps2_common_init(MachineState *machine)
     }
 
     /* This clock doesn't need migration because it is fixed-frequency */
-    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
-    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    mms->sysclk = machine_create_constant_clock(machine, "SYSCLK", SYSCLK_FRQ);
 
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 7a83f7dda7d..e15149f3a27 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -372,10 +372,8 @@ static void musca_init(MachineState *machine)
         exit(1);
     }
 
-    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
-    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
-    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
-    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
+    mms->sysclk = machine_create_constant_clock(machine, "SYSCLK", SYSCLK_FRQ);
+    mms->s32kclk = machine_create_constant_clock(machine, "S32KCLK", S32KCLK_FRQ);
 
     object_initialize_child(OBJECT(machine), "sse-200", &mms->sse,
                             TYPE_SSE200);
-- 
2.26.3


