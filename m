Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D537F380DD0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:12:40 +0200 (CEST)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaQZ-0006hm-TM
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIU-0005oP-37
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIS-0005DB-DM
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=919k9q2m+2zrPKFQ+Ec/Cc8wRWCIr42fDB+fDVUPS1k=;
 b=VtBgTeGv7lo+F32NE2Ogdyy63ucalOzuJMyZopLK/SrMvZtMK+yiU9bG/FYz2Q6cG0jgEP
 VA3cU0r9lP07ce+lfcUa0nDEwbFU9dvpcCxL87BEHRoAaNO/3rhPglobYaEQktMMdLb3zy
 x0L1SAoL0DL8hXox8r3j+/rsIgkpvTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-zB5tScV8MfCiDMnIH_RAcw-1; Fri, 14 May 2021 12:04:12 -0400
X-MC-Unique: zB5tScV8MfCiDMnIH_RAcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1234367wmn.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=919k9q2m+2zrPKFQ+Ec/Cc8wRWCIr42fDB+fDVUPS1k=;
 b=N50sS5kdTYF0m5zuJMNMyySGTCy6BK6bWAj9vglfikf3bn5hN59cFeIhHPcSddZcos
 tlcWTx1qAIWI0sm+pnu5g+4UVHLo4yA17J/mXxy6ymTzrjfThL985BK19Y0g10jmBDmC
 NKxy8nMlAqNhWs+XZG5OkAH6bToZf23GHPVMKbbmHES+MEuFZXkDm561Pqak9GDEwyr5
 oquOMTTq2NRXy1/A5hai1iql1N2g0KE9TQihmIwkeHSzzjADzEYM+hxtMGhoW0x3LVnk
 1/PYfc4alhjgz6ch2o29hEoGeAKAViQtpVTJX44YEqVUyqDLRWeJB4gUcVzMYfSTT4fY
 WLjg==
X-Gm-Message-State: AOAM530po1Q4/pxT0Ogzsg5zhF4o2RwZuanp7UrntXld+cPPLOi19eQ0
 yCsm8OfnFqwmDxdTTGFpvP880lD5OLsveOO4xGLpX5FW6toUpPK9v5Amuxtu6NMT4g/liHgmbB6
 fCpXzufi8WKTc6S7CmohwZhl15QkOw9sEKepOi3RHkzNsO0vXjqnQmX5CGBLx
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr10103892wmq.159.1621008251249; 
 Fri, 14 May 2021 09:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp1nMkXzlps2N7kGzxypWM+YS4VQnS/Djn4sCsK/c5b39OLggeOjKBYGqB9iRUWgaJ/2Qc1g==
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr10103860wmq.159.1621008251002; 
 Fri, 14 May 2021 09:04:11 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id m22sm12206172wml.40.2021.05.14.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:10 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] amd_iommu: Fix pte_override_page_mask()
Message-ID: <20210514160245.91918-2-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

AMD IOMMU PTEs have a special mode allowing to specify an arbitrary page
size. Quoting the AMD IOMMU specification: "When the Next Level bits [of
a pte] are 7h, the size of the page is determined by the first zero bit
in the page address, starting from bit 12."

So if the lowest bits of the page address is 0, the page is 8kB. If the
lowest bits are 011, the page is 32kB. Currently pte_override_page_mask()
doesn't compute the right value for this page size and amdvi_translate()
can return the wrong guest-physical address. With a Linux guest, DMA
from SATA devices accesses the wrong memory and causes probe failure:

qemu-system-x86_64 ... -device amd-iommu -drive id=hd1,file=foo.bin,if=none \
		-device ahci,id=ahci -device ide-hd,drive=hd1,bus=ahci.0
[    6.613093] ata1.00: qc timeout (cmd 0xec)
[    6.615062] ata1.00: failed to IDENTIFY (I/O error, err_mask=0x4)

Fix the page mask.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20210421084007.1190546-1-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 74a93a5d93..43b6e9bf51 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -860,8 +860,8 @@ static inline uint8_t get_pte_translation_mode(uint64_t pte)
 
 static inline uint64_t pte_override_page_mask(uint64_t pte)
 {
-    uint8_t page_mask = 12;
-    uint64_t addr = (pte & AMDVI_DEV_PT_ROOT_MASK) ^ AMDVI_DEV_PT_ROOT_MASK;
+    uint8_t page_mask = 13;
+    uint64_t addr = (pte & AMDVI_DEV_PT_ROOT_MASK) >> 12;
     /* find the first zero bit */
     while (addr & 1) {
         page_mask++;
-- 
MST


