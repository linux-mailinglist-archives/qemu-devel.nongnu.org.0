Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403563B125
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 19:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozikE-0002Zf-BK; Mon, 28 Nov 2022 13:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ozikB-0002Wr-Qt
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:20:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ozik8-0006Km-Mb
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669659604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7D+0bAmUR8W6CgS2+YzAy5jhFxO1PClLLKA6nZqWCy4=;
 b=bwy8ZbU+S2x0aHAMsQSrpDFtQYROdINFrpy4Ry8704mYAytBuer1GWp8gDCHXwJvah3iKU
 uHqvuXoNeGUGhvzmoZdXA2lncVdKiP6f2E+2o8ix96YoMpbgdKiqv+5egN1H864HTmbwDi
 EVgjLgxdCwEc5RoTA9RkjUJhz4PyugI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-uV-gmIWqP1uaV2g5urJ1dg-1; Mon, 28 Nov 2022 13:20:03 -0500
X-MC-Unique: uV-gmIWqP1uaV2g5urJ1dg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h4-20020a1c2104000000b003d01b66fe65so8925173wmh.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7D+0bAmUR8W6CgS2+YzAy5jhFxO1PClLLKA6nZqWCy4=;
 b=VkeWMa7cDN7agdKsReeLaUcPtNlnHApV8v/NSkOU752aQn7JvmNo4RZT1ZO57pNz6N
 QnK6GayufT0yTAL3uDhL0Yleq9FkCcjnRUfFvnDfvhl2hRS1rdFg8d0NbRtlX1EF6POf
 Gr6IYxaw+HNyKnPy8G2aXOk0L9fP/luzIh1sef+ZsbkY2YtNEoNylY5uwsBB7alOBzqG
 K9gzePtf3jwJxxF+IZYfiU2gy1g8xBMsBipEeFvPZvo/eq0U7DQuP42Lu3DlBluxtH1+
 SFtsRvsgRCov8aOBiYpyjBqTn8sIsnuBfhEm3naxKJJcYpD6ACszW1oZU8k3/+W2c5Eo
 qtqQ==
X-Gm-Message-State: ANoB5pnvdO8V/Pa9jeBzngGTJt6b6WVruXOoEQ7VEhUPOd8iZGeiacyA
 gmsiw1Afya48HiGQz4M24KEIX/13KmECramodaU3uE8Vh+HbOg6tTEKaiF+qSi+Ndim7ZAVEfD7
 RXDJT2SQdPM1s5Kc=
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id
 y18-20020a1c4b12000000b003cf90de7724mr42136516wma.18.1669659601956; 
 Mon, 28 Nov 2022 10:20:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7v/8Sew4qiPSrKfbVoUvTpMIbSu3GjvWPREdqw7XL+QUNvXi7kBLAwvl0unFdWSjVrzl6Rag==
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id
 y18-20020a1c4b12000000b003cf90de7724mr42136492wma.18.1669659601616; 
 Mon, 28 Nov 2022 10:20:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b003c64c186206sm16973538wmn.16.2022.11.28.10.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 10:20:00 -0800 (PST)
Message-ID: <b10ccdc2-e8cc-b7b0-69b8-c8b721abb4d1@redhat.com>
Date: Mon, 28 Nov 2022 19:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-3-peter.maydell@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20221109161444.3397405-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Peter,

On 11/9/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
> reset method doesn't do anything that's invalid in the hold phase, so
> the conversion only requires changing it to a hold phase method, and
> using the 3-phase versions of the "save the parent reset method and
> chain to it" code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  include/hw/arm/smmuv3.h |  2 +-
>  hw/arm/smmuv3.c         | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index c641e60735e..f1921fdf9e7 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -77,7 +77,7 @@ struct SMMUv3Class {
>      /*< public >*/
>  
>      DeviceRealize parent_realize;
> -    DeviceReset   parent_reset;
> +    ResettablePhases parent_phases;
>  };
>  
>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index daa80e9c7b6..955b89c8d59 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1431,12 +1431,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
>      }
>  }
>  
> -static void smmu_reset(DeviceState *dev)
> +static void smmu_reset_hold(Object *obj)
>  {
> -    SMMUv3State *s = ARM_SMMUV3(dev);
> +    SMMUv3State *s = ARM_SMMUV3(obj);
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>  
> -    c->parent_reset(dev);
> +    if (c->parent_phases.hold) {
> +        c->parent_phases.hold(obj);
> +    }
>  
>      smmuv3_init_regs(s);
>  }
> @@ -1520,10 +1522,12 @@ static void smmuv3_instance_init(Object *obj)
>  static void smmuv3_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
>  
>      dc->vmsd = &vmstate_smmuv3;
> -    device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
> +                                       &c->parent_phases);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
>  }


