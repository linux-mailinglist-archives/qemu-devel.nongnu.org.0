Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D216A383816
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:50:51 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifW6-0007Lv-Ur
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifUQ-0005bX-0u
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:49:06 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifUM-00013t-U5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:49:05 -0400
Received: by mail-vs1-xe34.google.com with SMTP id 66so3333271vsk.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gUQzNN0Mk9EFh7FnmTMOOz1kPDINo1P5bFdxsF6qyic=;
 b=yj2/8fZlE99GGG0Y2ZcgTg00PNIg81lzcMpm/kPW5blRyvFqZGoHOsaRV7K150MHIV
 lx/IpykbhcZ7mM6gS967QcQKQgEJrjHhZEfo1z3VCLzTDV0B24PtSgOcEMK9T1iDnULS
 3UiE9R9GTg/gq1RDlRRx9hm8aw+UciZALoJuNji/coREahs7HJvVCfAaaG0idS25uVw5
 ocEltlFB6JgylE9qib9yxD3t1kfBt5wk66eAzwrokhlq8gZD2re6as+Hul7W/4puGCG5
 P4UmZJimKtqcC2GcMJdh+YUDHYylh/ZWoiNTQIFwltnLHZOEMxOxxnuogoBr0Rw+Yd8Y
 zdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gUQzNN0Mk9EFh7FnmTMOOz1kPDINo1P5bFdxsF6qyic=;
 b=CF1+JTjJyKiQAof7ZyhcCTlwoIBQJG7KNLGtZJfyJtdgdua+fIf95KkbydDT6IlVPO
 QjG89BQbYNJW7hutouxXCf4h1PbX5+H+s64D4QAnLGISQEMUHW37AliSCANIg/51qlTl
 WUyGqyWmQcY56YOVlqbSa05K+06nNwdSO1RGwGnnM4yoaE10x3pAQ6Mhj+laJrjUi9db
 Lcivhv5cacX/d8y2vSJQvKWJbetzIDspuW18CBqzEq8YgQOHmNySGqzs7B1yn5tvesXY
 XT/XSeGi2Mb3xZMTbMctApueAV86Ep9h1NhQFARrw5HITX0ZIb5Q9zqr+4fzKbUOGvCg
 /K6g==
X-Gm-Message-State: AOAM5330bxootcnUdvCk+zqXeXK7c6YdYqCIALwUCSyACt62Ars0iO67
 VNd/roUC+w9ApYQMadkVuYPJYw==
X-Google-Smtp-Source: ABdhPJy+peqBEJpuX+eXcVJZmDG5yLr6ijEYdoMFACh6daOki9MZmDs74V6bUzir2fYomlBv0mPiaQ==
X-Received: by 2002:a05:6102:320d:: with SMTP id
 r13mr605674vsf.27.1621266540730; 
 Mon, 17 May 2021 08:49:00 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x24sm518189vkn.40.2021.05.17.08.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 08:49:00 -0700 (PDT)
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
 <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
 <47db40f0-52c4-f282-ecf9-eab2bdb7f1d1@linaro.org>
 <CAFEAcA8gYB+SWaUERkC+PbkqWwri3mx_E1TCgV184yX8YBvA6Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f72ce5a0-fc2a-09f1-fbae-d2481dfc4a47@linaro.org>
Date: Mon, 17 May 2021 10:48:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8gYB+SWaUERkC+PbkqWwri3mx_E1TCgV184yX8YBvA6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe34.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/21 11:09 AM, Peter Maydell wrote:
> On Sat, 15 May 2021 at 18:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/13/21 2:25 PM, Peter Maydell wrote:
>>>> -VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
>>>> -               vm=%vm_dp vn=%vn_dp vd=%vd_dp
>>>> +VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
>>>> +               vn=%vn_dp vd=%vd_dp
>>>
>>> Is it possible to make this kind of bug a decodetree error?
>>> It seems unlikely that there's a use for having a bit which is
>>> decoded both by a %foo field specification and also in some
>>> other way...
>>
>> That's not what's happening here.  This has separate fields "rm" and "vm"
>> decoded in different ways.
> 
> But they overlap: rm:4 in the pattern itself is using bits [3:0],
> and "vm=%vm_dp" is also using [3:0] because the %vm_dp field
> specifier is defined as "5:1 0:4". I'm suggesting that if the
> pattern uses a field specifier we should check that none of the
> bits in that field specifier are used in the pattern for some
> other purpose (here 'u' and 'rm').

We do this, more or less, for sve:

# Three register operand, with governing predicate, vector element size
@rda_pg_rn_rm   ........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
                 &rprrr_esz ra=%reg_movprfx

where ra and rd overlap.  Though ra and rd overlap exactly, so perhaps that's 
not quite the same as vm above, overlapping both rm and index.


r~

