Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484353CC5C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 17:36:16 +0200 (CEST)
Received: from localhost ([::1]:37874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx9LT-00052u-2j
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 11:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx9Je-0003cj-Gm
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:34:23 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx9Jc-0002q0-Lr
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:34:21 -0400
Received: by mail-pf1-x432.google.com with SMTP id 15so7443240pfy.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eu6Ka5fs2jm+BFFRMhEXnnCDkOe9V+sSnXtefqD7zbI=;
 b=JGmtW2ipEnzHH6q5J4O97iBZ42ZCmOCqI9a34Tveqkdek4dfUz4+PKxRUCOkmfPFmy
 ECzuEJpN8IYs7phTitmEAaDMAjgNANRCWDiLDe+k0gheM8PokGmzVLOiC+O/qojtisYG
 lT5E6cy2Pnc6waMX08afnkY3sSmT4y6w3nwJRWz/idr/12BhLglMVnEbxLhoimtug6/K
 0neRlosvR5E45XNazA2i8aWsxFLFotAb/6wxll5DHWEcwWHD6+Q9fnFLnBJ8xeENyRJ3
 yxRnRMM34pJkaMAhktL62Y6EQp2WZcWYuBMBTKEwvEf1P0MuNnXRh/KXdOXefNp8TC4B
 zu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eu6Ka5fs2jm+BFFRMhEXnnCDkOe9V+sSnXtefqD7zbI=;
 b=RqHUuZp7+tL3VU31CjggMJ7qKmxQ+P+W+7eyjMO1Tb+RRWpugbUxHBVWSoZaU1kxQ0
 IwQPfUMYWcz0hLE5OGJ/+LlbJKvup8Yo0U24iYuleOCUjiM2sItM0sxfzO2vGWtNr7np
 sY2g2U0Vt8KYCyrJY8wmIAxhS7+WXI3OD/OzQQTmk6cS6CBNyhufDQKY18z46JL5NHjs
 5KPVKByAwx5kZy753hITpdIEhOyerucnB/iNELISiaQcG0/p+N/kwRI4TIxLa1E02ur4
 HoZ8sBeCw2tm4u9iCCh9a3+kfWeTp8CSLlyC72Hev8VNomLDd1fst2IPqreKuWE3RZgO
 Qg9A==
X-Gm-Message-State: AOAM5315MD5G/MU+jweU3DbayBVZdxobfh48Flb/qYJUTaFTovuan9xT
 lgWjOG/jtgGUZGOb4JUH+4DMGw==
X-Google-Smtp-Source: ABdhPJwA4UNLIaN2xceQeUWjr/IWQaBZu0vE+8dWgN+c5EWSD0raEd8TG8hAdr/rOmrj+QUiX21Zig==
X-Received: by 2002:a05:6a02:19c:b0:3aa:1bf8:7388 with SMTP id
 bj28-20020a056a02019c00b003aa1bf87388mr9420811pgb.455.1654270459233; 
 Fri, 03 Jun 2022 08:34:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b0015ef27092aasm5537026plk.190.2022.06.03.08.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 08:34:18 -0700 (PDT)
Message-ID: <7c4ecea9-3c63-e429-eb6f-44cb32cca147@linaro.org>
Date: Fri, 3 Jun 2022 08:34:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Content-Language: en-US
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
 alex.bennee@linaro.org
References: <20220603092505.1450350-1-drjones@redhat.com>
 <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
 <20220603150536.pt5jwmoeoqfkeixu@gator>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603150536.pt5jwmoeoqfkeixu@gator>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/3/22 08:05, Andrew Jones wrote:
> On Fri, Jun 03, 2022 at 06:56:41AM -0700, Richard Henderson wrote:
>> On 6/3/22 02:25, Andrew Jones wrote:
>>> The max cpu type is the best default cpu type for tests to use
>>> when specifying the cpu type for AArch64 mach-virt. Switch all
>>> tests to it.
>>
>> This won't work without further changes.
>>
>>> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>>>            """
>>>            :avocado: tags=arch:aarch64
>>>            :avocado: tags=machine:virt
>>> -        :avocado: tags=cpu:cortex-a53
>>> +        :avocado: tags=cpu:max
>>>            """
>>>            kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>>>                          '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
>>
>> For a release this old, we'll see the kernel bugs wrt FEAT_LPA/FEAT_LPA2.
>> See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")
> 
> Thanks Richard. How about for each test with guest kernels which don't
> work, I add a comment about LPA2 and use '-cpu max,lpa2=off' instead?

I would prefer to test new kernels with max, where we might actually test the newer 
features.  Perhaps keep one older kernel test around, to make sure we don't regress, but 
don't pretend that it can test more than what it was built for.


r~

