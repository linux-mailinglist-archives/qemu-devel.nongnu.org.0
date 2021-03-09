Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83652331FDA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:32:16 +0100 (CET)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWql-00087l-Jh
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lJWnn-0006PB-02
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:29:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lJWnV-0007r0-4L
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:29:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 j14-20020a17090a588eb02900cefe2daa2cso608352pji.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 23:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lQLsHkOERIFiMEwGZb5fT7xzAyRvgJPwXPaJzQUVV6I=;
 b=T9fxs3phfGtPOL9xHcdME8tHnA8tOXWrJjMnmTdRE9xaG0QwhGgg1n2E3l/gzc7sl/
 wT/LDYE/gESy4bRK7tcpLYQwQKUkSlYiBg4lRizsLA6DE4HXDTPEwE69f0sM4sQRVaeA
 JQ5HA/idrieZhLq9ceuStVmERMA9/W1FDFw8NaVFKe3lkhP+vJoggcUZEAWSFJpDkYK+
 fiteX+wB8mjfcO3cRjwdcEN8D9BNineJWoWm2GG5gAUmy2yoS2yR3DgdEfXxZTaZf55K
 al2FuQ305GJsbKd6DH0G8JpjFqD3shEBEcSnjn/R3kDyW4a3ZLUHmAkb41t9Tsm7RwtP
 s4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lQLsHkOERIFiMEwGZb5fT7xzAyRvgJPwXPaJzQUVV6I=;
 b=lVG2XcxM4/v0i2rbJXL0X7mUKEZFmyJqlRSnSrLoT5gY2E4reqQl6rjFHmShXs9suw
 ylHrgx2HQ+Xu38EhwitQgksq6/AosWAvjOf33J3g9FBxsNGYpKx/snA7lOQxBesDVzJa
 prwWBKRpBhhPi0mtLDBKtSAb2JaiSDuD+kA9/efYawoafQHF751FEYE+JRyO979C0myh
 rfljj24CyCCichfeVfZkwcs3s8ZIdj6c34Tx7LzL8O2Yur0U1FWpDvL6DJ9/G7LkaOuf
 oBfKSaJPIUT1hsJ45Hp7ugDGwmoWOreOU7h3OIsGCGGGMoYcXQp4LaFTHVv9WepiRsey
 Dpeg==
X-Gm-Message-State: AOAM5331YOVuUrtvsZ5rGv8FnFKxkNAcqiyA2x++tgPVtdKDSZNSAvsX
 k7aLDErkdZJMrRGgnATD/Z9Ueg==
X-Google-Smtp-Source: ABdhPJxImh1+vZgEMQHncBYEow0NYgWUtD3KZURcNd8hhq6YNYGr5ANm6tscwPejl3SrG3Vp31DnaQ==
X-Received: by 2002:a17:90a:bc06:: with SMTP id
 w6mr3257629pjr.44.1615274929107; 
 Mon, 08 Mar 2021 23:28:49 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id l15sm1673355pjq.9.2021.03.08.23.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 23:28:48 -0800 (PST)
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <YEcHxEvVPPO85BGE@yekko.fritz.box>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
Date: Tue, 9 Mar 2021 18:28:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <YEcHxEvVPPO85BGE@yekko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 09/03/2021 16:29, David Gibson wrote:


>>>> +struct ClientArchitectureSupportClass {
>>>> +    InterfaceClass parent;
>>>> +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
>>>> +    void (*quiesce)(void);
>>>
>>> Is there actually any real connection of quiesce behaviour to cas
>>> behaviour?  Basically, I'm wondering if this is not so much about
>>> client-architecture-support fundamentally as just about
>>> machine-specific parts of the VOF behaviour.  Which would be fine, but
>>> suggests a different name for the interface.
>>
>> The most canonical way would be having 2 interfaces.
> 
> Why?  I don't see any reason these shouldn't be a single interface, it
> just has a bad name.

I renamed it to SpaprVofInterface for now.


> [snip]
>>>> +typedef int size_t;
>>>> +typedef void client(void);
>>>> +
>>>> +/* globals */
>>>> +extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware) */
>>>> +
>>>> +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
>>>> +
>>>> +/* libc */
>>>> +int strlen(const char *s);
>>>> +int strcmp(const char *s1, const char *s2);
>>>> +void *memcpy(void *dest, const void *src, size_t n);
>>>> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
>>>> +void *memmove(void *dest, const void *src, size_t n);
>>>> +void *memset(void *dest, int c, size_t size);
>>>> +
>>>> +/* Prom */
>>>> +typedef unsigned long prom_arg_t;
>>>> +int call_prom(const char *service, int nargs, int nret, ...);
>>>
>>> AIUI this isn't so much about calling the PROM, since this *is* the
>>> PROM code, but rather about calling the parts that are implemented on
>>> the qemu side.  Different names might clarify that.
>>
>> "call_ci"?
> 
> Works for me.

call_ci() it is then.

About builtins such as memcmp() - turns out these are not really 
builtins as they are not inlined and gcc/ld still want to link against 
libc which is trickier for such firmware (not quite sure how to do this 
and keep it small and not pull other libc stuff in), gcc just knows 
about them a bit more. This is different from, for example, 
__builtin_ctz which is inlined. So I am keeping my libc.o for now.



-- 
Alexey

