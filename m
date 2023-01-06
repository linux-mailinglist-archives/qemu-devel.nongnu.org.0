Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C96606A4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDrn6-0006vN-9J; Fri, 06 Jan 2023 13:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrn1-0006rI-5O
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:50:03 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrmz-0003IP-HK
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:50:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso862818pjl.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qvEvKBqCpA3hShDigFgXXPOkFy03Vtjchu+K13tMCU4=;
 b=E+YOl5fRGoy+a40LsWVFoMCXl5vfCM2edDNLFg872Y73AmHRzjYDA+jyIEda7mMncu
 +m1U93fBFaCvn8PqyeAYjyR+iTfhgeezEBqgKBF6vJ/Yad6pmszDND+sahtGx5pBjkTV
 BajHeQDXm/a+fueG9OL/f5N7CbGPMeSneW3/fUIThRUHyqkUTq2Z1h+oKdNkFUcaGWJp
 GUI+GbcMRRdzO6n7/BscJCGMsfZWq+wGgf+tu+hOK5FW2Hk5Xcqepxse5QmFHV0oZrIJ
 VT2/T8+racPEvC9CBifrqE3gSPbDntdxrqCR1+bZv9BRW/lATzxBLHzl3J+uC3H9T11p
 ZTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvEvKBqCpA3hShDigFgXXPOkFy03Vtjchu+K13tMCU4=;
 b=kAZVFOnSO3ohPxqkJJvHpf8Q57wKZ1L1um1ov9+sS8OlvljtXVgAWkly9ncGB2jIPa
 8pxKkOrzJEdoL30SpkMZFQsfPl/MJvUg9ErCmHtpIYXczQjzxRVJCQ4kgCz22EtEgx6f
 jxGW4fM3YEvD9+pm76S+HNRpToNaeLtq5l/vObmApTAlhSCHbq5d1oA5ieux4NdBEZPI
 uKUohh4FmGAGVppy874r1Ro2jVe3Hamvr2yFUJnwf87vCnzdn9W6hboihHnPqP4xmGK6
 HUux2zIuN9SbFJz4w3Iw6c6CCP5cjpclPNPimbfVfPyMI1fFeNS6P7K9aH2DhnpJ1eB2
 VkhQ==
X-Gm-Message-State: AFqh2koETsPPFvgpmcABZL62hP5btXxGv0sW2V341cQdWWMXqsvY6vNJ
 uPdWzXqTlp3qa23X8iElGbRpfw==
X-Google-Smtp-Source: AMrXdXviuYaUHEIjZulNkISSev+nEt2+c3JDWHu/dhd3e1V8JwVC9fuWhgoJTF01gsMUBjhSdgEThg==
X-Received: by 2002:a17:902:854b:b0:192:903c:3726 with SMTP id
 d11-20020a170902854b00b00192903c3726mr35751713plo.28.1673031000047; 
 Fri, 06 Jan 2023 10:50:00 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b001911e0af95dsm1218907plh.240.2023.01.06.10.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 10:49:59 -0800 (PST)
Message-ID: <d55772bf-c87e-20e5-180f-a903d9f9f8b0@linaro.org>
Date: Fri, 6 Jan 2023 10:49:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/8] hw/pci-host/bonito: Set reference using
 object_property_add_const_link()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/23 05:07, Philippe Mathieu-Daudé wrote:
> A QOM object shouldn't poke at another object internals.
> 
> Here the PCI host bridge instantiates its PCI function #0
> and sets a reference to itself (so the function can access
> the bridge fields).
> 
> Pass this reference with object_property_add_const_link(),
> since the reference won't change during the object lifetime.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 80ec424f86..d881c85509 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -656,10 +656,17 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
>   static void bonito_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIBonitoState *s = PCI_BONITO(dev);
> -    SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
> -    PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
> -    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
>       MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
> +    SysBusDevice *sysbus;
> +    PCIHostState *phb;
> +    BonitoState *bs;
> +    Object *obj;
> +
> +    obj = object_property_get_link(OBJECT(dev), "host-bridge", &error_abort);
> +    s->pcihost = BONITO_PCI_HOST_BRIDGE(obj);
> +    sysbus = SYS_BUS_DEVICE(obj);
> +    phb = PCI_HOST_BRIDGE(obj);
> +    bs = BONITO_PCI_HOST_BRIDGE(obj);

It would be nice to re-order these so that you only perform the dynamic cast once:

     s->pcihost = bs;

Regardless,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

