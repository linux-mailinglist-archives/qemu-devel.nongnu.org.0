Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B850E3ECA73
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 19:31:49 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFJzA-0006yt-Ay
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 13:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFJxt-0006De-Ob; Sun, 15 Aug 2021 13:30:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFJxp-0003ZI-Kz; Sun, 15 Aug 2021 13:30:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso13302244wmg.4; 
 Sun, 15 Aug 2021 10:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FJq99MCE+X2oFRL/7NIxPo5ZQhN+js9JKXBFcmPoW7g=;
 b=p7hVw1HDu3l3eSgFnNdDHXh+Hc761kTNzcYlojFN4dg6ELTkFI+FHlliXBDp8iqxwF
 Y6J+ILFZo9R7UVBQx8evn3qrjGb77hOPAoej84DJg/Ik5SMq+IO2mc1dIjDLs37Vmozm
 Vxi/B5qjUdfA59BW7NUQkRLOfop6IZEXtkelrE9iKUj0vrLqxOhxT46UywzUmpzL9vFr
 dg/qh8yAtKhdjgytwvxVycLcCK98QKV/0yvYMqqOxjzp08aiK3wlcy6Nmeiwbd1V26M/
 yS002m475yx2G8wstEFHqt1GEvDmKaeMrQmF9neO8F/6Cn5Q9BP46wnEZ3lcthK0amOP
 5Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FJq99MCE+X2oFRL/7NIxPo5ZQhN+js9JKXBFcmPoW7g=;
 b=FG0l87QCcgcHhX3y6TnmZ49Ww7LY4JiDRjED33j9+QHcKVahXq5BnyFPsFTKxqrB55
 y6p+8LnTyLk0Kj/F9eAZwzSWPYNZQrg6NiVfY+pioNt0wpKnPOSuAjcAebArNK85Qa+s
 vVkf/6dKS28DwmF5+CYr1VlnYdEAW/zIrvcpcNiOoT2Xs8UGQvuTGK7Be4sgvS3smOE/
 BpwBk6DdBWHXyKvVYPO0vFxZtJvPdlqVWnizYoIZ6Iaf8BEYdcq7e2/ITI033G6Ndl65
 xKgtq4Xtfio/1wBTuyO5oFH3R/J6eo0/6vCNK+kh6YRlj3VO1TKJaaS+Tp6B/sFRZ8DF
 Omog==
X-Gm-Message-State: AOAM530MLc2jwpsfxk5weJADh42akoFNi1i1tNsyP2vCRl0nnmptJlxS
 sikmOyjpXpGt/mp83Hi5dBU=
X-Google-Smtp-Source: ABdhPJz9dZMXQdxlwCoXlxjh8gqIZ54qeFb6Pz2EuBxDnj1qpGuCrmP/gcSAdCKL1r04qAaOYynfwQ==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr11799795wmi.69.1629048623523; 
 Sun, 15 Aug 2021 10:30:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n21sm7135386wmc.36.2021.08.15.10.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 10:30:22 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3fc10091-832a-e87c-9866-323534f6dc9e@amsat.org>
Date: Sun, 15 Aug 2021 19:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter/David

On 8/12/21 11:33 AM, Peter Maydell wrote:
> Currently we implement the RAS register block within the NVIC device.
> It isn't really very tightly coupled with the NVIC proper, so instead
> move it out into a sysbus device of its own and have the top level
> ARMv7M container create it and map it into memory at the right
> address.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h       |  2 +
>  include/hw/intc/armv7m_nvic.h |  1 -
>  include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
>  hw/arm/armv7m.c               | 12 +++++
>  hw/intc/armv7m_nvic.c         | 56 ---------------------
>  hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |  2 +
>  hw/misc/meson.build           |  2 +
>  8 files changed, 148 insertions(+), 57 deletions(-)
>  create mode 100644 include/hw/misc/armv7m_ras.h
>  create mode 100644 hw/misc/armv7m_ras.c

> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 9ce5c30cd5c..8964730d153 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -231,6 +231,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&s->container, 0xe0000000,
>                                  sysbus_mmio_get_region(sbd, 0));
>  
> +    /* If the CPU has RAS support, create the RAS register block */
> +    if (cpu_isar_feature(aa32_ras, s->cpu)) {
> +        object_initialize_child(OBJECT(dev), "armv7m-ras",
> +                                &s->ras, TYPE_ARMV7M_RAS);
> +        sbd = SYS_BUS_DEVICE(&s->ras);
> +        if (!sysbus_realize(sbd, errp)) {
> +            return;
> +        }
> +        memory_region_add_subregion_overlap(&s->container, 0xe0005000,
> +                                            sysbus_mmio_get_region(sbd, 0), 1);

Just curious, is the overlap really needed? I see the NVIC default
region is 1 MiB wide. Aren't smaller regions returned first when
multiple regions have same priority? This might be one of my
misunderstandings with QEMU MR/AS APIs. Without looking at the
code, assuming 2 MRs overlapping with the same priority, is there
some assumption which one will be hit first?

> +    }
> +
>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>          if (s->enable_bitband) {
>              Object *obj = OBJECT(&s->bitband[i]);

