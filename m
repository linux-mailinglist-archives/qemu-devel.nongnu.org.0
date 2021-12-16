Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE4476C32
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:49:57 +0100 (CET)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmSa-0005HN-HS
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxmQ7-0002md-FZ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxmQ3-0003aV-L0
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tg22waHuW5CQsQYlHK6Flo/4VDA1ciuXDsOUGOBnv8=;
 b=HIUg2io3hWJ+ra3friGkQN8z9baxljttEz236goSS1PKNQCciWvmyjp0gDhSlQQ30/xUkW
 YCiA3+1kszvAiI4DcWs5K/tDOB4CGi3jFdiCP7LzCuJXPw4tw331G6nHjdjg7DazoP21Mr
 hfeDEr2KuNJJX1t2L5Usvj6oJwEo4kY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-2NYZyfrgNhiHwuB3uqwVjg-1; Thu, 16 Dec 2021 03:47:15 -0500
X-MC-Unique: 2NYZyfrgNhiHwuB3uqwVjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o17-20020a05600c511100b00343141e2a16so7511839wms.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 00:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2tg22waHuW5CQsQYlHK6Flo/4VDA1ciuXDsOUGOBnv8=;
 b=RpXozs687xwg32dKXW9NMBUO/Ey32ea2wLMr84S3Z5FdeVG0vUAeHo/z6/FiSCn9Cc
 2UOQnmn7ZGQ4M8lJAk3lKRnT0g7DzmxdFQVhiENvFp4NWAkLtbEaZ3j8MGokOiGXNx3w
 7lTvBPjwB9UzEQ+Xt/nnOwCiRQlETWAkUFIJxEaLzhK6SQmfup9niPxmdmtRWzbW50MH
 dmTJfYTaUm7si8msjb1NmgWJ68J5WVJKIODf5lniU5rUYiJEfl8u8NITj+ySQmVfHxxc
 dekHpWKQkgcRxfT0AYX+T2stY87/l7uuy2KGItvUAbmtYK5E7VOkng9AhdtDucqUdRKw
 jJtw==
X-Gm-Message-State: AOAM530+eul/Ej49kbQFevLD1RrdWk+AYhpko2q2D+yt1Jv91KCCg8hI
 sLEXv4+na2QYJFqZNgZw6gs1MzUHdB6z7+HHq5ct8d3MFQljLkkgmkLs6agx8e7Hlgq5sHhNngY
 NbH79ttHsCvVg53M=
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr3886746wmq.25.1639644434059; 
 Thu, 16 Dec 2021 00:47:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7EZ9KrpHeN6hLzB6CDWNWhpRfGg8hLtaOpMGGpg3Kha5qpFV5HNYTqcWKqFzyxJqYitJEOg==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr3886725wmq.25.1639644433845; 
 Thu, 16 Dec 2021 00:47:13 -0800 (PST)
Received: from xz-m1.local ([64.64.123.12])
 by smtp.gmail.com with ESMTPSA id o2sm3112072wru.109.2021.12.16.00.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:47:13 -0800 (PST)
Date: Thu, 16 Dec 2021 16:47:06 +0800
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 4/4] intel_iommu: Fix irqchip / X2APIC configuration
 checks
Message-ID: <Ybr9Cn7GPKbm/rzL@xz-m1.local>
References: <20211209220840.14889-1-dwmw2@infradead.org>
 <20211209220840.14889-4-dwmw2@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20211209220840.14889-4-dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, David,

On Thu, Dec 09, 2021 at 10:08:40PM +0000, David Woodhouse wrote:
> We don't need to check kvm_enable_x2apic(). It's perfectly OK to support
> interrupt remapping even if we can't address CPUs above 254. Kind of
> pointless, but still functional.

We only checks kvm_enable_x2apic() if eim=on is set, right?  I mean, we can
still enable IR without x2apic even with current code?

Could you elaborate what's the use scenario for this patch?  Thanks in advance.

> 
> The check on kvm_enable_x2apic() needs to happen *anyway* in order to
> allow CPUs above 254 even without an IOMMU, so allow that to happen
> elsewhere.
> 
> However, we do require the *split* irqchip in order to rewrite I/OAPIC
> destinations. So fix that check while we're here.
> 
> Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

I think the r-b and a-b should be for patch 2 not this one? :)

> ---
>  hw/i386/intel_iommu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index bd288d45bb..0d1c72f08e 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3760,15 +3760,10 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
>                                                ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>      }
>      if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
> -        if (!kvm_irqchip_in_kernel()) {
> +        if (!kvm_irqchip_is_split()) {

I think this is okay, but note that we'll already fail if !split in
x86_iommu_realize():

    bool irq_all_kernel = kvm_irqchip_in_kernel() && !kvm_irqchip_is_split();

    /* Both Intel and AMD IOMMU IR only support "kernel-irqchip={off|split}" */
    if (x86_iommu_ir_supported(x86_iommu) && irq_all_kernel) {
        error_setg(errp, "Interrupt Remapping cannot work with "
                         "kernel-irqchip=on, please use 'split|off'.");
        return;
    }

>              error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
>              return false;
>          }
> -        if (!kvm_enable_x2apic()) {
> -            error_setg(errp, "eim=on requires support on the KVM side"
> -                             "(X2APIC_API, first shipped in v4.7)");
> -            return false;
> -        }
>      }
>  
>      /* Currently only address widths supported are 39 and 48 bits */
> -- 
> 2.31.1
> 

-- 
Peter Xu


