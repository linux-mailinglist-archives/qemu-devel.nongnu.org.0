Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A36107A0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:06:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEkV-0006jI-Cd; Thu, 27 Oct 2022 22:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEkH-0006fh-Fm
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEkF-0002oS-QH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666922714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7K058gj8SyugkyzejY+vUPJfEieshe68CPkEZQoCVQ=;
 b=GK91RlbQhrXgD7AEuXy/qkU3L4oQBuiGyNMqazDjtCPs2AE9Ynyq758KcgXcqcUwntqY2t
 5i6G8//lvti1CKpmCBfdc25u+OQ6tovMc4c3D1hPvqvj5ec4+pWimJ2fADAa9SO4IE8EOC
 7mgb+fBpR6UcIxIt/xk0SBU2urcihso=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-8v_f2RW3McCvr85XjS1FXg-1; Thu, 27 Oct 2022 22:05:12 -0400
X-MC-Unique: 8v_f2RW3McCvr85XjS1FXg-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso1968529ejb.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 19:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X7K058gj8SyugkyzejY+vUPJfEieshe68CPkEZQoCVQ=;
 b=3jxkOY3nDwyg3UQNL40iehK4MFomJL4+8bbTsqCQ7GQjrFfeqFuN1HODfK0wJdya6S
 sn7g5XUEsN5gsEmnYipsUT4nDUDW1KcXq8PLJlicrUqi7yKdCL0sdL3bF+sFjEBsHbyh
 KHPIHIrxeYZPoBzyc1y5qvFMg7tFwEmnuBEOiXCkErlZ/BZwaaaGDpglsLBlN9wVd1+8
 B/5hrTPY/3AT1m0nsrrTuGPJcc70FDgurtJ20Hl/CwOE6ruTGtGRhkVLddG28Bq4reYR
 yfONpIInHzwBPuSQJgFEpBVOepzitEzD+KfXlqTUA2E11Auy7oF6f+COo2oLW/i+IZZp
 ooLA==
X-Gm-Message-State: ACrzQf0etDcb9UQ/KrSVUu1PmCD2fpN0RKm5txNefuAG2E8H2iqV5u0L
 hmc91/BVMio/qIo4s5SH/Ow3FVsrJgxh5o1t1d2/MCI/fI5ETdGhVnEEUCaN4ovSVJH/RJwzaTs
 LHJNJ2xRIrknkKsR8S2ihB/xBRmZUMh0=
X-Received: by 2002:aa7:c491:0:b0:461:7f0c:c573 with SMTP id
 m17-20020aa7c491000000b004617f0cc573mr28400755edq.8.1666922711686; 
 Thu, 27 Oct 2022 19:05:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Go0LBs8F8i29ll5EpzMnVONydbD66ICqa6A10Tb+5cX6AKLzZF84mEbePYbnyW1e/ZNGhr3TJICmiA1WSAY0=
X-Received: by 2002:aa7:c491:0:b0:461:7f0c:c573 with SMTP id
 m17-20020aa7c491000000b004617f0cc573mr28400740edq.8.1666922711463; Thu, 27
 Oct 2022 19:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221027075042.16894-1-jasowang@redhat.com>
 <20221027075042.16894-4-jasowang@redhat.com>
 <7b0c2ff0-f516-aec7-40db-86b2dfb2c653@intel.com>
In-Reply-To: <7b0c2ff0-f516-aec7-40db-86b2dfb2c653@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Oct 2022 10:04:58 +0800
Message-ID: <CACGkMEsSJNn1Bv74BSeFVf67YRTx-nL7VoR72D+jn5Ex25r9KQ@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
To: Yi Liu <yi.l.liu@intel.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, 
 yi.y.sun@linux.intel.com, eperezma@redhat.com, lulu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 9:16 PM Yi Liu <yi.l.liu@intel.com> wrote:
