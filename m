Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A71058A8F6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:44:12 +0200 (CEST)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtsJ-0005Jd-Fi
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoK-0007VY-Ck
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:04 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoI-0001Rl-Uz
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:04 -0400
Received: by mail-vs1-xe30.google.com with SMTP id c3so1928526vsc.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=i6lUIAeVHV++Uc3uOSofCj5FLRg63b1CmusxkRCE8K0=;
 b=MbX8HuNaNo9Ve+hMDPQYJQ/KZ8GGCl2zgeh/HKUfw0AqtB1fJ26VSZSOsMSI+qybzr
 Z2DDSPcqq7N4/bTZaJSj6QTrzHy3Yseg1apMxjGOg0RLkV+GhFFeGByR8+BWu5/9i2al
 a6rLrxNmXMNtg5bYY5cmhmpv2SIuT5oQLdauKGZYX3D26sHHTRd6Y5R3nNc9mywnOQ8B
 WZc5+PxaHUk2XrMXlg+ez/YBIVOstIFaWOMnzrxsIa5zk3ptvzYTWjul7RG8cbbF6sF6
 SO9WiNOUeltxYbdP0DgpgnjMfqoMzzFXhWwvz4snGmt7Qy9e5Esg5FmI6ECtSk1R9we3
 C7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=i6lUIAeVHV++Uc3uOSofCj5FLRg63b1CmusxkRCE8K0=;
 b=fQGTuCXdqxZ7o81m739RYDrkBGIlZHWMQXiqkEBWbiFVbq+K5JhZI4Mpn4wCAZkrUh
 QWcSEgC/6xLadR0t1Y0sdX1xgpOwuksFdSC3DMDlBpf8QmYoA5nByWsSPv3AoKJYXKLe
 WyGTx6mkwbBvXneK9PMrD/B+aQESSEP4AqjrrUO06gdcNRSKRotUgMXvTVSx2m0Cx3Q9
 4IE2sVLnG87gfOxiqGJ1x8ipWt2l3DD800K0y86Z9YxYKJIVlIEzujgyliPRjuWOYDfK
 tdAw34PrSTj5MHH6wVYdMeKcQDJaD44WuxNOqd5D1FAdoLPyKhAuRWS9udzvrlRYtnNH
 X2hQ==
X-Gm-Message-State: ACgBeo3MmBWZfb1zGS2d6KEwNwh6xifezdeTz+fq3MeL4T55kuqdX+Fo
 iaowguxypzd/ZtCjdLrefuCyzylIOTc=
X-Google-Smtp-Source: AA6agR5E5/ayjLGixgw4v6ShKMDI4T4R+SenMx7TFHPW8dz91jG59O3VWMjs320tQ4FCPTsWuzJQBA==
X-Received: by 2002:a05:6102:2321:b0:357:c4aa:9877 with SMTP id
 b1-20020a056102232100b00357c4aa9877mr2375515vsa.56.1659692402080; 
 Fri, 05 Aug 2022 02:40:02 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH for-7.2 v2 04/20] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Fri,  5 Aug 2022 06:39:32 -0300
Message-Id: <20220805093948.82561-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the e500 machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..07c15fc181 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,6 +47,8 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
@@ -600,7 +602,18 @@ done:
         cpu_physical_memory_write(addr, fdt, fdt_size);
     }
     ret = fdt_size;
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to
+     * shrink the blob size we're going to store.
+     *
+     * The FDT is re-created during reset, so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    fdt_pack(fdt);
+    machine->fdt = fdt;
 
 out:
     g_free(pci_map);
-- 
2.36.1


