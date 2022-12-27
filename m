Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02B656D6B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADlz-0003iG-DL; Tue, 27 Dec 2022 12:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADlw-0003i6-MD
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:29:52 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADlv-0007qV-02
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:29:52 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-12c8312131fso16160930fac.4
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AkiBGydu0g8F5BDGmTug56QWAwNI4IYlTgEkOqub6aQ=;
 b=iJsE3FCmhZ+wc7eoZ6Nia67tlKnJf5Q+ZFGxUqnkDXAMzKJsWhsUr/FziANM1g9Ps2
 oW2jN0hRDP35qvyhZpB7IlMIvQ4+hPdVWBgqI6pHD5SeqkwcR+OTRSqEqbeErfrXiEOF
 wgWAfkPOAvVpgB5Ik/xsBklDd1qhH/VvE3W0srt+7ms0uTuYheiA0aPrbOkwNVZH7WbX
 zc98c/pEBD7pdT9AdaLDdahi5NOx3hdnQyUhGPLt/oHcTKlM8bbSiwc9ctlfDRi2WqxW
 qD34aiuxFyv/aJCRM/ItxnatHbicPubfLkFrcp/eAmuLLXzKCiK22bS9rJx8UCTqb/7y
 2KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AkiBGydu0g8F5BDGmTug56QWAwNI4IYlTgEkOqub6aQ=;
 b=zrSNEbUwoTjRWbn26ykv2E4y4ft2jbDhGIVtzVCV1YWM6cG1EigFgUx+lAkk7/4Exc
 zSmqtkqo5NE2SJeK5SRfHgRqFPVxLy3+RWolp4PSZlNj6dvUk4EjQ8MrpiRKCuLiD5WP
 nAjO7CVeMeJHPKMvebaP9ACeIawVLbv1Z0Ar7tb+Tub5lwDEY5t5z1CqDGPMEW7h8B7Y
 jJXiUwx8qtCgHV6uxdtaQJ1boN84wByYupyHgm3gTtVV8TGYb3z8e0zyEgPk10/8MvwT
 frVJKWiO2OrSu4KPu2ng8R/t9A7/uQjM0rpi3tlBw+fCmFjtx9bkxfho9Pi6VEoXnR8M
 nrhA==
X-Gm-Message-State: AFqh2koaeuc1sO8KDr2KBlKFgsEEzjNM85lBRScRJmFVQ7h4YFXzABQn
 7Ck5vAgtrmFcl8MpT/2p5lB1+A==
X-Google-Smtp-Source: AMrXdXvu0t3UiPSAIWzEga+T83x1HFMX1wMFjK4F0s9qBszVaWswpqK216xWCqXqjIV7KNVG3y0AEQ==
X-Received: by 2002:a05:6871:891:b0:148:6804:e60c with SMTP id
 r17-20020a056871089100b001486804e60cmr13527914oaq.35.1672162189705; 
 Tue, 27 Dec 2022 09:29:49 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a056870d0c200b0014ff15936casm2383709oaa.40.2022.12.27.09.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:29:49 -0800 (PST)
Message-ID: <be9ccb17-dcc0-1b5d-55fb-16a860acfec6@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:29:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/12] hw/char: riscv_htif: Drop {to,from}host_size in
 HTIFState
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-3-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-3-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
> These are not used anywhere. Drop them.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   include/hw/char/riscv_htif.h | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index f888ac1b30..3eccc1914f 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -33,8 +33,6 @@ typedef struct HTIFState {
>   
>       hwaddr tohost_offset;
>       hwaddr fromhost_offset;
> -    uint64_t tohost_size;
> -    uint64_t fromhost_size;
>       MemoryRegion mmio;
>       MemoryRegion *address_space;
>       MemoryRegion *main_mem;


