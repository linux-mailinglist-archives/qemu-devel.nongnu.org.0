Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DA3FB71C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 15:42:06 +0200 (CEST)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhY5-0004DP-5d
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 09:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mKhWJ-0002Id-Hz; Mon, 30 Aug 2021 09:40:15 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mKhWI-0000vq-4m; Mon, 30 Aug 2021 09:40:15 -0400
Received: by mail-qt1-x834.google.com with SMTP id t9so11652270qtp.2;
 Mon, 30 Aug 2021 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3KaARbSeSFIGfKqTvgS3Qm1pmrdyji3JLfRUxEyn68=;
 b=pF99jx/YXkV1TfF/GoIZYE5ZI3oZdWLbWHPLtZPsje7VKAUi7XFh87F642iBhiHEEF
 ez3nnfDRDA6VEb904z9eY2EQoAH8bbK9nZgR1yX4A0jXc8bbRGc6lNk7UiGgF+BvrrC0
 14PVmwB8v6mu36lsPKgLURgaVkgu+B1ABnOCi3BsnarQn6MyPGUUvmGviPkiZguwOF0j
 tI0Whbtit/72vBtFnw/3RdbWnS9oGfHxdTjGtgnIT99aWj2l7AwiDS50hmwqIUXOnlNV
 69I0xROqI6jKU1A/ipk1Af6NGsRXVxPZESW6tq70NkuyiPACiB3bhom8puM4M0/bTMGm
 rWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3KaARbSeSFIGfKqTvgS3Qm1pmrdyji3JLfRUxEyn68=;
 b=eC7D21IeoiBLrnqxrxSdUW4izFYVUOFvTpOwtvzmKRMsc36X2Yc3ih2hX36b+YmUK9
 WS8jOCEV96GT8wjvLAWEVkwd5IOp7NUzSjmihJ+3Tc/yxKOWzKuj00NDzZt6MnFHAfgN
 G9A8tiqHcdPM9xeVaZfhc6u9afjk1nxR1paY/3jNn8YbNBbEUfH5rtxehPVxG7fVX+bq
 Ow/Q7nVM+c6sQ0fbUCHa8Ig+CDP1oqRCvkTs0cYFM4XTMhItZtGAdvO/eX70KKyzdZvs
 n86wUz0SKbl/LGBytRHqQmiXfYhGTLianthr7i3J6B2CeS22V+iQpEqskIGkQswo7wrL
 bywg==
X-Gm-Message-State: AOAM531v9OOcwFWto1KIoMBCkW3eG4gzZV+I8H6CvPyh0x8igiLGw05n
 ST0KWfKiJTIt3Ks2KgZDy40=
X-Google-Smtp-Source: ABdhPJzNDsrbGsl5XnPanEGPj1CbFZFuwBNwrGfA0+v4ZNtlWjhoVDUUjaP3cGrfzory4ll8imZriQ==
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr20721743qtb.367.1630330812307; 
 Mon, 30 Aug 2021 06:40:12 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id 207sm11815266qkh.45.2021.08.30.06.40.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Aug 2021 06:40:11 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: groug@kaod.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, hsp.cat7@gmail.com, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org
Subject: [PATCH v2] Report any problems with loading the VGA driver for
 Macintosh targets
Date: Mon, 30 Aug 2021 09:39:45 -0400
Message-Id: <20210830133945.11264-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x834.google.com
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
v2 changes:
- Replaced printf() with warn_report().
- Removed newline characters from messages.

 hw/ppc/mac_newworld.c | 6 ++++++
 hw/ppc/mac_oldworld.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7bb7ac3997..19a142cfe5 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -526,8 +526,14 @@ static void ppc_core99_init(MachineState *machine)
 
         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
+        } else {
+            warn_report("failed to load driver %s. This may cause video"
+                        " problems.", NDRV_VGA_FILENAME);
         }
         g_free(filename);
+    } else {
+        warn_report("driver %s not found. This may cause video problems.",
+                    NDRV_VGA_FILENAME);
     }
 
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index de2be960e6..041ccebe25 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -367,8 +367,14 @@ static void ppc_heathrow_init(MachineState *machine)
 
         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
+        } else {
+            warn_report("failed to load driver %s. This may cause video "
+                        "problems.", NDRV_VGA_FILENAME);
         }
         g_free(filename);
+    } else {
+        warn_report("driver %s not found. This may cause video problems.",
+                    NDRV_VGA_FILENAME);
     }
 
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
-- 
2.24.3 (Apple Git-128)


