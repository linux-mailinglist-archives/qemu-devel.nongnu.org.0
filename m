Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8AE674369
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbM2-0002K6-7p; Thu, 19 Jan 2023 15:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIbLw-0002Jf-9B
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:17:43 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIbLu-0004a2-FK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:17:39 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-12c8312131fso3917548fac.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lX/f4TRkWE06+NwnzDitUOj/rbGdBPdu3QAKHPVyvhY=;
 b=DqwAlI9vz84aL0RS7+M3rG6MpGIcPi2jsmESjpAphgpJBqw3+warIw/sfOvij2XC0l
 iUruRAL0565isjVCc9ncywDTrZH3JxefqmUCeL8hWWrk4r5A6QnmBbdxhRW1yV4bzZpt
 mprDle4E/lOjSMiHZBwMn7SZ1FFIaUQVbBl4rtiCt5ByvAQFCHi93XY8fWcth6k0cMN0
 Oh6bTtzje22uHBmQ/U1y1L5PXxQyP1nA7TC2U4FcrS1cLE/sBT17W8nd0uwsb5uD/GWQ
 14HGywH9SLqg+Kahy/QajqcuZ/6rIa4nT0FVNvGdcuhuakM50WN3sVkNItgUSdYX5lUS
 uXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lX/f4TRkWE06+NwnzDitUOj/rbGdBPdu3QAKHPVyvhY=;
 b=AYYC2WppdzGlkzqYF0CX0J15svTnYMYoCwL7m3XQNQRUFUZdJwKGy4fWwHkDf3QsRg
 yBQ944HN+xWGVgbAvRtX16WBtct5+62+6ZArwlLkIiqXnRzug+8hoPfqTDMHLalZn8iP
 r7XtSG+hm3+0bUwq2IZedL3FbFdyT9HYCv4+PsGcSCLOj8PBeeHKW7nvdSKtMEAKv3X8
 blrIj+djOvOJ8MeZ0DlfguIpSwU1GRlA3bgRUcoQrKNy4cFj1HAUew8CrR2rp9NrMKjY
 PXdJ/9t0TUK/+WwgoqsEh+6z3SRfKF4z8OdAgstXo+4NUQjMwdHg98Y/YfNqK22cuNOT
 rnCA==
X-Gm-Message-State: AFqh2krfbE2eaAhLTNuFqdKjlTN5E3NtQexAvRuNS0kZ8pAWcRqrhtGe
 5hT5gWygO06obA2cyhl5oAudGQ==
X-Google-Smtp-Source: AMrXdXtt12V7REAS0RX8kInk0uyyO9YukkuWPNygugVQu1AaV93IVUHCR8keCtbtYaPlXujbfFbf2w==
X-Received: by 2002:a05:6870:4985:b0:152:d0dc:2bba with SMTP id
 ho5-20020a056870498500b00152d0dc2bbamr6572487oab.15.1674159456962; 
 Thu, 19 Jan 2023 12:17:36 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 e145-20020a4a5597000000b004fd878ef510sm2026322oob.21.2023.01.19.12.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:17:36 -0800 (PST)
Message-ID: <ab6a9f67-c7e7-f96b-5fe9-3df8caba34c9@ventanamicro.com>
Date: Thu, 19 Jan 2023 17:17:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com> <Y8mghghac5Bintsl@spud>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <Y8mghghac5Bintsl@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/19/23 16:56, Conor Dooley wrote:
> Hey!
>
> On Thu, Jan 19, 2023 at 04:17:24PM -0300, Daniel Henrique Barboza wrote:
>> The Icicle Kit board works with 2 distinct RAM banks that are separated
>> by a gap. We have a lower bank with 1GiB size, a gap follows,
>> then at 64GiB the high memory starts.
>>
>> MachineClass::default_ram_size is set to 1.5Gb and machine_init() is
>> enforcing it as minimal RAM size, meaning that there we'll always have
>> at least 512 MiB in the Hi RAM area, and that the FDT will be located
>> there all the time.
>>
>> riscv_compute_fdt_addr() can't handle this setup because it assumes that
>> the RAM is always contiguous. It's also returning an uint32_t because
>> it's enforcing that fdt address is sitting on an area that is addressable
>> to 32 bit CPUs, but 32 bits won't be enough to point to the Hi area of
>> the Icicle Kit RAM (and to its FDT itself).
>>
>> Create a new function called microchip_compute_fdt_addr() that is able
>> to deal with all these details that are particular to the Icicle Kit.
>> Ditch riscv_compute_fdt_addr() and use it instead.
> Hmm, this breaks boot for me in what is a valid configuration for
> Icicle/PolarFire SoC which was previously functional in QEMU.

Thanks for letting me know.  Are you testing it by using the command line
you mentioned in the "qemu icicle kit es" thread?

$(QEMU)/qemu-system-riscv64 \
	-M microchip-icicle-kit \
	-m 2G -smp 5 \
	-kernel $(vmlinux_bin) \
	-dtb $(devkit).dtb \
	-initrd $(initramfs) \
	-display none \
	-serial null \
	-serial stdio




Thanks,

Daniel

>
> I'll try and write another email explaining things in more detail, but
> in case I do not have time to get that done in the next day or two I
> figured I should let you know.
>
> Thanks,
> Conor.
>


