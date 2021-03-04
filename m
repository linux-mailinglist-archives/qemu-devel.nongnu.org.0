Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95332DB20
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:25:29 +0100 (CET)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuXI-0007vk-7o
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuRK-0002yd-On; Thu, 04 Mar 2021 15:19:19 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuRJ-0006VO-Cr; Thu, 04 Mar 2021 15:19:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id e10so28836016wro.12;
 Thu, 04 Mar 2021 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XC7M1dOfRL6WHCR1d9zxUFa49rOrWxHbD5Ti//RuwLM=;
 b=qSsCwFZZhUyE6b10znZdQV1q478tUxgfeqC/oPKY6+gkA7UByX0HTdyv5bcfwnlwGn
 4BOcJ+Ujbo86koiJqA9OiQdA05o979RLeohhzJEvfJ2hsFewtguSgmWzuPPQxxsTOqki
 oTZsS1rz4eyg/kUdMu/IRNacYo/ksQyHmpmusZ2VPXhVrrIAK66s232ASc/W3Duox62W
 R+z0NO8YaCjIUmxI+NQMk0oXyj3TENjpxxXWzfs9BYRYfATsvCIDuDX0ygEbXQ5+wlTw
 7oXHlH/pa6Vvbuu+OOMVtN3eHNZdYaqR8abg1qVUMV4S+RnXBbtPhvN2ZLdKdnWJ7HLN
 zyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XC7M1dOfRL6WHCR1d9zxUFa49rOrWxHbD5Ti//RuwLM=;
 b=NBwbqt+K0vzPZU65cai4e8uG9PcbBdfaGEOLuWdoCwZVpZesX9AkqqMGmy8EKErH9P
 OPWq5TURDn3JJ0DFBzNMZqJoQ142kkHYXguUCYjjcry6owHxbng41rXt51GMdIdKxsL5
 rx5ikE4wEMdn1vzafNrM3f2h5UQvyKcCKoSg2d0PI7zak2DTh42votkjQXKvpS2543uY
 C0dzoV5FlpSdiicObAp/5zgG+m4dzALqFvt2nG8XH0DnvcANWrJ8D0y3IhPoR20gbFQ3
 cID3a3L9S7slTnfFCX7gbYf++Wm4DzJJpC89qDfpOVxfXtkofsyIxVgcnd3aP3rsS8Yr
 DojA==
X-Gm-Message-State: AOAM532FHJAz3dsrVYi70hgsbRTYrKzEhAuj2uHdG6ri9cqShhVdBcHV
 VK04V22Q3s1zaCvXjny13ppeVTghetc=
X-Google-Smtp-Source: ABdhPJzFEaD0ksNgSDlt1GUQbMy/ogR2SBez4p5h/OHe14IiU1wAOv/0xfkevcnNBzbZsCdohWzqlw==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr5544579wrq.27.1614889155061; 
 Thu, 04 Mar 2021 12:19:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z3sm492592wrw.96.2021.03.04.12.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:19:14 -0800 (PST)
Subject: Re: [PATCH 31/44] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-32-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4185da92-5909-5040-b015-5608aa57729b@amsat.org>
Date: Thu, 4 Mar 2021 21:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:46 PM, Peter Maydell wrote:
> The SSE-300 has a slightly different set of shared-per-CPU interrupts,
> allow the irq_is_common[] array to be different per SSE variant.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armsse.c | 39 +++++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index f43f0524e28..b316fe69571 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -68,6 +68,7 @@ struct ARMSSEInfo {
>      bool has_cpuid;
>      Property *props;
>      const ARMSSEDeviceInfo *devinfo;
> +    const bool *irq_is_common;

Maybe *const?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

