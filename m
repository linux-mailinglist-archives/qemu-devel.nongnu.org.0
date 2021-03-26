Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A98349E0B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:37:05 +0100 (CET)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaTI-0003bS-6M
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKw-0002or-GI; Thu, 25 Mar 2021 20:28:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKp-0004Hq-R8; Thu, 25 Mar 2021 20:28:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id p19so2119802wmq.1;
 Thu, 25 Mar 2021 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKDA4eVJdfRxYq1EfuTuqohDkKwpb3am+iFd4G3Hvr4=;
 b=O8+KG+/omyfE3MH1os+UijgTr/H3PK50FfNKFkjBALk6lmN9OPaXSGbEHO8OzF7pKu
 unDA/pp34Ts9CED9QY34UuHA3GIVmBEdHxsLxbht2imL0nbsecRFsU9Ec3AjMun7ouPR
 LMAsCnSI0inmmqD3evV3B7wS4NHrwnZmoEDN2v+0xMnVNYFgbw+cSHY04OwBn5M+4RoH
 SFxa+/WDTyZg2KEnBBie2EYvW7FmxAr+BsO5cRy5TVF4r+iYlNB+8r/m8Qt7EuENKijG
 GmjymdiQR4f813q7I4djwx68DYv5/CeMKNsKHmvwewG5AC/h4JOdZYB57e7FmxDl5ekF
 j7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OKDA4eVJdfRxYq1EfuTuqohDkKwpb3am+iFd4G3Hvr4=;
 b=F8ILx7UiEzpL39v7thRmK2CNojRjBc7wzwyBoeBzqahwcGkvrQYM6+C3R7BdBzGigL
 OKiEvzRLOxy9Vl99e560FV3gRMSgt0H35dR7ME2lcT0YWsiZfJJkRqIxeyHV/oweGmht
 US4ijGQnTDuFveU0leX4Sq9XHPgXwFIxeGTvfWTNSPFMs5SNEro5WKo+DjB4jRsf9o9N
 0AjE5+cg7Hzj4azJkjup3/HgeZta/AVbK1GyCtvSSU5qcRX9DZuvEgG9vrLEw3RIRJxi
 nqXYrFwD5as16OfyHEBRNNwQv4gvxLUp4CNInt3wfUHsVGimHzwnLrKgbUZ3uB7O3wcl
 AE2w==
X-Gm-Message-State: AOAM533FJWu0phlqgf9ySOWk7aYgG0Jhgy8LRo/vp2Y1GyNwiiknkRci
 2G4pfVoVSIGrFO3vhqcjv9buzpnyRNo0AQ==
X-Google-Smtp-Source: ABdhPJy1NXEfN2hkOHw1HkOWIl3+xRN70JpVZP9oEPisumT3Rs9PjqBFDq3uB88l1C8YmzpOK702fg==
X-Received: by 2002:a1c:9a09:: with SMTP id c9mr10056005wme.172.1616718492267; 
 Thu, 25 Mar 2021 17:28:12 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s20sm8211386wmj.36.2021.03.25.17.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:28:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 08/10] hw/misc/aliased_region: Simplify aliased
 I/O regions
Date: Fri, 26 Mar 2021 01:27:26 +0100
Message-Id: <20210326002728.1069834-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently a small I/O region aliased on a wide container creates
many aliases. For example, a 8 bytes regions in a 4KiB container
creates 512 aliases! As I/O goes via the slow path, we can optimize
by using an I/O region which dispatch via an address space view
of the aliased region.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/aliased_region.h |  6 +++-
 hw/misc/aliased_region.c         | 56 ++++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/aliased_region.h b/include/hw/misc/aliased_region.h
index 0ce0d5d1cef..30b54cf06b7 100644
--- a/include/hw/misc/aliased_region.h
+++ b/include/hw/misc/aliased_region.h
@@ -1,7 +1,7 @@
 /*
  * Aliased memory regions
  *
- * Copyright (c) 2018  Philippe Mathieu-Daudé <f4bug@amsat.org>
+ * Copyright (c) 2018, 2020  Philippe Mathieu-Daudé <f4bug@amsat.org>
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -25,6 +25,10 @@ struct AliasedRegionState {
     uint64_t span_size;
     MemoryRegion *mr;
 
+    struct {
+        AddressSpace as;
+    } io;
+
     struct {
         size_t count;
         MemoryRegion *alias;
diff --git a/hw/misc/aliased_region.c b/hw/misc/aliased_region.c
index 8fcc63f2648..46b4412430a 100644
--- a/hw/misc/aliased_region.c
+++ b/hw/misc/aliased_region.c
@@ -1,7 +1,7 @@
 /*
  * Aliased memory regions
  *
- * Copyright (c) 2018  Philippe Mathieu-Daudé <f4bug@amsat.org>
+ * Copyright (c) 2018, 2020  Philippe Mathieu-Daudé <f4bug@amsat.org>
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -14,6 +14,50 @@
 #include "hw/misc/aliased_region.h"
 #include "hw/qdev-properties.h"
 
+static MemTxResult aliased_io_read(void *opaque, hwaddr offset,
+                                   uint64_t *data, unsigned size,
+                                   MemTxAttrs attrs)
+{
+    AliasedRegionState *s = ALIASED_REGION(opaque);
+
+    return address_space_read(&s->io.as, offset, attrs, data, size);
+}
+
+static MemTxResult aliased_io_write(void *opaque, hwaddr offset,
+                                    uint64_t data, unsigned size,
+                                    MemTxAttrs attrs)
+{
+    AliasedRegionState *s = ALIASED_REGION(opaque);
+
+    return address_space_write(&s->io.as, offset, attrs, &data, size);
+}
+
+static bool aliased_io_accepts(void *opaque, hwaddr offset, unsigned size,
+                               bool is_write, MemTxAttrs attrs)
+{
+    AliasedRegionState *s = ALIASED_REGION(opaque);
+
+    return address_space_access_valid(&s->io.as, offset, size, is_write, attrs);
+}
+
+static const MemoryRegionOps aliased_io_ops = {
+    .read_with_attrs = aliased_io_read,
+    .write_with_attrs = aliased_io_write,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 8,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 8,
+    .valid.accepts = aliased_io_accepts,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void aliased_io_realize(AliasedRegionState *s, const char *mr_name)
+{
+    memory_region_init_io(&s->container, OBJECT(s), &aliased_io_ops, s,
+                          mr_name, s->region_size);
+    address_space_init(&s->io.as, s->mr, memory_region_name(s->mr));
+}
+
 static void aliased_mem_realize(AliasedRegionState *s, const char *mr_name)
 {
     uint64_t subregion_size;
@@ -63,7 +107,15 @@ static void aliased_mr_realize(DeviceState *dev, Error **errp)
     span = size_to_str(s->span_size);
     name = g_strdup_printf("masked %s [span of %s]",
                            memory_region_name(s->mr), span);
-    aliased_mem_realize(s, name);
+
+    if (memory_region_is_ram(s->mr)
+            || memory_region_is_ram_device(s->mr)
+            || memory_region_is_romd(s->mr)) {
+        aliased_mem_realize(s, name);
+    } else {
+        /* I/O or container */
+        aliased_io_realize(s, name);
+    }
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
 }
 
-- 
2.26.2


