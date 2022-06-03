Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F053CD5D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:41:58 +0200 (CEST)
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxAN3-0000HI-1r
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxAKg-0007CS-BC
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:39:30 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxAKe-0000F3-Dx
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:39:29 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso7492388pjb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qpFVEM/LoeHyrRezmNFMPMrSBP010Us4R2SCI/5t5Go=;
 b=oSM70p+DC8QEfywKpmJzKGloTT8shcQer8Ttm8nrzkxbzeqMA23iKvZ5e3rN4QK5sH
 GUNUsMHbcCwmEtRCxHr0cae2dopNwcnf8u7CZCWHhWwjCGd6lsBSt0AEJc0R56WtNU9+
 nr6MKl2kj4Ex4d4IWeCSYoDhXJYgLKNkFPDVqnYfBgtTq9ZWukYpEuDpmFYVHtIoFZLB
 +VahaPpAz1CLynmJDybnUN1wnxMJYMxjx2kw2B0Kvb68s7iLYe6tP8tL5mYe5xWIU3hJ
 7Vj6K50lAmtRTQuvnx0b22+Vc5XLTUtVATDpc6+O8XxJFTaA2sFJViS09muo1Pv0AZmX
 IcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qpFVEM/LoeHyrRezmNFMPMrSBP010Us4R2SCI/5t5Go=;
 b=0U+Db9qNhMrBPji70z8oDS2IEk6pV32m9B799leRLnCP/Cw6dH2ovsLvoznBKywIpu
 jzWyDcEdcpLBnlfpelN7nFI+mAq0MdHfAkTllKFhmF/J3HTzTJu4IMFqvheGKXItSXEM
 X0SaAnINABxHdpvl2wert9oSetyaZjyfSNMSZlfWYwT2QlRamV2hvXO3Vj23sRARO0Zl
 CbHWCtBekxmgSWQGjNQBr2kMbLvhG97+s/jcj8mkIwaJWFMdi0WaeMZ1azm9TT0aKlMC
 S1M7niZ+4fZ7jYuiPtXmtL02g2weZGTzNxdVyB2prVj0OU0lg/e+QixWpw9o1mB3Tmm0
 6sOA==
X-Gm-Message-State: AOAM531lZLC9j8+SPTP5pu3NuY4TeM0+tNjzz7nkZKuit8VQ/2pBp0Qm
 xB0WUdM+t01LiO2Rr+LSJElnpg==
X-Google-Smtp-Source: ABdhPJzyXJ40fFNd5sp2lBSr0qmzgg2ThbZhvNOrAwv6chc/NIwG+YMQligq6eYZ/UMQAH/EZKOS2Q==
X-Received: by 2002:a17:90b:4f47:b0:1e3:38c7:70b5 with SMTP id
 pj7-20020a17090b4f4700b001e338c770b5mr22387515pjb.32.1654274366782; 
 Fri, 03 Jun 2022 09:39:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b0016401043dfasm5602791plk.91.2022.06.03.09.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 09:39:26 -0700 (PDT)
Message-ID: <a0fb6ef8-9f25-08e9-a80f-258224700b2d@linaro.org>
Date: Fri, 3 Jun 2022 09:39:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, mark.cave-ayland@ilande.co.uk
References: <20220601102509.985650-1-yangxiaojuan@loongson.cn>
 <20220601102509.985650-35-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220601102509.985650-35-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 03:25, Xiaojuan Yang wrote:
> +static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
> +{
> +    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
> +    unsigned long offset = addr & 0xffff;
> +    uint32_t index, cpu, ret = 0;
> +
> +    switch (offset) {
> +    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
> +        index = (offset - EXTIOI_NODETYPE_START) >> 2;
> +        ret = s->nodetype[index];
> +        break;
> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
> +        index = offset - EXTIOI_IPMAP_START;
> +        ret = *(uint32_t *)&s->ipmap[index];

This...

> +        break;
> +    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
> +        index = (offset - EXTIOI_ENABLE_START) >> 2;
> +        ret = s->enable[index];
> +        break;
> +    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
> +        index = (offset - EXTIOI_BOUNCE_START) >> 2;
> +        ret = s->bounce[index];
> +        break;
> +    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> +        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> +        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        ret = s->coreisr[cpu][index];
> +        break;
> +    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
> +        index = offset - EXTIOI_COREMAP_START;
> +        ret = *(uint32_t *)&s->coremap[index];

... and this are points of concern.  You can't simply re-interpret an array of uint8_t as 
uint32_t without running into host endian issues.

I wonder why you've declared them as uint8_t at all?  Both read and write use this cast. 
Was this some attempt to avoid

     s->coremap[index / 4]?

or what?

> +static const VMStateDescription vmstate_loongarch_extioi = {
> +    .name = TYPE_LOONGARCH_EXTIOI,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(bounce, LoongArchExtIOI, EXTIOI_IRQS_GROUP_COUNT),
> +        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, LOONGARCH_MAX_VCPUS,
> +                               EXTIOI_IRQS_GROUP_COUNT),
> +        VMSTATE_UINT32_ARRAY(nodetype, LoongArchExtIOI,
> +                             EXTIOI_IRQS_NODETYPE_COUNT / 2),
> +        VMSTATE_UINT32_ARRAY(enable, LoongArchExtIOI, EXTIOI_IRQS / 32),
> +        VMSTATE_UINT32_ARRAY(isr, LoongArchExtIOI, EXTIOI_IRQS / 32),
> +        VMSTATE_UINT8_ARRAY(ipmap, LoongArchExtIOI, EXTIOI_IRQS_IPMAP_SIZE),
> +        VMSTATE_UINT8_ARRAY(coremap, LoongArchExtIOI, EXTIOI_IRQS),
> +        VMSTATE_END_OF_LIST()
> +    }

Missing the sw_* members.


r~

