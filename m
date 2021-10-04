Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A617420935
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:15:59 +0200 (CEST)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL0n-0006Br-Pi
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKxi-0002x0-Py
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKxg-0002yi-TM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633342364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCPDv4QRNZ0a1fQs05Nas1A64qaGfmSB0iOlYE+QsHo=;
 b=WcC/5S85Qdw+pwLrN3LUq9axW6TckjG4KkxJX2eR7CQ6GVNKGNOFrw1voyg5qLRLSLhrYa
 /mvWf6M8bQzrcbvSTi676ru96VOoYJ+XXy4ZH4DQxxhoXQ0UvmZXHdyUQ421qRJn1TGim3
 7nOhsGTQnQn2iTieisuwQIm82QCe4Ek=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-tmmbmZhVNuyP1Ur57MUjOw-1; Mon, 04 Oct 2021 06:12:43 -0400
X-MC-Unique: tmmbmZhVNuyP1Ur57MUjOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso4464874wrg.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 03:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rCPDv4QRNZ0a1fQs05Nas1A64qaGfmSB0iOlYE+QsHo=;
 b=243NeT6b9v78VHLjibmzHcueqhoEt2K8oVDDTFmdQ6pR1A+XXYoqq4gpnjrijJe4WV
 hVCV4Uv5Pla2gJ2B2xCnkay+FUuiod7Tvo2qLxJnVMGoNEeYYd2GFJdkEykILnkWwfOj
 s2Dj/0LP9HKSku6vt/DS1M0eefTqBMntMI3JCDlPq8HSzbr8gWNdRLLvN6z9KreNQ2yJ
 VlNajBKWFPaziJFeZE3AxuRdsksUUDNWx3r/b4lxHvgZxjQ2+47gD/7yW8BegzQEfBFt
 RQaL+hh2Nf8BCxBpeFPutZjNGQMUITFjCR034rPteNuPPbsoyU3m0C8OxRBeCt1DYZxA
 azEw==
X-Gm-Message-State: AOAM533uzqSs59g6rRxIpVUxdyzplKbnf1c4R/CGWkSOtZyW0RV7aTIV
 2AYuOQaLX61DWl5Hu5Vh3eKfAA/O9hrtR659nq7ECbaTS3ILy5mNd28POezhFBsTnVpAL0hN8KB
 B8x9gDtm8pVV/B20=
X-Received: by 2002:adf:f946:: with SMTP id q6mr13123331wrr.437.1633342362032; 
 Mon, 04 Oct 2021 03:12:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSvhm+jWUInTDea5wEfwMr2LgnDYEZ4Lout+X2NLSfcGiX7+w+w//Bp93Dv3sbxAR10OUxnw==
X-Received: by 2002:adf:f946:: with SMTP id q6mr13123315wrr.437.1633342361923; 
 Mon, 04 Oct 2021 03:12:41 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id b16sm1605797wrw.46.2021.10.04.03.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 03:12:41 -0700 (PDT)
Date: Mon, 4 Oct 2021 12:12:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 5/5] hw/arm/virt: Disable highmem devices that don't
 fit in the PA range
Message-ID: <20211004101240.fdf2mty5jvnler33@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-6-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-6-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 05:46:05PM +0100, Marc Zyngier wrote:
> Make sure both the highmem PCIe and GICv3 regions are disabled when
> they don't fully fit in the PA range.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a572e0c9d9..756f67b6c8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1673,6 +1673,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      if (base <= BIT_ULL(pa_bits)) {
>          vms->highest_gpa = base -1;
>      } else {
> +        /* Advertise that we have disabled the highmem devices */
> +        vms->highmem_ecam = false;
> +        vms->highmem_redists = false;
>          vms->highest_gpa = memtop - 1;
>      }
>  
> -- 
> 2.30.2
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


