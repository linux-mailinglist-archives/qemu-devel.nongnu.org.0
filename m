Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCE2ECC47
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 10:06:34 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxRFY-0006Qd-PB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 04:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxRE4-0005WG-3t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:05:01 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxRE0-0002GH-Ac
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:04:59 -0500
Received: by mail-wm1-x333.google.com with SMTP id v14so4516208wml.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o8yL9n6HozE/Ex7MpyYHQRdFZh6hCZGjqNJdBYi9rxY=;
 b=BZNxmvRE/fhiKHRJzoYgrsU7xE+Z2bPnN3/aRBoRO+rCIWT22vHuFE+OZ4CdNMtGjQ
 7fcjDd3Bp587obk6VDB1lpxjBiKLqIUDR0NyTPYIeKxjQQp7m6uctU301BAgKZp8eNpd
 GAsN97T6YiaQ7CTRg/VfVYmdeQBcM5Jz02kpH7/9ySbWefzlhgMRvYzKbFBxEb9D8CQd
 C3EtR4WKCjfNM4ulu71EwCCRhGRmmvYDELk3IsgWDXiRuKK1OItTHdXV8SMLyT2nbWMG
 jnpbILHhgM+dQw2yI4IPp2QPN5c/zitVxR/zpkxDWfUWeDTVxFdm4mA6pKiDRW5YlyE1
 GlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o8yL9n6HozE/Ex7MpyYHQRdFZh6hCZGjqNJdBYi9rxY=;
 b=h1DCLDpe4uT1p9Szc03KgUNKvw248c4utASzkzJrugcSWJfL2QK6g/JufWga+Eni8s
 TRywnMF9VZwQ83lc5MQcJHdKlAxZAEqwFB0eLhtxL/d+vQO9hgO2zvYqosQHzPJmiLbK
 GgzL+YtR7/sIjhY60MxPEWyLVXoTWjKGHhGKq9AbqzwnyJCdjO4UWw/EdJkt+dzUozK2
 BgcjJpqXp+LxGkjv1CCPz3jF1rUDaglc9787v5eiOi90sMIu5NDGv7r9yaj36b2VdW29
 YvTD/a+BMV/NXSHTjTUq+7Fmze0Ov7EPlHesQp11idp2SOkRZIwCZAqVHLpadtkYqRqi
 Azjg==
X-Gm-Message-State: AOAM533sHkJVq+v/CHaEKhVA8qPgwQc6qe7ElijsKRBwZq6NaWPt5Tns
 36/Rsl7aHrjsnqfWI5Rmz8w=
X-Google-Smtp-Source: ABdhPJzCvph+Xqy8cmtQC5h/uhi/H8Oq2k9dRPL8gJ47bIyKbE+cmlyESYr4OyYwfxGz9184I/pGUQ==
X-Received: by 2002:a1c:2ed2:: with SMTP id u201mr7067931wmu.79.1610010294442; 
 Thu, 07 Jan 2021 01:04:54 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s12sm6530722wmh.29.2021.01.07.01.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 01:04:53 -0800 (PST)
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
 <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
 <af357960-40f2-b9e6-485f-d1cf36a4e95d@flygoat.com>
 <b1e8b44c-ae6f-786c-abe0-9a03eb5d3d63@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0a0d8d4d-a0b6-dde5-e32d-17746ef57d53@amsat.org>
Date: Thu, 7 Jan 2021 10:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b1e8b44c-ae6f-786c-abe0-9a03eb5d3d63@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 4:14 AM, Jiaxun Yang wrote:
> 在 2020/12/16 上午10:50, Jiaxun Yang 写道:
>> TBH I do think it doesn't sounds like a good idea to make 32-bit
>> and 64-bit different. In fact ISA_MIPS32R6 is always set for targets
>> with ISA_MIPS64R6.
>>
>> We're treating MIPS64R6 as a superset of MIPS32R6, and ISA_MIPS3
>> is used to tell if a CPU supports 64-bit.
>>
>> FYI:
>> https://commons.wikimedia.org/wiki/File:MIPS_instruction_set_family.svg
> 
> Just add more cents here...
> The current method we handle R6 makes me a little bit annoying.
> 
> Given that MIPS is backward compatible until R5, and R6 reorganized a lot
> of opcodes, I do think decoding procdure of R6 should be dedicated from
> the rest,
> otherwise we may fall into the hell of finding difference between R6 and
> previous
> ISAs, also I've heard some R6 only ASEs is occupying opcodes marked as
> "removed in R6", so it doesn't looks like a wise idea to check removed
> in R6
> in helpers.

I think we are in agreement :) Your comment seems what I addressed
last month as this series:
https://gitlab.com/philmd/qemu/-/commits/mips_decodetree_lsa_r6/
(I'll try to rebase it and post during the week-end.)

> So we may end up having four series of decodetrees for ISA
> Series1: MIPS-II, MIPS32, MIPS32R2, MIPS32R5 (32bit "old" ISAs)
> Series2: MIPS-III, MIPS64, MIPS64R2, MIPS64R5 (64bit "old" ISAs)
> 
> Series3: MIPS32R6 (32bit "new" ISAs)
> Series4: MIPS64R6 (64bit "new" ISAs)
> 
> Thanks
> 
> - Jiaxun

