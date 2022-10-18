Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761E603109
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:50:42 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpnZ-00065n-Mv
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okpI2-000604-7s
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:18:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okpHz-0007ct-NQ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:18:01 -0400
Received: by mail-wr1-x430.google.com with SMTP id a10so24369745wrm.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KHkoQStzaWgQ1E7HYpZhkUz2PhLAE9lzaPHltk7Ex00=;
 b=bwHSxow+q78EuZ6J9fv7phTlhcqVMFdS9zhdnRJ48OvkPtkZoTo4mS0e0UDxlFqrBQ
 veh0P92TSvIuJWV7ID26+oSpH9w6DSOYUt3wY8LCWs05KlOwI07OcmNFdkleOQuKIYgp
 tUoOEjWBfURRqGiyGQ6Wbmp+2mmxLr1RKHhCl8gjFMw6c7ky8jy+fwkcCEG02X6X7YKt
 eikAf4vGhO6K5rOUJX61LtYGGmxytvAKYRU9RHYPwmrKzEL2yb1c1RPtPc4E2fnVUV5V
 EAlmbrkF5ZB25x0fSu5xgrHOwgZTYfDB1g7teeFrWnWOMb0p+0gtvQzRXbzK7Np+l6LQ
 F9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KHkoQStzaWgQ1E7HYpZhkUz2PhLAE9lzaPHltk7Ex00=;
 b=dFhZa/dimdXhKkLLBiUtF3MpIh7M8GgjOmpceRdPx93cUm0aqwfptTannVNt7Qp1Kd
 XuA3GGSn39dbgsZoVqz2Cp4W7QFcqQ1zWRTd5pA26QnWCCW6zJlyJSYXB78Ia7V44pcj
 S4TMOrsXakI5xnV9cmOhfgvEXwSPNSwRarVCIuoW1/LgVYlvZexaAMWyUI1xSyRfzbOn
 2Gm3uBKlmgJnrtb5vUbagzyDTBaI7Sqc8qhcY8ASnfEQ07tUoWJvPIi5k9nHUFYAU7B6
 81W0N/dS5TZ6n5gqPDimn1RjNRGDgEc+JzsrAcRslPmtOmiP3n+zI8M2jQTRpEuEe8TS
 ffgQ==
X-Gm-Message-State: ACrzQf3SLubIg1zw2xMBdqUGN2+CtMbbYT6+u8Vk0u1pExX888ZW7Vq9
 nBQFtVE/i2Uky4JriR1HjH1GIw==
X-Google-Smtp-Source: AMsMyM6Fgx98yAWsUILVXU8OcmDhxKeF8mGYrz+yzNUOYRioXI2AwixvB5RFIwnvcpAKrP5eryj+dg==
X-Received: by 2002:a5d:4c4f:0:b0:22e:6c5b:a4b0 with SMTP id
 n15-20020a5d4c4f000000b0022e6c5ba4b0mr2458925wrt.574.1666109877943; 
 Tue, 18 Oct 2022 09:17:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003b4e009deb2sm16039006wmc.41.2022.10.18.09.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 09:17:57 -0700 (PDT)
Message-ID: <4c2ee3bc-18e0-bdd1-79e0-ee9a2c818d10@linaro.org>
Date: Tue, 18 Oct 2022 18:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [RESEND PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Content-Language: en-US
To: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221018152524.137598-1-jusual@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018152524.137598-1-jusual@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 17:25, Julia Suvorova wrote:
> In the ACPI specification [1], the 'unarmed' bit is set when a device
> cannot accept a persistent write. This means that when a memdev is
> read-only, the 'unarmed' flag must be turned on. The logic is correct,
> just changing the error message.
> 
> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> 

Fixes: dbd730e859 ("nvdimm: check -object memory-backend-file, 
readonly=on option")

The documentation in 'docs/nvdimm.txt' is correct :)

> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/mem/nvdimm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7c7d777781..bfb76818c1 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
>       if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
>           HostMemoryBackend *hostmem = dimm->hostmem;
>   
> -        error_setg(errp, "'unarmed' property must be off since memdev %s "
> +        error_setg(errp, "'unarmed' property must be on since memdev %s "

If you ever respin please quote 'on' for readability.

>                      "is read-only",
>                      object_get_canonical_path_component(OBJECT(hostmem)));
>           return;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

