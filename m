Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B795F7C5D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:39:30 +0200 (CEST)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogrJo-0005bH-Mw
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogrFq-0002NO-BH
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:35:22 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogrFm-000272-Hh
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:35:20 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e205so4167190iof.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UoCZAjL06IF4MTDyYFvN5gdKC5Sn7AX9BG2iOUSrdWg=;
 b=wiWAxC4HVbivmgAkpjbr3hwp3oSfL5qyp1wYForgXA8neCCLFVMYZRaLh9A/SYJypq
 je+J49avb9AO0GuXe61ws/KwDpxOJAdMol4rL398H1KvhE3UZkJJpztS9D2x1Essgb7X
 rmknVUWh83rZVfzMZyp9EgEUduZnZNDUDSxrjS80CxqK84QJa/u68XZQnl5sDqLpbixh
 mwg1Kj5wvurYhjxuqcrTcTAPWBvASQCg7CksSeOXGkhM1DPZs4UnhBi1Y3qQOxg7BGdA
 S/e/ytZokJCuqzQhTsCgE1wos0krGV3FIs2qqb5aLI9W6RC99Vs6FAwDnefQsrwVqGx0
 /Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UoCZAjL06IF4MTDyYFvN5gdKC5Sn7AX9BG2iOUSrdWg=;
 b=208tGeNEYNZJIuJF8vv2eCZhWWelIqNadvRWogDyKo5Sk5lUZIEEYywMscJzMjeVw9
 ZIWWOiFrnzZq+53vJybb720VdI67Z74SI0GTC+3t70MwTOOLjxZo67bLWVts6U+beGqJ
 c4QcO8KZh1Z9zPvH+ZrvaJvKHHb+9FRUWXYeLHkeo870ZqDuyj0rviWBzEMWakUfco/y
 REqt8nE+S9j3K3133IRyww5wW1gIvVMqtoSd+xGzOoIFRggsa96u89H6hfbkncDrvl4j
 C/m3M/2P0HlObfNbU0T0Ey8oBAFEX66arR3ZkCLV+3lksoNtq5C7UCzKLrXgQLZFopGY
 534A==
X-Gm-Message-State: ACrzQf2OIFzWVBFtTa1flvh+alOaG1Lb7HvB7XovRH6lbywWC60lKqfG
 1Y8NzuawDYPV+ZhsCZtyMD6zxd8GSlhfDQ==
X-Google-Smtp-Source: AMsMyM6ghjw+114ICaKQxHQvTvp3MkbhEl9gJT6Ke0xqFGRA1sTLP058VOc7GpjMltEE/XoH12Yvgg==
X-Received: by 2002:a65:4508:0:b0:43c:e3c6:d1c2 with SMTP id
 n8-20020a654508000000b0043ce3c6d1c2mr5449035pgq.582.1665164106203; 
 Fri, 07 Oct 2022 10:35:06 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a17090a1c1700b001fabcd994c1sm4855679pjs.9.2022.10.07.10.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 10:35:05 -0700 (PDT)
Message-ID: <630e438d-1ef5-dc22-c9ad-4576de22b24f@linaro.org>
Date: Fri, 7 Oct 2022 10:35:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
 <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
 <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
 <CAFEAcA8Qe-Y1HD8ULjDgrcRGbpXruqL=te9NXtTv2OWv2DOBhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Qe-Y1HD8ULjDgrcRGbpXruqL=te9NXtTv2OWv2DOBhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/22 09:50, Peter Maydell wrote:
> On Fri, 7 Oct 2022 at 17:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/7/22 06:47, Peter Maydell wrote:
>>> Are there definitely no code paths where we might try to do
>>> a page table walk with the iothread already locked ?
>>
>> I'll double-check, but another possibility is to simply perform the atomic operation on
>> the low 32-bits, where both AF and DB are located.  Another trick I learned from x86...
> 
> Doesn't that cause a problem where we don't detect that some other
> CPU wrote to the high 32 bits of the descriptor ? We're supposed to
> be using those high 32 bits, not the ones we have in hand...

Hmm, yes.  Which now makes me wonder if the x86 case is in fact buggy...

> If we do need the iothread lock, we could do it the way that
> io_readx() does, I guess, where we track whether we needed to
> lock it or not.

yes.


r~

