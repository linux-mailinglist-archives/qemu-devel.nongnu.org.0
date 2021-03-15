Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F5633C9F9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:37:24 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwm3-0002oC-TN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkP-0000zO-CM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkM-0005tT-Ac
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61MR0XWqyaDqUOghlQbgzXPLZ3MUcZpD5yT7NkV5FWI=;
 b=Qq0CGsKw/X4ANqOembsH4w96Ns+vwWHbEjqxmPCWARWClqpIzXtNhDWOl5uGnf7Dopg3rp
 K0MCl4fidBiiX0YBFH8HWt6RS8nO4ZBruSmT1JwXC3qvqphAIDbQhh3W7bOlJP4bnWDM/B
 MNqTTqEPCL3mEw5Ba6CMK24CpLGhZHs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-SieT-sFyPPWNkTeoP6n06Q-1; Mon, 15 Mar 2021 19:35:35 -0400
X-MC-Unique: SieT-sFyPPWNkTeoP6n06Q-1
Received: by mail-wm1-f69.google.com with SMTP id s192so8858188wme.6
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=61MR0XWqyaDqUOghlQbgzXPLZ3MUcZpD5yT7NkV5FWI=;
 b=aavo8zmBTFChudIeEUX62hgveTGec4wPWjMbH3JwbZp5CtOQibs5GKtOYcGaqO8ehF
 VCzmwDJCx7PQaMq0mMcDH51MoTU78jc9IelpGv5gtrXRTvNbSj6A7+ytmsf34R4te35c
 djT4bGLAWKiyJNQ6CQ5ppuau8tsPZ7KvlhMJT2jDV3hpr3yfNZJe/CcFzpiK5kj5JTer
 eqt6yjtl5T7yLy1h09mFO0cNWXqnD3De8zBCRkL+s+Pi1hrzudALnjrlLvDNFhHCtVEa
 Xd1CxsEyg1myiO7AaX5RzQNe2uGvS8XO7v+CBJTNfEMZrBq4s97PMyWeZgxqTG4Qy9wp
 pkJw==
X-Gm-Message-State: AOAM533KVqZEaQB+5HldKDFtFXqxPFP4ctb5H5vf2QRakfCo/imeIhLy
 acgYTXjrv2tYhxnozDVkgth52vEpntGKUtcFnkfb5SLllIsn9RI+2wF3q9Ui3gwfThNFqoed7Fx
 8Z7enfBUcKc219RS12pHq0g8t1Ifa1ARr7/W9ja66DGf+FXa+e/nM2Y+RyeN3lenn
X-Received: by 2002:a5d:698d:: with SMTP id g13mr1963958wru.2.1615851334318;
 Mon, 15 Mar 2021 16:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw41BLkwpQXtSm1SApHYoevWNDykwAHZT/5sVnSAe9jRkUUMjKxezIXAo1IG/ko+C+/K4a5ZQ==
X-Received: by 2002:a5d:698d:: with SMTP id g13mr1963931wru.2.1615851334013;
 Mon, 15 Mar 2021 16:35:34 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d16sm19839965wrx.79.2021.03.15.16.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] hw/block/pflash_cfi: Fix code style for checkpatch.pl
Date: Tue, 16 Mar 2021 00:35:17 +0100
Message-Id: <20210315233527.2988483-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210310170528.1184868-2-philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 36 ++++++++++++++++++++++++------------
 hw/block/pflash_cfi02.c |  9 ++++++---
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 526b70417de..248889c3d02 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -115,7 +115,8 @@ static const VMStateDescription vmstate_pflash = {
     }
 };
 
-/* Perform a CFI query based on the bank width of the flash.
+/*
+ * Perform a CFI query based on the bank width of the flash.
  * If this code is called we know we have a device_width set for
  * this flash.
  */
@@ -125,7 +126,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hwaddr offset)
     uint32_t resp = 0;
     hwaddr boff;
 
