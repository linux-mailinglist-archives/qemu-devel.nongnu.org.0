Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B155992FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 04:13:11 +0200 (CEST)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOrVV-0007MA-UV
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 22:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oOrUH-0005nn-RW
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 22:11:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oOrUF-000519-FZ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 22:11:53 -0400
Received: by mail-pg1-x536.google.com with SMTP id 73so2650893pgb.9
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 19:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=WP9sgYipJJ1s8rUXj9+y7eoJXQG04HI0duGmLH4ovzU=;
 b=qzvotf7HBBiCDW+C6BD+8RXhj1CMvIPQPgt5Rv+bRKOYwbkZEgK4VjHs4KRPuDWZAB
 PO4Zy6Ej/KN03h2YzuMoO8nEacgb4K08JejNSlaeF99aHA87lZhMEr2SgSLuucND8dnb
 PwNsF7wwf4yA1Wu5LAJ4smJbgNhJe2CNvZqpl9oYBmwElfNg0exNV8mOGzv4cesXqPuI
 WMvrGvpqL7rjJUwDuogV1Ip22VwZ1SY/JgzcPDzp5pwnZdwNQmnvYG6VDqUNksKBtzmV
 hP2CVVlABBAnvX+OKL7KbuPsc6kp9wP+11iKeUr184JbHBTDrXxJQGGIbeZ48vcSXug6
 bNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WP9sgYipJJ1s8rUXj9+y7eoJXQG04HI0duGmLH4ovzU=;
 b=iGDcdFSD1891UBAvgPijeq3rm8o2XUs2jrcUygXt/ncskzxYZEXCyMvJFgMyCrE/CL
 fAl2kqdODGGt6W5dL3YqL2aN2XJ/QmOQm7q9y0JgbAjpDZQhZjiKZ4+SwkUtRjJPkFr8
 RpPnRhQ/ZF04GMc1Ch+GoR3/Hmip/ZxGxEcmeBQu7zVGT+RrN7+6/MwAvm3CA6V3NNGw
 AB6DqQzdTtTEj25Stw/9wejO1wWaV4ZQSqNiBJq1FR5qJXwmF8UWMcpHM+7YGhffmzak
 K3b0C27gRvMxqDv6vjUmcdRQUgQ4hK8TyKgC9ZVxcIfsj91kfoqDB1IA62cu0bTlUkf/
 fhhA==
X-Gm-Message-State: ACgBeo1VOJ5kfXubpjieW0jV/nr4caOstg36DU4p7V6HRb9VG8ognvnG
 dcDR/hjMG/o8d9Rrp0wqCzihyg==
X-Google-Smtp-Source: AA6agR6URKoEgCtDYn+da1cSeeLIm0GC/ogOwfhEbCJwKRd3xFgRefB/x0WlWEVl3lw/OQV3s2Infw==
X-Received: by 2002:a63:80c7:0:b0:41c:62dd:2109 with SMTP id
 j190-20020a6380c7000000b0041c62dd2109mr4499667pgd.449.1660875108508; 
 Thu, 18 Aug 2022 19:11:48 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 6-20020a621606000000b0052de4886706sm2354675pfw.10.2022.08.18.19.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 19:11:47 -0700 (PDT)
Message-ID: <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
Date: Fri, 19 Aug 2022 12:11:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220805093948.82561-11-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
> The pSeries machine never bothered with the common machine->fdt
> attribute. We do all the FDT related work using spapr->fdt_blob.
> 
> We're going to introduce HMP commands to read and save the FDT, which
> will rely on setting machine->fdt properly to work across all machine
> archs/types.


Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt 
property enough?

Another thing is that on every HMP dump I'd probably rebuild the entire 
FDT for the reasons David explained. Thanks,


> 
> Let's set machine->fdt in the two places where we manipulate the FDT:
> spapr_machine_reset() and CAS. spapr->fdt_blob is left untouched: what
> we want is a way to access the FDT from HMP, not replace
> spapr->fdt_blob.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/spapr.c       | 6 ++++++
>   hw/ppc/spapr_hcall.c | 8 ++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dc..94c90f0351 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
>       spapr->fdt_initial_size = spapr->fdt_size;
>       spapr->fdt_blob = fdt;
>   
> +    /*
> +     * Set the common machine->fdt pointer to enable support
> +     * for 'dumpdtb' and 'info fdt' commands.
> +     */
> +    machine->fdt = fdt;
> +
>       /* Set up the entry state */
>       first_ppc_cpu->env.gpr[5] = 0;
>   
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index a8d4a6bcf0..0079bc6fdc 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>       spapr->fdt_initial_size = spapr->fdt_size;
>       spapr->fdt_blob = fdt;
>   
> +    /*
> +     * Set the machine->fdt pointer again since we just freed
> +     * it above (by freeing spapr->fdt_blob). We set this
> +     * pointer to enable support for 'dumpdtb' and 'info fdt'
> +     * HMP commands.
> +     */
> +    MACHINE(spapr)->fdt = fdt;
> +
>       return H_SUCCESS;
>   }
>   

-- 
Alexey

