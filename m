Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5F30DAF7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:21:41 +0100 (CET)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7I6G-00066j-4M
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l7I3G-0004B3-Rj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:18:34 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l7I3F-00048e-CY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:18:34 -0500
Received: by mail-ej1-x62c.google.com with SMTP id i8so19232810ejc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KM1LFbdOXok2pTmBM5h0V2HKaL6ZeJ9Dsmh8BjxEAYk=;
 b=UAEFWw03vw3qspdbuJaQAyhY/ld3hVJijn+VokPBn+NETXYhBXWT7p6OrgRxNo+pWM
 THml6FJWyMsz8elPW6M+jp4TOcWa5a1Xaz5AqpKrJKMXNjNPNkug1Xgq7FDnIY7voQeh
 1Bzyj/rPY9E+b5WNw5nRYb/6w/qtnsWjm3H06LA30izR951SKoFyA0GvPQvyBMuT28TH
 BPGEhX1wpF/SzQEJd2/qUa6SPpHrXmAkWkqpOWM2kDUEHQ1Ib/53qE8xmYvfk120kfs3
 +ZUMYU0rxlbsthgtr3CAYERXpw4p6N4b7+WIPXTP3NuTLAQ+ftTU+gv610ZpSJAcKvKy
 haWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KM1LFbdOXok2pTmBM5h0V2HKaL6ZeJ9Dsmh8BjxEAYk=;
 b=O5UNNjjFkNjvkmfuFm0wHLhL8CMKkJ8TpIH4QSpJ/oVrvP3cUfsoMOKqV5vMtv5G/+
 nwKJlR61g8doYXCvPaqg7CW1+mYlmas+RkhPrCAQvWXPpZAtnvguyhSsN+8zxz2Q74Ca
 asmM54wrddlsCJ/hgxxnQS3swL8yNc3MQNCsZBLbUQrdH4G4Q4VowVaSl9U3FZMT1Cgm
 m2mFtysQ6TOdyeVL5nGJNYhW/cSwR+hOfd0SR5uSAFiZXQjESTjsQXcqSKTjml0+IDnM
 XSWVNd1LF8A/KcXnk2s6qPi/GR5n1sDBuVjfHh22973vd2yVJeX9IyqzR60p5Ci5zrNA
 Ul3g==
X-Gm-Message-State: AOAM533Hj28TpfdXhVxB6TelIfcz2yptxAFTonvvb1jdMWv8VMK4Y0w0
 E6hGga9PcDXqsoQON8Gv77E75/ndI/5JTQ==
X-Google-Smtp-Source: ABdhPJxZazpMlaBVb3qxVctr2l9Y6nWO/luNMDHH8pAu713koKdYnvvM9DCYgw6G9sC0D84vhg4weQ==
X-Received: by 2002:a17:906:c299:: with SMTP id
 r25mr3244207ejz.80.1612358311843; 
 Wed, 03 Feb 2021 05:18:31 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g14sm866892edm.31.2021.02.03.05.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 05:18:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] pci: reject too large ROMs
Date: Wed,  3 Feb 2021 14:18:27 +0100
Message-Id: <20210203131828.156467-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203131828.156467-1-pbonzini@redhat.com>
References: <20210203131828.156467-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 mst@redhat.com, lersek@redhat.com, peterx@redhat.com, dme@dme.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_image_size() returns an int64_t, which pci_add_option_rom() assigns
to an "int" without any range checking.  A 32-bit BAR could be up to
2 GiB in size, so reject anything above it.  In order to accomodate
a rounded-up size of 2 GiB, change pci_patch_ids's size argument
to unsigned.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 512e9042ff..58560c044d 100644
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
@@ -2234,7 +2235,7 @@ static uint8_t pci_find_capability_at_offset(PCIDevice *pdev, uint8_t offset)
 
 /* Patch the PCI vendor and device ids in a PCI rom image if necessary.
    This is needed for an option rom which is used for more than one device. */
-static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
+static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
 {
     uint16_t vendor_id;
     uint16_t device_id;
@@ -2292,7 +2293,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
                                Error **errp)
 {
-    int size;
+    int64_t size;
     char *path;
     void *ptr;
     char name[32];
@@ -2342,6 +2343,11 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
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



