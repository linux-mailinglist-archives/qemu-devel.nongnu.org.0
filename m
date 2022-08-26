Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B3B5A2954
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:25:43 +0200 (CEST)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaHD-0002ga-9D
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4F-0007ic-52; Fri, 26 Aug 2022 10:12:15 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4C-0003sz-L4; Fri, 26 Aug 2022 10:12:14 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 6-20020a9d0106000000b0063963134d04so1085777otu.3; 
 Fri, 26 Aug 2022 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=W3OSa9MXxQstpQEShZr7qGq0YKfPJLRHYk7eRBvuzgA=;
 b=RXS9ueKQT7snOt03t+/CILiwktXWtLK5N8PUfa7ylZiUB6AcDZZlkoTkjA8tqV6E1h
 HNk4cC56dsJDFvdpFpJmSG6iVkpWJK8+DURIvlVIFDKdLqLocvxivUcZrP/nAbknlGXN
 WtBwotDyGYphPTHB+wbzFVXhPvLMSI6r2DsZlLIObk2/fGnP4Cxqh60t5ukNThTss7ku
 a6mdnqnfpam0qylXHpUGslmfDg32eI1vFS9snvo8Evj/2IjA3O0cELJhJlvLEwp+KZjQ
 pMfHIouZGakqGptslaQ06LpNVKYvhc6pgGj49j9BIQ6z1wW5grb5faMoOi37oNS8sk5H
 VLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=W3OSa9MXxQstpQEShZr7qGq0YKfPJLRHYk7eRBvuzgA=;
 b=5fIXNYnNetiV+04MmnsynK2t20z23eX1XpVZ6SpmibFq7T1MzLhhQAnqcr4mW+kJM8
 TjExkHt81xCy2rOC4XZgK7oxC4s3vXyzBW63orAXL3iSPi4OvMx0FUJZ3niQSAQWLHsl
 WLxdgTkMNEK5zSAaW372GUeb0ny6YF7G9fiW5tDsrIv+MhIJKhqCEW3Jtknrue+xMxFC
 6sE7L3g7OlzBkPQoEWz3NOAz/8jhPWfmXPJqLgGP0u1y0zUklj807+zg6mQ0S5rLeSwk
 YsAebNZAcE0PJCKblnX6/wIxf6q+1paKRIVBBbk/QZVnmkC9UQEK7nVlKFR5Kwy4zD9v
 EiSw==
X-Gm-Message-State: ACgBeo3BAdt72vTNcIUWSdeEZyphtzwRGgsGlUsPKGotiKiKsamwm37Q
 kjfthUAnaIL62hcQiHvJJApdmyJu9l0=
X-Google-Smtp-Source: AA6agR4WvfRz1L4IA/1cFDkM/cL0jTMycWadjZ28kiMbaIG1Yl4jRRjjk/UnAf88vSPM3euL/nmWyg==
X-Received: by 2002:a9d:4f0d:0:b0:638:b3a7:81a1 with SMTP id
 d13-20020a9d4f0d000000b00638b3a781a1mr1396568otl.266.1661523127454; 
 Fri, 26 Aug 2022 07:12:07 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 04/21] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Fri, 26 Aug 2022 11:11:33 -0300
Message-Id: <20220826141150.7201-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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
 hw/ppc/e500.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..6197a905b8 100644
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
@@ -600,7 +602,16 @@ done:
         cpu_physical_memory_write(addr, fdt, fdt_size);
     }
     ret = fdt_size;
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     *
+     * The FDT is re-created during reset, so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 
 out:
     g_free(pci_map);
-- 
2.37.2


