Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848893BC30F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:20:03 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0U8Q-0002CK-JW
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0U7Y-0001FH-8I
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0U7V-0003Cn-2i
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625512743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7tpF9xDdZNgAfp2yyfFiWcTO+Lbj+AqG6VZQlgsJfU=;
 b=OVbYV8jNw0ILCInknYNixwzNdVpFgTnNZ+pn0HMq97oTYSRBtB6pY/w4pbx17GNV6p0VaW
 1VhaBk/tEAOjK+oQ3ohPrVp0wgmfHzS3D5PE9hUst9xH74HqkKrxEbnK4Pz4bOj8q6C/9X
 aGT31d3kW6PgTPsrcY7NiI2ZVPIP+4o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-BplHp2XQNz-lMw-c4eADuw-1; Mon, 05 Jul 2021 15:19:02 -0400
X-MC-Unique: BplHp2XQNz-lMw-c4eADuw-1
Received: by mail-wr1-f70.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so6516964wrq.21
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 12:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F7tpF9xDdZNgAfp2yyfFiWcTO+Lbj+AqG6VZQlgsJfU=;
 b=HGk2iy8euVnTG4L71oUE75y4ZVdcSUwlGZiKgd5PaVF3TljFKgfsbF0ZsvKtylgOIE
 D7wV9+sewmwHDN7LNZD/d+Zm7XdP8j5grXr4izfXeNoMxWyRgyS17mvQKfhaFGZ4BmgS
 EBZY2sEEVg/cu7fnh41jld0uQhgps30x/PUP7rqc/T308fq4AWMQDnCTo8ttl9RRM3CW
 oO9YIFlu9SxIjr8aMbjz9jL9MKl4vV6FtTAZB8HWOcfhg0D9ZyZNxNi3tRJIBYQo+SNV
 NtSo8QyvBn+ZNOnrfuRCdY/cqtRwToj6h2qBz/6MoHRcCqBAugRgQ9qdiXGysdAhEXwi
 u9YQ==
X-Gm-Message-State: AOAM530sB7JjKRqzxKjm/TP+ZZxOJPoC2SDYlSj+HlJbwTMba5mcKcJ1
 lauwQJrlEmQ7D3E6Ox/TgwFFuULgn4IQb7WmfDHpI1XGdgR/sgWFhorOFeW6Vt/RKDKhBwc3SRB
 O11/xac+JAd774LA=
X-Received: by 2002:a1c:e207:: with SMTP id z7mr604107wmg.92.1625512741517;
 Mon, 05 Jul 2021 12:19:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbLuJMFgqyMwEMZ8HwrHfzJZmNvFKbOF6WdmxfFG462kdtMflRkFthk6df1CY3W0VFPiBf7g==
X-Received: by 2002:a1c:e207:: with SMTP id z7mr604079wmg.92.1625512741243;
 Mon, 05 Jul 2021 12:19:01 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id d3sm6008876wrx.77.2021.07.05.12.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 12:19:00 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <20210623023250.3667563-2-iii@linux.ibm.com>
 <ce59213b-4642-63b4-32b1-4566415c3b7f@redhat.com>
 <3694d1e29d7b1d00b60235360a54abf4b9ca4dea.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <59f3bbfe-c92c-6940-c008-9fc697e5a464@redhat.com>
Date: Mon, 5 Jul 2021 21:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3694d1e29d7b1d00b60235360a54abf4b9ca4dea.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 19:24, Ilya Leoshkevich wrote:
> On Mon, 2021-07-05 at 11:36 +0200, David Hildenbrand wrote:
>> On 23.06.21 04:32, Ilya Leoshkevich wrote:
>>> For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
>>> instruction, and at the instruction for other signals. Currently
>>> under
>>> qemu-user it always points at the instruction.
>>>
>>> Fix by advancing psw.addr for these signals.
>>>
>>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
>>> ---
>>>    linux-user/s390x/cpu_loop.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/linux-user/s390x/cpu_loop.c b/linux-
>>> user/s390x/cpu_loop.c
>>> index 30568139df..230217feeb 100644
>>> --- a/linux-user/s390x/cpu_loop.c
>>> +++ b/linux-user/s390x/cpu_loop.c
>>> @@ -133,6 +133,11 @@ void cpu_loop(CPUS390XState *env)
>>>    
>>>            do_signal_pc:
>>>                addr = env->psw.addr;
>>> +            /*
>>> +             * For SIGILL, SIGFPE and SIGTRAP the PSW must point
>>> after the
>>> +             * instruction.
>>> +             */
>>> +            env->psw.addr += env->int_pgm_ilen;
>>
>> We also reach this path via EXCP_DEBUG. How can we expect
>> env->int_pgm_ilen to contain something sensible in that case?
> 
> You are right, this breaks breakpoints after getting any PGM exception
> (they turn into "Program received signal SIGTRAP, Trace/breakpoint
> trap." instead of the usual "Breakpoint N").
> 
> We don't need a PSW rewind here, since it's already incremented
> throught the following sequence:
> 
> 1) GDB asks QEMU to set a breakpoint using a $Z0 packet.
> 2) translator_loop() notices the breakpoint and calls
>     s390x_tr_breakpoint_check().
> 3) s390x_tr_breakpoint_check() sets DisasContextBase.is_jmp to
>     DISAS_PC_STALE and increments DisasContextBase.pc_next by 2.
> 4) translator_loop() calls s390x_tr_tb_stop().
> 5) s390x_tr_tb_stop() calls update_psw_addr(), so the JITed code
>     increments the PSWA by 2 as well.
> 6) s390x_tr_tb_stop() calls gen_exception(EXCP_DEBUG).
> 
> What do you think about the following amend?
> 
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -64,7 +64,13 @@ void cpu_loop(CPUS390XState *env)
>           case EXCP_DEBUG:
>               sig = TARGET_SIGTRAP;
>               n = TARGET_TRAP_BRKPT;
> -            goto do_signal_pc;
> +            /*
> +             * For SIGTRAP the PSW must point after the instruction,
> which it
> +             * already does thanks to s390x_tr_tb_stop(). si_addr
> doesn't need
> +             * to be filled.
> +             */
> +            addr = 0;
> +            goto do_signal;

Looks better to me, but I'm not an expert on signals, so I cannot tell 
what si_addr is supposed to contain in that case.

-- 
Thanks,

David / dhildenb


