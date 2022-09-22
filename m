Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE155E6B4C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:54:21 +0200 (CEST)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRL2-0002XW-88
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obPFC-0005tE-Fv
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obPF8-00067h-7W
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663864805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FoU5k5YezdtoVCOpE768w8sLb6a1W8HGqsYG4lswDvg=;
 b=Ou06ct5BawI89RJ9rrkyolR+gAOcJKvFaqMuWEgrpiVpcwiSR6bsaM1FbZsRi+CNbvpiS4
 vZBzu3x50tEH8ZOJzlOwcgSdRTNPJvZrQ8s+lqs9HyA5ZsPlJodfif8+3iTjE37Apboior
 SPMaZiilwwRwv1mq4ogDRfxwpi2RbpQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-KzDw016nOCykL3nZ0qUA_Q-1; Thu, 22 Sep 2022 12:40:03 -0400
X-MC-Unique: KzDw016nOCykL3nZ0qUA_Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 k10-20020ad4450a000000b004aa116eebe8so6741608qvu.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=FoU5k5YezdtoVCOpE768w8sLb6a1W8HGqsYG4lswDvg=;
 b=PKnMKNO6v/p0Et9/83ooPHLXD+yeDtIET9r8524IYw7QK40rTElesoajKTVvj1W+MD
 hDNgrsinq/mOX9/dWU5gptIf19QuxuglHPj83EjQ61lpPeeEXqqrVBp5GojiFREzlSDN
 S7d5jzSx1CVS1ozhPuHze7EV3dEaiP0kL6Av8PXNK2xd/0qDF4m9zCIW9ABVl7LNlouh
 b0Lq37MhRM4ThGRR1NalxtTHdFw7Zq1HTghxx6mhdr3EJkmk76Syy64D8ZxZwqD3tXDu
 z5W3Qm7t7XXi6SIqPXvJ1gIDa2npgN+rMUcG37XsKv9mEpVpWrz9lSBfG/oxbw1dgixZ
 Hotw==
X-Gm-Message-State: ACrzQf3+Rl/xNlIfqeRPcFcbKA1IJjDQ9TJ7Pe249gExK6d2ZjLqFEze
 sMEMOZrVq8OVGm4PqJTsFXzyH6R11o04FMMEyYZaupnhsSlg7ZGAtcGy1LOYnReJcHWHp5dsR4g
 wNKyVuJiy/hvEaUc=
X-Received: by 2002:a05:6214:20e5:b0:4aa:b01f:471f with SMTP id
 5-20020a05621420e500b004aab01f471fmr3396803qvk.38.1663864803151; 
 Thu, 22 Sep 2022 09:40:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7O0NG3v8YsuWrveVFU9yZXVbQ3rFU8Z48oiyZ0SSq1NKSbhzowWXDdgFXJBOZf0VmxY7P/ig==
X-Received: by 2002:a05:6214:20e5:b0:4aa:b01f:471f with SMTP id
 5-20020a05621420e500b004aab01f471fmr3396786qvk.38.1663864802926; 
 Thu, 22 Sep 2022 09:40:02 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05622a01c600b0035bb84a4150sm3961463qtw.71.2022.09.22.09.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:40:02 -0700 (PDT)
Date: Thu, 22 Sep 2022 12:40:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <YyyP4b2uKghi1EHL@xz-m1.local>
References: <20220921161227.57259-1-peterx@redhat.com>
 <20220922154617.57d1a1fb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220922154617.57d1a1fb@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 03:46:17PM +0200, Igor Mammedov wrote:
