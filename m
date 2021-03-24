Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9A3481DB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:28:44 +0100 (CET)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9BK-0003SL-S4
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP9AH-00031Z-Im
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:27:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP9AG-0000ta-2l
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:27:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso1851032wmq.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hLU1kCsBKvwOHqlKzu9iQGtoczQm9ofJkmpKvIMAg3o=;
 b=e+sZjNM1eu6IT3yUN3D73I66mv/D2Xp20EjjI+qG615vXG8FeFB+tzGFo4CxOOQ+uO
 pjdLN9Ztz6niyLW2eIvSPBbEnKba6f6/nGIy1Id8D25BqHIZf4oMUyH6uCFdqoq2zvnB
 dF0SoHKZByre7tTBae/vXG6dZ1snw5qscxLBz1CnqCpU3V8IrKPvKhCD/G/8h97eQZiE
 QNUmxZug/awaHW0N3MsPhOHYTTRI3j2uzlEg07lE2+7soO5JCQQCXYFIxfc7AFqYqEZI
 beyn9dCwMR3TopZHPUZRiIT9NyuovSBu2viJH9RcqAoUJkTDn21KcIvor9EacuVus8XF
 O/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hLU1kCsBKvwOHqlKzu9iQGtoczQm9ofJkmpKvIMAg3o=;
 b=XE21CEc3bT7Q1KJQr7mttlMx7v8/EY4hbCXejEgwal/2NcWqjnTbXTf0hcEzuDCMPN
 FilJUAwcDm/J3jTodbm6ruLWHQtO5GHa8f8HDORfGgv/ytAsqhRGu9rEUSZNrwTUOmGA
 PG0H+RGn006LMq21z8vwXcwU/k/4kx0O5YbgF69HmSrf2wW4SkDHtDkSyutCxuLBng0v
 4tVe+TYuLAwkgXjfSJhwvcbNLZML3zcLXtf7VTvPh9kx7YD5+cWr1HlADHCrowUZGxVy
 GAhRJWIJC0MafINCwbA7dtUQddQIYF/ANTuhyDyghg8Oq/2+NZ0zh7c7DhmNSeTUVr5D
 W+3A==
X-Gm-Message-State: AOAM532HAZRfl2CRzkrNB/toSHI1XCKln+ZDhrTnSZ+oMN1/3+rw4XxP
 gmjKJXcdoRseOmxYBWVow9jXKVNfP4dbNw==
X-Google-Smtp-Source: ABdhPJzuZVUq5iwCegzAQecfb7aN0vrrDm8HkBsAlUodEgdQbWz6heOtAvRAxWhDcXHj/Ur1kqtWfg==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr4538276wmc.85.1616614053638;
 Wed, 24 Mar 2021 12:27:33 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j13sm4438342wrt.29.2021.03.24.12.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 12:27:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/isa/piix4: Migrate Reset Control Register
Date: Wed, 24 Mar 2021 20:27:31 +0100
Message-Id: <20210324192731.717142-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

When adding the Reset register in commit 5790b757cfb we
forgot to migrate it.

While it is possible a VM using the PIIX4 is migrated just
after requesting a system shutdown, it is very unlikely.
However when restoring a migrated VM, we might have the
RCR bit #4 set on the stack and when the VM resume it
directly shutdowns.

Add a post_load() migration handler and set the default
RCR value to 0 for earlier versions, assuming the VM was
not going to shutdown before migration.

Fixes: 5790b757cfb ("piix4: Add the Reset Control Register")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Add piix4_ide_post_load() and describe
---
 hw/isa/piix4.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a50d97834c7..e7bce0e590c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -93,12 +93,25 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xae] = 0x00;
 }
 
+static int piix4_ide_post_load(void *opaque, int version_id)
+{
+    PIIX4State *s = opaque;
+
+    if (version_id == 2) {
+        s->rcr = 0;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_piix4 = {
     .name = "PIIX4",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
+    .post_load = piix4_ide_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, PIIX4State),
+        VMSTATE_UINT8(rcr, PIIX4State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2


