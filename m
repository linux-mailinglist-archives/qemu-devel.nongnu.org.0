Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ADB671662
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 09:38:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3wx-0000fD-2Z; Wed, 18 Jan 2023 03:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI3wu-0000eV-Rp
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:37:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI3ws-0001MW-UE
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:37:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so888518wmb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSGxKCrJE3DVbK9tjGe4fQkYJ8hEiFobz6BMSb2tpKY=;
 b=m/8+HVw2IVqgbcysMfnI23Sp2fATzYLU3w5gynI9qYsMqWqyHNdmTl/GinKUqQLvbP
 GpC0eZmLMfxS55zvcrF+yAn0B93IHVkuAJdnQRKO1IrciPSQQXt6cR3tTYt2462SeQsZ
 ySwePxa+A806mMs/62aHvtqqRYi9fSjjGgzJODxUQ7yI1bL/z9UysUEkL2qjVFi8c62Q
 FEdQVKFDrQDYwGjvrO5bJz3dbiYUdG7rh2DibHIk9iMTnGXzwQ3Uu+G9W0FvLFygnioi
 mJQ0642Cf9yJXyN0IRYLHopXjMmHk4eaWWmuSvAUKDOThwEs8y/aORK7LuXNX1PnLrMb
 +PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSGxKCrJE3DVbK9tjGe4fQkYJ8hEiFobz6BMSb2tpKY=;
 b=mtMNMZLYdlQWy0S/tnaiKt/KC7FygMhE36r+K/1TcDWM9P0G+ai+UP7ztS4MU0VYdM
 vbgmG2uI8YsZ787O3uP5pONg4a19mONZt6VefHiFzGc9N/OkJ62QHpR6OKwpxOaS7B6j
 bD/8u0l4gYorzIl2Mru8I8Ax2xHmzDWuaXjSwpWe6t4UyX7IUvAJF4MAbMl1nBR3PRaS
 f/yk2uKz1h0akBRj2mtdeGQAK7jJYe7UfJ25hH0CglHpkxXyotJH+HL9FwIuEsPIZmDb
 00qOmNLufkSw6eMWzlS2Sl8FiY34azJGxJvIdRv3zT28VQCCNNihoIdGOEcoDi7WSbJY
 XXcA==
X-Gm-Message-State: AFqh2kr2DUjzpy3jUhLwTZorfpntAMKL4dKw2WJCOE6Zyj98Cml/l/x2
 KX0cQ9jAlA6Ytd2uXFsIDfTLdg==
X-Google-Smtp-Source: AMrXdXvIQc/9IEWVSay4OoD30bcvClxk0UR+xDtCjFe+253A7q2k5nkI1mYZC0cruaaJvj9QdAnIKQ==
X-Received: by 2002:a05:600c:1c1a:b0:3da:fbd2:a324 with SMTP id
 j26-20020a05600c1c1a00b003dafbd2a324mr5760025wms.36.1674031053088; 
 Wed, 18 Jan 2023 00:37:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az15-20020a05600c600f00b003cfa622a18asm1361898wmb.3.2023.01.18.00.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 00:37:32 -0800 (PST)
Message-ID: <1c532bf1-e69e-1ee6-da46-44ad07208af3@linaro.org>
Date: Wed, 18 Jan 2023 09:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix
 definitions
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-5-philmd@linaro.org>
 <CACPK8XcdKGvQGOeBKQXRhYVZKO5k8jCv_1syNbZr8YPufaSjLg@mail.gmail.com>
 <8646a560-dd95-6cdb-1f7b-3d344ee744f7@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8646a560-dd95-6cdb-1f7b-3d344ee744f7@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 18/1/23 08:32, Cédric Le Goater wrote:
> On 1/18/23 07:53, Joel Stanley wrote:
>> On Fri, 30 Dec 2022 at 11:35, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> IEC binary prefixes ease code review: the unit is explicit.
>>
>> I strongly prefer the existing code; it tells you the size without
>> having to do maths.

I guess it depends on one's mindset and culture / education,
maybe I'm too young for the full hexadecimal world and am more
custom to decimal notation with binary prefixes.

0x16400 is just another magic number for me, while 89 * KiB is a size.

> you mean that it matches better with the address space representation
> in the code and the 'info mtree' output ? If so, I agree. We can keep
> this patch out, it is not fundamental.
> 
> The hex representation of values has its advantages compared to the
> macros because hex is generally what you get in debug outputs and
> it is easier to compare and manipulate.  Some Linux dev feel the
> same.

>>> aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>>>       sc->name         = "ast2600-a3";
>>>       sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>>>       sc->silicon_rev  = AST2600_A3_SILICON_REV;
>>> -    sc->sram_size    = 0x16400;
>>> +    sc->sram_size    = 89 * KiB;
To keep everybody happy I'll respin using:

          sc->sram_size    = 0x16400; /* 89 * KiB */

Thanks,

Phil.

