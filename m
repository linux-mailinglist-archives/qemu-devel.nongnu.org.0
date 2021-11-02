Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD4442B49
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:03:26 +0100 (CET)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqdZ-00034e-LH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqc7-0002Kj-IR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:01:55 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqc5-0006NT-Gv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:01:55 -0400
Received: by mail-qt1-x82e.google.com with SMTP id v4so3885942qtw.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CUn+eaQzAxJwj8ZGGT0RIbnng5wqjhxehJcTPnEVwH0=;
 b=E/JSi8v2QPURDwaRFM9Qk8AVJYixHAxfVfkCaKeyorMWWQhJshG7iPEAABlkLcgpKU
 Bc37Oz55rkFOT/D8ZpQGwSp3gmdMCDpvCL1G9puXXCGMoKln1K38cwOJRw/w1Nf/8Ay3
 5NE66sMNXkWBlTxrmJUMCNorvpziJZ+W0pj1eB356DynpFd//Qd/JGUYrO0HOFqyNzpc
 afHiUmSO/MN8LdpEPbmMcKltbk3Z9zzLIZWadH1tRl9HuPkJW//Fzint4K/OnI1pOM4f
 ecxSPj10uTa3AlfQo40fkAehz3S7LhslH1UBlx0zedOVgO4jB9vwCW86OeIZA8mgHpUs
 yyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUn+eaQzAxJwj8ZGGT0RIbnng5wqjhxehJcTPnEVwH0=;
 b=oRrBpNt0/H0wG/ell5ons+5I4P0J4nnQxOCCbPflGDdCrvC4oZYEi/oLvnRY1pLLah
 5qyJbkoTXtn4nO86lcT899u3c2cfX+ABNbOoars1+WhDAJOL6Uw/BfnxyOfe+9tx+xNK
 +zaJ9uLGv7Y1ZEHAqftu0Xvldd3n78pRtOdNc0O9pHlJCiaAhTzxJhHuwp4BNmTs7SJr
 N3jpwjl4qckMvjhxbKRUJjUgTNXQTPpi7JQ9Ru/NKkT7CwmuBHvKLy1YWZVzvdbPbBpn
 5i+qtW5Gf8F2SS997NrmBD22OgaDxGFlhHuAFv0TDhQgJhzoRULlZFUe5Ge3ztcr48yh
 b/ww==
X-Gm-Message-State: AOAM532Xif/1m80rFIv2JkbbO6LNLtrRjBvPLUk0TMMdtSdDvQfdgzqb
 YHZ3nrstV9p+uryKQ5nGsmokAA==
X-Google-Smtp-Source: ABdhPJxXfcVoMVs8I8gbfFskguSt6ywcTgmkBId2HKHcUm9p0C/oThG4gtLErY98tYB5Pj1MM4XvOA==
X-Received: by 2002:ac8:5ac6:: with SMTP id d6mr8641616qtd.162.1635847312514; 
 Tue, 02 Nov 2021 03:01:52 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h2sm11881672qkf.106.2021.11.02.03.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:01:52 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211026071241.74889-1-agraf@csgraf.de>
 <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
 <CAFEAcA_wBCL++KREtW2COtDC8nHAD3DRsDbWBxPr0k7i8EWRnw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47d35b2d-bfbf-6ee8-a004-ad74e713db13@linaro.org>
Date: Tue, 2 Nov 2021 06:01:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_wBCL++KREtW2COtDC8nHAD3DRsDbWBxPr0k7i8EWRnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 3:35 PM, Peter Maydell wrote:
> On Mon, 1 Nov 2021 at 19:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/26/21 3:12 AM, Alexander Graf wrote:
>>> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
>>> into user space. For MMIO however, these have no meaning: There is no
>>> cache attached to them.
>>>
>>> So let's just treat cache data exits as nops.
>>>
>>> This fixes OpenBSD booting as guest.
>>>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>> Reported-by: AJ Barris <AwlsomeAlex@github.com>
>>> Reference: https://github.com/utmapp/UTM/issues/3197
>>> ---
>>>    target/arm/hvf/hvf.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>
>> Thanks, applied to target-arm.next
> 
> ...did you see my email saying I think we also need
> to test S1PTW ?

That arrived afterward.

r~

