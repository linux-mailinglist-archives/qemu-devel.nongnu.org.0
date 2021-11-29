Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B3E46174E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:59:54 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhCD-0008UU-5Y
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh4J-0003nb-9v
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh4A-00033c-B3
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dNA74JogDW+OTgGs6tOWW2D5DT75AYZMnUaKYfmi5IQ=;
 b=MJBrjY3/Nd+ufiQh2I2DvCtNBGgJui5AnV09DupnerN9R1NE3XPNYJU8fR+2fyKdnhBrvL
 X+jkf2mMPeBmH2unLZRSTsWlwe49JzKeG1KkcPZFjHHfHzzral/7WouyLQFNtmjPfG7bsw
 3VvLwftnMmuRn94Ajiphxx9en3TPW+A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-DAJ0-QPIP528ufTiJvhjKQ-1; Mon, 29 Nov 2021 08:51:32 -0500
X-MC-Unique: DAJ0-QPIP528ufTiJvhjKQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 bx28-20020a0564020b5c00b003e7c42443dbso13727360edb.15
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dNA74JogDW+OTgGs6tOWW2D5DT75AYZMnUaKYfmi5IQ=;
 b=iFy4B0gJJfo0t3nuR/mU8ZpkeapYpWzA6fSmoN+u/5hQvWFa3HBTb6hm+0NrAb7Mx/
 HYGGphBHZNs6PfFsnxQahJs8/XZ/1jbnSEIs8Q2SIyDEQlP16/9S9md3agoJgmc09fgh
 8fQ9O9XhvhR+vfA9EzLM9e85MMP98ZAvEWTbgz0Q8F3tFK9U1irzbjhwY5cU6hHPdijl
 WwAz0EwhH/pbpLbSfY52RRAUmyyX9MZyyvsRbTcWp2HIv7SrXqJbIf7PaGkkhAIcpNdT
 ocFGmxv7fpSUDzMoz1TvffLCb1HRTKBBnZeAwD7HtNiyv7lbvRt9uwO/BInWr8B85w+J
 lq0Q==
X-Gm-Message-State: AOAM532VY+hZGrHkdPyoeHz2Y3ICbBvjosldK8wWG3/d311X4ViBHRZK
 hpROxXFwBGxg8LBzO9WlhApkl9QqbGX43/IKvDxAQOWagb3Ag2wLUqc//IVI66TOTtJmMIZ7veM
 X+PYSVutH8l4nTOY88OearsF9s3bD9TQZA5LxizGtPpYe8zNHFnpKWrVgOoaM
X-Received: by 2002:aa7:c783:: with SMTP id n3mr74937960eds.121.1638193891228; 
 Mon, 29 Nov 2021 05:51:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JUTvAWr8SJ8MnVNvB5CIDwffDRfMI0mrZR5ZC0RpkqQSqzXD798XXP5DSsey1I6jYZdwmw==
X-Received: by 2002:aa7:c783:: with SMTP id n3mr74937920eds.121.1638193890993; 
 Mon, 29 Nov 2021 05:51:30 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id s16sm9127972edt.30.2021.11.29.05.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:30 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] intel-iommu: ignore leaf SNP bit in scalable mode
Message-ID: <20211129135053.560225-7-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

When booting with scalable mode, I hit this error:

qemu-system-x86_64: vtd_iova_to_slpte: detected splte reserve non-zero iova=0xfffff002, level=0x1slpte=0x102681803)
qemu-system-x86_64: vtd_iommu_translate: detected translation failure (dev=01:00:00, iova=0xfffff002)
qemu-system-x86_64: New fault is not recorded due to compression of faults

This is because the SNP bit is set for second level page table since
Linux kernel commit 6c00612d0cba1 ("iommu/vt-d: Report right snoop
capability when using FL for IOVA") even if SC is not supported by the
hardware.

To unbreak the guest, ignore the leaf SNP bit for scalable mode
first. In the future we may consider to add SC support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211129033618.3857-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu_internal.h | 2 ++
 hw/i386/intel_iommu.c          | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 3d5487fe2c..a6c788049b 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -388,6 +388,8 @@ typedef union VTDInvDesc VTDInvDesc;
 #define VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO 0xffff0000ffe0fff8
 
 /* Rsvd field masks for spte */
+#define VTD_SPTE_SNP 0x800ULL
+
 #define VTD_SPTE_PAGE_L1_RSVD_MASK(aw, dt_supported) \
         dt_supported ? \
         (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 294499ee20..f584449d8d 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3629,6 +3629,12 @@ static void vtd_init(IntelIOMMUState *s)
     vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits,
                                                          x86_iommu->dt_supported);
 
+    if (s->scalable_mode) {
+        vtd_spte_rsvd[1] &= ~VTD_SPTE_SNP;
+        vtd_spte_rsvd_large[2] &= ~VTD_SPTE_SNP;
+        vtd_spte_rsvd_large[3] &= ~VTD_SPTE_SNP;
+    }
+
     if (x86_iommu_ir_supported(x86_iommu)) {
         s->ecap |= VTD_ECAP_IR | VTD_ECAP_MHMV;
         if (s->intr_eim == ON_OFF_AUTO_ON) {
-- 
MST


