Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D6B33C9FA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:37:39 +0100 (CET)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwmI-00031v-Qo
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkY-0001FL-4M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkV-0005z2-WB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9Ipj29ef/epUm7canVmOvW2sayP8EKcaMfLDp/k/Io=;
 b=edwJGbyEFz/pu3JvOSILChFPbw0/ePXrqEiCor1VMqHNTwz7VQIdKTs9GLHSv+xIkOkqDA
 I8qLQIpoOb6QpLw0WeKE77qWUaMSKoOBKiKt+JFjc1RcFKL6bhgZyS3WioDN/9kiqDiKnP
 3TfwWbJ5sJ47AftPAUtTZNM+XRsH0gA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-hjbxhxSVMhC3A0NI_iD2rQ-1; Mon, 15 Mar 2021 19:35:45 -0400
X-MC-Unique: hjbxhxSVMhC3A0NI_iD2rQ-1
Received: by mail-wr1-f69.google.com with SMTP id n17so15787915wrq.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U9Ipj29ef/epUm7canVmOvW2sayP8EKcaMfLDp/k/Io=;
 b=BjuAYpIauRXddHGUyNIzKTdKptiPF9+z6SIsLxeD6N6kwV1MdEI75cankPJ0c0iyZ5
 5xbCDP6RCgqS6BzI/DTHeUK95uP82wSNcvn64h4JxCCUTMc+3vFYS6IJQBDqOND0fZvJ
 HFIwmzWIM/VuIobvIjwGNBecIaM/RU0vxgpwd0oqKAQ66tZBlUByBAzApeDV+rjy175t
 RJnSkWopeY/0hsk1MyFQCZtEgvWaazmirGelmGBuQaaEaVlU8NDFEJEpMrRU29dN73yF
 pyCK58wGaJIBMAdKnS9r30bNAmwRTl/rQXxBn8v5zT6hevqkxnn8cMpb42rKqv3v2mFc
 PKsA==
X-Gm-Message-State: AOAM530i9zRFWmBke9Ic4w2yFpcjSb40ctOfEaDrw58UMAynQxaXUjw3
 IjNaOPCdLkTEh3HMpjmJbtD9J6CEhG8/OdKD0Tzszs1owlZdlcMIG9/QxtR/n8OuGO2mV5ysSxJ
 HskHPD5VbQ38YTkwWf7nUoKaqQCrtwrE93Eqmqil4kmQ71VOnlT2ztv9A1UwwIYrO
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr1920007wmh.9.1615851344036;
 Mon, 15 Mar 2021 16:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0TkBHNcVV7M0BEl1fCvNbd9DowFAm6OjPtoZh6EMpE1K0TQUHGbW4DFXSBaukFvOiPTHtqw==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr1919986wmh.9.1615851343793;
 Mon, 15 Mar 2021 16:35:43 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k12sm20943756wrx.7.2021.03.15.16.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] hw/block/pflash_cfi02: Extract
 pflash_cfi02_fill_cfi_table()
