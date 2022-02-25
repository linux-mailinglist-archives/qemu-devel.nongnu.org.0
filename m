Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C294C3CAF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 04:53:57 +0100 (CET)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRg3-00071K-Hn
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 22:53:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nNRei-0006LA-Ai
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 22:52:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nNRef-0001Bh-3R
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 22:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645761147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gK1IobmioAvowTK/AFrStJhSVeA4AsVnDZIgNJ9g67w=;
 b=hsAH+o2K76oQHAILYh0SOesux9GIH1BXnUXlvZ7tp4OeM66Aieero25o+B/Km/sksVv+Es
 tnU36+Mu0LhPf6HyfrbzIBHQW176bXYOWt3A8FDOiAEIlCO8ztKaZpFbEZlPdrnCfueNcb
 coRiZ1BKjGZedGZbPJ9iRV/m/EkHuTQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-cEd4d2eYPOOaVC_Ze1K6Lw-1; Thu, 24 Feb 2022 22:52:26 -0500
X-MC-Unique: cEd4d2eYPOOaVC_Ze1K6Lw-1
Received: by mail-lj1-f200.google.com with SMTP id
 b16-20020a05651c0b1000b0024647a956a2so2036135ljr.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 19:52:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gK1IobmioAvowTK/AFrStJhSVeA4AsVnDZIgNJ9g67w=;
 b=BNR2GAfJkvr6XMcvfrzlbkb/oO2TOlcXmyQz5bpBgUHDmdw47SMlQwrAgUP/fPn/os
 WIrvY6ZCZVAi/CDckSGIIVsLZVnwjAeOVWVHZzTaMG2FSRnl2CUM2IgPth9IR9E/lTPU
 rZA/XlKk7oEzcCbn7lFAqqviCyOJFDNgY4By1bKOJHY+SjtwSb3WpniDCV5KEs3axXeh
 8T3pnmLXeST5dM6yhq0A0ZT7GCXRXVF/E3U5K+Fl6XPmLyXvG8Ro9MpYvPJ8nDZenDDU
 hxOupIQ0WHM8YFwul3ZFLi5Fg21SDOURDAAsat1y5vWqYg+4CRdCAH13+cs2O4H0vPPo
 KTxQ==
X-Gm-Message-State: AOAM530MZp9S1o18BO65kjObLm4LP4r2Frh60m0IAaY5/ZtkpvOUGB5m
 f1TgZ9sfSUNYG28zJsI6lQ7Qsf3r5DAzpuhUpCb6KASobjfGQ6erDkknvcWAqNMhti3++IXW/k0
 foBteqbVXV3L8IvJBvwBCVGsMw6JCwrs=
X-Received: by 2002:a2e:a885:0:b0:23a:30ac:5798 with SMTP id
 m5-20020a2ea885000000b0023a30ac5798mr4091403ljq.73.1645761145084; 
 Thu, 24 Feb 2022 19:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytAHGLaMh68ANom4912up2DNGSLjGwodptf/LOVMWQZxvuGfAeZ8uTcHftynqHPBRQlQS245R+sp0O5qEBMmk=
X-Received: by 2002:a2e:a885:0:b0:23a:30ac:5798 with SMTP id
 m5-20020a2ea885000000b0023a30ac5798mr4091378ljq.73.1645761144743; Thu, 24 Feb
 2022 19:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220224131607-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Feb 2022 11:52:13 +0800
