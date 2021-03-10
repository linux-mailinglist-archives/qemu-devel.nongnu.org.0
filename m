Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703B33348F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:53:57 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqr6-0003sD-2D
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lJqpb-000372-FB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 23:52:23 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lJqpY-000518-SW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 23:52:23 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so6536984pjb.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 20:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EjsreDwOWFbAyntfgG/hG7y77m2xSfNvSujFWZV5lnE=;
 b=uaRIYa7H59gWNmRHbnJUz+FoayIfufaTWGNEHxf2x9c5YIWZbpeK3pcgvAH3rjXxs0
 /uiRoreXr4xZcBrwoCtCUFOEImL+4loIBCR4z2IUcFwS8g7u1qGWYfNlqc3yQ/uTiRT/
 4zm/IR90oro4Hrx9Kff5TQVpeXL8JoJ2iYgvi09oLnWH5SEB+fqQ+4O/Lz9PaWI7gjXu
 sALPLrNs9OM+yh5D9KKdvrWF7Jrq0wbEloup0Mt7qvG1Xr9C6DDyxetIB/Zgt0NhpgLL
 dLWkmpa4E0j7pNFxZ9+JVH6R05K8m/WXPpY75oP3OARv8XrAFnWb12MnwXvkyYSEmbEM
 76jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EjsreDwOWFbAyntfgG/hG7y77m2xSfNvSujFWZV5lnE=;
 b=b/K5B+5crUWZvxTUS+zjnyHxU3WqfwUlynj5hIH8CvdHBaYtMaKgRT+AMburLalqU8
 LVs5keSntofZgQdEJmQkoVXgNkBzKWWue1o5IecTpakvTiZAAjXwv+CcXOLxXP2oKHlC
 gPijKrITupmDwTem8vCtxVzBE7rRgKlEQwrlFH171qdIKtZ0oFM/eD3gHPPsIjSwxWf7
 y6+3HCaJaJQQtaQ8MxhTWHLzLySIz7AbEBYjf9A6dkFXu7qiwzHP88zuxl1EVpnSR354
 z4Lj6X3JA6oGtevzAPudGYFji54cC+4jWQ/u7cuGr5I8BWI02uFhgEa5WdQj/fac+IFw
 g0iQ==
X-Gm-Message-State: AOAM532wOzmCYcx7j8G0c84u6iGmnZhxROjw6Nx0qwoiv9NfshJLJk08
 hwKtFcMbi0VRqc4i0nQ2UcY7UA==
X-Google-Smtp-Source: ABdhPJzSHRjAiRPpclVhqnw6Hf+ZCU5lXKNHLv53oFkoolSYxB6rXW51SvSi3zb/X4RAbfgifIX45Q==
X-Received: by 2002:a17:90b:1a89:: with SMTP id
 ng9mr1640599pjb.36.1615351938293; 
 Tue, 09 Mar 2021 20:52:18 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id fa21sm4312547pjb.25.2021.03.09.20.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 20:52:17 -0800 (PST)
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <YEcHxEvVPPO85BGE@yekko.fritz.box>
 <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
 <d7edd653-4923-fea5-e14-cd4ab871e324@eik.bme.hu>
 <80852df2-667a-871f-1f6a-e74723117e01@ozlabs.ru>
 <YEgxqV0pNPmBZrIk@yekko.fritz.box>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <60b92956-bc91-b28a-7185-83bc7ce26844@ozlabs.ru>
