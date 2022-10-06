Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9C5F6A6C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:18:54 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSeC-0002ui-VP
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogSVu-0001CZ-32
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:10:23 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogSVs-0004Ey-E8
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:10:17 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r18so2085464pgr.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JduTXW6PLGdKWzmUjZZhmO+OtGT4XeVNrt4EO4Tuu9A=;
 b=gQLbPe5SssuViN30WDK281fiEm+eGyxdiaZysMGDPyf61TpDZH0KtG28nKfHZt331x
 op37IQtJmZyZxs4ugqJrNmBQDal59CpmC9dgkmLs21MpsAbe007+IypQE6rguEJNecEB
 U+Pz+JHVeVbRZSrXOU3ksYuRcVCW8yAMRYdKkJ8NOCSvbBz+IYU4uZ3IYI86H9ke12fB
 KExsHjgpdr71KV4uUwRjhd7UZXo9+VU//OEnH/fUy4OS3nCiRZntU3j9QQ+2h2KFwMTd
 6cTkXHyWWg51lQI0h0smEtrBXETTaWKQW9Bq/NDQ1GaE4ycW68mM0qghot6syWnsnL9N
 gOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JduTXW6PLGdKWzmUjZZhmO+OtGT4XeVNrt4EO4Tuu9A=;
 b=cTZk5irVDJZGvm2AOJ1sadZ2BDlB52mi6goO+pRXF8YiwK5J74VgA3TgQcxuNc4pxL
 AZpSYoIxN0aNstMGUXRg31XHD6QqomSGjNV89YCxP8FUTvW7jcLl5vzdDzi9N4WB87b9
 uqXy8tiy2gG9a6v9H5rjHcKbx8fH/zI6J0CdD83BJcuJxnfNhVPqF7cbp5s0qxAtYjk3
 y6VHhRM6WrCOoXp/CrLcF0KhVpPjUh9zUYCroHUaYX+lSAWrRH8wpyLAuo/X+37drDjd
 59GCswhG0w7yeUAu4DJgxJYUUr8Q/dz5DN2PbPuDuZJYjgRYOz23n7gUm2n6XQQUwUsZ
 botQ==
X-Gm-Message-State: ACrzQf3Oecs5iLjHZu6MqHSWRjkvPRrXSfBo/lqZPSeHqK/unfgqwrAc
 4gUb0XrrmQFTEdajLFiWnBj6lw==
X-Google-Smtp-Source: AMsMyM7y79UVS3PSlo0PMlq/Jf42b0JegBf9gO+Hn5+OkYGKCACgVgVRCXlFvFCwCnf7zCj+td5kWQ==
X-Received: by 2002:a05:6a00:1312:b0:536:fefd:e64a with SMTP id
 j18-20020a056a00131200b00536fefde64amr300148pfu.26.1665069015004; 
 Thu, 06 Oct 2022 08:10:15 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79419000000b00561c179e17dsm5279180pfo.76.2022.10.06.08.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 08:10:14 -0700 (PDT)
Message-ID: <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
Date: Thu, 6 Oct 2022 08:10:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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

On 10/6/22 07:27, Peter Maydell wrote:
> On Sat, 1 Oct 2022 at 17:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The starting security state comes with the translation regime,
>> not the current state of arm_is_secure_below_el3().
>>
>> Create a new local variable, s2walk_secure, which does not need
>> to be written back to result->attrs.secure -- we compute that
>> value later, after the S2 walk is complete.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v3: Do not modify ipa_secure, per review.
>> ---
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I did find myself wondering if we should explicitly set
>    result->attrs.secure = false;
> in an else-branch of the last "if (is_secure)", though.
> At the moment we rely on get_phys_addr_lpae() for the stage2
> doing that for us, I think. Having the code here always set
> result->attrs.secure before the 'return 0' avoids having to think
> about that...

Yes, we're currently (and predating this patch set) relying on the attrs structure being 
cleared to start.  But I can certainly add the assignment if you like.


r~

