Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A547334521
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:29:56 +0100 (CET)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2eg-0004Tp-1U
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hc-00050M-9Z
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2HW-000050-5t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQO9biHCPAJnw7a1zkeuv52hwPL+u8u+MaxlaPRiSEo=;
 b=cAQ9IFuS/tNv/SyvpIs1rAq+jRWpcs6Pw6k2CsgPSlVLR3iR9S1JPZEY/qR6nMvBqeH+Ox
 N9Ch+dGXCmNBJuneY3lWNSxCUzlY+aeM2kHbu+ebaC4uj7fW7w3dRvVJOkf3LArgcAzQ2L
 HJcGVPh31nDF+MjHa9dNzMTCYuC1538=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-DDf-FvH7PRCy2XGWWdHz5w-1; Wed, 10 Mar 2021 12:05:55 -0500
X-MC-Unique: DDf-FvH7PRCy2XGWWdHz5w-1
Received: by mail-ej1-f70.google.com with SMTP id gv58so7491045ejc.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQO9biHCPAJnw7a1zkeuv52hwPL+u8u+MaxlaPRiSEo=;
 b=BJDNstLNSPr7+HD5azYHOC+LxiOSJoBlqwhSp5PqOgfLS1QLHq94VundK/GFAruaZg
 bD4ShNtqzlRIdlgwv4VLnNe4vzVgd9BI7tTLLLisgkRIUOWQMDq34x0bT7tpV7T9WV6Y
 Tf7dns+49AsnEjVD3jZrg8dUx3Fs4km1xh8L2ghj84f+uGQgB6DzwFBFGnwFlOb9mGVf
 n2bUo9Fo8C5uzwPiB6xQSRgK/pCESSkUVj9o4s3OHCm3hB6nncydQj+07Z50laLTTV7Z
 4toS3PuFuSuDhAFeHnousnrlnh1LClL4F7ZCz5PamPcGuR+Tjj900Afrs65qSNEzTzk7
 YhYQ==
X-Gm-Message-State: AOAM533gGmEVhbDY8uoKveg4C2MYY+VAsAxEGNgIC2lKmZMKgSFzPig8
 5SQMk3IYeHGtiTjEW+PukGQAGcPLvz+TUTUNvlVaYnIdg8mMseKZVmvecCXzEMUHYFChPZu6ncW
 iinosau4oFI8rwNKpa5Qg5lbPRVjbb4BRHZDRoyGM21zBKfsWboY8a07JjIMK3NkY
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr4492806edr.316.1615395952691; 
 Wed, 10 Mar 2021 09:05:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOS4qzLs41HF0mG0I98Zsnk1nUUB2p++d/C4PaiupWqwDHXzFLG3McwoL7dZ0NHmtP/kR64A==
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr4492778edr.316.1615395952563; 
 Wed, 10 Mar 2021 09:05:52 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v12sm18597ejh.94.2021.03.10.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:05:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
Date: Wed, 10 Mar 2021 18:05:20 +0100
Message-Id: <20210310170528.1184868-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
to boolean and set it to true directly within pflash_setup_mappings().

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Convert to bool in pflash_register_memory (David)
---
 hw/block/pflash_cfi02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 845f50ed99b..0eb868ecd3d 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -108,7 +108,7 @@ struct PFlashCFI02 {
     MemoryRegion mem;
     MemoryRegion *mem_mappings;    /* array; one per mapping */
     MemoryRegion orig_mem;
-    int rom_mode;
+    bool rom_mode;
     int read_counter; /* used for lazy switch-back to rom mode */
     int sectors_to_erase;
     uint64_t erase_time_remaining;
@@ -181,12 +181,13 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
                                  "pflash-alias", &pfl->orig_mem, 0, size);
         memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappings[i]);
     }
+    pfl->rom_mode = true;
 }
 
 static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
 {
     memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
-    pfl->rom_mode = rom_mode;
+    pfl->rom_mode = !!rom_mode;
 }
 
 static size_t pflash_regions_count(PFlashCFI02 *pfl)
@@ -927,7 +928,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
     pflash_setup_mappings(pfl);
-    pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
-- 
2.26.2


