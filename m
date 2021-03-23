Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0434660F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:14:08 +0100 (CET)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkbX-0007aM-18
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgJ-0005La-Ci; Tue, 23 Mar 2021 12:14:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgH-0007h2-T7; Tue, 23 Mar 2021 12:14:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v11so21353304wro.7;
 Tue, 23 Mar 2021 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSeqnX5N97W9rEK9WSPE4QKFRME0UciPhX0NyqSn+M8=;
 b=R7dUzghB9unldNEhViaM1UR8ta25tikMbx6NJdZbQSUvKkIS7hkxVseKMPFTqBHGt2
 OoTRjGw+iYnT+pJaUrjgMSp+fhVu3GNtFWimL98vV5r3ARRERo2QjAkVs386MEEqPHu8
 nVQmaJPBKa9g614UD52Ye+/nZw5Rs+Kum8PucvJL/wBK0a+Qvvde6yBH2cojhO8vmMhd
 7lKMfCy1HsZLeC5bw1NREPHYH3jsO7yTeYfJlmtos/oIfx+Cvb7RBQcNJ3AxRYq/iVq5
 7Ys06xZlAqsdDafhVAtxTeXwB1yKq7mQhJzbcyJVlOHSCHCLIPb0rVWwUZYz1NulOl7E
 VFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DSeqnX5N97W9rEK9WSPE4QKFRME0UciPhX0NyqSn+M8=;
 b=mD6DIjTk1MhO37n4/fugKxWrZP6o8+k95BUngQOSIWQCdeX3J7RrE4X/YDlGEi5fmb
 cskIzY75XTLjK54OS4hZ6j1Qz5epxfdlZeQYWuncgYIaeq/rn4NY7cG4q+UArEn3ilE/
 0jt5tdzR2ghEjjXhsyAkA2i5WEJPB5nw0ZB1MDnUaIDc+SzPDsrqy42vw7/Ni6XnhPKd
 F8SMCyUeGSOg5sECbJKnra2ImW007pS+bLdeyBjEYt6uZp5vtucBvpdSOrOW305RzpUV
 zsoe2QSeZQFAu7YH467B0ILVIa64f3NN7jqIN00ikwpSzF+IK8wBG5ATlczo4gVml5IY
 KAwQ==
X-Gm-Message-State: AOAM530vZe+drHqjX2O2I8F8YQSvicbDXJRGomYPDRG0+nSVu5Extn9b
 RcPNUPOKd6FvE2aP0sT3jhekd4r7P4qrHg==
X-Google-Smtp-Source: ABdhPJxzmk/6q6KI8inXOXYloQO7Bvb05rJTSRpn2RkP5IdU7tYqfepoq2/6KR3FY7quBaBAM5tBOg==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr4597775wrm.321.1616516095976; 
 Tue, 23 Mar 2021 09:14:55 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q4sm2934464wma.20.2021.03.23.09.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:14:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/display/bcm2835_fb: Use bcm2835_fb_reconfigure in
 bcm2835_fb_reset
Date: Tue, 23 Mar 2021 17:14:42 +0100
Message-Id: <20210323161443.245636-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323161443.245636-1-f4bug@amsat.org>
References: <20210323161443.245636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Directly use bcm2835_fb_reconfigure() instead of open coding it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 3e63d58e0b2..a9c2e57d1c6 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -396,11 +396,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
 
     s->pending = false;
 
-    s->config = s->initial_config;
-
-    s->invalidate = true;
-    qemu_console_resize(s->con, s->initial_config.xres, s->initial_config.yres);
-    s->lock = false;
+    bcm2835_fb_reconfigure(s, &s->initial_config);
 }
 
 static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
-- 
2.26.2


