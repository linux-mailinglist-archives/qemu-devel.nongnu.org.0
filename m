Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EF4D8877
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:47:46 +0100 (CET)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmvB-0008GG-FR
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:47:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nTmZ7-00085n-C4
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:24:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nTmZ4-00040v-Fv
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647271493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xOJcx0cmLDQK1gGjHMb+p67BMvylagIHDxUOd/Ur3nU=;
 b=CtxGmOd1i9mhCqEWdNqM+VG1cAObMVLRecpEMVEsSt+SJFCmeHZrRZbHE90NsIsrdT2lcX
 UhbZqEJfVCNWZon0E8Igmnwpg+Y16JigLgCE8Wi3zyr0cadpx4Zsi5mvWGlcTkp5BeZqyn
 jDgPQxWlqTPRUvPFPmHILMKHLDovyAY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-icilYJkgM96UI64Dge7QtA-1; Mon, 14 Mar 2022 11:24:52 -0400
X-MC-Unique: icilYJkgM96UI64Dge7QtA-1
Received: by mail-wr1-f69.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so4492538wrw.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 08:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xOJcx0cmLDQK1gGjHMb+p67BMvylagIHDxUOd/Ur3nU=;
 b=R6W+UWSUWZ8LOnIat2mkYedWgdx/15N5PuTRO03+AytKygqlH9rz45vPjk4cNBNCmo
 NyNTG4kWxTWvShkn8YbGPuh3395ZGC0WZ15afyqeb/WbvGskDjbl/X20nyfBW7c4lhQO
 O/APJ69tdrfylYof7K1eQxnTzTaqRETNKBmJm1FGxEbl0MNF/fN1S8HtJ8Q/jtqNDA4E
 4Xv5GOT+5bfW+VUlZGYs6544dCtQbpeL0+dYXntaSIJYB1VOiGS5sff7zl2vaY3TBlEN
 C8nmye+2W1LjRYZLIjzRKCzgBdUf9oGaWlU6dRk7U5IO4WEsOtwQKTvk/51lp9ZJBWhY
 pU/w==
X-Gm-Message-State: AOAM530bKmAw8870mIjbM3cAM95l0itEapBX/lNK9KQ6UHvNdobRPbVF
 1phuHPnaaNqtoXhN9RHRxdFyhd1rcbc/8Zr29E2z7Tf6h0tNjMcHvBEh65u+eztcRsVREOyayS2
 bEud1F1ZZKsI/OFQ=
X-Received: by 2002:a5d:5850:0:b0:1fc:a7d7:e33b with SMTP id
 i16-20020a5d5850000000b001fca7d7e33bmr16569435wrf.157.1647271491061; 
 Mon, 14 Mar 2022 08:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyepgEI9wbW8AcLZafdUt5uVHDnPcukrfvttKQVcKQzMTVgYp8UJK8zfzUC/C9d5e0S72EjVA==
X-Received: by 2002:a5d:5850:0:b0:1fc:a7d7:e33b with SMTP id
 i16-20020a5d5850000000b001fca7d7e33bmr16569415wrf.157.1647271490804; 
 Mon, 14 Mar 2022 08:24:50 -0700 (PDT)
Received: from redhat.com ([2.55.155.245]) by smtp.gmail.com with ESMTPSA id
 n2-20020a056000170200b001f1e16f3c53sm13658963wrc.51.2022.03.14.08.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 08:24:50 -0700 (PDT)
Date: Mon, 14 Mar 2022 11:24:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/4] intel_iommu: Support IR-only mode without DMA
 translation
Message-ID: <20220314112001-mutt-send-email-mst@kernel.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
 <20220314142544.150555-2-dwmw2@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20220314142544.150555-2-dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 02:25:42PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> By setting none of the SAGAW bits we can indicate to a guest that DMA
> translation isn't supported. Tested by booting Windows 10, as well as
> Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

this is borderline like a feature, but ...

> ---
>  hw/i386/intel_iommu.c         | 14 ++++++++++----
>  include/hw/i386/intel_iommu.h |  1 +
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 32471a44cb..948c653e74 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2214,7 +2214,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
>      uint32_t changed = status ^ val;
>  
>      trace_vtd_reg_write_gcmd(status, val);
> -    if (changed & VTD_GCMD_TE) {
> +    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
>          /* Translation enable/disable */
>          vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
>      }
> @@ -3122,6 +3122,7 @@ static Property vtd_properties[] = {
>      DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
>      DEFINE_PROP_BOOL("snoop-control", IntelIOMMUState, snoop_control, false),
>      DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
> +    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_translation, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -3627,12 +3628,17 @@ static void vtd_init(IntelIOMMUState *s)
>      s->next_frcd_reg = 0;
>      s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
>               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> +             VTD_CAP_MGAW(s->aw_bits);
>      if (s->dma_drain) {
>          s->cap |= VTD_CAP_DRAIN;
>      }
> -    if (s->aw_bits == VTD_HOST_AW_48BIT) {
> -        s->cap |= VTD_CAP_SAGAW_48bit;
> +    if (s->dma_translation) {
> +            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
> +                    s->cap |= VTD_CAP_SAGAW_39bit;
> +            }
> +            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
> +                    s->cap |= VTD_CAP_SAGAW_48bit;
> +            }
>      }
>      s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO;
>


... this looks like you are actually fixing aw_bits < VTD_HOST_AW_39BIT,
right? So maybe this patch is ok like this since it also fixes a
bug. Pls add this to commit log though.

  
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> index 3b5ac869db..d898be85ce 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -267,6 +267,7 @@ struct IntelIOMMUState {
>      bool buggy_eim;                 /* Force buggy EIM unless eim=off */
>      uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
>      bool dma_drain;                 /* Whether DMA r/w draining enabled */
> +    bool dma_translation;           /* Whether DMA translation supported */
>  
>      /*
>       * Protects IOMMU states in general.  Currently it protects the
> -- 
> 2.33.1


