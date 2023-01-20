Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C216754BA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqf7-000613-3j; Fri, 20 Jan 2023 07:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqf2-0005wk-2v
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:38:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqez-0002Pc-KY
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:38:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so5735394wml.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o27X1AXHAhsD3xqNa4/bymSVDox9yFn3FbhdkunpaWc=;
 b=ZcSwzIgLwzy3/yp8KGK0mWXwyc5Qqpvts585QzZsS8tY9lLibsrrgL/Ylr5uY/RJny
 38PPwvN2+OZ9owZpgM+lDgTkF/jzPQCe7tgVuVbFmAGUZIfFlzKzrk/adhhNw8LR2ygf
 XmZyrrMW5mG2vPWtAym4T3pFOlHci0tuw+cJK0PQyT6ZKjcNjooMDqZ2nWug1bQmzRYz
 UXlYteVUNmLD71XLoIxl3gK0FCgs5KuseRbQwX7s5M0wMyX+B66riuvrRHtpcqptRF5N
 TEKZu/332I7uuHiLHo+YOoNMepjXBrj+DDEWXdUdOKBaxeY6InS9F4l3Ra5GUzr9TgTn
 ReCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o27X1AXHAhsD3xqNa4/bymSVDox9yFn3FbhdkunpaWc=;
 b=0YNlneOzbwIMY8nnWOQFURF4jFKhGh6r+ouwlqpjAoKIJcYLFgRlJ/A4lQ4Yp9MIvV
 EpgxKIrSkDHnI+cF7hCzhZL5lSchtvpvk3bjPsUtTgHtQLmECJgPAtNnLrGfu6Rn7ysb
 f9GybOMjXZwilLnNM15fLpfbviqipmNL32P8A2+I0Wuc4fuUJ/r2H4DpQ0779pO+O3AS
 IeFWEafUB5bcaeUTfkWlI88plO2EtI/cTUochakyf0qADaP11wlfMXHA7bSezECZJiBF
 Ymak1RRRe62n/IfD3YKpikg+m7/DXXe/hHH5qm+FQyBdr5GLmVAH32Dkb9SCLBlMpkEQ
 HpdQ==
X-Gm-Message-State: AFqh2kr/NzWkPIIRJNZNng1brWWJKl5zwXIeYHu+0Yw2JCt2QR49L91j
 EAXDYLJ3h0LGcBOgIngk10469g==
X-Google-Smtp-Source: AMrXdXuSc9nT8GpQEWAu+CSUJABeJAnt1M+FyBJcqTAUo58y6eVw5G1+nIxCScUqQxYhKbnRVE2ecg==
X-Received: by 2002:a05:600c:4e4b:b0:3db:2e6d:9f79 with SMTP id
 e11-20020a05600c4e4b00b003db2e6d9f79mr2696650wmq.39.1674218299081; 
 Fri, 20 Jan 2023 04:38:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o28-20020a05600c511c00b003dab40f9eafsm2382217wms.35.2023.01.20.04.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 04:38:18 -0800 (PST)
Message-ID: <1ddbd1ec-6419-3b73-b913-c0584e041ffe@linaro.org>
Date: Fri, 20 Jan 2023 13:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/2] hw/sd: skip double power-up in
 sd_vmstate_pre_load()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230120120133.666993-1-dbarboza@ventanamicro.com>
 <20230120120133.666993-3-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120120133.666993-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

+David / Juan / Peter for migration and timers.

On 20/1/23 13:01, Daniel Henrique Barboza wrote:
> At this moment any migration with the RISC-V sifive_u machine
> fails with the following error:
> 
> qemu-system-riscv64: ../hw/sd/sd.c:297: sd_ocr_powerup: Assertion
> `!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP)' failed.
> 
> The assert was introduced by dd26eb43337a ("hw/sd: model a power-up
> delay, as a workaround for an EDK2 bug"). It introduced a delayed timer
> of 0.5ms to power up the card after the first ACMD41 command. The assert
> prevents the card from being turned on twice.
> 
> When migrating a machine that uses a sd card, e.g. RISC-V sifive_u, the
> card is turned on during machine_init() in both source and destination
> hosts. When the migration stream finishes in the destination, the
> pre_load() hook will attempt to turn on the card before loading its
> vmstate. The assert() is always going to hit because the card was
> already on.
> 
> Change sd_vmstate_pre_load() to check first if the sd card is turned on
> before executing a sd_ocr_powerup() and triggering the assert.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/sd/sd.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index bd88c1a8f0..4add719643 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -664,11 +664,19 @@ static int sd_vmstate_pre_load(void *opaque)
>   {
>       SDState *sd = opaque;
>   
> -    /* If the OCR state is not included (prior versions, or not
> +    /*
> +     * If the OCR state is not included (prior versions, or not
>        * needed), then the OCR must be set as powered up. If the OCR state
>        * is included, this will be replaced by the state restore.
> +     *
> +     * However, there's a chance that the board will powerup the SD
> +     * before reaching INMIGRATE state in the destination host.
> +     * Powering up the SD again in this case will cause an assert
> +     * inside sd_ocr_powerup(). Skip sd_ocr_powerup() in this case.
>        */
> -    sd_ocr_powerup(sd);
> +    if (!sd_card_powered_up(sd)) {
> +        sd_ocr_powerup(sd);
> +    }
>   
>       return 0;
>   }


