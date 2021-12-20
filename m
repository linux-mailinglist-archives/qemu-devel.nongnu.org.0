Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACB47B22E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:31:47 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMVm-0005vP-NN
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKb5-00068r-NY
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:29:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKb0-00030P-BO
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OSLdQYtaAE+KxJRSEto8PUIHyVRplaPjVQGwutQdkcE=;
 b=DfHRDn/RsnJOCdyHAFgKO2W6zoMbf4z19g5CShJjfV4FKhXZ2cPW/HB/d3fSjGr6yr7K+5
 znA5h6aMH/qGujEXJr2+jzVOeaKKA/zlhkRBYIRQuvQsUfvVnjFY4FS2hCrzb9uowOp20P
 BgNOetMSLTt4yEoO+cGgNdw2ZrEYkco=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-OzIeDGbOOkC_09OcG9VEiQ-1; Mon, 20 Dec 2021 05:07:35 -0500
X-MC-Unique: OzIeDGbOOkC_09OcG9VEiQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso3591509wrh.20
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 02:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OSLdQYtaAE+KxJRSEto8PUIHyVRplaPjVQGwutQdkcE=;
 b=Df/ur7r74sL0HRkaXZc4FT19+G4VTKzMRzuhKvecKVRrksKKgo8nLZCaYwGu3jpJxE
 1ZYGriI0C71hSErbMkhMZ00ka9S8+RDHm7kVGL3vhkyGChYf7cKTkUaYiHHKkWSXzgg7
 jrYdkp2jukTc3Al/w8KHKwQLfbtAUSjCfRfwcOPuwHpEIMjVLYEJKuNvqzK6tV1Tqx4o
 em13LEo+FCY1g81efjYkvDqV6WWcfUFxyFH4/w6j4xuiDPZW7dKgxc6C0tYtKDKElON8
 Li9E2TCM91vlPQRTaq9D9BR0l53c9fxg/+QBB3go1QxdiAu/W9NOmy9MJjmZW80NIY/F
 9lWg==
X-Gm-Message-State: AOAM533ihJgGWIFSonqQUvkjUXlAhYW7pg180011bwjP3JTwpfOr29kb
 DV+dzVt+iifdW0eJLw6X0R0KIJ3OupZYmyZLA1xX/H6Zp5/3ppg7jktbbIr+tm3lWrdrPXrXQLb
 5nd3S/7OzXG4SDzc=
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr13574713wms.169.1639994853874; 
 Mon, 20 Dec 2021 02:07:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws/VOBgVZgMhOehZp/Gf5UnrmrB2XNJXzkxVBaGeg306WSIgO2FP9gd/nistGckWlx/GS0uQ==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr13574474wms.169.1639994850595; 
 Mon, 20 Dec 2021 02:07:30 -0800 (PST)
Received: from xz-m1.local ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id p2sm6071801wrs.112.2021.12.20.02.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 02:07:29 -0800 (PST)
Date: Mon, 20 Dec 2021 18:07:22 +0800
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 4/4] intel_iommu: Fix irqchip / X2APIC configuration
 checks
Message-ID: <YcBV2uSVTSm3pvVX@xz-m1.local>
References: <20211209220840.14889-1-dwmw2@infradead.org>
 <20211209220840.14889-4-dwmw2@infradead.org>
 <Ybr9Cn7GPKbm/rzL@xz-m1.local>
 <ebaa70df2b126e3cdded33d0281828cd9cd6de04.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ebaa70df2b126e3cdded33d0281828cd9cd6de04.camel@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 04:51:20PM +0000, David Woodhouse wrote:
> On Thu, 2021-12-16 at 16:47 +0800, Peter Xu wrote:
> > Hi, David,
> > 
> > On Thu, Dec 09, 2021 at 10:08:40PM +0000, David Woodhouse wrote:
> > > We don't need to check kvm_enable_x2apic(). It's perfectly OK to support
> > > interrupt remapping even if we can't address CPUs above 254. Kind of
> > > pointless, but still functional.
> > 
> > We only checks kvm_enable_x2apic() if eim=on is set, right?  I mean, we can
> > still enable IR without x2apic even with current code?
> > 
> > Could you elaborate what's the use scenario for this patch?  Thanks in advance.
> 
> You can have IR, EIM *and* X2APIC if kvm_enable_x2apic() fails. You
> just can't have any CPUs with an APIC ID > 254.
> 
> But qemu is going to bail out *anyway* if you attempt to have CPUs with
> APIC IDs above 254 without the corresponding kernel-side support, so
> there's no need to check it here.

Ah OK.

> 
> > > The check on kvm_enable_x2apic() needs to happen *anyway* in order to
> > > allow CPUs above 254 even without an IOMMU, so allow that to happen
> > > elsewhere.
> > > 
> > > However, we do require the *split* irqchip in order to rewrite I/OAPIC
> > > destinations. So fix that check while we're here.
> > > 
> > > Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > 
> > I think the r-b and a-b should be for patch 2 not this one? :)
> > 
> 
> Yes, I think I must have swapped those round. Thanks.
> 
> > > ---
> > >  hw/i386/intel_iommu.c | 7 +------
> > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index bd288d45bb..0d1c72f08e 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3760,15 +3760,10 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
> > >                                                ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> > >      }
> > >      if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
> > > -        if (!kvm_irqchip_in_kernel()) {
> > > +        if (!kvm_irqchip_is_split()) {
> > 
> > I think this is okay, but note that we'll already fail if !split in
> > x86_iommu_realize():
> > 
> >     bool irq_all_kernel = kvm_irqchip_in_kernel() && !kvm_irqchip_is_split();
> > 
> >     /* Both Intel and AMD IOMMU IR only support "kernel-irqchip={off|split}" */
> >     if (x86_iommu_ir_supported(x86_iommu) && irq_all_kernel) {
> >         error_setg(errp, "Interrupt Remapping cannot work with "
> >                          "kernel-irqchip=on, please use 'split|off'.");
> >         return;
> >     }
> 
> OK, then perhaps the entire check is redundant?

Yes, maybe.

It also reminded me that this is the only place that we used the "buggy_eim"
variable.  If we drop this chunk, that flag will become meaningless.

If we look back, it seems to decides whether we should call kvm_enable_x2apic()
at all, so as to be compatible with old qemus.  Please see commit fb506e701e
("intel_iommu: reject broken EIM", 2016-10-17).

hw_compat_2_7 has:

    { "intel-iommu", "x-buggy-eim", "true" },

It means kvm_enable_x2apic() (at least before commit c1bb5418e3 of yours)
should be skipped for 2.7 or older version of QEMU binaries.

Now after commit c1bb5418e3 we'll unconditionally call kvm_enable_x2apic() in
x86_cpu_load_model() anyway, even if x-buggy-eim=on.  IIUC it violates with the
original purpose of commit fb506e701e.

However maybe it's not necessary to maintain that awkward/buggy compatibility
at all for those old qemu binaries.  I can hardly imagine someone uses vIOMMU
2.7- versions for production purposes, and for relying on that buggy behavior
to work.

To summarize: I'm wondering whether we should also drop buggy-eim as a whole..

Thanks,

-- 
Peter Xu