Date: Tue, 16 Mar 2021 00:35:19 +0100
Message-Id: <20210315233527.2988483-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Fill the CFI table in out of DeviceRealize() in a new function:
pflash_cfi02_fill_cfi_table().

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210310170528.1184868-4-philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 193 +++++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 94 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index fa981465e12..845f50ed99b 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -724,6 +724,104 @@ static const MemoryRegionOps pflash_cfi02_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void pflash_cfi02_fill_cfi_table(PFlashCFI02 *pfl, int nb_regions)
+{
+    /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
+    const uint16_t pri_ofs = 0x40;
+    /* Standard "QRY" string */
+    pfl->cfi_table[0x10] = 'Q';
+    pfl->cfi_table[0x11] = 'R';
+    pfl->cfi_table[0x12] = 'Y';
+    /* Command set (AMD/Fujitsu) */
+    pfl->cfi_table[0x13] = 0x02;
+    pfl->cfi_table[0x14] = 0x00;
+    /* Primary extended table address */
+    pfl->cfi_table[0x15] = pri_ofs;
+    pfl->cfi_table[0x16] = pri_ofs >> 8;
+    /* Alternate command set (none) */
+    pfl->cfi_table[0x17] = 0x00;
+    pfl->cfi_table[0x18] = 0x00;
+    /* Alternate extended table (none) */
+    pfl->cfi_table[0x19] = 0x00;
+    pfl->cfi_table[0x1A] = 0x00;
+    /* Vcc min */
+    pfl->cfi_table[0x1B] = 0x27;
+    /* Vcc max */
+    pfl->cfi_table[0x1C] = 0x36;
+    /* Vpp min (no Vpp pin) */
+    pfl->cfi_table[0x1D] = 0x00;
+    /* Vpp max (no Vpp pin) */
+    pfl->cfi_table[0x1E] = 0x00;
+    /* Timeout per single byte/word write (128 ms) */
+    pfl->cfi_table[0x1F] = 0x07;
+    /* Timeout for min size buffer write (NA) */
+    pfl->cfi_table[0x20] = 0x00;
+    /* Typical timeout for block erase (512 ms) */
+    pfl->cfi_table[0x21] = 0x09;
+    /* Typical timeout for full chip erase (4096 ms) */
+    pfl->cfi_table[0x22] = 0x0C;
+    /* Reserved */
+    pfl->cfi_table[0x23] = 0x01;
+    /* Max timeout for buffer write (NA) */
+    pfl->cfi_table[0x24] = 0x00;
+    /* Max timeout for block erase */
+    pfl->cfi_table[0x25] = 0x0A;
+    /* Max timeout for chip erase */
+    pfl->cfi_table[0x26] = 0x0D;
+    /* Device size */
+    pfl->cfi_table[0x27] = ctz32(pfl->chip_len);
+    /* Flash device interface (8 & 16 bits) */
+    pfl->cfi_table[0x28] = 0x02;
+    pfl->cfi_table[0x29] = 0x00;
+    /* Max number of bytes in multi-bytes write */
+    /*
+     * XXX: disable buffered write as it's not supported
+     * pfl->cfi_table[0x2A] = 0x05;
+     */
+    pfl->cfi_table[0x2A] = 0x00;
+    pfl->cfi_table[0x2B] = 0x00;
+    /* Number of erase block regions */
+    pfl->cfi_table[0x2c] = nb_regions;
+    /* Erase block regions */
+    for (int i = 0; i < nb_regions; ++i) {
+        uint32_t sector_len_per_device = pfl->sector_len[i];
+        pfl->cfi_table[0x2d + 4 * i] = pfl->nb_blocs[i] - 1;
+        pfl->cfi_table[0x2e + 4 * i] = (pfl->nb_blocs[i] - 1) >> 8;
+        pfl->cfi_table[0x2f + 4 * i] = sector_len_per_device >> 8;
+        pfl->cfi_table[0x30 + 4 * i] = sector_len_per_device >> 16;
+    }
+    assert(0x2c + 4 * nb_regions < pri_ofs);
+
+    /* Extended */
+    pfl->cfi_table[0x00 + pri_ofs] = 'P';
+    pfl->cfi_table[0x01 + pri_ofs] = 'R';
+    pfl->cfi_table[0x02 + pri_ofs] = 'I';
+
+    /* Extended version 1.0 */
+    pfl->cfi_table[0x03 + pri_ofs] = '1';
+    pfl->cfi_table[0x04 + pri_ofs] = '0';
+
+    /* Address sensitive unlock required. */
+    pfl->cfi_table[0x05 + pri_ofs] = 0x00;
+    /* Erase suspend to read/write. */
+    pfl->cfi_table[0x06 + pri_ofs] = 0x02;
+    /* Sector protect not supported. */
+    pfl->cfi_table[0x07 + pri_ofs] = 0x00;
+    /* Temporary sector unprotect not supported. */
+    pfl->cfi_table[0x08 + pri_ofs] = 0x00;
+
+    /* Sector protect/unprotect scheme. */
+    pfl->cfi_table[0x09 + pri_ofs] = 0x00;
+
+    /* Simultaneous operation not supported. */
+    pfl->cfi_table[0x0a + pri_ofs] = 0x00;
+    /* Burst mode not supported. */
+    pfl->cfi_table[0x0b + pri_ofs] = 0x00;
+    /* Page mode not supported. */
+    pfl->cfi_table[0x0c + pri_ofs] = 0x00;
+    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
+}
+
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -837,100 +935,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cmd = 0;
     pfl->status = 0;
 
