Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC5444455
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:10:41 +0100 (CET)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHuS-0004Rk-Ro
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp0-0003IY-GC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHox-0000Xx-Mj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so4845707wmj.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Feie4aaYvBPPX4NGQ+HI7Tuz8JeaxPU1QKcXUDGysRQ=;
 b=NJdhe7sxtXBku4RUMW/0SMRJ5mbYcP9xF6jFleL3Gn0q/trL6rp4Wc+AEbj3VjiQ5c
 k0TLHweIiy4/pfvFjlH0DzcXMOkFizDcfre1HnVXTA5QKHET/eUlNWohTXR23q0jP2p4
 d7v0u9vDcuN6X1VmRUjqfFHB98iPGXiAnC2vKnTzhdrAI0qskg/LnKSxgQmyQ1XyVo89
 ToTXtd7JpWgyUAjIti170MAORvf5iVPrqejwtpq2W+CDu5hvFvAbC5z11LQXR9UqxM2/
 Ymdq8axeCURlhKacos+2JDiPFbo7aZpHjB5Yega0FHeRTiqADG4iWkmcsEu2i0wIxGmX
 LiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Feie4aaYvBPPX4NGQ+HI7Tuz8JeaxPU1QKcXUDGysRQ=;
 b=LWrA0oWYt5IffnDPOsTehVpljP7SQNd1YwmNKE3c3BStFUzMz+Yt/K611lh2Ui9AD8
 6p50LDfBofuzBUAfMLbK2GtEdxHParG5fvJkREGvFZVoCPpWBBA3AZ6lUndtzE32bjav
 /OgRxMD9DRTKjw2TVQTeM3qAuYm3KKEvB7ZIyj6nim04hRzp5SS1Prpx+EMxno0Syl66
 +tiJGReETAWuRVLd8URiHIh0+R/tbq1qNpyW+gYlBI88FTOdaxlavqFBJyXpSWAY93aD
 urelrcGR+BHLEIkFpzaX6u9WHPINmXxrhd5d6jkgiJ00iarQfzX6wecde70ZQ9Q/31SV
 OmWw==
X-Gm-Message-State: AOAM533MVngp9T6NsR6bMSWim0Xd9Wj4t7++szaaVie/k0Mk999Je5d6
 PJp5jqtCS0fnV9Vk2pusOGCaNSTrRUc=
X-Google-Smtp-Source: ABdhPJzd+JjzSQ/YbMbkBVb4dehXnsBugXvQ+9YLr15hwT+6AttlPdem9jcbBa5zPfda6B8idscSOQ==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr15525073wmq.175.1635951898161; 
 Wed, 03 Nov 2021 08:04:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] hvf: Avoid mapping regions < PAGE_SIZE as ram
Date: Wed,  3 Nov 2021 16:04:27 +0100
Message-Id: <20211103150442.387121-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

HVF has generic memory listener code that adds all RAM regions as HVF RAM
regions. However, HVF can only handle page aligned, page granule regions.

So let's ignore regions that are not page aligned and sized. They will be
trapped as MMIO instead.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211025132147.28308-1-agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/hvf/hvf-accel-ops.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 2b2c411076..54457c76c2 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -122,6 +122,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     MemoryRegion *area = section->mr;
     bool writeable = !area->readonly && !area->rom_device;
     hv_memory_flags_t flags;
+    uint64_t page_size = qemu_real_host_page_size;
 
     if (!memory_region_is_ram(area)) {
         if (writeable) {
@@ -135,6 +136,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         }
     }
 
+    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
+        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
+        /* Not page aligned, so we can not map as RAM */
+        add = false;
+    }
+
     mem = hvf_find_overlap_slot(
             section->offset_within_address_space,
             int128_get64(section->size));
-- 
2.31.1



