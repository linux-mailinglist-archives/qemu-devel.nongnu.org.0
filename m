Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EBA3F99BF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:26:29 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbsK-0001ym-24
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbqR-0000iS-C2
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:24:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbqM-0000qG-ON
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:24:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso4351815wmi.5
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IL0IhZ89qP0aP4cEleW4k8GTKxNWY73C+es1+kPwk0A=;
 b=PoyJzcgPrlJ87BcQi8swMmF7BlfJd844Apw3LR68kMm/Av1hDvUGraBPqYDCgo89+P
 +AVZ6lBRpUu3Wdvg6NM559tQ5QDJ4hHkYcMlTYde2UYiOqueXafwSXOvk4rbP/NNwTKC
 G0K9Szg+D1m/hhXVUHxvOZV/sCxNl41D3ZyYZCF6jRg/kg5zerLpNsKAgpddSkXdg6K6
 Ry/tQ+I0jPKpCwA73dU/T7k+EWSICRpvgsSZ108BtUbvKfPjmiddC49A1pDYFSzYcu+D
 4B2AbfBMLUt6BKbAbpb0AIyQIqL5waq04C44cTHG+DkNIFKNV+jDQPpf7/ESS7ENTWFi
 Y9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IL0IhZ89qP0aP4cEleW4k8GTKxNWY73C+es1+kPwk0A=;
 b=eMcKFF/N44ybulEIyu1ps4XhlVR/zPORo0xo1HNej277HO6n2fXV83khprlxAvWHRj
 S16d3/OctivAZuQXFZ1SXSS5PMFKpQAPEOdX0juJExBwr9zsTnmgOosJGyhl1J6cGZo/
 OTKfprLsbg/NHOQ9ua5oUYR1im5n9n6w/OqC/TTFUYqIrbIPo1otvctgLfGozltncdw6
 lphrpgjFfhd/2mYJoYX2GUh9JAN3Lgnz6GwZ/Oeqv9uTGS4hdzy6JveBDKveIY38bjBD
 p2VXvdwZ0/P3ZKzcwvzrKWDI+1pmufHp3Zjd8a4aeCREtHGUWmEnKBSD4nRhWnMS7B/B
 qqfQ==
X-Gm-Message-State: AOAM533msZL524D0G3Unx/hIadxlUpDOTgvgTAdMG4Dth9SpcGwSfz6m
 pNzv6sns3jxEFyz05AvWxl1gww==
X-Google-Smtp-Source: ABdhPJw+FN3a2trMN9sQYMO2l9BUUw0q9ezznNNYD8w9XGwgs/hgBIbp7UH4Kxwq04gkJcSC5qjG+Q==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr8871274wmi.87.1630070663958;
 Fri, 27 Aug 2021 06:24:23 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id n8sm5331351wmq.18.2021.08.27.06.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:24:23 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:26:33 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 6/6] pc: Allow instantiating a virtio-iommu device
Message-ID: <YSjoCW5z1xbYL4Gp@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-7-jean-philippe@linaro.org>
 <41720de5-ce29-dd79-2911-d974408af544@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41720de5-ce29-dd79-2911-d974408af544@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 04:11:49PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> > From: Eric Auger <eric.auger@redhat.com>
> >
> > Add a hotplug handler for virtio-iommu on x86 and set the necessary
> > reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> > region is reserved for MSIs. DMA transactions to this range either
> > trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
> >
> > Although virtio-iommu does not support IRQ remapping it must be informed
> > of the reserved region so that it can forward DMA transactions targeting
> > this region.
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> I think we need to handle the case where the end-user gets lost with
> iommu options and use an invalid combination such as
> 
> -M q35,iommu=on,int_remap=on,kernel_irqchip=off -device -device virtio-iommu-pci

I guess that would be
"-M q35,kernel_irqchip=off -device intel-iommu,intremap=on -device virtio-iommu-pci"

I'll add the checks, similar to the one in x86_iommu_set_default().

> We may also document somewhere that the virtio-iommu-pci
> does not support irq remapping as this may be an important limitation on x86.

I'll mention it in the commit message, unless you had another place in
mind?

Thanks,
Jean

