Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C6308D5D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:31:58 +0100 (CET)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZUr-0000c6-5j
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5ZRl-0007iB-6U
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:28:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5ZRj-00074r-9H
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:28:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c12so9957042wrc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AzYhMXskdJJjtZLtwvwFrwykEA7TzJv7brNc4V8DwwQ=;
 b=T+0WR4g0R9JUihpKjrkHemFcAtSqlzspGH8v8sRYC1V1QMFLK0R9AS05hhXk8GzhCd
 Baq0Lf+GoxxOo1qOyPvpajtm03rqYe2CfngXsNz6Su/L0ojbUOVnLQwGOt7NT0n4og0K
 tg1EAdb7d2goY45/miycO1umu0danQfP8fJeFeFqTZjaInkCsyFhnxVu8XTPygrcHQ1S
 5mbb6YXU5D/szm6O265+LB7bH7z6gdcNwnH3CKizfpouTfStPHFY+T+Mu1GG75JDIKlt
 QwRQsj7Obc5WEgHWAy7uLG446e5gEArdG5cor1uh2dUFJU4p0nwoXQpxo9PXU5VcDr5i
 g1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AzYhMXskdJJjtZLtwvwFrwykEA7TzJv7brNc4V8DwwQ=;
 b=opRc5SCRy0d+4IeYKvlfyzk7KFI3D3mKfNbYDY4jD3Z+QOzsmdU3Jg4X0oYWKmqd/K
 17IVkQJB9qZWXelo5zAhzAsvDtWKpB5mRIduIaAz3JGMLHXItzCXdWthd2DqbGUJOAue
 CmNr5voXkgfMvKIgVMXDSn7lY2nbsTylDZH+nFawHYtfVMuFfPEBCDeguxs9x3Z8H91W
 d9JkjJNF+5guTao2gDmQw5Km2/g/gUM8bsFxh13lnn1J6Q/4Q6b2QI3pOF4E1zyqu6kl
 rI1I/r+a5mLVPz43HoPCurLSLcHyFnVrcZfVtvnTVJ6BwXpL+fvueQ8URLaaXEQGMfO6
 mN7w==
X-Gm-Message-State: AOAM530G4e11nYae1qu5IqERcyo1ynaRd5ce6IGujVEUgh+TiY23CfZs
 o6rMXMASPlrd5kNuyjx0AX/dxSEeeXnqKg==
X-Google-Smtp-Source: ABdhPJwm583lXGNZqKPsn39SYMDSzZDjmpHFvoiUdiihS9FbR/oaYlCllbTbp47NjjOgphFe8zeGLw==
X-Received: by 2002:a5d:5908:: with SMTP id v8mr6436747wrd.113.1611948521600; 
 Fri, 29 Jan 2021 11:28:41 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id l18sm10964528wme.37.2021.01.29.11.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:28:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] pci: reject too large ROMs
Date: Fri, 29 Jan 2021 20:28:37 +0100
Message-Id: <20210129192838.582771-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129192838.582771-1-pbonzini@redhat.com>
References: <20210129192838.582771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: lersek@redhat.com, dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_image_size() returns an int64_t, which pci_add_option_rom() assigns
to an "int" without any range checking.  A 32-bit BAR could be up to
2 GiB in size, so reject anything above it.  In order to accomodate
a rounded-up size of 2 GiB, change pci_patch_ids's size argument
to unsigned.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a6b0c5602e..bbce10050b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/datadir.h"
+#include "qemu/units.h"
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
@@ -2258,7 +2258,7 @@ static uint8_t pci_find_capability_at_offset(PCIDevice *pdev, uint8_t offset)
 
 /* Patch the PCI vendor and device ids in a PCI rom image if necessary.
    This is needed for an option rom which is used for more than one device. */
-static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
+static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
 {
     uint16_t vendor_id;
     uint16_t device_id;
@@ -2316,7 +2316,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
                                Error **errp)
 {
-    int size;
+    int64_t size;
     char *path;
     void *ptr;
     char name[32];
@@ -2366,6 +2366,11 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
         g_free(path);
         return;
+    } else if (size > 2 * GiB) {
+        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
+                   pdev->romfile);
+        g_free(path);
+        return;
     }
     size = pow2ceil(size);
 
-- 
2.29.2



