Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC25EC750
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:12:31 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCG6-0003Ep-5b
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odAZl-0000dv-Tq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odAZf-0005kH-WB
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664285074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkvKGoZI9TLSH3d7GE+i/g81FyFuBAaQO2BkoSj7XpE=;
 b=AAmGC0vXp4bB3btQJrmFkMjE6L5gObXCbK2ZeW7b5buk5fuqpDAw2SP6NzXKXW8tuk/GI/
 EW6tqx3kI3F6RAse2Wa5Wyrc+zeHlY6D8IbRwGDFNKDAfkjBRkZ9TdCkcb7m8ZrPNnaTPg
 6YS4z6Q6HbbapJKZGPGUzUcCPdH7vjQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-BUO0r5MZNCm5h2HZY-kmfg-1; Tue, 27 Sep 2022 09:24:33 -0400
X-MC-Unique: BUO0r5MZNCm5h2HZY-kmfg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so2165239wra.21
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YkvKGoZI9TLSH3d7GE+i/g81FyFuBAaQO2BkoSj7XpE=;
 b=bs+sgG2cDBBr0RvBw14n9z62ftwYltkYEG1NrMf9Y4cYhyWE4Oc5v18K6reFa0SLOU
 36wgYZH1H6KD6yEoe1eBwBi7PUWhTRIb+pxCp8yu6bwEgIZBl2WhkMX9DTGREI/CJxnY
 oh4qd8ZbDLsnmxXOpEZPAnYSrZqMiWs7E4ft0TO2K/CsALP5wR6Kd8tUu1BZ478ZpaDi
 ojtLw9UhJUsQO8ekwvm/1HJIGlrcWPxN6RMrp1ePL9ueUkTmqLenI5L0KMHoFYywZV1V
 FFCkZfMBl3Na8f4TWHIFKHUajJq9sEGTsPkOCl18bvrBrk9AKIr36qsEFAa/nJtchHFe
 u4FQ==
X-Gm-Message-State: ACrzQf2hoSzfDw1fH9nnqClmYoS3HkPYvfOKIftbxFPmSfxBrnmfrcoq
 ct+LgYIYF2RPBrhpVVrO1p70WJ0BFc9umhlf9H3g/hNtHCEE5WiS5VzviUSdkee22ca+qUZkWC6
 mP31c+3/lngdaNWU=
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr16904265wru.459.1664285072633; 
 Tue, 27 Sep 2022 06:24:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Y92oW+XsJWM3HQNPZn3xLVKOpr/sNEpqqKUfmKN6hapb6DO2dJeRTyXG4PDRACwVMcSElNQ==
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr16904246wru.459.1664285072351; 
 Tue, 27 Sep 2022 06:24:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h7-20020adffd47000000b0022c906ffedasm1764299wrs.70.2022.09.27.06.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:24:31 -0700 (PDT)
Message-ID: <de209311-c944-45c7-92f9-278fc43fd01b@redhat.com>
Date: Tue, 27 Sep 2022 15:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/8] hw/arm/virt: Fix devicetree warning about the SMMU
 node
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-7-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-7-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

you may add: as opposed to SMMUv2, ...
> The SMMUv3 node isn't expected to have clock properties. Fix the
> corresponding dt-validate warning:
> 
>   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric

> ---
>  hw/arm/virt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 10ce66c722..2de16f6324 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1362,8 +1362,6 @@ static void create_smmu(const VirtMachineState *vms,
>      qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
>                       sizeof(irq_names));
>  
> -    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
> -    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
>      qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
>  
>      qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);


