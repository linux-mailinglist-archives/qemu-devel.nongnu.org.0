Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21C6340DF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVmp-0000qE-2b; Tue, 22 Nov 2022 11:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxVmm-0000nw-2z
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxVmf-0006Vk-U0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669133162;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JxIojlnsBhYnzs2a7uWwrQZFG8jHh60pu/mx3kpXQU=;
 b=NovVJ7EYw2E2875y70k9so6DZ70MCtkpQWugmuLPeO+/JnNbQ5loC0WxVrxEhr1KZPsbpr
 669F+3g8f7BGeuVBgUDn+tFyd4cpq37GOmqILDXWvOjjpIo46sFXjwKCP4gZDaRCxJ14Q2
 lvW14aqbYTrVprWB0YSRD5ksUZddjD8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-bctksavlNl-j-KGwHko8Dw-1; Tue, 22 Nov 2022 11:05:59 -0500
X-MC-Unique: bctksavlNl-j-KGwHko8Dw-1
Received: by mail-qt1-f199.google.com with SMTP id
 y19-20020a05622a121300b003a526e0ff9bso14799073qtx.15
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+JxIojlnsBhYnzs2a7uWwrQZFG8jHh60pu/mx3kpXQU=;
 b=suXoSjbS7BB+jNQEf2ioRlI2G6P6DcVRsiMJefNeVS7DZMnyFjaFrr76IqfLlfL4/S
 whl2whBIdVeNLVKydqRO5yQDMEic9nMNKgP18S0bn9Yk7DuT2Nc43SOyPW3kWDjsXh/I
 u3CEO1hIrLIUlSRFWBQc2OKp5yZ4BNpOUsOcYZZnBvhREQ5BBYeQMNK3cah74ZhVHDWB
 ihyYpNxK3kB9AONcjYtoIMUa7EOHBmIAca9fo8HTdwDjym/Qv5DdJz0498wm2et77OTP
 NH6oHUOlPfd9zXj/2ofaFkU57j5GzCBIjVLltLh6bUnluH5dUO2sCVpFcm7ujrTvFT4l
 Vykw==
X-Gm-Message-State: ANoB5pkjNpr2AknKolRk/8tskwbA00FzVMCzAtJ/eYroHfaTOcr/Rf6C
 wBvr0XUxN/c0NHm02GDsvWXdcnkESUu01VvuwzRbRSYvIfEOc6Cfm5tGnTWRWCSzvF1Aa55Tf1K
 nM5YuHubm+B5hvrw=
X-Received: by 2002:a37:ad0a:0:b0:6fa:2c9a:ae20 with SMTP id
 f10-20020a37ad0a000000b006fa2c9aae20mr8171965qkm.582.1669133157592; 
 Tue, 22 Nov 2022 08:05:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YVUcj7KT3XN3ySaimzWl7EnAfPmljakPWhN/qV4x3o4+uKdaqWUiJxBSUEXub1FWWGDcUpQ==
X-Received: by 2002:a37:ad0a:0:b0:6fa:2c9a:ae20 with SMTP id
 f10-20020a37ad0a000000b006fa2c9aae20mr8171942qkm.582.1669133157306; 
 Tue, 22 Nov 2022 08:05:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05622a001600b003a57f822157sm8623807qtw.90.2022.11.22.08.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 08:05:56 -0800 (PST)
Message-ID: <8dbb6cf5-4af9-590b-1459-524d67da3bd0@redhat.com>
Date: Tue, 22 Nov 2022 17:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: eperezma@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221122145349.86072-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Marc-André,
On 11/22/22 15:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> warning") removed the warning on vfio_listener_region_add() path.
>
> An error is reported for vhost-vdpa case:
> qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
>
> Skip the CRB device.
>
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=2141965
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/virtio/vhost-vdpa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..9d7206e4b8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -19,6 +19,7 @@
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/vhost-shadow-virtqueue.h"
>  #include "hw/virtio/vhost-vdpa.h"
> +#include "sysemu/tpm.h"
>  #include "exec/address-spaces.h"
>  #include "migration/blocker.h"
>  #include "qemu/cutils.h"
> @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>  {
>      Int128 llend;
>  
> +    if (TPM_IS_CRB(section->mr->owner)) {
> +        /* The CRB command buffer has its base address unaligned. */
> +        return true;
> +    }
> +
>      if ((!memory_region_is_ram(section->mr) &&
>           !memory_region_is_iommu(section->mr)) ||
>          memory_region_is_protected(section->mr) ||


