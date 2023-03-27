Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7C6CABF1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:37:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqma-0007rz-9V; Mon, 27 Mar 2023 13:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqmV-0007rU-3z
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:37:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqmL-0003Vj-OK
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:37:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id le6so9111349plb.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679938620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vnq3MWMA3CGNWNWm8SHH75ex2VpC7iZB0vqds53m5rY=;
 b=sLbVdoeweWcB2ZTjyKmfzn1d4mAisheC+J7rdZNc1jvOhDkMSSKhN6XfaFFLT/DqB4
 RM2liOrbQnWlW99b0qzvkMs6/9SvBfe+4qTwpCzEPQb7SiHF0bUYdPqRIJhbP8z0IrNh
 ztzrCXoGJPmXskFMxAamcdtxMfqzFxg2Jc4mHgkEa21dJbs2SRDgyS9EN0do47RjLsJ/
 CuLubWD1oQS3phc+FLRftEXZj8yDnPdSsoDvV1pyUApzjh00g7SAD5A4qL7C+ggZTTPk
 xpkOF79iPWOYuTMyos1UX5DX4CTSgINJS7FotwF0h7IO2cli41l9qHw3AA3qEr/L310m
 FX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679938620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vnq3MWMA3CGNWNWm8SHH75ex2VpC7iZB0vqds53m5rY=;
 b=J1EFLB9MykljUcrCL3CZYz06weabLft3pDfPYvfxquv5IzuA1y4DQXNX1yNfs2YF6g
 S/y85TGhYGhl1YhVysp/nm2fwNDat7ARHcWrbyEOz8hlwjpqftD6VgleCk9YLvvZNWpd
 lb7eQigC1txABkm3mcWqQNpkjN7ysjudGKnI91ObkcElRckjAz+BI4zFslyWVWEsKYqU
 g3mcT7LVu0F1iEeT/1M6Li/E6+3T2glRAwh9PIzytPzK0jWtOvUIvP6jSXKNsgHUBWk7
 9Pu9nocFJDThHATi8JyIFj4B+jd9baCFU02J0oX2050krLpPEK3wQMxfV5LWXfLcNSkG
 Axow==
X-Gm-Message-State: AAQBX9e4Jc45j65o+tUQPx29n/MH4HG1evT2AgP51qyV4tpHv/X93qAN
 gxXpNPnxTQ/2RcElrTlKAn5Wzw==
X-Google-Smtp-Source: AKy350Zk9n+7vOs779heWdTuGvC9w/rOq7kSgJ0R5y8479UujxCa+//DWsujV59IMAIY19hLc48rXQ==
X-Received: by 2002:a17:903:2112:b0:1a0:549d:39a1 with SMTP id
 o18-20020a170903211200b001a0549d39a1mr10044338ple.32.1679938619832; 
 Mon, 27 Mar 2023 10:36:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 iw4-20020a170903044400b0019f2a7f4d16sm19597952plb.39.2023.03.27.10.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 10:36:59 -0700 (PDT)
Message-ID: <fd714eec-2241-8c32-08d4-b2b346f611e7@linaro.org>
Date: Mon, 27 Mar 2023 10:36:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 11/11] linux-user/arm: Take more care allocating
 commpage
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20230322150744.175010-1-richard.henderson@linaro.org>
 <20230322150744.175010-12-richard.henderson@linaro.org>
 <87zg7ysi4y.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zg7ysi4y.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 01:38, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> User setting of -R reserved_va can lead to an assertion
>> failure in page_set_flags.  Sanity check the value of
>> reserved_va and print an error message instead.  Do not
>> allocate a commpage at all for m-profile cpus.
> 
> I see this:
> 
>    TEST    convd on i386
> qemu-i386: Unable to reserve 0x100000000 bytes of virtual address space
> at 0x8000 (File exists) for use as guest address space (check your
> virtual memory ulimit setting, min_mmap_addr or reserve less using -R
> option)
> 
> on the ubuntu aarch64 static build:
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/4003523064

Odd.  Works on aarch64.ci.qemu.org outside of the gitlab environment.


r~

