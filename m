Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1C3F9E9C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:16:53 +0200 (CEST)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgPC-0007xq-WA
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mJgNC-00070i-AU; Fri, 27 Aug 2021 14:14:38 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mJgNA-0003ob-R5; Fri, 27 Aug 2021 14:14:38 -0400
Received: by mail-qk1-x734.google.com with SMTP id t190so8120496qke.7;
 Fri, 27 Aug 2021 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uttmlEu4SLM81EZMF649p5K2ATVUObZfQHeNzdItPxg=;
 b=J+FAlwnHXhAmCjGyGaKE/clEaPo0Jr5EOTdYkv37VdfUIYIvsGkoJKWXBIWsVmuc6L
 B3W8cZa7RksUY4SBx8ofn91VzMDKY+m4SvLP+lXFSgedpSf5AbqrOgTPtOioAF64KzjW
 Okp4fZHtSv4GEKNcIDSqxtYPd+Zl1ZNas7LYTWWSGGUg5P9ZdOMACUbCjZz/FcZU34R1
 hQbvIVSNT1l02liy98S83BuW3ozO6NmMujp9/+Oqs4fUaR+hlLeoM+gDCxf/Sy3U1Hh5
 0qrK7KBQMcTRrUW3OhdH+/6+sJgXxNCnBdw8pZ/iTBrpGulMxyIQAqXQAqEe9hKzaOAH
 S8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uttmlEu4SLM81EZMF649p5K2ATVUObZfQHeNzdItPxg=;
 b=Dk54JffFEaPsmll+JP1eMiWkeOqPqePp0l9DsbAkZAJWI/nalIYZiCkNlPNrV6LOll
 y3YcznpPAzd9Oa9gW01J8MbJvMOZYM2KIbZ1/iDGZc48dngwEWAfLyee4WDTjRl5zzXy
 b17GkUqUwB1Gek+7FQmhc6SlhsxP7R9IeZ/CHtxg1AM0txLgBF2Q0F0XeRHoErOQEwfS
 Nn+VB6kqpH8NCUBpzi42sUDPwD6V4xC2Uwqcm6X3z+hGYw1/zI0pxFpVsiYoO0UyLe2q
 xrkPHWnBaeBp7yQwy5Om8Ri+DIKc1JiNXTpMLyXSe2Oww/v1JLZ//+e6dPx0139WdOAF
 Ym+Q==
X-Gm-Message-State: AOAM533LFaIS5nOA3V5XZsJinJZl+YCOxes/HHFz8p3QPueGfnmsg2ep
 UqNOZjnOdafUtgMfi3Q3CKs=
X-Google-Smtp-Source: ABdhPJy9IGDROYD7SQ8xl8h8/cLAkunoMDh031ZRVBghDA33lXvl7fbRt5JgVJ8KyfUd1vsayQ+qOw==
X-Received: by 2002:a37:9c8c:: with SMTP id f134mr9895357qke.50.1630088075512; 
 Fri, 27 Aug 2021 11:14:35 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id l13sm5206830qkp.97.2021.08.27.11.14.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 11:14:35 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: groug@kaod.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, hsp.cat7@gmail.com
Subject: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
Date: Fri, 27 Aug 2021 14:14:29 -0400
Message-Id: <20210827181429.23609-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was having a problem with missing video resolutions in my Mac OS 9 VM. When I
ran QEMU it gave no indication as to why these resolutions were missing. I found
out that the OpenFirmware VGA driver was not being loaded. To prevent anyone from
going thru the same trouble I went thru I added messages that the user can see
when a problem takes place with loading this driver in the future.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 hw/ppc/mac_newworld.c | 6 ++++++
 hw/ppc/mac_oldworld.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7bb7ac3997..c1960452b8 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -526,8 +526,14 @@ static void ppc_core99_init(MachineState *machine)
 
         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
+        } else {
+            printf("Warning: failed to load driver %s. This may cause video"
+                   " problems.\n");
         }
         g_free(filename);
+    } else {
+        printf("Warning: driver %s not found. This may cause video problems.\n",
+               NDRV_VGA_FILENAME);
     }
 
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index de2be960e6..96603fe9cf 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -367,8 +367,14 @@ static void ppc_heathrow_init(MachineState *machine)
 
         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
+        } else {
+            printf("Warning: failed to load driver %s. This may cause video"
+                   " problems.\n");
         }
         g_free(filename);
+    } else {
+        printf("Warning: driver %s not found. This may cause video problems.\n",
+               NDRV_VGA_FILENAME);
     }
 
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
-- 
2.24.3 (Apple Git-128)