-    /* Adjust incoming offset to match expected device-width
+    /*
+     * Adjust incoming offset to match expected device-width
      * addressing. CFI query addresses are always specified in terms of
      * the maximum supported width of the device.  This means that x8
      * devices and x8/x16 devices in x8 mode behave differently.  For
@@ -141,7 +143,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hwaddr offset)
     if (boff >= sizeof(pfl->cfi_table)) {
         return 0;
     }
-    /* Now we will construct the CFI response generated by a single
+    /*
+     * Now we will construct the CFI response generated by a single
      * device, then replicate that for all devices that make up the
      * bus.  For wide parts used in x8 mode, CFI query responses
      * are different than native byte-wide parts.
@@ -185,7 +188,8 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
     uint32_t resp;
     hwaddr boff;
 
-    /* Adjust incoming offset to match expected device-width
+    /*
+     * Adjust incoming offset to match expected device-width
      * addressing. Device ID read addresses are always specified in
      * terms of the maximum supported width of the device.  This means
      * that x8 devices and x8/x16 devices in x8 mode behave
@@ -198,7 +202,8 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
     boff = offset >> (ctz32(pfl->bank_width) +
                       ctz32(pfl->max_device_width) - ctz32(pfl->device_width));
 
-    /* Mask off upper bits which may be used in to query block
+    /*
+     * Mask off upper bits which may be used in to query block
      * or sector lock status at other addresses.
      * Offsets 2/3 are block lock status, is not emulated.
      */
@@ -297,7 +302,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     case 0x60: /* Block /un)lock */
     case 0x70: /* Status Register */
     case 0xe8: /* Write block */
-        /* Status register read.  Return status from each device in
+        /*
+         * Status register read.  Return status from each device in
          * bank.
          */
         ret = pfl->status;
@@ -308,7 +314,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
                 shift += pfl->device_width * 8;
             }
         } else if (!pfl->device_width && width > 2) {
-            /* Handle 32 bit flash cases where device width is not
+            /*
+             * Handle 32 bit flash cases where device width is not
              * set. (Existing behavior before device width added.)
              */
             ret |= pfl->status << 16;
@@ -340,7 +347,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
                 break;
             }
         } else {
-            /* If we have a read larger than the bank_width, combine multiple
+            /*
+             * If we have a read larger than the bank_width, combine multiple
              * manufacturer/device ID queries into a single response.
              */
             int i;
@@ -367,7 +375,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
                 ret = 0;
             }
         } else {
-            /* If we have a read larger than the bank_width, combine multiple
+            /*
+             * If we have a read larger than the bank_width, combine multiple
              * CFI queries into a single response.
              */
             int i;
@@ -544,7 +553,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
             break;
         case 0xe8:
-            /* Mask writeblock size based on device width, or bank width if
+            /*
+             * Mask writeblock size based on device width, or bank width if
              * device width not specified.
              */
             /* FIXME check @offset, @width */
@@ -718,7 +728,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 
     total_len = pfl->sector_len * pfl->nb_blocs;
 
-    /* These are only used to expose the parameters of each device
+    /*
+     * These are only used to expose the parameters of each device
      * in the cfi_table[].
      */
     num_devices = pfl->device_width ? (pfl->bank_width / pfl->device_width) : 1;
@@ -763,7 +774,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    /* Default to devices being used at their maximum device width. This was
+    /*
+     * Default to devices being used at their maximum device width. This was
      * assumed before the device_width support was added.
      */
     if (!pfl->max_device_width) {
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 7962cff7455..fa981465e12 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -100,7 +100,8 @@ struct PFlashCFI02 {
     uint16_t unlock_addr1;
     uint8_t cfi_table[0x4d];
     QEMUTimer timer;
-    /* The device replicates the flash memory across its memory space.  Emulate
+    /*
+     * The device replicates the flash memory across its memory space.  Emulate
      * that by having a container (.mem) filled with an array of aliases
      * (.mem_mappings) pointing to the flash memory (.orig_mem).
      */
@@ -884,8 +885,10 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x28] = 0x02;
     pfl->cfi_table[0x29] = 0x00;
     /* Max number of bytes in multi-bytes write */
-    /* XXX: disable buffered write as it's not supported */
-    //    pfl->cfi_table[0x2A] = 0x05;
+    /*
+     * XXX: disable buffered write as it's not supported
+     * pfl->cfi_table[0x2A] = 0x05;
+     */
     pfl->cfi_table[0x2A] = 0x00;
     pfl->cfi_table[0x2B] = 0x00;
     /* Number of erase block regions */
-- 
2.26.2


