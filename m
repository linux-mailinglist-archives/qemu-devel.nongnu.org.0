Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829C76FD6FD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:29:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdKF-0004l6-1j; Wed, 10 May 2023 02:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwdKB-0004ky-SQ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwdKA-0000uc-AI
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683700157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uigqYMoKl0yokxX02Q1PesTTnNSjxjb46yQbpNLXP3Q=;
 b=TXPJU7I+pgJPIhQeLXimVYT3ql8JpXUbrtOkOLgzm8cQG5ngN5lVLGIuMHtL2+lMGBXGGM
 z4CYH1BE3mUjESPN+g0Skt5t/bnZsBXBzyk9a6Fvbx3bTrUpLKidYxMuSXwMFvaCloGZSL
 yiYfS4AaqRzJqWY4w6iiBb8EJ8vu9/A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-5RLmxKl6M8eUqZlXMBplhA-1; Wed, 10 May 2023 02:29:16 -0400
X-MC-Unique: 5RLmxKl6M8eUqZlXMBplhA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bcd24504eso7669653a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683700155; x=1686292155;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uigqYMoKl0yokxX02Q1PesTTnNSjxjb46yQbpNLXP3Q=;
 b=YIIJNwByEDh0re+ftpYcDicq4mwddZMOrWMid+O1scYbbnGf9vTPLdeKRSRgH1m9eJ
 avdhmAPQ5x1Pdn2LodaLpQgnObQXiulXbtP3l4dn6qcJLLRHdBkAWErU3W9b+BAYoAP/
 tA8gITszBOQqDAjC6X1KRG+pCEguUJOH/jWklEvPRj/RlwjgzFei/fJ3BXAAIwqmipix
 uExzAwdNM6IGDp6UsrU3YPkCLgcwnboa4NyNkguyLduM3RyKHl/Ef8DufRIKYHNnDjEs
 TjJtLVtLSvDPxLOI4Nrwnq/AkEXLf19nk3cv0LtlLgTJhghW2yQlHMcIHAGBEQsJ28yF
 RIqg==
X-Gm-Message-State: AC+VfDwESvEVMxYud2RBuPuWjDDXuVqnGksgx0lD05OlO22YWiXH5op0
 zzAYTcbU76yHbjPPJ8Hq42sO29UurY9bmWCDbaEHiebOKG9LzoriFnLvb0ianK0uvHleONj15l6
 JNtcTGzl0B4lwCLU=
X-Received: by 2002:a17:907:1629:b0:96a:9c6:d752 with SMTP id
 hb41-20020a170907162900b0096a09c6d752mr3198317ejc.54.1683700154907; 
 Tue, 09 May 2023 23:29:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zB7q+FzpuHm5gwntKZtMPis0i/lhnd21AYjOh2mKydT1Fg1ZV6anYvyFuDjDDyTXF5SKgAw==
X-Received: by 2002:a17:907:1629:b0:96a:9c6:d752 with SMTP id
 hb41-20020a170907162900b0096a09c6d752mr3198300ejc.54.1683700154611; 
 Tue, 09 May 2023 23:29:14 -0700 (PDT)
Received: from redhat.com ([176.119.195.36]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b0094ed0370f8fsm2245633ejc.147.2023.05.09.23.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 23:29:12 -0700 (PDT)
Date: Wed, 10 May 2023 02:29:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH] intel-iommu: Set status bit after operation completed
Message-ID: <20230510022854-mutt-send-email-mst@kernel.org>
References: <20230309092319.29229-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309092319.29229-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Mar 09, 2023 at 05:23:19PM +0800, Zhenzhong Duan wrote:
> According to SDM 11.4.4.2 Global Status Register:
> "This field is cleared by hardware when software sets the SRTP field in the
> Global Command register. This field is set by hardware when hardware
> completes the ‘Set Root Table Pointer’ operation using the value provided
> in the Root Table Address register"
> 
> Follow above spec to clear then set RTPS after finish all works, this way
> helps avoiding potential race with guest kernel. Though linux kernel is
> single threaded in writing GCMD_REG and checking GSTS_REG.
> 
> Same reasion for GSTS_REG.TES
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>


So I am dropping this?

> ---
>  hw/i386/intel_iommu.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index faade7def8..7cba1945a3 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2312,11 +2312,12 @@ static void vtd_handle_gcmd_qie(IntelIOMMUState *s, bool en)
>  /* Set Root Table Pointer */
>  static void vtd_handle_gcmd_srtp(IntelIOMMUState *s)
>  {
> +    vtd_set_clear_mask_long(s, DMAR_GSTS_REG, VTD_GSTS_RTPS, 0);
>      vtd_root_table_setup(s);
> -    /* Ok - report back to driver */
> -    vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_RTPS);
>      vtd_reset_caches(s);
>      vtd_address_space_refresh_all(s);
> +    /* Ok - report back to driver */
> +    vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_RTPS);
>  }
>  
>  /* Set Interrupt Remap Table Pointer */
> @@ -2338,19 +2339,22 @@ static void vtd_handle_gcmd_te(IntelIOMMUState *s, bool en)
>  
>      if (en) {
>          s->dmar_enabled = true;
> -        /* Ok - report back to driver */
> -        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_TES);
>      } else {
>          s->dmar_enabled = false;
>  
>          /* Clear the index of Fault Recording Register */
>          s->next_frcd_reg = 0;
> -        /* Ok - report back to driver */
> -        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, VTD_GSTS_TES, 0);
>      }
>  
>      vtd_reset_caches(s);
>      vtd_address_space_refresh_all(s);
> +
> +    /* Ok - report back to driver */
> +    if (en) {
> +        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, 0, VTD_GSTS_TES);
> +    } else {
> +        vtd_set_clear_mask_long(s, DMAR_GSTS_REG, VTD_GSTS_TES, 0);
> +    }
>  }
>  
>  /* Handle Interrupt Remap Enable/Disable */
> -- 
> 2.25.1


