Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8243B62B3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:47:27 +0200 (CEST)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsXm-0005mT-Jl
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsWF-0004FI-5M
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:45:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsWB-0006sg-91
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:45:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id a7so4948967pga.1
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwoDVreh6KFleXkyrTouQOBdsl8qLBUbUzqvztH0lDM=;
 b=l/Wl+w+cVArkscdSHbPNjXfcwkVLaeYbtg5mh+MZHavHKRZIFglXtMt2KvhvqFWpcX
 mRhTOP35HL/C10sUNbBcn+v9g85iW4229BpWcM2kxy0Lw6X9qZqqCAArULeexESitnZ2
 FAISmyVIQC9smSRUv7lkYVjhgeimGV+jqFFAkEQ4EHlKDzWick21uKVNDDqoQ899ukuS
 3/TcLNDb4qj9VE14g8QVbMyDqYNf4it1InPuLiGakUCIHXHB/durshToPtZuZulE9bMa
 fGuzJxIv3XMmRhG0Dbzn/ody6hDO1ht/zRMRMnB1ON4x9+pdxVrduVyP6mEakqSsORoM
 BfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwoDVreh6KFleXkyrTouQOBdsl8qLBUbUzqvztH0lDM=;
 b=VnnvMmBk6VQHpQrQz993CZxcwL8um5Fenf6tnjNjzXz+V9dsKEcGqM5Yj1P/gN8GY8
 1MTZtuT77euWboW8+XEtG64NiGetvgGOVk4dUoDTSQwq2RMIQGtonFDEahAa3KL61k/D
 RP5IaQY2WUI/xAY1/Bh7zoIIigNWiqD58S/UlXJxodPTLfn5M5EZYgvHn1ZnYdbUYkZH
 58UoGQVnQDY37URkvXnouf2E5ji437iZFp6Z0yF7tXIIEnlj22H4YN9ihKVWP50Wm1s2
 4hAMQWImuIEV1LHo4cdzymuUFOiGnR4hgJfYLHgi+LDgi0gxiCHq7nFTz/Me4k9Mgs7D
 oEUg==
X-Gm-Message-State: AOAM532pPG9Gv1OajXb1xfJswfWfPEaqh6mgB1M0iaLiB9gaTTWeLcIM
 wypNrHRFv/t7GC7nK3WgtQD3UQ==
X-Google-Smtp-Source: ABdhPJxfB7mQ6Ry/2dFYh3ks2jsQHLezL2Im892qQcJ/nKr0pZrDZGEYuVpZkRCVZ1VgU0f+K6w0QQ==
X-Received: by 2002:a62:6406:0:b029:302:bb9:1511 with SMTP id
 y6-20020a6264060000b02903020bb91511mr25062531pfb.26.1624891545408; 
 Mon, 28 Jun 2021 07:45:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t6sm20233912pjo.4.2021.06.28.07.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 07:45:45 -0700 (PDT)
Subject: Re: [PATCH v3 12/29] tcg/ppc: Use power10 byte-reverse instructions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-13-richard.henderson@linaro.org>
 <CAFEAcA9njnXqgx=wmfizZEpW5j4kzxJhKC5MExmqOXeN28ig=w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46f4bff7-9022-4708-d16e-06a383e0b97d@linaro.org>
Date: Mon, 28 Jun 2021 07:45:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9njnXqgx=wmfizZEpW5j4kzxJhKC5MExmqOXeN28ig=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 7:33 AM, Peter Maydell wrote:
>> +    if (have_isa_3_10) {
> 
> Side note, why do we call this have_isa_3_10 when it's checking
> for ISA 3.1, not 3.10 ?

I think it's just because it made the columns line up:

#define have_isa_2_06  (have_isa >= tcg_isa_2_06)
#define have_isa_2_07  (have_isa >= tcg_isa_2_07)
#define have_isa_3_00  (have_isa >= tcg_isa_3_00)
#define have_isa_3_10  (have_isa >= tcg_isa_3_10)

though I think there's also a missing . or _ there -- should have been 2.0.6 and 2.0.7.


r~

