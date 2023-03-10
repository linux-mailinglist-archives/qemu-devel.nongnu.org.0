Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF56B526D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 21:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pajoX-0005bR-8g; Fri, 10 Mar 2023 15:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pajoV-0005bH-2o
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 15:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pajoS-0003A6-LU
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 15:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678481883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9frRCsrEa6H2i6nCXx+oMUrLjv/FyLSF0lESaP2gJzY=;
 b=d91OU63URVWLmyo3FYyvlP4taBTMlIpObUCXaFfAn6v0X47MW0GyQrswVl+mq4UcQBlB9k
 jmIu9iflGaUBfAXwPF9yWYNEKylv2R/HqIryLFeV1h7T7e5FEj+JT+PK1hfGXhhyR/JCZu
 xW0RgD1YL2UFGfsvsZonldIR7/2nZBc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-JO4nv8uzM0uujUvMhODd9A-1; Fri, 10 Mar 2023 15:58:02 -0500
X-MC-Unique: JO4nv8uzM0uujUvMhODd9A-1
Received: by mail-qk1-f199.google.com with SMTP id
 q25-20020a37f719000000b00742bfdd63ecso3782920qkj.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 12:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678481882;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9frRCsrEa6H2i6nCXx+oMUrLjv/FyLSF0lESaP2gJzY=;
 b=dH5HRs8Udi22hLniBxkaXLMx/UhZzFhDSi73BrV0GaAMkldyyDCkmthUbIjATVPjVd
 Fc65QJXU4d1jEIRftLFXy93xSOYOsf9gGwvHHYOFipH1+zTDwyTIaof/P/OYHiYYpjwY
 Wxb/hlZYaWHIkT2WlsfayZ3sHTNJ5es9CZbBLgUbQfugQ2rH3rHukPQVwxODZuL4tFUo
 0EALu9p2Vl+xorNZfAq7bWfD9wuh5sys1wTm+JAoZemArSu/wiTvIc6j1Ex8+7U77aYV
 bk+fAXcudXH/dl3ld+lR3zxpat0NdI1uPc8ddJG4lt3lmMjL97HO+ruGMcvZV2Dd2osS
 OinQ==
X-Gm-Message-State: AO0yUKXlGD43U/BRJ6m2AEMBjuIxUJuMJRt2hWbEAEFf0v/5lH2Kiik8
 GVFHOTrI+2FMNTbifh79Mw7mgO63yKaH4aQPzzuWq0ii0+VH1JHW8ixTXYq8z9NuofQpAsPjDg1
 t0RGYdiQqU65Elvo=
X-Received: by 2002:a05:622a:118a:b0:3bf:cc1b:9512 with SMTP id
 m10-20020a05622a118a00b003bfcc1b9512mr13928308qtk.1.1678481881704; 
 Fri, 10 Mar 2023 12:58:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8L9AgAGdbA/2Xf8ne5qC3/PAZnpdO0tf14wdLjrnm7R5ZqW1dmDAs+qDhZJTd+CUGNZ4Cdlg==
X-Received: by 2002:a05:622a:118a:b0:3bf:cc1b:9512 with SMTP id
 m10-20020a05622a118a00b003bfcc1b9512mr13928281qtk.1.1678481881291; 
 Fri, 10 Mar 2023 12:58:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 y10-20020ac83e8a000000b003bfbf3afe51sm472445qtf.93.2023.03.10.12.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 12:58:00 -0800 (PST)
Date: Fri, 10 Mar 2023 15:57:58 -0500
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [RFC PATCH] intel-iommu: Report interrupt remapping faults
Message-ID: <ZAuZ1g7GyrgvH+NP@x1n>
References: <825854379f8d3b2f6e021f31fb117daab023c8c8.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <825854379f8d3b2f6e021f31fb117daab023c8c8.camel@infradead.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 10, 2023 at 05:49:38PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There is more work to be done here, as pretranslations for the KVM IRQ
> routing table can't fault yet; they should be handled in userspace and
> the fault raised only when the IRQ actually happens (if indeed the IRTE
> is still not valid at that time). But we can work on that later; we can
> at least raise faults for the direct case.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> 
> Seemed like a good place to start.
> 
> Utterly untested yet except for building it. Do we have unit tests for
> this; anything which will deliberately cause DMA faults that I can
> extend to also do IR faults? Or should I resort to just hacking a Linux
> kernel to do things wrong?
> 

I am not aware of anything besides the test in kvm-unit-tests..

https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/blob/master/x86/intel-iommu.c

> Also, why does the generic X86IOMMUClass->int_remap function return
> VTD-specific values? Shouldn't it just return true or false, or an
> actual error from the system errno space?

Agree, a boolean seems to be enough. Not a huge problem, I guess.

