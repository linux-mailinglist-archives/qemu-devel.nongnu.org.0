Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2767AB69
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKasU-0001Xh-2w; Wed, 25 Jan 2023 03:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pKasO-0001XV-GZ
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pKasM-0001cS-Sg
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674634281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wnjeri0Js13tsnRaB88SvHQUZS4ARE6VTYNDHO2TCI=;
 b=hwyT4r3qegGoglnlruLqgkvK4ku0NwDLu5Hk/PuO3qFRf6TV4uV097o1twQ6zZgHBIC2LP
 DmrtcIsDp8OtcN2bw9uh4YdhpNsgPU6RIci0Cb71dNy3XSHltpHG0sly7hU6cyc1G3SVZD
 bzSAC+CXDuYl09h5FC4pF9tUGFDLRtA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-WgIU7LeBOM-uU6FhvOGUUQ-1; Wed, 25 Jan 2023 03:11:19 -0500
X-MC-Unique: WgIU7LeBOM-uU6FhvOGUUQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bi7-20020a05620a318700b007091d3fe2d3so9733151qkb.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 00:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2wnjeri0Js13tsnRaB88SvHQUZS4ARE6VTYNDHO2TCI=;
 b=pRnEchhlRB6ebjAcZT4KGe9NRvDmTC+s0Oavy1tKeJuRLo72HR3Ly5m/TD4SDPzuJo
 EkcGGdt8ONJTISZ9GDZLh2S7hh+kneJlu/lUTfzqrJh2ZNNhi5XaUMQhv5Ww2YfM5xOj
 ld3XBXqP24+8ci4IiaYfxH+2oOqsOtui4cwoa4WWl/o/8gCswLIm2OhR/b9PDiFnIllB
 9IbiBT4YO/mdkRRXvjgT6nxEmI4r9QQnYi8rVr4c6h4CKoplZ+1iWVXjmaYML35/gVQY
 /L2eF2Hchvxu24UFpPA2sVkDsPmC3E0wdxiE8NWk/XB9I6t8VFSKOpFShali/djwEljq
 jiFw==
X-Gm-Message-State: AFqh2kp6e64VdS8HZmXOyujzn7WUqIUiLWzBJlPXkcZs+uheDbGGHMN7
 D6DEGY5X7NQZGjmWZV6ZBmbk+9AqlBdPPnW3jUQqu404v258MAm1u8k1GwnYROgVqG7X49Fx+BY
 UmSZnXdJcygZsQ6Q=
X-Received: by 2002:a05:6214:5a06:b0:535:5ec4:91e6 with SMTP id
 lu6-20020a0562145a0600b005355ec491e6mr31882642qvb.37.1674634279131; 
 Wed, 25 Jan 2023 00:11:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1LxtC3aAP34DWgsGdY5guWiI0QGckeqHmtEMA0qw1ozbyJYrW23mUwPLtb0kgGkNz6m7LzA==
X-Received: by 2002:a05:6214:5a06:b0:535:5ec4:91e6 with SMTP id
 lu6-20020a0562145a0600b005355ec491e6mr31882626qvb.37.1674634278872; 
 Wed, 25 Jan 2023 00:11:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05620a223600b006fa22f0494bsm3006678qkh.117.2023.01.25.00.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 00:11:18 -0800 (PST)
Message-ID: <f63e8826-ca1d-1bed-1415-3d0a5339938d@redhat.com>
Date: Wed, 25 Jan 2023 09:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230124232059.4017615-1-richard.henderson@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230124232059.4017615-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 1/25/23 00:20, Richard Henderson wrote:
> Use the macro instead of two explicit string literals.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/sbsa-ref.c | 3 ++-
>  hw/arm/virt.c     | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 4bb444684f..8378441dbb 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -29,6 +29,7 @@
>  #include "exec/hwaddr.h"
>  #include "kvm_arm.h"
>  #include "hw/arm/boot.h"
> +#include "hw/arm/smmuv3.h"
>  #include "hw/block/flash.h"
>  #include "hw/boards.h"
>  #include "hw/ide/internal.h"
> @@ -574,7 +575,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      DeviceState *dev;
>      int i;
>  
> -    dev = qdev_new("arm-smmuv3");
> +    dev = qdev_new(TYPE_ARM_SMMUV3);
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5f1fddd210..d103de8c2e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1344,7 +1344,7 @@ static void create_smmu(const VirtMachineState *vms,
>          return;
>      }
>  
> -    dev = qdev_new("arm-smmuv3");
> +    dev = qdev_new(TYPE_ARM_SMMUV3);
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);


