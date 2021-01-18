Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0F2F9BC2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:11:39 +0100 (CET)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QZW-0001lC-TV
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QX8-0001Ka-CE
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:09:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1QX6-0007dS-LY
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:09:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id v184so8866592wma.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UNDKFtXKYYMo/TD2kFXsV60A3o17+bAJPdRtRrc2TZc=;
 b=pAPGSNEmuk+ZRBYJ9uK/5I9DzxxrvI6udb+mfwXRPR1OpFLf2C7lIs73vv5fM93Sw0
 /2jk4ix2Aa3jsUmSP8qCnu6T5fidHCoPYrprCPwY931P4DvK8VYpoq+M2iJ5lMAk+d8L
 LlOvpjvJ35jWvd1jkKDoIjB3Z6DSqZb7kLhMZuMK9rB1NWC7cQAY8v/3RJumxwa1ILaD
 zPw8/Z44QvpRJ0+v8p+9HwCHZFNpDJ3YssqETMFzJGdS63Q5dwjeSDQruVPQTMT79S63
 zCjpFnnPlnKdG5Vqm/6YZ1GO0Gj99Q+ZxaytTvjR+bt0CYj6Kj2BtdfjTf7DNB+AXZKn
 +aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UNDKFtXKYYMo/TD2kFXsV60A3o17+bAJPdRtRrc2TZc=;
 b=VhM1ml2raae+7cCIAk2MFPcQViBaTdZ29y9Ce9Tk1i/0H3ekLej6dKl42uDoDzGOc5
 iT9iGp//l27IwdJDUT96jiX/35efV2m304BHtvW/mgksG0vBsEoOHg4ZIs2/HFSmTlBH
 1E6wgshCbzfnWFz6scvHx3vBve1hMUuWJaIKoiNrvFf56nTZrbu7bCao41/zRB+ctrcP
 Kd0ZcKIzsDp6zB+6day0StsZhghe7Qlm2/LxigmjwE8AANeYdFuTWX+JMIqI/ffxROf1
 +szyUD4vz9gKnWyGcf6VkAzVppSGSTmCFPAwVYNB/qgOMI1Ap0uQiMasanliD3swJb2m
 2Xkw==
X-Gm-Message-State: AOAM5320of5uXkSfmQHTW7YLrXRNY7c8272hyu4/tk+R9YPNXQzg1XnZ
 Md/YXAlGcBSOcw0LB5GamHM=
X-Google-Smtp-Source: ABdhPJztVFLLUwoQ0hAM0jdBkTlYQzDbxrSDdNQ2ebD8C9ciac0ALjE09JAT99gZll9cNzc6N4QVvw==
X-Received: by 2002:a1c:68d5:: with SMTP id
 d204mr19724666wmc.178.1610960946163; 
 Mon, 18 Jan 2021 01:09:06 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n6sm6106166wmi.23.2021.01.18.01.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:09:05 -0800 (PST)
Subject: Re: [PATCH v3 1/2] hw/intc: Add Loongson Inter Processor Interrupt
 controller
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
 <20210118011706.22639-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8ff38217-fd9b-13b1-5250-27e7e1b08149@amsat.org>
Date: Mon, 18 Jan 2021 10:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118011706.22639-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun,

On 1/18/21 2:17 AM, Jiaxun Yang wrote:
> Loongson IPI controller is a MMIO based simple level triggered
> interrupt controller. It will trigger IRQ to it's upstream
> processor when set register is written.
> 
> It also has 4 64bit mailboxes to pass boot information to
> secondary processor.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  include/hw/intc/loongson_ipi.h |  20 ++++
>  hw/intc/loongson_ipi.c         | 174 +++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig                |   3 +
>  hw/intc/meson.build            |   1 +
>  hw/intc/trace-events           |   4 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 include/hw/intc/loongson_ipi.h
>  create mode 100644 hw/intc/loongson_ipi.c
...

> +static void loongson_ipi_init(Object *obj)
> +{
> +    struct loongson_ipi *p = LOONGSON_IPI(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
> +
> +    memory_region_init_io(&p->mmio, obj, &pic_mmio_ops, p,
> +                          "loongson.ipi", R_END * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> +    qemu_register_reset(ipi_reset, p);

You forgot to address 2 comments from v2:

- Use DeviceReset instead of qemu_register_reset()
- Missing VMState

https://www.mail-archive.com/qemu-devel@nongnu.org/msg772949.html

> +}
> +
> +static const TypeInfo loongson_ipi_info = {
> +    .name          = TYPE_LOONGSON_IPI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(struct loongson_ipi),
> +    .instance_init = loongson_ipi_init,
> +};

