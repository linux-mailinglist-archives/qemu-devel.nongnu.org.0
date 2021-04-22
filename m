Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A793688FE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 00:26:57 +0200 (CEST)
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZhmi-0004xd-Er
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 18:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lZhkt-0003Q9-KO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:25:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lZhkp-0003Mf-3Y
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619130297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=919k9q2m+2zrPKFQ+Ec/Cc8wRWCIr42fDB+fDVUPS1k=;
 b=AK6IVIz3cg5kJjP3te0pYdhMQHO+jvTczqMgiIWq+nVl3x/o3w4tdoV+Ue+LVbz+k+8bDd
 RoFQHFsjfc9ifcFuDrehkysYsSS4dlP473U+B1lKpOmS1x+4qrrJB71Bm/1/8S2kxgc+ub
 2q7DFQtU+3YVWYnZT6xDoCjZre/RA7g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-N_ldELDIM-KfjTjkqIZcVA-1; Thu, 22 Apr 2021 18:24:55 -0400
X-MC-Unique: N_ldELDIM-KfjTjkqIZcVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d2-20020aa7d6820000b0290384ee872881so13419949edr.10
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 15:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=919k9q2m+2zrPKFQ+Ec/Cc8wRWCIr42fDB+fDVUPS1k=;
 b=rfa5tdAQpyNuar0yNnvNTj5aSG6pdLkZvgwrAMXf9f1VxCCTLvEVZujZrXfpYL1M++
 2vdazKklLC7F5pMkDRq90cR8dxStimXGhLlXrFa7rIUTi99B0Iq4Nzv67cGV1kutP8j+
 br9nN5a1gra4y044/vnHghgphIBFG7xpmH2EGz1LKKxyQUiz5igVBMPFsSaJqPhqUSEO
 v7sIQ9H+oWqryhil4/Td1eNKy6gOHdyYT9tk5wqexrReVICs+9ERhGEP/p417eUy6qXP
 8sIkdc9E73ruHITMCdV1c/H7U/262O9GVTx4Xsu4mqHvjVIQG8YSnKaol6zQ/caNUarK
 ZIkA==
X-Gm-Message-State: AOAM530t4iDAWRTWpXpTZ45VhhXnSoYWjQ6N7g4vWQn+4C+KR6u/B7q/
 g2nsveLiRVwxkSrzwnXYueRCm3erPodW+puzZnaCvwYXvW3BpFX5QxFgNxxhYoJz8WLaL8nJeyH
 QyLvBdFJH5JfY9vU7ZGN+Xa+QMXIDtY3hQs9SfnX4G5i/gJiJyAPxSpTcEvq2
X-Received: by 2002:aa7:d9d7:: with SMTP id v23mr762077eds.281.1619130294339; 
 Thu, 22 Apr 2021 15:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDmAhR+5sIHD2BGU4DxxMZCcnMuYO82j6fEU1oVrd2eHEm6wVkbdmhFSX3zkF4ryPSKCh4FQ==
X-Received: by 2002:aa7:d9d7:: with SMTP id v23mr762038eds.281.1619130294020; 
 Thu, 22 Apr 2021 15:24:54 -0700 (PDT)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id t17sm3251124edv.3.2021.04.22.15.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 15:24:53 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:24:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] amd_iommu: Fix pte_override_page_mask()
Message-ID: <20210422222429.183108-2-mst@redhat.com>
References: <20210422222429.183108-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422222429.183108-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


