Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8DC35DC46
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:13:23 +0200 (CEST)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWG2s-0007dF-Sq
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1P-0006Et-Pq
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1O-0004li-9E
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:51 -0400
Received: by mail-wm1-x333.google.com with SMTP id u20so3863494wmj.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHETbRXCR+t9b893UAfzQ7dYkQDMKdnYYi5AYTvl98I=;
 b=cqUY481mlxn96npT+uSN34Rvjbgv89GqcMHxNiDNvio4UMWjC42jOnuqwCtXSrRi6f
 KjqO6FWrko5iSyQX5FrGO37Wtk0WIyFnJCqbyID14X3GqVCRI/eXCI0Zul+czpATUcEb
 OwIW+IcRi4mCvZcG2dCLro6LkqPOk3KvbXtH+e0DRqevcSgbvlI31Ec4T6orGWukfZMz
 0+e+4RFHdWdjjHh2w/M0DizQiRc9pmNxl/EX0YPevqJbklO5Fn44jWTvqPzARNziGMFU
 oo0xWR7rK0nm7QxOTnQ/tzx+lOuq2S9uWDa7qPmzlV57l9fJqWfS8yljMyMFP8pyVr6h
 0ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cHETbRXCR+t9b893UAfzQ7dYkQDMKdnYYi5AYTvl98I=;
 b=KUR9zWRGOy3SvCiFPXJv/lPYb/a+4Mb9KsrFXjTlYIy4y5kVuEZ3EwLrwIA4EQ6VBI
 hcg9ewQVXNEAGE/mfDrgquCzu0xrxpZGyD1Hx71oFZn+6Ip6tWK8JothnkvM5/CXQWfu
 sj/FX95fI5MlEZbgpxPuzJd2cpWrICQOyn5hkLpeTwt5TRBXikKXdeH1mFgFn246wEu7
 pGC5Vz2l5bw8Y9fIwgv4hW5AalyXzyMyrQHnnCXZeraXNAQHZCUmwmmHPVYxgq0NTZhn
 fygXO1mC4fTntaP2YwKgIoLOtX2ijcyCx9NcghKpTVG/f1FiWSBvm541mkCPxVIVpdsU
 SOIQ==
X-Gm-Message-State: AOAM530nIaq2ZziyzbQglz4irs2OcgLxqfUwtZjknnGuFTyrt0iSKG7F
 wOMLdLUBGBu92GTU+0z7Jy/d4a05ILQ=
X-Google-Smtp-Source: ABdhPJx1dJ5R3otNWtTTxXzDjsWhxu/smbj03EhH18V2hyArUlUcXSibY3Riq3ZH2tb//9eC6BAH4g==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr3333132wmc.76.1618308708156; 
 Tue, 13 Apr 2021 03:11:48 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p17sm1851536wmq.47.2021.04.13.03.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 03:11:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/isa/piix4: Migrate Reset Control Register
Date: Tue, 13 Apr 2021 12:11:30 +0200
Message-Id: <20210413101131.3480173-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210413101131.3480173-1-f4bug@amsat.org>
References: <20210413101131.3480173-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210324200334.729899-1-f4bug@amsat.org>
---
 hw/isa/piix4.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a50d97834c7..b3b6a4378a3 100644
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
+        VMSTATE_UINT8_V(rcr, PIIX4State, 3),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.3


