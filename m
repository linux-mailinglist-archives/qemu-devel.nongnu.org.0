Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F113AEAB9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:04:55 +0200 (CEST)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKXm-0001Vb-Ej
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKVF-0007nI-J2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:02:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKVC-0006BJ-77
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:02:17 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so45524pjn.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8gsTyYenGeDacRrclbuaONK5s0xdR9KUfflfn14bIi4=;
 b=B5lZgmy9+O01S1xzRhOE8h+70K5XcfUBzjnRpsQGz1mm/9Un4TaovwZg9w6IxS3rzi
 bjQuTJ/6Zm3bq18pydNU9yLAYbA8yvxK57gxhCDxRYrekUqbtanWH+3ibmJehTM2VVvT
 PdfSxHtDHHGSHg93dFZ+tzVO/DFepw0+XX/zg2yb7ZNtqr95nenDlh2Aq5KgMguPpedD
 j18v4uTKhlsXzgqleYC0AZFM4MmKIpX1OeZN/VMgHg3ooHFPIL8cfwdjycKnEu8AZP9A
 fptyiKuRqGzrrAMJmFqGKkFDl9Nb8BqZ7wpiXJIdOkxr+bHnEheT/7feB27t+iSw4R2b
 kKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8gsTyYenGeDacRrclbuaONK5s0xdR9KUfflfn14bIi4=;
 b=pitYA9zc5ybWwuJ/T3Rkwh7sk8QCZQ9+FEhcI/aYdWmPN4S2OZZysPtGxeaR9iX6oq
 k/SFqZCVdZbjiy0cmtKDwiHyZJ8Cx7g3k4tWqpn/8JKK7EAA9hWRoYZms6UII0GSR4m8
 RJWyoA23/yH6VJT9ZJbDo+cXtIkBTL9Bb118EGrPaxlxSnB8C+22/vo4aXOZV8lRrzPa
 hGLQpjPYJPolNAv+75W1PCsu8v18lhxIYP4Zjyh1cumQo/Fj2wsbyJDRlTqK0k8bto5G
 KuXfgYZ9cu/1uoWQGUKvGdIJiILXozfkhJ91IkuFVq+bbI+fL6kC83tasWwm6qc+1hYh
 iz1Q==
X-Gm-Message-State: AOAM53393F+YWnhpqubJp0mxmcrUSxu01ttxPtc4ibpvEzJ81bcFbgtM
 UsyMrwl0tmd2O10lfexPJKK6IhEQWaSDeQ==
X-Google-Smtp-Source: ABdhPJyuVciqX98h0SFEKLEoQQoF1woABhSgO0jct/o0deLWaIY6ihPTUfOtoQF5kQfI1OeAy9Q9Xg==
X-Received: by 2002:a17:90a:4746:: with SMTP id
 y6mr20962690pjg.107.1624284132651; 
 Mon, 21 Jun 2021 07:02:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y66sm5812437pgb.4.2021.06.21.07.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:02:12 -0700 (PDT)
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
 <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
 <CAFEAcA9Rg9O7n24Jpee3BxyE35e5z+a7m8CiQqJqeJ9hNffYjQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7906e8d-2db4-88fd-0755-af433fae808a@linaro.org>
Date: Mon, 21 Jun 2021 07:02:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Rg9O7n24Jpee3BxyE35e5z+a7m8CiQqJqeJ9hNffYjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 6:51 AM, Peter Maydell wrote:
> On Mon, 21 Jun 2021 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 14 Jun 2021 at 09:43, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> This will eventually simplify front-end usage, and will allow
>>> backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
>>> optimization.
>>>
>>> The argument is added during expansion, not currently exposed
>>> to the front end translators.  Non-zero values are not yet
>>> supported by any backends.
>>
>> Here we say non-zero values are not yet supported by the backend...
> 
> Looking at the tcg/README docs, I think what you mean is that
> at the moment all the backends assume/require that the caller passes
> one of TCG_BSWAP_IZ or (TCG_BSWAP_IZ | TCG_BSWAP_OZ), since the
> pre-flags implementation requires the top bytes to be zero and leaves
> them that way.

Correct.

> But then the parts of your patch that pass in a zero
> flags word would be wrong...

The parts that pass in a zero flags word are covered by, from the README:

> The flags are ignored -- the argument is present
> for consistency with the smaller bswaps.


r~

