Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D17B300041
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:30:19 +0100 (CET)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2thp-0003KN-Vd
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2tg3-0002kw-76
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:28:27 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2tg1-0006iH-Gs
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:28:26 -0500
Received: by mail-ed1-x529.google.com with SMTP id c2so5680312edr.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ClYik4ES144XsmXmhpA4VWMRaeoZSdXuC+uC+G7xF4M=;
 b=FecHv46+J27k6gPJD3la1mYVYiHMNDUztsiq1R2AXmQesQVv5KzYuO2sbccnkqMMal
 sPhrciZa2FOS+x1H4gaR2V6K0GMr9t2xo0OHRmRRuq192SheDvWKW232fQa51hOmGiP8
 M4Uuk16N7m4YwG+0miL/giC0Dh/llRpPXxpY66cLc+KHBSVH9ozpY+rQOHGDdl4rm1Sl
 xhyse45m3I+H4pnpzDzK5RQkVaQNJ6Ayn1CwEkY7Qu+EruWUGTrC976xK+AJu3/c/KkB
 IqFLuyrzIGmlzNPqXGYfMtWBJprx/me3Bx5pw1xi5QxPR9tW6JMCI+hhe8GF/TFhFoHK
 qKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ClYik4ES144XsmXmhpA4VWMRaeoZSdXuC+uC+G7xF4M=;
 b=J9Wk/tE0zeEVdn+ztXJ08PEE/FP6YuMvgj+nPCewrJ0S/7nmoS0QWVk0DNj4FuWItC
 N1V4dArH1QV8vUs7bi5DMbaVlKT7sLL0GbBxWTeLsjqFtxxvHNGdHZ1MLGCG22WR2Tnu
 jjfta8PCoQ++laE2aDrRJSX8FKhREFw0BYjewyOJtVbjPRv4dI6ChuvsDMGNhAqEJmoC
 f+Z5XCtHu787GKXeX+zWlbkouxIXQZKFCkQYyua435IbUJU22yMHn+Hsc0KCXkL6YL0E
 IwZqgPE2y/NfSbPTHyOg87AvAy73m/GEni1X2sFwxzF771OnnY+WLs85c23bBiPC+vWk
 Jfeg==
X-Gm-Message-State: AOAM532+6l+LqEormJEBFQD8ibGeEUKL6rwBUY7ORMZFgA3PL531JiIY
 kgFyaU0QSetkuRZiTyuXwJI=
X-Google-Smtp-Source: ABdhPJzbjffsoTX++WLRtJWwcfsOVsbm3KE+wYycxe+MZl74VpvBu3UcKSKr3w2+DpRmxVK2cJ+uaQ==
X-Received: by 2002:a05:6402:1249:: with SMTP id
 l9mr2471166edw.375.1611311304047; 
 Fri, 22 Jan 2021 02:28:24 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g14sm4981143edm.31.2021.01.22.02.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 02:28:23 -0800 (PST)
Subject: Re: [PATCH] linux-user/mmap: Avoid asserts for out of range mremap
 calls
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
 <0025f40ee1c0c4261fc3ce82c3095f5d1166b386.camel@linuxfoundation.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad2cd487-eac4-bff6-a152-e021f017cf0c@amsat.org>
Date: Fri, 22 Jan 2021 11:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0025f40ee1c0c4261fc3ce82c3095f5d1166b386.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 10:37 AM, Richard Purdie wrote:
> On Fri, 2021-01-08 at 17:42 +0000, Richard Purdie wrote:
>> If mremap() is called without the MREMAP_MAYMOVE flag with a start address
>> just before the end of memory (reserved_va) where new_size would exceed 
>> it (and GUEST_ADDR_MAX), the assert(end - 1 <= GUEST_ADDR_MAX) in 
>> page_set_flags() would trigger.
>>
>> Add an extra guard to the guest_range_valid() checks to prevent this and
>> avoid asserting binaries when reserved_va is set.
>>
>> This meant a bug I was seeing locally now gives the same behaviour 
>> regardless of whether reserved_va is set or not.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>>
>> Index: qemu-5.2.0/linux-user/mmap.c
>> ===================================================================
>> --- qemu-5.2.0.orig/linux-user/mmap.c
>> +++ qemu-5.2.0/linux-user/mmap.c
>> @@ -727,7 +727,9 @@ abi_long target_mremap(abi_ulong old_add
>>  
>>
>>      if (!guest_range_valid(old_addr, old_size) ||
>>          ((flags & MREMAP_FIXED) &&
>> -         !guest_range_valid(new_addr, new_size))) {
>> +         !guest_range_valid(new_addr, new_size)) ||
>> +        ((flags & MREMAP_MAYMOVE) == 0 &&
>> +         !guest_range_valid(old_addr, new_size))) {
>>          errno = ENOMEM;
>>          return -1;
>>      }
>>
>>
> 
> Any comments on this? I believe its a valid issue that needs fixing and
> multiple distros appear to be carrying fixes in this area related to
> this.

You forgot to Cc the maintainer who likely missed it due to the huge
traffic:

$ ./scripts/get_maintainer.pl -f linux-user/mmap.c
Laurent Vivier <laurent@vivier.eu> (maintainer:Linux user)

Now Cc'ed.

Regards,

Phil.