-    /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
-    const uint16_t pri_ofs = 0x40;
-    /* Standard "QRY" string */
-    pfl->cfi_table[0x10] = 'Q';
-    pfl->cfi_table[0x11] = 'R';
-    pfl->cfi_table[0x12] = 'Y';
-    /* Command set (AMD/Fujitsu) */
-    pfl->cfi_table[0x13] = 0x02;
-    pfl->cfi_table[0x14] = 0x00;
-    /* Primary extended table address */
-    pfl->cfi_table[0x15] = pri_ofs;
-    pfl->cfi_table[0x16] = pri_ofs >> 8;
-    /* Alternate command set (none) */
-    pfl->cfi_table[0x17] = 0x00;
-    pfl->cfi_table[0x18] = 0x00;
-    /* Alternate extended table (none) */
-    pfl->cfi_table[0x19] = 0x00;
-    pfl->cfi_table[0x1A] = 0x00;
-    /* Vcc min */
-    pfl->cfi_table[0x1B] = 0x27;
-    /* Vcc max */
-    pfl->cfi_table[0x1C] = 0x36;
-    /* Vpp min (no Vpp pin) */
-    pfl->cfi_table[0x1D] = 0x00;
-    /* Vpp max (no Vpp pin) */
-    pfl->cfi_table[0x1E] = 0x00;
-    /* Timeout per single byte/word write (128 ms) */
-    pfl->cfi_table[0x1F] = 0x07;
-    /* Timeout for min size buffer write (NA) */
-    pfl->cfi_table[0x20] = 0x00;
-    /* Typical timeout for block erase (512 ms) */
-    pfl->cfi_table[0x21] = 0x09;
-    /* Typical timeout for full chip erase (4096 ms) */
-    pfl->cfi_table[0x22] = 0x0C;
-    /* Reserved */
-    pfl->cfi_table[0x23] = 0x01;
-    /* Max timeout for buffer write (NA) */
-    pfl->cfi_table[0x24] = 0x00;
-    /* Max timeout for block erase */
-    pfl->cfi_table[0x25] = 0x0A;
-    /* Max timeout for chip erase */
-    pfl->cfi_table[0x26] = 0x0D;
-    /* Device size */
-    pfl->cfi_table[0x27] = ctz32(pfl->chip_len);
-    /* Flash device interface (8 & 16 bits) */
-    pfl->cfi_table[0x28] = 0x02;
-    pfl->cfi_table[0x29] = 0x00;
-    /* Max number of bytes in multi-bytes write */
-    /*
-     * XXX: disable buffered write as it's not supported
-     * pfl->cfi_table[0x2A] = 0x05;
-     */
-    pfl->cfi_table[0x2A] = 0x00;
-    pfl->cfi_table[0x2B] = 0x00;
-    /* Number of erase block regions */
-    pfl->cfi_table[0x2c] = nb_regions;
-    /* Erase block regions */
-    for (int i = 0; i < nb_regions; ++i) {
-        uint32_t sector_len_per_device = pfl->sector_len[i];
-        pfl->cfi_table[0x2d + 4 * i] = pfl->nb_blocs[i] - 1;
-        pfl->cfi_table[0x2e + 4 * i] = (pfl->nb_blocs[i] - 1) >> 8;
-        pfl->cfi_table[0x2f + 4 * i] = sector_len_per_device >> 8;
-        pfl->cfi_table[0x30 + 4 * i] = sector_len_per_device >> 16;
-    }
-    assert(0x2c + 4 * nb_regions < pri_ofs);
-
-    /* Extended */
-    pfl->cfi_table[0x00 + pri_ofs] = 'P';
-    pfl->cfi_table[0x01 + pri_ofs] = 'R';
-    pfl->cfi_table[0x02 + pri_ofs] = 'I';
-
-    /* Extended version 1.0 */
-    pfl->cfi_table[0x03 + pri_ofs] = '1';
-    pfl->cfi_table[0x04 + pri_ofs] = '0';
-
-    /* Address sensitive unlock required. */
-    pfl->cfi_table[0x05 + pri_ofs] = 0x00;
-    /* Erase suspend to read/write. */
-    pfl->cfi_table[0x06 + pri_ofs] = 0x02;
-    /* Sector protect not supported. */
-    pfl->cfi_table[0x07 + pri_ofs] = 0x00;
-    /* Temporary sector unprotect not supported. */
-    pfl->cfi_table[0x08 + pri_ofs] = 0x00;
-
-    /* Sector protect/unprotect scheme. */
-    pfl->cfi_table[0x09 + pri_ofs] = 0x00;
-
-    /* Simultaneous operation not supported. */
-    pfl->cfi_table[0x0a + pri_ofs] = 0x00;
-    /* Burst mode not supported. */
-    pfl->cfi_table[0x0b + pri_ofs] = 0x00;
-    /* Page mode not supported. */
-    pfl->cfi_table[0x0c + pri_ofs] = 0x00;
-    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
+    pflash_cfi02_fill_cfi_table(pfl, nb_regions);
 }
 
 static Property pflash_cfi02_properties[] = {
-- 
2.26.2


