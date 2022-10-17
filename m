Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09F601807
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:49:16 +0200 (CEST)
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW6s-00075u-Sh
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgJ-00046G-Vn; Mon, 17 Oct 2022 15:21:48 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgD-00031P-Fq; Mon, 17 Oct 2022 15:21:46 -0400
Received: by mail-oi1-x236.google.com with SMTP id y72so13251583oia.3;
 Mon, 17 Oct 2022 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ya0usZjpo+eHVeEl1xh5Y1FiouQtJmroW9MogSfqU7U=;
 b=pzlAgUsqosuwpKnLibS9nwPnqnwp9DiNa/y1Y0wBI15vUaUd2vfRoVRyP5eYcnt03H
 0/JmlttsUeONCiP8aOszoOqi3yqus46V5TfYDlVa2LLcbKlyl/jbqMCCU420EYpco5is
 Z+LgfgLsc0p6W6pg0Hdpi+3063Zxcja4e9pNG/kcmJqXn4Dpop8cfLtoB8nVPX+NFLEi
 PtQl1Mhl3ug1WY045tMX9S2D6G0XrcqufBN0bQWThD2MMJsAOZasr56TNPc3ZHt82smJ
 CADhW2GTnCfrB1S794ROn11AsnrXDVjUS/aRk7NsUYEsr4Bl+OO7tUAzm6InSdqcjWYc
 Mv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ya0usZjpo+eHVeEl1xh5Y1FiouQtJmroW9MogSfqU7U=;
 b=EaZfYN08aPbBc7x+762iLFyW/2V2mhWdLkx1C+p44HhANHDYU2BwuwrzfP9eyBWpfZ
 WsHHndacKD75aV7TbvZEqLY/rXfp6YWjbtqk2j2iR1S1yhKEXZE91OqmlBp4N30Comms
 8m/fUdtjaX7BVjpnDPCACF5z6RBAg0zM234tWVdAs3s2oFBxRGv+I+e2GAdVFhmbdo+M
 zDhlPXWpNI0s+RPtqiBuLZSzgO5GniQQ6vXLKhFAdMWZdWBAmljZdmCC7EHxNzkVSBAG
 /Qw0iHJ67WKV5oGfs/aIEPtHQZFN/cxRt8L+EdPvQRFxMbLi5XCDHRIMpgADEzKiQ9OA
 F6bw==
X-Gm-Message-State: ACrzQf0ZKWu/ynwVxISX3aVdDXZugfpMS+xnAezMdHvAA9kXztC+xn4F
 W9F/qciS/MjuSxcbBx47HHaTLm/sVS8=
X-Google-Smtp-Source: AMsMyM4bUtiLdqtFDvQloJO5xeQacAeVtGvroK/OtHJFv0Etkw264yxu4vT1uEiXlYFuxjPJN7vi7Q==
X-Received: by 2002:aca:4b8b:0:b0:355:4433:d3ef with SMTP id
 y133-20020aca4b8b000000b003554433d3efmr712099oia.282.1666034498534; 
 Mon, 17 Oct 2022 12:21:38 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 30/38] hw/nios2: set machine->fdt in nios2_load_dtb()
Date: Mon, 17 Oct 2022 16:20:01 -0300
Message-Id: <20221017192009.92404-31-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' QMP/HMP command for all nios2
machines that uses nios2_load_dtb().

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-7-danielhb413@gmail.com>
---
 hw/nios2/boot.c      | 8 +++++++-
 hw/nios2/meson.build | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..b30a7b1efb 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -43,6 +43,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 #define NIOS2_MAGIC    0x534f494e
 
 static struct nios2_boot_info {
@@ -81,6 +83,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
 static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
                           const char *kernel_cmdline, const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -113,7 +116,10 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
diff --git a/hw/nios2/meson.build b/hw/nios2/meson.build
index 6c58e8082b..22277bd6c5 100644
--- a/hw/nios2/meson.build
+++ b/hw/nios2/meson.build
@@ -1,5 +1,5 @@
 nios2_ss = ss.source_set()
-nios2_ss.add(files('boot.c'))
+nios2_ss.add(files('boot.c'), fdt)
 nios2_ss.add(when: 'CONFIG_NIOS2_10M50', if_true: files('10m50_devboard.c'))
 nios2_ss.add(when: 'CONFIG_NIOS2_GENERIC_NOMMU', if_true: files('generic_nommu.c'))
 
-- 
2.37.3


