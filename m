Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044D347AAF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:29:42 +0100 (CET)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4Vx-0004ob-Lu
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP4Ue-0003Gy-U1
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:28:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP4Ud-0005wm-BQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:28:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id k8so24653859wrc.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/7CG30zXdXn0O90KLB4N/sylVR91M/usoyNtrStkkE=;
 b=oGZOkgOZaIZgN73sa0LGja8ITPoPjjlfM7ys1XESYV9eDyzNSLjBJRDbdY7TOcxsp+
 FoBQ96LtW1ZouXLXldFaXlyIp6jZBpIzYBycGKOwU6AotfDY5nNPdW7paTCLOr744y2A
 U3ajj1TcrqHdcfS0Soc4CMEAfmRDkDxYfHU1ji3r6JUbG6Wh9bVyp+bUHgx/CfZvmqe5
 D9H3XKQy3a1hMr+KXeyW2NzEaiziEir8Y5PdSkdfTYZVw1+LlwEXLPZPyxaUmMyaLsOz
 7HgtJ2azleLsaQKI8Z6f00WzFyq7dJv3kERqWA7NGJ5ArFQjwV7HUYhY+xUzTVLAMkHo
 LtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+/7CG30zXdXn0O90KLB4N/sylVR91M/usoyNtrStkkE=;
 b=I3NN66hpr5q33oOXgvJ+uc2sYbE4ehyPAqQh3MjnyhJo/BVduk8uaYY5I3IT8PUqZd
 /Jf7u1Ze+/J1xEbnEOLcns00ulGDG8AF6pzcSxorkD4APfuNHn6e4ga+l/jbCUh/+Yl0
 nH5vosokvoF6VJhDHk/hEJOd/58kdJjT7hanS+JcPGXk1V5KL0hQp8VRLEllCsIAwbBD
 5K3ScWcnmVGlyZ9CVsuWkASjzClyL5P6jmGtKqeqsLkQhObZuOrPM4sAOs57svIQ1cAw
 siKYDPfkJAgszSHUtBsN/wV5T4vYmlN29yHuhevYHGuU1PPM2cfCzjlZBp1+SO5SW0ST
 H3Bw==
X-Gm-Message-State: AOAM533Yw1NsWMkivmNfpwHweqFiaPb5bqHtjaVEpnf0yHKt7rv88voV
 s3Vu2Bk6F4wumO4uTtRrd0Fn62TdflOxiQ==
X-Google-Smtp-Source: ABdhPJxacxG1XMsRdmN7LRMPspOYmh8GhCuuMzL4rHifDLsLMXj4B5x7Un08KFVRSSugnmAQeeOLgA==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr3881521wrx.356.1616596097024; 
 Wed, 24 Mar 2021 07:28:17 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l6sm2205232wrt.56.2021.03.24.07.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:28:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/isa/piix4: Migrate Reset Control Register
Date: Wed, 24 Mar 2021 15:28:14 +0100
Message-Id: <20210324142814.609112-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 5790b757cfb ("piix4: Add the Reset Control Register")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a50d97834c7..6eeff4525f8 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -95,10 +95,11 @@ static void piix4_isa_reset(DeviceState *dev)
 
 static const VMStateDescription vmstate_piix4 = {
     .name = "PIIX4",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, PIIX4State),
+        VMSTATE_UINT8(rcr, PIIX4State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2