> 
> I also think we're allowing Compatibility Format MSIs when we shouldn't
> (when GSTS_CFIS is clear); the reporting of VTD_FR_IR_REQ_COMPAT is
> conspicuous in its absence. But I can fix that in a separate commit.

Yes, thanks.

> 
> 
>  hw/i386/intel_iommu.c          | 115 +++++++++++++++++++++++++--------
>  hw/i386/intel_iommu_internal.h |   1 +
>  2 files changed, 89 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index faade7def8..946f6008fe 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -468,21 +468,12 @@ static void vtd_set_frcd_and_update_ppf(IntelIOMMUState *s, uint16_t index)
>  
>  /* Must not update F field now, should be done later */
>  static void vtd_record_frcd(IntelIOMMUState *s, uint16_t index,
> -                            uint16_t source_id, hwaddr addr,
> -                            VTDFaultReason fault, bool is_write,
> -                            bool is_pasid, uint32_t pasid)
> +                            uint64_t hi, uint64_t lo)
>  {
> -    uint64_t hi = 0, lo;
>      hwaddr frcd_reg_addr = DMAR_FRCD_REG_OFFSET + (((uint64_t)index) << 4);
>  
>      assert(index < DMAR_FRCD_REG_NR);
>  
> -    lo = VTD_FRCD_FI(addr);
> -    hi = VTD_FRCD_SID(source_id) | VTD_FRCD_FR(fault) |
> -         VTD_FRCD_PV(pasid) | VTD_FRCD_PP(is_pasid);
> -    if (!is_write) {
> -        hi |= VTD_FRCD_T;
> -    }
>      vtd_set_quad_raw(s, frcd_reg_addr, lo);
>      vtd_set_quad_raw(s, frcd_reg_addr + 8, hi);
>  
> @@ -508,17 +499,11 @@ static bool vtd_try_collapse_fault(IntelIOMMUState *s, uint16_t source_id)
>  }
>  
>  /* Log and report an DMAR (address translation) fault to software */
> -static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
> -                                  hwaddr addr, VTDFaultReason fault,
> -                                  bool is_write, bool is_pasid,
> -                                  uint32_t pasid)
> +static void vtd_report_frcd_fault(IntelIOMMUState *s, uint64_t source_id,
> +                                  uint64_t hi, uint64_t lo)
>  {
>      uint32_t fsts_reg = vtd_get_long_raw(s, DMAR_FSTS_REG);
>  
> -    assert(fault < VTD_FR_MAX);
> -
> -    trace_vtd_dmar_fault(source_id, fault, addr, is_write);
> -
>      if (fsts_reg & VTD_FSTS_PFO) {
>          error_report_once("New fault is not recorded due to "
>                            "Primary Fault Overflow");
> @@ -538,8 +523,7 @@ static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
>          return;
>      }
>  
> -    vtd_record_frcd(s, s->next_frcd_reg, source_id, addr, fault,
> -                    is_write, is_pasid, pasid);
> +    vtd_record_frcd(s, s->next_frcd_reg, hi, lo);
>  
>      if (fsts_reg & VTD_FSTS_PPF) {
>          error_report_once("There are pending faults already, "
> @@ -564,6 +548,42 @@ static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
>      }
>  }
>  
> +/* Log and report an DMAR (address translation) fault to software */
> +static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
> +                                  hwaddr addr, VTDFaultReason fault,
> +                                  bool is_write, bool is_pasid,
> +                                  uint32_t pasid)
> +{
> +    uint64_t hi, lo;
> +
> +    assert(fault < VTD_FR_MAX);
> +
> +    trace_vtd_dmar_fault(source_id, fault, addr, is_write);
> +
> +    lo = VTD_FRCD_FI(addr);
> +    hi = VTD_FRCD_SID(source_id) | VTD_FRCD_FR(fault) |
> +         VTD_FRCD_PV(pasid) | VTD_FRCD_PP(is_pasid);
> +    if (!is_write) {
> +        hi |= VTD_FRCD_T;
> +    }
> +
> +    vtd_report_frcd_fault(s, source_id, hi, lo);
> +}
> +
> +
> +static void vtd_report_ir_fault(IntelIOMMUState *s, uint64_t source_id,
> +                                VTDFaultReason fault, uint16_t index)
> +{
> +    uint64_t hi, lo;
> +
> +    lo = VTD_FRCD_IR_IDX(index);
> +    hi = VTD_FRCD_SID(source_id) | VTD_FRCD_FR(fault);
> +
> +    vtd_report_frcd_fault(s, source_id, hi, lo);
> +}
> +
> +#define log_irte_fault(f, sid, i) vtd_report_ir_fault(iommu, sid, f, i)

This one seems not used.