Message-ID: <CACGkMEsE1gwaT2jCb4pONdki36Fsojxcz=SOi6Vb1MNy3Nf_VA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 2:30 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:
> > On 2/24/22 17:23, Michael S. Tsirkin wrote:
> > > On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:
> > >> On 2/23/22 23:35, Joao Martins wrote:
> > >>> On 2/23/22 21:22, Michael S. Tsirkin wrote:
> > >>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> > >>>>> +                                          uint64_t pci_hole64_size)
> > >>>>> +{
> > >>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> > >>>>> +    uint32_t eax, vendor[3];
> > >>>>> +
> > >>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> > >>>>> +    if (!IS_AMD_VENDOR(vendor)) {
> > >>>>> +        return;
> > >>>>> +    }
> > >>>>
> > >>>> Wait a sec, should this actually be tying things to the host CPU ID?
> > >>>> It's really about what we present to the guest though,
> > >>>> isn't it?
> > >>>
> > >>> It was the easier catch all to use cpuid without going into
> > >>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
> > >>> for systems with an IOMMU present.
> > >>>
> > >>>> Also, can't we tie this to whether the AMD IOMMU is present?
> > >>>>
> > >>> I think so, I can add that. Something like a amd_iommu_exists() helper
> > >>> in util/vfio-helpers.c which checks if there's any sysfs child entries
> > >>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
> > >>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
> > >>> even worth checking the range exists in:
> > >>>
> > >>>   /sys/kernel/iommu_groups/0/reserved_regions
> > >>>
> > >>> (Also that sysfs ABI is >= 4.11 only)
> > >>
> > >> Here's what I have staged in local tree, to address your comment.
> > >>
> > >> Naturally the first chunk is what's affected by this patch the rest is a
> > >> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
> > >> all the tests and what not.
> > >>
> > >> I am not entirely sure this is the right place to put such a helper, open
> > >> to suggestions. wrt to the naming of the helper, I tried to follow the rest
> > >> of the file's style.
> > >>
> > >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > >> index a9be5d33a291..2ea4430d5dcc 100644
> > >> --- a/hw/i386/pc.c
> > >> +++ b/hw/i386/pc.c
> > >> @@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> > >>                                            uint64_t pci_hole64_size)
> > >>  {
> > >>      X86MachineState *x86ms = X86_MACHINE(pcms);
> > >> -    uint32_t eax, vendor[3];
> > >>
> > >> -    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> > >> -    if (!IS_AMD_VENDOR(vendor)) {
> > >> +    if (!qemu_amd_iommu_is_present()) {
> > >>          return;
> > >>      }
> > >>
> > >> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > >> index 7bcce3bceb0f..eb4ea071ecec 100644
> > >> --- a/include/qemu/osdep.h
> > >> +++ b/include/qemu/osdep.h
> > >> @@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
> > >>   */
> > >>  size_t qemu_get_host_physmem(void);
> > >>
> > >> +/**
> > >> + * qemu_amd_iommu_is_present:
> > >> + *
> > >> + * Operating system agnostic way of querying if an AMD IOMMU
> > >> + * is present.
> > >> + *
> > >> + */
> > >> +bool qemu_amd_iommu_is_present(void);
> > >> +
> > >>  /*
> > >>   * Toggle write/execute on the pages marked MAP_JIT
> > >>   * for the current thread.
> > >> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> > >> index f2be7321c59f..54cef21217c4 100644
> > >> --- a/util/oslib-posix.c
> > >> +++ b/util/oslib-posix.c
> > >> @@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
> > >>  #endif
> > >>      return 0;
> > >>  }
> > >> +
> > >> +bool qemu_amd_iommu_is_present(void)
> > >> +{
> > >> +    bool found = false;
> > >> +#ifdef CONFIG_LINUX
> > >> +    struct dirent *entry;
> > >> +    char *path;
> > >> +    DIR *dir;
> > >> +
> > >> +    path = g_strdup_printf("/sys/class/iommu");
> > >> +    dir = opendir(path);
> > >> +    if (!dir) {
> > >> +        g_free(path);
> > >> +        return found;
> > >> +    }
> > >> +
> > >> +    do {
> > >> +            entry = readdir(dir);
> > >> +            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
> > >> +                found = true;
> > >> +                break;
> > >> +            }
> > >> +    } while (entry);
> > >> +
> > >> +    g_free(path);
> > >> +    closedir(dir);
> > >> +#endif
> > >> +    return found;
> > >> +}
> > >
> > > why are we checking whether an AMD IOMMU is present
> > > on the host?
> > > Isn't what we care about whether it's
> > > present in the VM? What we are reserving after all
> > > is a range of GPAs, not actual host PA's ...
> > >
> > Right.
> >
> > But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
> > and so we need to not map that portion of address space entirely
> > and use some other portion of the GPA-space. This has to
> > do with host IOMMU which is where the DMA mapping of guest PA takes
> > place. So, if you do not have an host IOMMU, you can't
> > service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
> > don't need this problem.
> >
> > Whether one uses a guest IOMMU or not does not affect the result,
> > it would be more of a case of mimicking real hardware not fixing
> > the issue of this series.
>
>
> Hmm okay ... my first reaction was to say let's put it under VFIO then.
> And ideally move the logic reporting reserved ranges there too.
> However, I think vdpa has the same issue too.
> CC Jason for an opinion.

vDPA is even more complicated than VFIO as it allows the device to
reserve specific IOVA ranges:

static void vhost_vdpa_set_iova_range(struct vhost_vdpa *v)
{
        struct vdpa_iova_range *range = &v->range;
        struct vdpa_device *vdpa = v->vdpa;
        const struct vdpa_config_ops *ops = vdpa->config;

        if (ops->get_iova_range) {
                *range = ops->get_iova_range(vdpa);
...
}

I wonder if we need to expose those via netlink protocol.

Thanks

> Also, some concerns
> - I think this changes memory layout for working VMs not using VFIO.
>   Better preserve the old layout for old machine types?
>
> - You mention the phys bits issue very briefly, and it's pretty
>   concerning.  Do we maybe want to also disable the work around if phys
>   bits is too small? Also, we'd need to test a bunch of old
>   guests to see what happens. Which guests were tested?
>
> --
> MST
>


