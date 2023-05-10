Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39C6FDD73
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:08:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwib4-0003p6-AA; Wed, 10 May 2023 08:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwib2-0003oZ-3j
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:07:04 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwib0-0004dr-BA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:07:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso10060175e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683720420; x=1686312420;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x1XEwoHrB7mWdBvULTj9PJB9aqMfYkHk57WDRS8B7Jw=;
 b=paDe1s/FMtSWa8FKv38Vs8JOmlFp6p52bo9isw75aLCuEFzde2UfJrIpW51Sid0IbO
 SSCp/kt8/RiL92FoY8KE4+OIdiATQH74USNYk1aYSVuD9vN5KUfXPoapc3gfYrL2jxka
 Nxq2k/pZDOQENBxuhGuYGMwxupHsi06PdYvkrfNBDXn0rAPz3GMOC4GQEeIEqqzanoXU
 jOaP8qx0mQCU/mF2KXREn2hkXLJbpCSzo7Ebdej20ZsfdGAMiU2PGoaqZV/eORBuZGD6
 SjdhaFJ4ZLcr5IwCEotufPBrnDTdcBcVPES4/cICuwgTGvcurVQ7cDKCsMH+ZdzZ6tM8
 E2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683720420; x=1686312420;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x1XEwoHrB7mWdBvULTj9PJB9aqMfYkHk57WDRS8B7Jw=;
 b=a1wF8esHvrGLgJURK9LiDdUEEQhydmccaymv8R5m0aEKZwbs5EH5FpRStpn9jhYZzL
 eUh+OkuwQO2L8glo0Uv8xOZBTthEuxqoTU6SgxbbMixKAkmPKi4/SezIpI31bZqv524B
 YkrtDQMBxcTmSuEgn15ah8oIM87mAi/r+bWupiL+je9EHvwKCsDq9h8gxsL/9ktep/K1
 YDESr1d/OQT9mu8cFw8Bq4/ZNq1XzojpYJAmMOQhNNoeQQp9UFNHAvXtvK4TfSTIkSPV
 jN/ocDUQqvBQoygX0Vl3VfwwHjzDhYnCHUFS3lULo5I6EORdHaqnIXtup8CWGkYZNjAA
 iQMQ==
X-Gm-Message-State: AC+VfDz9kVyL1+jUl+gBuDC/eBeHL4KiypIlvVVo9olv2Wk38JE59rhc
 7oC4TLsdy7UkisJyzh0krTR1dw==
X-Google-Smtp-Source: ACHHUZ6Y3SKZLeFOZrCX4BliwpU+a6mWQMlUNQMobwjPxg97VAoY1o6hVeEwoON0WIG+2hxKu72JiA==
X-Received: by 2002:a1c:f317:0:b0:3f1:7581:bba3 with SMTP id
 q23-20020a1cf317000000b003f17581bba3mr11368373wmq.10.1683720420528; 
 Wed, 10 May 2023 05:07:00 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a7bc7c4000000b003f4ddde398csm917132wmk.21.2023.05.10.05.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:06:59 -0700 (PDT)
Message-ID: <49f04f3d-df61-3b98-4d52-777252b1436e@linaro.org>
Date: Wed, 10 May 2023 13:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/45] loongarch-to-apply queue
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <20230506063540.178794-1-gaosong@loongson.cn>
 <bd4d0fa0-6ce6-058c-22a3-f11909af8d12@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <bd4d0fa0-6ce6-058c-22a3-f11909af8d12@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/10/23 12:17, Paolo Bonzini wrote:
> On 5/6/23 08:34, Song Gao wrote:
>> The following changes since commit eb5c3932a383ba1ef3a911232c644f2e053ef66c:
>>
>>    Merge tag 'pw-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging 
>> (2023-05-05 19:18:05 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20230506
>>
>> for you to fetch changes up to 725d7e763a802321e1bb303348afc551d564d31e:
>>
>>    hw/intc: don't use target_ulong for LoongArch ipi (2023-05-06 11:19:50 +0800)
> 
> Hi,
> 
> this causes three failures on FreeBSD (detected by the x64-freebsd-13-build CI job):
> 
> Summary of Failures:
>    8/779 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/qom-test           
> ERROR           0.94s   killed by signal 6 SIGABRT
>   47/779 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/test-hmp           
> ERROR           0.97s   killed by signal 6 SIGABRT
> 353/779 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/machine-none-test        
> ERROR           0.73s killed by signal 6 SIGABRT

Now fixed,

commit 7534695b405e8abb4eb61d082da1d7610f6585bf
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed May 10 06:15:44 2023 +0000

     target/loongarch: Terminate vmstate subsections list



r~