Date: Wed, 10 Mar 2021 15:52:12 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <YEgxqV0pNPmBZrIk@yekko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/03/2021 13:40, David Gibson wrote:
> On Wed, Mar 10, 2021 at 12:55:07PM +1100, Alexey Kardashevskiy wrote:
>>
>>
>> On 10/03/2021 01:00, BALATON Zoltan wrote:
>>> On Tue, 9 Mar 2021, Alexey Kardashevskiy wrote:
>>>> On 09/03/2021 16:29, David Gibson wrote:
>>>>>>>> +struct ClientArchitectureSupportClass {
>>>>>>>> +    InterfaceClass parent;
>>>>>>>> +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
>>>>>>>> +    void (*quiesce)(void);
>>>>>>>
>>>>>>> Is there actually any real connection of quiesce behaviour to cas
>>>>>>> behaviour?  Basically, I'm wondering if this is not so much about
>>>>>>> client-architecture-support fundamentally as just about
>>>>>>> machine-specific parts of the VOF behaviour.  Which would be fine, but
>>>>>>> suggests a different name for the interface.
>>>>>>
>>>>>> The most canonical way would be having 2 interfaces.
>>>>>
>>>>> Why?  I don't see any reason these shouldn't be a single interface, it
>>>>> just has a bad name.
>>>>
>>>> I renamed it to SpaprVofInterface for now.
>>>>
>>>>
>>>>> [snip]
>>>>>>>> +typedef int size_t;
>>>>>>>> +typedef void client(void);
>>>>>>>> +
>>>>>>>> +/* globals */
>>>>>>>> +extern void _prom_entry(void); /* OF CI entry point
>>>>>>>> (i.e. this firmware) */
>>>>>>>> +
>>>>>>>> +void do_boot(unsigned long addr, unsigned long r3,
>>>>>>>> unsigned long r4);
>>>>>>>> +
>>>>>>>> +/* libc */
>>>>>>>> +int strlen(const char *s);
>>>>>>>> +int strcmp(const char *s1, const char *s2);
>>>>>>>> +void *memcpy(void *dest, const void *src, size_t n);
>>>>>>>> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
>>>>>>>> +void *memmove(void *dest, const void *src, size_t n);
>>>>>>>> +void *memset(void *dest, int c, size_t size);
>>>>>>>> +
>>>>>>>> +/* Prom */
>>>>>>>> +typedef unsigned long prom_arg_t;
>>>>>>>> +int call_prom(const char *service, int nargs, int nret, ...);
>>>>>>>
>>>>>>> AIUI this isn't so much about calling the PROM, since this *is* the
>>>>>>> PROM code, but rather about calling the parts that are implemented on
>>>>>>> the qemu side.  Different names might clarify that.
>>>>>>
>>>>>> "call_ci"?
>>>>>
>>>>> Works for me.
>>>>
>>>> call_ci() it is then.
>>>>
>>>> About builtins such as memcmp() - turns out these are not really
>>>> builtins as they are not inlined and gcc/ld still want to link
>>>> against libc which is trickier for such firmware (not quite sure how
>>>> to do this and keep it small and not pull other libc stuff in), gcc
>>>> just knows about them a bit more. This is different from, for
>>>> example, __builtin_ctz which is inlined. So I am keeping my libc.o
>>>> for now.
>>>
>>> Do they really want libc or they are in libgcc for which there's
>>> --static-libgcc I think to avoid needing it in runtime but not sure what
>>> clang has for these.
>>
>> I was getting "unresolved symbol `memcmp`" when I tried calling memcmp() or
>> __builtin_memcmp() and "-lc" did not help (installed some multilib packages,
> 
> Yeah, you'll need -lgcc rather than -lc, libgcc is the one with the
> builtin helpers.

Tried that:
===
ld -nostdlib -e_start -Tl.lds -EB -lgcc -o vof.elf entry.o main.o ci.o 
bootmem.o
ld: cannot find -lgcc
===

I tried playing with the cmdline but to no avail.

I also looked at libgcc and it does not look like it has the libc 
implementations:

===
[fstn1-p1 qemu-killslof]$ find /lib -iname "libgcc*"
/lib/powerpc64le-linux-gnu/libgcc_s.so.1

[fstn1-p1 qemu-killslof]$ objdump -D 
/lib/powerpc64le-linux-gnu/libgcc_s.so.1  | egrep '(memcmp|memcpy)'
0000000000010750 <memcpy@plt>:

[fstn1-p1 qemu-killslof]$
===


>> did not help either). I figured if I cannot get it compile in 3 minutes, I
>> should not probably be posting this and better off simply keeping the
>> existing small libc.
> 
> Fair point.

Yup.



-- 
Alexey

