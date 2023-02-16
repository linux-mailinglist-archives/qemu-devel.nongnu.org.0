Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8C698AA5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUNv-0001wv-A6; Wed, 15 Feb 2023 21:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUNt-0001wj-Jy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:52:33 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUNr-0000G0-TQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:52:33 -0500
Received: by mail-pl1-x629.google.com with SMTP id b5so681030plz.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T5+xIeCDu8jtyOAdoSrd/VU32+HlZfgxnVHArHHnnu8=;
 b=kEKntUgbVUOPNVvERaEI0fjO845UhGFw+ce/yHhwXPphtTpMVEQ9AeUSs3OM4tjrD2
 BcIUdQovGqVzwg5ObaIqVlUwp66Sg8w1ku1SkBIIU2qnLkr6XuFKsKUzXGHDvAMkEC2o
 Rd0wM2DpHkrGpmhVaerxhGfwBR0wnIEpG5aS8yQYYQle7sb89QvUgcaZAiV5x6LT0xaU
 3Xr6+/Ky2b9H5GyU1ymFB4K0mcMG6ehhT9BH+b377O30vf1v9+3F2ZMRpH0JwNd/lrR6
 IMefusHX2Hr8NsFtpd4XbIzk7983kvsPy83lKPDh99ZOLFZEDnufSKKUGCxlNyEkhBzg
 jujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T5+xIeCDu8jtyOAdoSrd/VU32+HlZfgxnVHArHHnnu8=;
 b=RYLb4BIfqD7Vc6VNkuV+7dG8+BCupEXtlWxJajNHSzMpbvf0U2ixkkkW33SVSf6FjK
 EWlFoYYjalKnclt6BVKHW/lE0qxuSZmEjzy3bBobD2gcGm8yfbYyaxp1E+oyiqBLnIFz
 oRdNpNRKUZiNDgFm4xqZFrSn35OVuR2p2BBfiH2JK6e27I2553+NSR6SA9bThNSgi4Ls
 ivmxLBlKfpEwFxYEIww7udRaR9Db8Q8bDP+cmGlLJ0tqc+CRMNdysLM4yzJ8WTVQr8V/
 umYYNatjUOO67nrHooFE3883SbYmXfuJIIvsDFPD0fTI/2qaTrfFrIyaZz2unWKRLntg
 dbnQ==
X-Gm-Message-State: AO0yUKX+yhK5xWgUVjBhMk6wr9GVN9G/C6V/nZWu4y9Y+46Cypm6tpTh
 nn9htdN0QTbUnzsVsm8w51Wmfw==
X-Google-Smtp-Source: AK7set9c3momnCE9GfOplFWmHPGn66TkGoPJu2WKfQaESU/1Lj32fLcn72cIA4hEZgfQbdfn8d0i1A==
X-Received: by 2002:a05:6a21:3806:b0:c7:26d0:1138 with SMTP id
 yi6-20020a056a21380600b000c726d01138mr205339pzb.39.1676515948098; 
 Wed, 15 Feb 2023 18:52:28 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 l6-20020a639846000000b004fbfefd5183sm98273pgo.80.2023.02.15.18.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 18:52:27 -0800 (PST)
Message-ID: <36dbc1bd-cf2d-ad74-8432-c9550e1a0aa4@linaro.org>
Date: Wed, 15 Feb 2023 16:52:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the page boundary check still necessary?
Content-Language: en-US
To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
Cc: qemu-devel@nongnu.org
References: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
 <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
 <tencent_5ED3B1CE709A7A92C2B7264011B9A84C2205@qq.com>
 <2c467dfb-a546-1bfc-a2e6-be30d91c73df@linaro.org>
 <tencent_242293DEBEFE0102C8F4654A993A7531D308@qq.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <tencent_242293DEBEFE0102C8F4654A993A7531D308@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 16:28, Kenneth Lee wrote:
> On Wed, Feb 15, 2023 at 04:26:18PM -1000, Richard Henderson wrote:
>> Date: Wed, 15 Feb 2023 16:26:18 -1000
>> From: Richard Henderson <richard.henderson@linaro.org>
>> To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
>> Cc: qemu-devel@nongnu.org
>> Subject: Re: Does the page boundary check still necessary?
>> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
>>   Thunderbird/102.7.1
>>
>> On 2/15/23 15:45, Kenneth Lee wrote:
>>>>> Now the chained TBs have been link with tb_link_page(), the chain will
>>>>> be rebuilt if it is invalidate on page. So why is this check still there?
>>>>
>>>> Even for a guest which doesn't use paging, and therefore does not need to
>>>> worry about memory maps changing, we still enable breakpoints and
>>>> watchpoints on a per-page basis.
>>>>
>>>
>>> Thank you. So is this the only reason? May I write a fine grained
>>> checking to remove this limitation?
>>
>> No.
>>
> Why?

When breakpoints change, we discard all translations on the affected page, similarly to 
how we handle writes from self-modifying code.  If you link from further away, then TBs 
won't be invalidated properly when breakpoints change.  For most guests, this isn't a 
limitation because we also have to care for modifications to page tables, so we can't 
allow such links anyway.

I have no idea what you're trying to accomplish that's different from existing guests.


r~

