Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141815E685D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:28:56 +0200 (CEST)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obP4I-0003a5-F8
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOY4-0001Hk-4w
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOY2-0004PV-Nm
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663862134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtGISf9FL8h5mYysqRwOtpfmpc3fp84CEe8X6LPKO5g=;
 b=ep7SbRzJmCINyD59SnUq8jPDFwmM+I5iviV1EJiX+ciJjVZWOCvb4FHyLcie3j0YeSkxyw
 KN3zAa/qeDY9RqUI1MByjOdmxM6AOj1mwaMOM/in+rpqiXUjv3HkES+eRHAlUwZBQ73GsP
 LjqOcfKwIFX4y0GfH7ZGeNhnd3o9r0I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-uq6Z90muMEme72wPG1FQpA-1; Thu, 22 Sep 2022 11:55:25 -0400
X-MC-Unique: uq6Z90muMEme72wPG1FQpA-1
Received: by mail-ej1-f70.google.com with SMTP id
 dm10-20020a170907948a00b00781fa5e140fso3195649ejc.21
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QtGISf9FL8h5mYysqRwOtpfmpc3fp84CEe8X6LPKO5g=;
 b=5NGRjs+hug1C5Z2WZunOLSn+JJI0hgyTtgDn38uRJd9Q2WhSQqhACUK6FX/+jLb0ty
 44fcNDeFSd/AhumvLIaPxbjHF7+i9UcFc6w9uJda8TrdMvCumDTi7uKHLqJ/c/xEZfDz
 Odnz3XZ+rzoDVGmwPOrrMwN2jnjmKLKuve4W4WVGnalXmz1194on7zBVnNU7gneexBC/
 W7ElguX9Xii/F3TbX6XFwyl6sgqCmDDu2cejSpU0KDmbAevOLZsEJuFCs5e/CVqxKUPk
 wF1D3hwDf6yCYA8SPMlI6Tl/ITrzSCEGf3vFWgO5WoYkH5RAaOvi2tKdql3GorVnce/p
 g48w==
X-Gm-Message-State: ACrzQf1rLwh0b6ZDXPaRYvQFjkANCLAWkygEEWlYTVPxGE6yDmWOnl1J
 KH5JcksusiSBoTrAvXqVi+8Ga44wmTtpbzy5TED2choEsKWBn/Evh/2gMpu/f5gOS0IE++fEl4m
 6yMPBAuZEyBEheRI=
X-Received: by 2002:aa7:dd17:0:b0:454:2a11:85e8 with SMTP id
 i23-20020aa7dd17000000b004542a1185e8mr3947761edv.166.1663862124203; 
 Thu, 22 Sep 2022 08:55:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XsrQIr0Yj8a2WlSDJpT8nj6tTVileD0CnTlvmYU4+UWTUSOUypx3ZhVwgAH/bb8oipk+GqQ==
X-Received: by 2002:aa7:dd17:0:b0:454:2a11:85e8 with SMTP id
 i23-20020aa7dd17000000b004542a1185e8mr3947735edv.166.1663862124008; 
 Thu, 22 Sep 2022 08:55:24 -0700 (PDT)
Received: from [192.168.45.94] ([37.85.29.70])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b0078175601630sm2815749ejh.79.2022.09.22.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:55:23 -0700 (PDT)
Message-ID: <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
Date: Thu, 22 Sep 2022 17:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220922153820.221811-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2022 17.38, David Hildenbrand wrote:
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> 
> In order to fully support MSA_EXT_5, we have to support the SHA-512
> special instructions. So implement those.
> 
> The implementation began as something TweetNacl-like, and then was
> adjusted to be useful here. It's not very beautiful, but it is quite
> short and compact, which is what we're going for.
...
> @@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>               cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>           }
>           break;
> +    case 3: /* CPACF_*_SHA_512 */
> +        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
> +                            &env->regs[r2 + 1], type);

I have to say that I liked Jason's v8 better here. Code 3 is also used for 
other instructions with completely different meaning, e.g. PCKMO uses 3 for 
TDEA-192 ... so having the "type" check here made more sense.
(meta comment: maybe we should split up the msa function and stop using just 
one function for all crypto/rng related instructions? ... but that's of 
course something for a different patch series)

  Thomas


