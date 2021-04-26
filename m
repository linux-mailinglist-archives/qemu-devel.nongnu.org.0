Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AE36BC06
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 01:25:47 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbAbq-0002HZ-Kz
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 19:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lbAam-0001lp-W0
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lbAak-0007o8-NU
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619479478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAbJ3CU+kBV8f2d5+F4dAZxUlB+QxwIxQp0upz7+QQ8=;
 b=OfW01z4X3N5nQ6ls5GkO1KlX2D3i6metZNi8Jm6zfp/NeoXZVoaFs6iR6M7OaEUXYMscFc
 DFL5CjRAfCNfkVClLVHteCuQs7IfRC8/huf0AXQJyi+4sXqaB8gNXmuBIVPC8myOfyVzxj
 SFWVnxCBGbK52cwLddPolpf3qFViBKY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-DD63vGBDPgujEf58MXDTGA-1; Mon, 26 Apr 2021 19:24:35 -0400
X-MC-Unique: DD63vGBDPgujEf58MXDTGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so17103706wrb.9
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 16:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kAbJ3CU+kBV8f2d5+F4dAZxUlB+QxwIxQp0upz7+QQ8=;
 b=ItLCSmapVTJsiGeSKlEz/QQyYfrBlyR/P//wHkNlsdUNZjgrlrOKh9JzM8uF1uUpdE
 b8q6vgsx4hDS76Bss6je8DqxthUdodtGqMCWXVNr5KcyEfVJU7g0AVEUKR1P36XaLhur
 gUayDL8KXf5X4u/7SY0WvDN7wGK8LfC8LZL0c7DE6ensfXJ3fdZqJ8jGF465E8vlwF8m
 D0AstYBYbma3DxhxrrXYitqdEH2rXrQ+Hmu0hexmL+jk5Nj3ztIscGNGyqEjlj1Cb4sI
 Mp8tFns2+IJa9Nhb0pgnLYCekCArLT8TNLcOSau6UqK8by5jFNf/TxBo5HugAQH0jIvV
 1Jbg==
X-Gm-Message-State: AOAM530VGG264Vc524ZnNoaxpmvsEl2WsIHaOg8GAnjb3ki8zxEF18/m
 uMm3OCbdsaVoEJE9YKaRNoeuJmi5vIWOfpQ42+ZmdoPr5f7IJUjB6frIQtrJpxkVHbzTnyy5HbH
 BfcEjaASraMbm2Hs=
X-Received: by 2002:a7b:c097:: with SMTP id r23mr21385234wmh.40.1619479474565; 
 Mon, 26 Apr 2021 16:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzCyDuvyw5XJdAVWWGUzl4RanqG3s5hHF5gCfTU004eg3gGTEoVSnah47hI6qjxNkt7dTuBw==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr21385217wmh.40.1619479474382; 
 Mon, 26 Apr 2021 16:24:34 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id l25sm19094702wmi.17.2021.04.26.16.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 16:24:33 -0700 (PDT)
Date: Mon, 26 Apr 2021 19:24:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kapl <rka@sysgo.com>
Subject: Re: [PATCH 1/1] amd_iommu: fix wrong MMIO operations
Message-ID: <20210426192311-mutt-send-email-mst@kernel.org>
References: <20210426082154.19734-1-rka@sysgo.com>
MIME-Version: 1.0
In-Reply-To: <20210426082154.19734-1-rka@sysgo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 10:21:54AM +0200, Roman Kapl wrote:
> Address was swapped with value when writing MMIO registers, so the user
> saw garbage in lot of cases. The interrupt status was not correctly set.
> 
> Signed-off-by: Roman Kapl <rka@sysgo.com>

Ouch. This API is just inconsistent, everyone else
uses addr, value in this order. How about fixing the
function signature instead?


> ---
>  hw/i386/amd_iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 74a93a5d93..bb5ce8c04d 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -141,13 +141,13 @@ static bool amdvi_test_mask(AMDVIState *s, hwaddr addr, uint64_t val)
>  /* OR a 64-bit register with a 64-bit value storing result in the register */
>  static void amdvi_assign_orq(AMDVIState *s, hwaddr addr, uint64_t val)
>  {
> -    amdvi_writeq_raw(s, addr, amdvi_readq(s, addr) | val);
> +    amdvi_writeq_raw(s, amdvi_readq(s, addr) | val, addr);
>  }
>  
>  /* AND a 64-bit register with a 64-bit value storing result in the register */
>  static void amdvi_assign_andq(AMDVIState *s, hwaddr addr, uint64_t val)
>  {
> -   amdvi_writeq_raw(s, addr, amdvi_readq(s, addr) & val);
> +   amdvi_writeq_raw(s, amdvi_readq(s, addr) & val, addr);
>  }
>  
>  static void amdvi_generate_msi_interrupt(AMDVIState *s)
> @@ -382,7 +382,7 @@ static void amdvi_completion_wait(AMDVIState *s, uint64_t *cmd)
>      }
>      /* set completion interrupt */
>      if (extract64(cmd[0], 1, 1)) {
> -        amdvi_test_mask(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
> +        amdvi_assign_orq(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
>          /* generate interrupt */
>          amdvi_generate_msi_interrupt(s);
>      }
> -- 
> 2.20.1


