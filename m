Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597FA52838D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:53:08 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZHf-0000Rr-EE
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7i-0000Gm-VQ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7h-0005WX-Ck
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90csNjP5LKfEJhmG68QBnKx1NoaampPhCE1MdP4/wac=;
 b=QaLhBBOk/G85uZsl/W1ZBjw+xADf3GszgtVHKpVOLqY3o2a7l32j9NRVLDcCC7gMX1cpNq
 +LyaELCdD0ieJRhzf26rj6H2iczn+JvFwzSJak8NnpvOjfzKYPR8Q+8Ux6GWaXdWOvQcqR
 n4dJFcipjT9ZxvwiL6/YLSiBZEwKWmU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-U99n4LLjPf6jlnAcPsovFw-1; Mon, 16 May 2022 06:38:43 -0400
X-MC-Unique: U99n4LLjPf6jlnAcPsovFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ba21-20020a0560001c1500b0020ca6a45dfcso3799763wrb.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=90csNjP5LKfEJhmG68QBnKx1NoaampPhCE1MdP4/wac=;
 b=n+3p0lec8ktHxaly+cTEFUe42G1UnUpITv3+T6FjWo+awZy6nC92ll5p+Pnq6B31DF
 RNYwlAkN1KIU3hnJDkEqqWFqQiEBmFGBvHR9nUpsvaSWmcbkK5qMubhsqyvhdx4xpYNk
 JFq9mLz8gerKIFni82Oo4Go8B8vTL9UlMXJsBxhigsXrgQGLo1Knpg8UXv5TQ6P0EJHT
 lVXoxoNWIou6i5qhzYvRc5bSrZC6M0Q1K5OUDsaU/1IdB4qaQULyk1sg3irZHgWOUqwH
 u2+DYnJSoz0LEmkRgWT3ZeRgk01daFlwiRmYMRpQMS/dmaHWwpaKVxORKJi7PkPybUl8
 pijQ==
X-Gm-Message-State: AOAM533itRpuLF4/03yAAwKknBPL8M96kvU4F2dCl5Hfhp2m9fOf0Mrh
 mUM7PvCOLHc/yxlN8fKXY2d91fnYlhEX2b45uYBmzbaesHy/slaQ4PDvLJAtXR8wXYJsKU5gekk
 Y/gqtQ1to+cbDMlandGICqEiTb6FkuBsXrqwE11tAM4hK/UFSx4AGezN/9d7T
X-Received: by 2002:a5d:47ab:0:b0:20c:6b09:2355 with SMTP id
 11-20020a5d47ab000000b0020c6b092355mr13792238wrb.230.1652697522400; 
 Mon, 16 May 2022 03:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF4FQysgU/tskp06usTB9efqJpYviAFurtPaJPcgg/SpIs/O4xKeXb3c5GiJyGjeKljEySSw==
X-Received: by 2002:a5d:47ab:0:b0:20c:6b09:2355 with SMTP id
 11-20020a5d47ab000000b0020c6b092355mr13792214wrb.230.1652697522130; 
 Mon, 16 May 2022 03:38:42 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 f8-20020a7bcc08000000b003942a244f35sm13034678wmh.14.2022.05.16.03.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:41 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 52/91] intel_iommu: Fix irqchip / X2APIC configuration checks
Message-ID: <20220516095448.507876-53-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: David Woodhouse <dwmw2@infradead.org>

We don't need to check kvm_enable_x2apic(). It's perfectly OK to support
interrupt remapping even if we can't address CPUs above 254. Kind of
pointless, but still functional.

The check on kvm_enable_x2apic() needs to happen *anyway* in order to
allow CPUs above 254 even without an IOMMU, so allow that to happen
elsewhere.

However, we do require the *split* irqchip in order to rewrite I/OAPIC
destinations. So fix that check while we're here.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Acked-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20220314142544.150555-4-dwmw2@infradead.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index d3361c8313..d310532108 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3786,15 +3786,10 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
                                               ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
     if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
-        if (!kvm_irqchip_in_kernel()) {
+        if (!kvm_irqchip_is_split()) {
             error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
             return false;
         }
-        if (!kvm_enable_x2apic()) {
-            error_setg(errp, "eim=on requires support on the KVM side"
-                             "(X2APIC_API, first shipped in v4.7)");
-            return false;
-        }
     }
 
     /* Currently only address widths supported are 39 and 48 bits */
-- 
MST


