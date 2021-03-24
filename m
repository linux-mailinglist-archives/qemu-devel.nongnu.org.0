Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A634828B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:05:57 +0100 (CET)
Received: from localhost ([::1]:44198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9lL-0006VE-UX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP9jB-0005ph-Qj
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:03:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP9j9-0004yf-OR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:03:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so3299859wmq.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mysaMOiFaLcROftTce1IldDkRwwnjt3o3BkfEv1lkKY=;
 b=nPH39AhTEpVg678reqDF34P3blN7eFq3HPEOEUl70mlEKxN1kuJ0/1UcfoKhlrSXBo
 YFfHuQmptKWrazCfUMnrRBRvHCg1WF+FNV/kwMF7wJaoyCI+/blR0KWm4h2+6lVM86UJ
 EilQZ7aJ67Ez1QH2V9hzdWEmwMQVWkYwiarERoobi71Uz/PsumGxsDnibdXhaSqL0eZK
 whCNKNuILamB/ndSU0vUhybmf/DcLGPW4u3aZI6oEX3jbomhk+FvGmkEeqoYD/sdOMoc
 aF/bdRl8Z0OSoRpzfCgDduI55K0cH3fycXXNaw0IlVT9CTDaBcXwT9FmuOluOM+Nx9GT
 xtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mysaMOiFaLcROftTce1IldDkRwwnjt3o3BkfEv1lkKY=;
 b=PbwcNVs0DuJpWrqeF3GABtLBJUASEstbB2PJOvz36DIcXSSXfTtFqZKNoj1L/FRXDt
 SzakYwxe5ssL2tS7ooHHFlKYdz0PPpE4NLsk/ZDZi+nJtGJshe3gZI4Ty7xjqkUVh+D5
 yD5skNhWmVIXLLh4oAEpHGhkbrkb0X8FDgjE/1cTuQqWFuhhEUhRLfn5pJfzGIm2akAg
 vTtKQqWQxWz2c6VLAM3S1gtaScdsCmueIbBCdxkEjvRf6PGsxXFDpzzpP1h8ipENMRBI
 JJZe9lgkj1KLsXH/bX0egFA+qPrEieBHc3Y5US1lD08i+icsMr+2WLPdSfKSjSxbZGp8
 e/Yw==
X-Gm-Message-State: AOAM530HZTN7VGIVGk0pmlkXMnZFhBaU0hyBZMjKbphwgV5+5Hwabob7
 jCCwATvkRnnIuA72h44YHusdr0atd8HkLg==
X-Google-Smtp-Source: ABdhPJwJBc5u3GiFTAE6YrOCOboPtV36KKDO8yxTBCHTV5fboap2jzeGdrL5qBl6l7XZC8Mdm6utSg==
X-Received: by 2002:a1c:e18b:: with SMTP id y133mr4547876wmg.22.1616616216632; 
 Wed, 24 Mar 2021 13:03:36 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q9sm4422994wrp.79.2021.03.24.13.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 13:03:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/isa/piix4: Migrate Reset Control Register
Date: Wed, 24 Mar 2021 21:03:34 +0100
Message-Id: <20210324200334.729899-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
v3: Use VMSTATE_UINT8_V (Dave)
v2: Add piix4_ide_post_load() and describe
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
2.26.2


