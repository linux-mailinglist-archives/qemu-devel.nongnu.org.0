Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2D5AC833
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:52:54 +0200 (CEST)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzQ5-0006Mk-H2
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9Q-0007FA-Io; Sun, 04 Sep 2022 19:35:40 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9N-000586-0v; Sun, 04 Sep 2022 19:35:40 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11f11d932a8so18073413fac.3; 
 Sun, 04 Sep 2022 16:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=16WddNSZhqtrCV5F9Z1jI9UMmcItES0z/obJPMI510U=;
 b=DZ+PqfAvWVXHN0M1UNlJqMsdiSSARtcCB90uMK2PHe5KEIk8gARk4V9iXgTYqdazDu
 sQ/GWrUj7tar7WqwHA1mx+iHTDbxZobe8zHXqtIC4Dd688+Ojn3vhGzrL0j0XaLvkK1o
 5Hc4XuKdhDg5UpVn3lnbyUkd6V5VOpqhXHkd8HE8YhQIpj1jMOy2qRTksU7SlY3T8OD+
 9NzIDok+tI9l1GChC9sTTnbErDiq+NsovcuxHHSLKiydliovD/Y4Y+3QoJ5deZW4ISJl
 ACvv/F40aOUX9fN6SsPxighb7Bg+BJ3jBay8cuuq6YEj4VGZYgrC4PuWbauNvIGX4SmS
 s15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=16WddNSZhqtrCV5F9Z1jI9UMmcItES0z/obJPMI510U=;
 b=J6XWB4nGYmpx1laXAgm1rzGJlSsAfu+oy3aBpXek8mKdJOVLXPhVH7gciPqetYocEf
 Y1h7UO+tf1YjO3i/MpOZ2DaqjyoK1s90JvLqTuWQ8f8jYS5qBW54Og4nd78fuStUKZZ6
 gxL9+nayT30zZ6584PGMuKujkV1P2EKRAet/ba52c+O6q17SHWADqNqxmf1SbXnF5akl
 gNtYQfgNPcJDCZkIqO9ti2ns+ddJ95GbubG4ocDe6QNtb1eCIgj/H4/4PxnKdS3rH2Yo
 sMP601enl1B4BaNgSn0PoAyWpwJBdeazq1ZHoHaLRaCfas1dY1Tdjckdzw0hjkOcZDDn
 D4zA==
X-Gm-Message-State: ACgBeo3Xe7QjFKGZA6L87iVYlwdsHLoSF+xodWhLypLVqsjyT3SED4V+
 59bzAyNPnxFQVIWN1PSQJ6qKFHFqSj83Ng==
X-Google-Smtp-Source: AA6agR5/Onc8Rm0L3rssF+7hUGNDOZUwwoE/dJxm0m+VkPCBqBTkedfuyeMsi3lzrfs4ILIM533jmw==
X-Received: by 2002:a05:6808:a19:b0:344:13cb:afce with SMTP id
 n25-20020a0568080a1900b0034413cbafcemr6815946oij.255.1662334533218; 
 Sun, 04 Sep 2022 16:35:33 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v6 13/14] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Sun,  4 Sep 2022 20:34:55 -0300
Message-Id: <20220904233456.209027-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

This will enable support for the 'dumpdtb' QMP/HMP command for all
xtensa machines that uses a FDT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/xtensa/meson.build | 2 +-
 hw/xtensa/xtfpga.c    | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/meson.build b/hw/xtensa/meson.build
index 1d5835df4b..ebba51cc74 100644
--- a/hw/xtensa/meson.build
+++ b/hw/xtensa/meson.build
@@ -6,6 +6,6 @@ xtensa_ss.add(files(
 ))
 xtensa_ss.add(when: 'CONFIG_XTENSA_SIM', if_true: files('sim.c'))
 xtensa_ss.add(when: 'CONFIG_XTENSA_VIRT', if_true: files('virt.c'))
-xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: files('xtfpga.c'))
+xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: [files('xtfpga.c'), fdt])
 
 hw_arch += {'xtensa': xtensa_ss}
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 2a5556a35f..867427c3d9 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -50,6 +50,8 @@
 #include "hw/xtensa/mx_pic.h"
 #include "migration/vmstate.h"
 
+#include <libfdt.h>
+
 typedef struct XtfpgaFlashDesc {
     hwaddr base;
     size_t size;
@@ -377,7 +379,9 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
-            g_free(fdt);
+
+            /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+            machine->fdt = fdt;
         }
 #else
         if (dtb_filename) {
-- 
2.37.2


