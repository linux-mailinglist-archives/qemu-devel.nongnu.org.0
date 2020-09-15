Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660D26AAE4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 19:42:22 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIEyD-0003nn-9B
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 13:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kIEfo-00021D-Ih
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:23:21 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kIEfl-0003zj-V2
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:23:20 -0400
Received: by mail-wm1-x343.google.com with SMTP id q9so273408wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 10:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FdiR7DlT5HQRODn81gQCKyUyfEBsym1zXiHAgLOa+rI=;
 b=fA7QPi0JQOv6zAoJol22y3PiXuVPn8B3DYHsnb3AliqWzZDTiBXqsHSoOuU8O+zoAG
 /SMa1AEAbsgzOtJeH0O9pF8M6Wx6f7+v58SIWw8ypYU/mn0X1mAwDukBTgFOSJ4e0K9y
 2xyCkvw1rgJBPuveWJb3V4RKYe+SFp1Ke3PHnqJjYWazJA1ca21qhAVJ69cKxjhZokXz
 twujDIlEEJhS69k9kp4LMOGDNHsQ/TfOLg/CdblT10UpVXEZUFRZt23TBIGKZnNUFMz0
 LhQF4YyEugskFB9bxrcalX18giU9Gk+1Q1pwRvCF2Ln9smoTWwvIP9Kw8AlYO9Lp7kYg
 kjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FdiR7DlT5HQRODn81gQCKyUyfEBsym1zXiHAgLOa+rI=;
 b=tjZIfmBhEKCJrABqvHQQmsFtbgtkpgjB2TDh9MPdVjFTB/D+1pZVzq9Ni1ZdH0r6/S
 PH6qOxO6gMtvx8gu62K9HpfnpMYEXo5mx2cgY/SPPAY2eH33o9AqCUKykrt2n2OSZaog
 Z7Oiu8fVRuUi+GKkMH+woixUhR0/0S/q5mF2Qc5xswFJzuVGwWKUYwvqWf6ts7ocI4At
 Z6JRuQXW4k6TYEtjdFGvZwvJvpjwDe8M4hiqKMS8lHSfA27w+Pm26pTkYjC7634I71qx
 tBZCBYIRpnXDLeXOFNt2QEF9XefwDrqnGzjuY1sR9Pjfj3cyHeXZYUMoQfkbmpxWxeTG
 ffJg==
X-Gm-Message-State: AOAM532Oaq5HkGKbRgNIR1OF9ARoa30U7O2YDoKaoe1wtJ0f1PHeotvb
 Agn0JptWu6RiQDS58csOugk=
X-Google-Smtp-Source: ABdhPJyiLiJ4b7fML4R3PRDXBoBIICchHSWNf+hiSkakxMAnejB+JBPHqzGuxq9kbXn4o6qCbt1woQ==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr471038wmc.54.1600190595870;
 Tue, 15 Sep 2020 10:23:15 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id n4sm343425wmc.48.2020.09.15.10.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 10:23:15 -0700 (PDT)
Subject: Re: [PATCH] hw/mips/malta: Fix FPGA I/O region size
To: qemu-devel@nongnu.org
References: <20200905213049.761949-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee3ee29f-35fa-aedb-c02b-8e4eb1e3e9b3@amsat.org>
Date: Tue, 15 Sep 2020 19:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200905213049.761949-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 9/5/20 11:30 PM, Philippe Mathieu-Daudé wrote:
> The FPGA present on the CoreCard has an I/O region 1MiB wide.
> 
> Refs:
> - Atlas User’s Manual (Document Number: MD00005)
> - Malta User’s Manual (Document Number: MD00048)
> 
> Fixes: ea85df72b60 ("mips_malta: convert to memory API")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/malta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index a59e20c81c5..6a19be0a5dc 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -574,7 +574,7 @@ static MaltaFPGAState *malta_fpga_init(MemoryRegion *address_space,
>      memory_region_init_alias(&s->iomem_lo, NULL, "malta-fpga",
>                               &s->iomem, 0, 0x900);
>      memory_region_init_alias(&s->iomem_hi, NULL, "malta-fpga",
> -                             &s->iomem, 0xa00, 0x10000 - 0xa00);
> +                             &s->iomem, 0xa00, 0x100000 - 0xa00);
>  
>      memory_region_add_subregion(address_space, base, &s->iomem_lo);
>      memory_region_add_subregion(address_space, base + 0xa00, &s->iomem_hi);
> 