> +
>  /* Handle Invalidation Queue Errors of queued invalidation interface error
>   * conditions.
>   */
> @@ -3300,7 +3320,8 @@ static Property vtd_properties[] = {
>  
>  /* Read IRTE entry with specific index */
>  static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
> -                        VTD_IR_TableEntry *entry, uint16_t sid)
> +                        VTD_IR_TableEntry *entry, uint16_t sid,
> +                        bool do_fault)
>  {
>      static const uint16_t vtd_svt_mask[VTD_SQ_MAX] = \
>          {0xffff, 0xfffb, 0xfff9, 0xfff8};
> @@ -3311,6 +3332,9 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>      if (index >= iommu->intr_size) {
>          error_report_once("%s: index too large: ind=0x%x",
>                            __func__, index);
> +        if (do_fault) {
> +            vtd_report_ir_fault(iommu, sid, VTD_FR_IR_INDEX_OVER, index);
> +        }

IIUC it's only the fault reason to report, then I am thinking if it's
easier to let the caller taking care of that?

Though we'll need conditions for fault disabled, e.g....

>          return -VTD_FR_IR_INDEX_OVER;
>      }
>  
> @@ -3319,17 +3343,33 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>                          entry, sizeof(*entry), MEMTXATTRS_UNSPECIFIED)) {
>          error_report_once("%s: read failed: ind=0x%x addr=0x%" PRIx64,
>                            __func__, index, addr);
> +        if (do_fault) {
> +            vtd_report_ir_fault(iommu, sid, VTD_FR_IR_ROOT_INVAL, index);
> +        }
>          return -VTD_FR_IR_ROOT_INVAL;
>      }
>  
>      trace_vtd_ir_irte_get(index, le64_to_cpu(entry->data[1]),
>                            le64_to_cpu(entry->data[0]));
>  
> +	/*
> +	 * The remaining potential fault conditions are "qualified" by the
> +	 * Fault Processing Disable bit in the IRTE. Even "not present".
> +	 * So just clear the do_fault flag if PFD is set, which will
> +	 * prevent faults being raised.
> +	 */
> +	if (entry->irte.fault_disable) {
> +		do_fault = false;
> +    }
> +
>      if (!entry->irte.present) {
>          error_report_once("%s: detected non-present IRTE "
>                            "(index=%u, high=0x%" PRIx64 ", low=0x%" PRIx64 ")",
>                            __func__, index, le64_to_cpu(entry->data[1]),
>                            le64_to_cpu(entry->data[0]));
> +        if (do_fault) {
> +            vtd_report_ir_fault(iommu, sid, VTD_FR_IR_ENTRY_P, index);
> +        }
>          return -VTD_FR_IR_ENTRY_P;

... here IIUC we can do:

  if (entry->irte.fault_disable)
        return 0;
  else
        return -VTD_FR_IR_ENTRY_P;
        
Hence when error occurs we always keep the error report above, and let the
caller report IR fault when <0.  It seems this will at least avoid plenty
of same calls within vtd_irte_get().

I do see a few others outside vtd_irte_get().  In short, it'll be nice to
avoid calling this same pattern in multiple places somehow.

>      }
>  
> @@ -3339,6 +3379,9 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>                            "(index=%u, high=0x%" PRIx64 ", low=0x%" PRIx64 ")",
>                            __func__, index, le64_to_cpu(entry->data[1]),
>                            le64_to_cpu(entry->data[0]));
> +        if (do_fault) {
> +            vtd_report_ir_fault(iommu, sid, VTD_FR_IR_IRTE_RSVD, index);
> +        }
>          return -VTD_FR_IR_IRTE_RSVD;
>      }
>  
> @@ -3355,6 +3398,9 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>                  error_report_once("%s: invalid IRTE SID "
>                                    "(index=%u, sid=%u, source_id=%u)",
>                                    __func__, index, sid, source_id);
> +                if (do_fault) {
> +                    vtd_report_ir_fault(iommu, sid, VTD_FR_IR_SID_ERR, index);
> +                }
>                  return -VTD_FR_IR_SID_ERR;
>              }
>              break;
> @@ -3367,6 +3413,9 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>                  error_report_once("%s: invalid SVT_BUS "
>                                    "(index=%u, bus=%u, min=%u, max=%u)",
>                                    __func__, index, bus, bus_min, bus_max);
> +                if (do_fault) {
> +                    vtd_report_ir_fault(iommu, sid, VTD_FR_IR_SID_ERR, index);
> +                }
>                  return -VTD_FR_IR_SID_ERR;
>              }
>              break;
> @@ -3376,6 +3425,9 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>                                "(index=%u, type=%d)", __func__,
>                                index, entry->irte.sid_vtype);
>              /* Take this as verification failure. */
> +            if (do_fault) {
> +                vtd_report_ir_fault(iommu, sid, VTD_FR_IR_SID_ERR, index);
> +            }
>              return -VTD_FR_IR_SID_ERR;
>          }
>      }
> @@ -3385,12 +3437,12 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint16_t index,
>  
>  /* Fetch IRQ information of specific IR index */
>  static int vtd_remap_irq_get(IntelIOMMUState *iommu, uint16_t index,
> -                             X86IOMMUIrq *irq, uint16_t sid)
> +                             X86IOMMUIrq *irq, uint16_t sid, bool do_fault)
>  {
>      VTD_IR_TableEntry irte = {};
>      int ret = 0;
>  
> -    ret = vtd_irte_get(iommu, index, &irte, sid);
> +    ret = vtd_irte_get(iommu, index, &irte, sid, do_fault);
>      if (ret) {
>          return ret;
>      }
> @@ -3418,7 +3470,7 @@ static int vtd_remap_irq_get(IntelIOMMUState *iommu, uint16_t index,
>  static int vtd_interrupt_remap_msi(IntelIOMMUState *iommu,
>                                     MSIMessage *origin,
>                                     MSIMessage *translated,
> -                                   uint16_t sid)
> +                                   uint16_t sid, bool do_fault)
>  {
>      int ret = 0;
>      VTD_IR_MSIAddress addr;
> @@ -3437,6 +3489,9 @@ static int vtd_interrupt_remap_msi(IntelIOMMUState *iommu,
>      if (origin->address & VTD_MSI_ADDR_HI_MASK) {
>          error_report_once("%s: MSI address high 32 bits non-zero detected: "
>                            "address=0x%" PRIx64, __func__, origin->address);
> +        if (do_fault) {
> +            vtd_report_ir_fault(iommu, sid, VTD_FR_IR_REQ_RSVD, 0);
> +        }
>          return -VTD_FR_IR_REQ_RSVD;
>      }
>  
> @@ -3444,6 +3499,9 @@ static int vtd_interrupt_remap_msi(IntelIOMMUState *iommu,
>      if (addr.addr.__head != 0xfee) {
>          error_report_once("%s: MSI address low 32 bit invalid: 0x%" PRIx32,
>                            __func__, addr.data);
> +        if (do_fault) {
> +            vtd_report_ir_fault(iommu, sid, VTD_FR_IR_REQ_RSVD, 0);
> +        }
>          return -VTD_FR_IR_REQ_RSVD;
>      }
>  
> @@ -3463,7 +3521,7 @@ static int vtd_interrupt_remap_msi(IntelIOMMUState *iommu,
>          index += origin->data & VTD_IR_MSI_DATA_SUBHANDLE;
>      }
>  
> -    ret = vtd_remap_irq_get(iommu, index, &irq, sid);
> +    ret = vtd_remap_irq_get(iommu, index, &irq, sid, do_fault);
>      if (ret) {
>          return ret;
>      }
> @@ -3475,6 +3533,9 @@ static int vtd_interrupt_remap_msi(IntelIOMMUState *iommu,
>                                "(sid=%u, address=0x%" PRIx64
>                                ", data=0x%" PRIx32 ")",
>                                __func__, sid, origin->address, origin->data);
> +            if (do_fault) {
> +                vtd_report_ir_fault(iommu, sid, VTD_FR_IR_REQ_RSVD, 0);
> +            }
>              return -VTD_FR_IR_REQ_RSVD;
>          }
>      } else {
> @@ -3515,7 +3576,7 @@ static int vtd_int_remap(X86IOMMUState *iommu, MSIMessage *src,
>                           MSIMessage *dst, uint16_t sid)
>  {
>      return vtd_interrupt_remap_msi(INTEL_IOMMU_DEVICE(iommu),
> -                                   src, dst, sid);
> +                                   src, dst, sid, false);
>  }
>  
>  static MemTxResult vtd_mem_ir_read(void *opaque, hwaddr addr,
> @@ -3541,7 +3602,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
>          sid = attrs.requester_id;
>      }
>  
> -    ret = vtd_interrupt_remap_msi(opaque, &from, &to, sid);
> +    ret = vtd_interrupt_remap_msi(opaque, &from, &to, sid, true);
>      if (ret) {
>          /* TODO: report error */
>          /* Drop this interrupt */
> diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
> index f090e61e11..37db7d44df 100644
> --- a/hw/i386/intel_iommu_internal.h
> +++ b/hw/i386/intel_iommu_internal.h
> @@ -268,6 +268,7 @@
>  #define VTD_FRCD_FI(val)        ((val) & ~0xfffULL)
>  #define VTD_FRCD_PV(val)        (((val) & 0xffffULL) << 40)
>  #define VTD_FRCD_PP(val)        (((val) & 0x1) << 31)
> +#define VTD_FRCD_IR_IDX(val)    (((val) & 0xffffULL) << 48)
>  
>  /* DMA Remapping Fault Conditions */
>  typedef enum VTDFaultReason {
> -- 
> 2.34.1
> 
> 



-- 
Peter Xu