> On Wed, 21 Sep 2022 12:12:27 -0400
> Peter Xu <peterx@redhat.com> wrote:
> 
> > It's true that when vcpus<=255 we don't require the length of 32bit APIC
> > IDs.  However here since we already have EIM=ON it means the hypervisor
> > will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
> > EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
> > even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
> > that wants to boot a VM with >=9 but <=255 vcpus with:
> > 
> >   -device intel-iommu,intremap=on
> > 
> > For anyone who does not want to enable x2apic, we can use eim=off in the
> > intel-iommu parameters to skip enabling KVM x2apic.
> > 
> > This partly reverts commit 77250171bdc02aee106083fd2a068147befa1a38, while
> > keeping the valid bit on checking split irqchip, but revert the other change.
> > 
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Claudio Fontana <cfontana@suse.de>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 05d53a1aa9..6524c2ee32 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3818,6 +3818,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
> >              error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
> >              return false;
> >          }
> > +        if (!kvm_enable_x2apic()) {
> 
> above 'check' has side-effects
> if it's supposed to be a check it would be better to use kvm_has_x2apic_api()
> instead.

A check is not what I wanted.

As stated in the commit message, since for some reason EIM is enabled on
the VT-d device already, we need to enable x2apic for the whole guest
(including KVM) to match with EIM=on being declared even if vcpus<255.

> 
> Also 77250171bdc says:
> "
>     The check on kvm_enable_x2apic() needs to happen *anyway* in order to
>     allow CPUs above 254 even without an IOMMU, so allow that to happen
>     elsewhere.
> "
> 
> Looking for that elsewhere, it looks like commit dc89f32d92b was supposed
> to take care of removed chunk, but that is not reachable because of > 255 vCPUs"
> 
> Likely 77250171bdc just exposed a bug in dc89f32d92b, where
> the later removed kvm_enable_x2apic() always called (with split irqchip)
> and made it called only when > 255 vCPUs.
> 
> So migration wise it looks like all version with it and less than 255 cpus
> are broken.
> 
> Wait earlier c1bb5418e3, introduced that
>    kvm_irqchip_is_split() && kvm_enable_x2apic()
> 'condition', also without any compat machinery to keep old behavior.

There's actually some attempt to be compatible, with:

 GlobalProperty pc_compat_5_1[] = {
     { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
+    { TYPE_X86_CPU, "kvm-msi-ext-dest-id", "off" },
 };

But I don't think that's strictly correct, because afaict that only
controls whether guest enables it or not (I can only see Linux does it that
way; no idea whether that's detected to other OSes from the PV interfaces).
The KVM x2apic will still be enabled even on old machines I think, as you
mentioned.

> 
> And before that kvm_enable_x2apic() was affecting only configuration
> with intel_iommu (fb506e701e9b).

Right, afaict that's what we "officially" support.

> 
> I'm not sure if anything could be salvaged here migration wise

This whole thing is indeed very unfortunate.  For easier reference of
future, here are the list of commits that are relevant in time order:

fb506e701e ("intel_iommu: reject broken EIM", 2016-10-17)
c1bb5418e3 ("target/i386: Support up to 32768 CPUs without IRQ remapping", 2020-12-10)
77250171bd ("intel_iommu: Fix irqchip / X2APIC configuration checks", 2022-05-16)
dc89f32d92 ("target/i386: Fix sanity check on max APIC ID / X2APIC enablement", 2022-05-16)

So regarding compatibility I'm wondering whether we should loose it for
this case, depending on whether vendors (like RH, or QEMU community in
general) should support "allowing 32K vcpu without vIOMMU" as an "official"
feature, or treat it as "experimental only".

IMO it's more important to always make the officially supported bits
compatible and work as expected.  Here IIUC the (only) official way to
support >255 vcpus should still be using vIOMMU with EIM enabled so far.
But I'm happy to be corrected..

If so, I would still suggest having such a patch because it should fix one
of the basic use cases with vIOMMU and currently upstream is broken on it.
This patch will definitely change the behavior again, but the old was
simply broken and we don't really have much choice out of it, IMHO.

Thanks,

> 
> PS:
> I'd keep kvm_enable_x2apic() only in corrected x86_cpus_init()
> and use kvm_has_x2apic_api() elsewhere for checks and bailing out.
> 
> 
> > +            error_setg(errp, "eim=on requires support on the KVM side"
> > +                             "(X2APIC_API, first shipped in v4.7)");
> > +            return false;
> > +        }
> 
> 
> 
> >      }
> >  
> >      /* Currently only address widths supported are 39 and 48 bits */
> 

-- 
Peter Xu


