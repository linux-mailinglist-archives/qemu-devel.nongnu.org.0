Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3554C983C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:18:05 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAom-0003SO-SL
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAYA-00028k-88; Tue, 01 Mar 2022 17:00:55 -0500
Received: from [2a00:1450:4864:20::62e] (port=41709
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAY8-0005Cg-1N; Tue, 01 Mar 2022 17:00:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id a8so34276639ejc.8;
 Tue, 01 Mar 2022 14:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=avhaKv0OePo1BmfKI7VpTNy8hAfHuZrWFlrW2+mi2p0=;
 b=E5rqKahHI03rGYMPsXPex5WGFHLy3rmIxI0KE7RioNRvORijHchcN8FwxaPmvEB0jU
 zZE+nimiyeSxgxsM+l1ZnK6J8dz0B3b98sdhvnXj8K8k+aaDN+hZvSJsqRFNKNAHT1uD
 jim/yO6eP49lMynfTPECKXNZ2zpGUBDD5yf1oDE7ocqv9DqCFWzxPK6+J1HEn8aLJvZu
 gcT+VatQMhQDnJGd1mRWVGnr5+ODY1ya4gleUiXwgRLmZpW/3xKuOU3nC/uNaSkwQh+R
 135k+jAHN3jFlz8tbgi0MmhHRit3fZp3kkHvYNrNAGUGOS2DzS4lAaIGMGo+ef75zJ12
 FUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avhaKv0OePo1BmfKI7VpTNy8hAfHuZrWFlrW2+mi2p0=;
 b=4ALHJeaVDUVFtRVLqB+wlI86loz9n9/dJfVQLr7pvo8ptZyRArWwAWSbAb/OhsTjR0
 21V87rhcaHkxat1TxbRUQ/kjE3qQEOexcPI6lscqGQvsRpJldEUt9upICi7kY15vA9kI
 sS+3riYUYkigFUgNx2yQRubEjFz0lGP7EEWLADR3g2dI9Bpy6YTdinFlKBt43VErEVRp
 XStY3bAy3bWFU/r6LIenLlgLq4HFvXAaAZq765KlMr4uOp63Bc0nL9CXAOc+MjhzUOLD
 7PG4AjZHxDU1DO+x15oIQse7l7y+FixTH8YE5ghH9a+7de5BHKU3vnmOeeOD/DIytzUk
 3/JA==
X-Gm-Message-State: AOAM530PqS1WOCBbNpnf+FGXWNY3E1uIGa1aQNYdtXOZzOYtPsTs5ErG
 9QjkykytI4oM7EBmi0tAxyaxNTFuBAc=
X-Google-Smtp-Source: ABdhPJzBP/vmW+a2unZGRDVKBc5JF+8WS8KA6HgA6XPqXJyrdBY1tBuTtdmnO+8E8hWVn4f/Kf7+3g==
X-Received: by 2002:a17:906:3a4f:b0:6cf:86e0:586c with SMTP id
 a15-20020a1709063a4f00b006cf86e0586cmr20577932ejf.626.1646172050340; 
 Tue, 01 Mar 2022 14:00:50 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] hw/ppc/pnv: Determine ns16550's IRQ number from QOM
 property
Date: Tue,  1 Mar 2022 23:00:35 +0100
Message-Id: <20220301220037.76555-6-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:PowerNV Non-Virt..." <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the IRQ number in the same way as for pnv_dt_ipmi_bt(). This
resolves one usage of ISADevice::isairq[] which allows it to be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/pnv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 837146a2fb..441bf958ca 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -380,9 +380,12 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
         cpu_to_be32(io_base),
         cpu_to_be32(8)
     };
+    uint32_t irq;
     char *name;
     int node;
 
+    irq = object_property_get_uint(OBJECT(d), "irq", &error_fatal);
+
     name = g_strdup_printf("%s@i%x", qdev_fw_name(DEVICE(d)), io_base);
     node = fdt_add_subnode(fdt, lpc_off, name);
     _FDT(node);
@@ -394,7 +397,7 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
 
     _FDT((fdt_setprop_cell(fdt, node, "clock-frequency", 1843200)));
     _FDT((fdt_setprop_cell(fdt, node, "current-speed", 115200)));
-    _FDT((fdt_setprop_cell(fdt, node, "interrupts", d->isairq[0])));
+    _FDT((fdt_setprop_cell(fdt, node, "interrupts", irq)));
     _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent",
                            fdt_get_phandle(fdt, lpc_off))));
 
-- 
2.35.1


