Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281176606D7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:58:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDruH-0001e0-Ly; Fri, 06 Jan 2023 13:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDruB-0001dX-Ic
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:57:27 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDru9-0007uJ-Ft
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:57:27 -0500
Received: by mail-pf1-x42f.google.com with SMTP id p123so745478pfb.8
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1J5FrIOcdKQs2hGr7bm36fTCadkbNneJg637w3SuT9o=;
 b=vGXcVEDxWHXLL6sx0s6KltKDZf/Tt5i1NhTIyQFRso5gDKyfiD3JD6B7u6RSXcR9ED
 tkvdKrMnyVz5/6X+8ozGsKv5zKfW4YDlGwb6mUvIRxdFXMuCkQkfgeW9AIPiKDO4Uu2Y
 r8W2JQa4uuwrpsgRZv1M2av1ZQwJQJ/hUIumzY9/VChbDE0D8ub86nHo1aWe9XdTPegC
 xF1LleoFl+pI6lzdAenKCuIlTn/Hub1koRDPas5YSylMdVwrcQe2YTKWZUPWj7ww+jVU
 Vmf+L1MymMqJiV9o9HaAl3EQMQGY/RdJewLEuKl803RSH9Z/sgeqpJ7dJO5sC33AhLjt
 gN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1J5FrIOcdKQs2hGr7bm36fTCadkbNneJg637w3SuT9o=;
 b=cUGqJnZ+2Y1o3gEKciqfrsuGEARZcSL9ILaNcOruxhIb9ojvtnTf7gbk0vLOx9XtJB
 Av+OKW41X3E2UCrMcqGEqU7Yjq42uwTVdNs7jqYMep3tJkGudDVPVyi4DnLLMuHRhFHO
 qQ1e7CzdKLyeH4V/EKi+PCIekIKHthK19w/iMbY2BYdlWIrr9RxqQo60ofo+GiOsTL1c
 U8oWu4o/Hfiqqj5Yxl8cBFl7uurq2K0r5HWMuw5wS4k+s7GkbjgH/ap3mvJLfFSVEhic
 U862jC92OpqAw25+tV42XO0oUu+dIyltfp+HxnNj1GkAOGGqBDAOvFL4/QxqSLn0xvZ7
 U9xA==
X-Gm-Message-State: AFqh2kqrdY1wwLpitK4PKts3+52H7Mp600YEcZ/7p2RF3iCiEN/tfloU
 ctH/iumezZ5BsFxp+wcGCzHW6Q==
X-Google-Smtp-Source: AMrXdXuwG6kp4Nd9amjWCx3AAozMLQj23FLdTc3WxKsgG+FRtZgOgGo7sLy95iku2hnnA/f8ywjKVg==
X-Received: by 2002:aa7:99cf:0:b0:581:c741:f908 with SMTP id
 v15-20020aa799cf000000b00581c741f908mr31703224pfi.33.1673031443802; 
 Fri, 06 Jan 2023 10:57:23 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056a00000500b005821c109cebsm1416166pfk.199.2023.01.06.10.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 10:57:23 -0800 (PST)
Message-ID: <6cfdcac2-e3af-9a1e-3851-416877181341@linaro.org>
Date: Fri, 6 Jan 2023 10:57:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/8] hw/pci-host/bonito: Create PCI function #0 in bridge
 realize() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
> The PCI function #0 is an integral part of the PCI bridge,
> instantiate it internally during the bridge creation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index d881c85509..7722636e9e 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -651,6 +651,11 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
>       }
>   
>       create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
> +
> +    bs->pci_dev = PCI_BONITO(pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO));
> +    object_property_add_const_link(OBJECT(bs->pci_dev), "host-bridge",
> +                                   OBJECT(bs));
> +    pci_realize_and_unref(PCI_DEVICE(bs->pci_dev), phb->bus, &error_fatal);

You can avoid this final dynamic cast by saving the result of pci_new.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

