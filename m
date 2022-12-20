Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D456F651763
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:53:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7QsI-00075i-9v; Mon, 19 Dec 2022 19:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QsG-00075T-U0
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:52:52 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QsF-00041Y-6o
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:52:52 -0500
Received: by mail-pl1-x62f.google.com with SMTP id w20so4114245ply.12
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XeljmiaDNnvmj+otpO2TC5EyHKzVgCeZv3sOMOFA7Hk=;
 b=kqqkvbPOkm2VKPC/ayzJ1s8rT3wnPCVzC+CAuz1DrfsVnoQ6YEjMXlFTid25r5kj0C
 jDPuaBTnJX+lyZd7f7GiN1WvU0teUoZy7zE4AHfRikGiqQw71D482nkYKIaKPxOYnt1I
 rsIoOjorw5lCbtADbxwjwP5OfI5xKDtZBDjjVkGez0U0Yeu0R4vmcgpD2y8FeCejdmyC
 v1hOQqs2VC9q2Lfk78oG4t8cD3CSn0oJaUN8MvU2A1sICAZyPYW2HC3r31KLpeZGFPBJ
 +Xu1ALdrmoFjg6oYj+J6r/Bs1VfU9Vxlxo6TBegvh/BGYEAmCbM6FjJrMj+0TqUfsko6
 +Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeljmiaDNnvmj+otpO2TC5EyHKzVgCeZv3sOMOFA7Hk=;
 b=ivr6hpXsFTvWml6km4hxTo4wHQ0OkAvFWWlGmSGcMhsj5U+GYvwLDMuHfZl+XHx3y7
 G3unT56f+tHBX0jbl48ud4qxS1aM0/bQvi1Y+d51gVhEoIfTPJX07tRmbi1GnrHwLJbP
 7VDJ1NVKHv39Ye4ZchJTkenmzflS6ekwNr8DhBQJj1ox6ZRt0G6E5sAMt7tfwsZo1bVD
 5R9yKP5AmyvuTxJNGFzN08w2z4SwG1i9XCoZ3LKj1hk2FflOBbw2zLTEh5Rx0EP1/kVt
 ml9O56OziQCTd7pWGAbi+hhsgtfX8YkYL3WpVLylpZjx8AvgU+aBnmS0MhgdLBSQolF0
 R6Eg==
X-Gm-Message-State: ANoB5pnNGxY0SPCtiRCrRtOx9ZVJP5QoGEMhDmJ+BsbjK0ATPqxy7Nek
 qarKQK4b+Q08fBtBqTDNqPc7GQ==
X-Google-Smtp-Source: AA0mqf7gV9uzuLFWwUyXzR4xHld4qufGmobgZNzT5OeWv4HfV0QWhnufdaQvbYZZewVXIFtR70k3ZA==
X-Received: by 2002:a17:902:eb45:b0:189:dfb1:f087 with SMTP id
 i5-20020a170902eb4500b00189dfb1f087mr41597283pli.24.1671497569862; 
 Mon, 19 Dec 2022 16:52:49 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0018f69009f3esm7750301plb.284.2022.12.19.16.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:52:49 -0800 (PST)
Message-ID: <95fe4231-ee7a-ff1a-4804-0e294e0adb58@linaro.org>
Date: Mon, 19 Dec 2022 16:52:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 5/7] hw/mips/malta: Explicit GT64120 endianness
 upon device creation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
> Propagate the controller endianess from the machine, setting
> the "cpu-little-endian" property.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/malta.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Modulo using qdev_prop_set_bool,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index ba92022f87..1f4e0c7acc 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1390,7 +1390,9 @@ void mips_malta_init(MachineState *machine)
>       stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>   
>       /* Northbridge */
> -    dev = sysbus_create_simple("gt64120", -1, NULL);
> +    dev = qdev_new("gt64120");
> +    qdev_prop_set_bit(dev, "cpu-little-endian", !be);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
>   
>       /* Southbridge */


