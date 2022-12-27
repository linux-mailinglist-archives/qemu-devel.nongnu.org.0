Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEB656D70
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADrK-0008An-8c; Tue, 27 Dec 2022 12:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADrF-00088a-Ac
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:35:22 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADrC-0000Zk-Kj
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:35:19 -0500
Received: by mail-oi1-x232.google.com with SMTP id e205so12935733oif.11
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fzz4zD0gIoxiEpAdol7VgoodD9JMzGbqBMY3Vmkl1hw=;
 b=NGidcoD4CYOsH3qIt3c639V/c7OWHaE9xx3Amrb0eRl/vNVqOzj5qprisSAdBXA0vl
 v1us8UCWRvVKnWW6aY7HStRokiYYf2mPqTApjZW5jdBB79jHSovqmPQRdpCBD3LvXsX8
 +uzxjfKWMu3AfsIpJOB9huHSRyWSE9TiQnnvESXmMOnYVvoY4nrdSTVUmqe6NYYCwglL
 Aa56cR7Hx7mI6UUwRWRF8CF9dfBoU942IT/WRkAlKQsmBmoQlK6XTzX9OWhm4emtdJs2
 lTS8f1cz4MFa/fMkG/kgRp5OdbwMqRJu4p6Y0JoTzcuC07rngKvq7HMUs53aI2i7AcHS
 c+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fzz4zD0gIoxiEpAdol7VgoodD9JMzGbqBMY3Vmkl1hw=;
 b=QEv+tsq/6GLCSw/XwQ5tYa+lpsMjsDh9wt8GcOVOVy+V2R4yaT03NrwthU/40i6e5z
 NBjG8zmaeTvUZNktG5VlU+9VKTDxonnNmNGMLuZfYizs6vNTO8vWns/AajtuZXS78RjX
 nwh1WJRNmVfUCnCI7qSXR4EXH4EPqtc78FZdD3sPXD2DkC2ynAitZH7mrck2kYo21ykB
 OZVSx7rfomErqvuU0PiKRF1g1+pKoB1f/dAXlV9JigDyrG+ceSFy9/88vLHoakkelQUB
 UVG2OvjTzwC09/sblcJ4Dz1K9ggZrmFJ6MdQUOQDqoQoHJUifLqyhOT/rK0MY0vp3s9m
 8m7Q==
X-Gm-Message-State: AFqh2kqDn6a++r3vMg6tmNyF8NCjLMNt1eZeLVv4GWrja56ABjDAUrLM
 Z6mxfAD4JSK6u3qB/FTxOU2MkQ==
X-Google-Smtp-Source: AMrXdXs7mWMSU9JaloRVCw4NPCcPT7NGzb0xQIjUwE7Ov7qA4UIeqVg/kAqi+8hXxlNUKmOXHNF/uQ==
X-Received: by 2002:a05:6808:90a:b0:35c:4ec7:8d2d with SMTP id
 w10-20020a056808090a00b0035c4ec78d2dmr10694304oih.3.1672162517345; 
 Tue, 27 Dec 2022 09:35:17 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6091588oib.16.2022.12.27.09.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:35:16 -0800 (PST)
Message-ID: <265d6a01-6a59-5b83-1f32-4bb190fa68f6@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:35:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/12] hw/char: riscv_htif: Remove forward declarations
 for non-existent variables
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-7-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-7-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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



On 12/27/22 03:48, Bin Meng wrote:
> There are forward declarations for 'vmstate_htif' and 'htif_io_ops'
> in riscv_htif.h however there are no definitions in the C codes.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   include/hw/char/riscv_htif.h | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 55cc352331..9e8ebbe017 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -40,9 +40,6 @@ typedef struct HTIFState {
>       uint64_t pending_read;
>   } HTIFState;
>   
> -extern const VMStateDescription vmstate_htif;
> -extern const MemoryRegionOps htif_io_ops;
> -
>   /* HTIF symbol callback */
>   void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>       uint64_t st_size);


