Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B55292E2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:30:42 +0200 (CEST)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiIb-00058s-7j
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiz-0000Vg-HE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhix-0006g5-Vs
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90csNjP5LKfEJhmG68QBnKx1NoaampPhCE1MdP4/wac=;
 b=aVINAuxXjCIb632WQ0miyoOSFfxXpGP1AlmilSt0TfW10wmk074uqo20sT2PpxeIDgE9IN
 9KsZOTxZeAz3r29zOoUvXPVv2kkdPYjg/+A9AYuawH+8po8dH6Hq8B+gpLyCesJYwsL0nV
 D7YEeFDC+1/r/fmn/WjZRGzxRF9Ashc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-iZeyhzqqMVq764UDOPSi7A-1; Mon, 16 May 2022 16:53:50 -0400
X-MC-Unique: iZeyhzqqMVq764UDOPSi7A-1
Received: by mail-ej1-f71.google.com with SMTP id
 ox8-20020a170907100800b006f9dc6e4a22so6349650ejb.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=90csNjP5LKfEJhmG68QBnKx1NoaampPhCE1MdP4/wac=;
 b=5yYMpKNtKMbwlZhLEJozo+kfaKPVZMSuSPL7YnK4kme9xZ83/l/J2LQ6HFGXwv6rZ+
 deL7N0nZw7fA4ziaqXLEhzkFZ9j01CMcAuSHyP/V8a1f5mlecG9HP4Fp5BFTD4SSLPQy
 tGk6IHcGwd2pbvv+SqCRcb8LaiMBXoaSqbxP4fffhOHJQfc+8ntqOXQUe+if5DHYP4uk
 KxUdKY1jQ3bS52qswrqFJ21V6Uq+3c3iun5UVh5GcX2NdtqZACbTTShZZbNVR6/YJ2zL
 5g0Cv592H/ud05CDzLNYygsN+g1Qfs+i9CM0slyED6GnmLPAIAydcIoV0HTaci8b9zHr
 O37Q==
X-Gm-Message-State: AOAM532bZfFOnvo7mGEexmp1T8S1IpxDP8nYpGmw8Ar4HpZQsXHKzI3g
 t+bo/MVTH9puWRrLQQiUtlqDQ93KybWH2WSxUvCBaGk5xjRP47l3sZQJvAMxkPGF1MQLBRi2Nio
 lcRiymM6p7LJG5HqIEUMuDO6xE0jhx2xWt+804b3bbJx9hWMtJHze4XLayQhi
X-Received: by 2002:a17:906:3ed5:b0:6f5:108c:a45 with SMTP id
 d21-20020a1709063ed500b006f5108c0a45mr16841338ejj.623.1652734428616; 
 Mon, 16 May 2022 13:53:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEcA/Foyq3vY8k4Pwe0YAD4ypYOCurkMPlZt9JGQE7Ly2DtOH0hsCRHO8qST2ZU53wVxBSJw==
X-Received: by 2002:a17:906:3ed5:b0:6f5:108c:a45 with SMTP id
 d21-20020a1709063ed500b006f5108c0a45mr16841317ejj.623.1652734428364; 
 Mon, 16 May 2022 13:53:48 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 t14-20020aa7d4ce000000b0042ab2127051sm2114045edr.64.2022.05.16.13.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:47 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:43 -0400
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
Subject: [PULL v2 52/86] intel_iommu: Fix irqchip / X2APIC configuration checks
Message-ID: <20220516204913.542894-53-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


