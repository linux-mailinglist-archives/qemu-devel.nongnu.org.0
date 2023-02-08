Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578F68F815
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:31:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqAD-0001be-Nn; Wed, 08 Feb 2023 14:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPq9o-0001Q6-RX
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:31:10 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPq9m-0006po-5Q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:31:04 -0500
Received: by mail-pl1-x629.google.com with SMTP id u9so888066plr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3IXRJH5taLneD9na5TOJOTS2JK21q2tHlSyF+EuRQHk=;
 b=InWIdIQOPXt99tblXNL31mY9sJomoo+zyj3DjP6OYr+s1XdrPmgVOtMIAG8E/bT+jS
 zqkyqqk6E/5TBdenifvIbWJTlV6nog8mskBUVSEZqgbdFfHFl1sBr+7NtRfvmpF06LAi
 Ua6mpJaYgwtITowUtRhMg0FjJErFhg8mCwzIfggemZwOXZuzvYD5CrTdItErJgpAbPQn
 xL+HAjpe4/BOnloZRK2L6bTjWRur4j2BPaNxCaWuEB56gL8l98C8dxIsKQJQ0+rjdPju
 cTVknEGNza6gib639nrgHwAXBMp/j7UTdSviWNUtFKUJsAe6fIynD82pRopwgCm9oQbQ
 1XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3IXRJH5taLneD9na5TOJOTS2JK21q2tHlSyF+EuRQHk=;
 b=eXuPWFChLadLYLOco3Iil7OwmfVTCxn3wqHTPA9ubTrnaqikjN8I2zqGAdwyPIBJFZ
 fER51umojvNphW6mIy97P1ImJh4t1I5LcRFfF+so55i6QblVnm2RFs7jrVEOyfC9B1KL
 YglGjGnIBkf2FG33w2ukknRKGH2ZScIfzSYEMEGweROsHjDQQ2zxdkfYgLP9Hf+RmVnp
 NJz2dQz8b67e1OVoV20igQb9TlzfhIx2vqZ0lvijj9PprhOKlJOvRgcq0pQblkR7cQcC
 Y0OmvGA3x5NUzXXi0YeSZqqgBhXiehnmwFgAgFLu/RXt19KytOykQbbaKJNp3GvqmPNw
 5WXQ==
X-Gm-Message-State: AO0yUKUNyZtM+af7hZwyLR/nkZvMeSB0lFmigSfKe2foF26oacAIFJpN
 O6BOW0sFyOuVoqHXAPqzvvtH7A==
X-Google-Smtp-Source: AK7set/aQIP3LTK5ywdbqrr+5+Cjnj/dNKhAtiyPUo/RDOoBT5YfzECH09wx8nYAz1Dx7gq5bZ8pww==
X-Received: by 2002:a17:90a:1a42:b0:230:7a3a:d4cc with SMTP id
 2-20020a17090a1a4200b002307a3ad4ccmr9562767pjl.43.1675884655865; 
 Wed, 08 Feb 2023 11:30:55 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 bj2-20020a17090b088200b0020b21019086sm4648927pjb.3.2023.02.08.11.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:30:55 -0800 (PST)
Message-ID: <589d77fd-6eab-ecb9-e8d8-a095aa643ebc@linaro.org>
Date: Wed, 8 Feb 2023 09:30:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/7] hw/isa: Use isa_address_space_io() to reduce access
 on global 'isabus'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230208000743.79415-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 14:07, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 5bd99379e9..95fc1ba5f7 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -114,7 +114,7 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
>   
>   void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
>   {
> -    memory_region_add_subregion(isabus->address_space_io, start, io);
> +    memory_region_add_subregion(isa_address_space_io(dev), start, io);
>       isa_init_ioport(dev, start);
>   }
>   
> @@ -133,7 +133,7 @@ int isa_register_portio_list(ISADevice *dev,
>       isa_init_ioport(dev, start);
>   
>       portio_list_register(piolist, OBJECT(dev), pio_start, opaque, name,
> -                         isabus->address_space_io, start);
> +                         isa_address_space_io(dev), start);
>   
>       return 0;
>   }