>
> On 2022/10/27 15:50, Jason Wang wrote:
> > We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
> > internal goto which prevents it from being reused. This patch convert
> > that macro to a dedicated function and let the caller to decide what
> > to do (e.g using goto or not). This makes sure it can be re-used for
> > other function that requires fault reporting.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> > Changes since V2:
> > - rename vtd_qualify_report_fault() to vtd_report_qualify_fault()
> > ---
> >   hw/i386/intel_iommu.c | 42 ++++++++++++++++++++++++++++--------------
> >   1 file changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 6abe12a8c5..6c03ecf3cb 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -49,17 +49,6 @@
> >   /* pe operations */
> >   #define VTD_PE_GET_TYPE(pe) ((pe)->val[0] & VTD_SM_PASID_ENTRY_PGTT)
> >   #define VTD_PE_GET_LEVEL(pe) (2 + (((pe)->val[0] >> 2) & VTD_SM_PASID_ENTRY_AW))
> > -#define VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write) {\
> > -    if (ret_fr) {                                                             \
> > -        ret_fr = -ret_fr;                                                     \
> > -        if (is_fpd_set && vtd_is_qualified_fault(ret_fr)) {                   \
> > -            trace_vtd_fault_disabled();                                       \
> > -        } else {                                                              \
> > -            vtd_report_dmar_fault(s, source_id, addr, ret_fr, is_write);      \
> > -        }                                                                     \
> > -        goto error;                                                           \
> > -    }                                                                         \
> > -}
> >
> >   /*
> >    * PCI bus number (or SID) is not reliable since the device is usaully
> > @@ -1718,6 +1707,19 @@ out:
> >       trace_vtd_pt_enable_fast_path(source_id, success);
> >   }
> >
> > +static void vtd_report_qualify_fault(IntelIOMMUState *s,
> > +                                     int err, bool is_fpd_set,
> > +                                     uint16_t source_id,
> > +                                     hwaddr addr,
> > +                                     bool is_write)
> > +{
> > +    if (is_fpd_set && vtd_is_qualified_fault(err)) {
> > +        trace_vtd_fault_disabled();
> > +    } else {
> > +        vtd_report_dmar_fault(s, source_id, addr, err, is_write);
>
> seems like this will report non-qualified fault. so the naming is not
> most suit. :-) Otherwise, I'm ok with the change.

Right, let me rename it to vtd_report_fault().

Thanks

>
> > +    }
> > +}
> > +
> >   /* Map dev to context-entry then do a paging-structures walk to do a iommu
> >    * translation.
> >    *
> > @@ -1778,7 +1780,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> >           is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
> >           if (!is_fpd_set && s->root_scalable) {
> >               ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
> > -            VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> > +            if (ret_fr) {
> > +                vtd_report_qualify_fault(s, -ret_fr, is_fpd_set,
> > +                                         source_id, addr, is_write);
> > +                goto error;
> > +            }
> >           }
> >       } else {
> >           ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
> > @@ -1786,7 +1792,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> >           if (!ret_fr && !is_fpd_set && s->root_scalable) {
> >               ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
> >           }
> > -        VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> > +        if (ret_fr) {
> > +            vtd_report_qualify_fault(s, -ret_fr, is_fpd_set,
> > +                                     source_id, addr, is_write);
> > +            goto error;
> > +        }
> >           /* Update context-cache */
> >           trace_vtd_iotlb_cc_update(bus_num, devfn, ce.hi, ce.lo,
> >                                     cc_entry->context_cache_gen,
> > @@ -1822,7 +1832,11 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> >
> >       ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
> >                                  &reads, &writes, s->aw_bits);
> > -    VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
> > +    if (ret_fr) {
> > +        vtd_report_qualify_fault(s, -ret_fr, is_fpd_set, source_id,
> > +                                 addr, is_write);
> > +        goto error;
> > +    }
> >
> >       page_mask = vtd_slpt_level_page_mask(level);
> >       access_flags = IOMMU_ACCESS_FLAG(reads, writes);
>
> --
> Regards,
> Yi Liu
>


