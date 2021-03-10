Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D4A3332E5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 02:56:33 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJo5Q-0003wN-EQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 20:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lJo4J-0003HZ-GP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 20:55:23 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lJo4B-0006Qq-Fj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 20:55:22 -0500
Received: by mail-pl1-x629.google.com with SMTP id n17so4126452plc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 17:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=higp68H34otoXzEQtVs6KBzTmSKvjqs4tO4D/XJesns=;
 b=k72l32P2DKOq/QszTXfKLhYZsjLzPU78EMTLdDvo5wTK/G32TuhLOFgiAPQ62E16a9
 oR+4VnQmxBGA4AsxQBgLlDJqK0G1jaNwbjfrye80xQjSmGgWHrSoU2g2iyLEPBYn44Tl
 HcjO9kj/C2mgFKN5cIRCuH86cUwH7HxrfhDN/lAEKXRTrPLjZN4HDvkyxg0TA6dr42Fv
 h/5/fqJhBlBWbF+svMvcN18erOJcvgAuu0ZI8NVMTOyFBiJthFrBCRAqEuGlextEUVXx
 GL8qb7eH3PRBrqR6qX7XzCp7GwralRom0LDrrLIZj/7c45PPVc4RollUWMxFnIzOUyAo
 b4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=higp68H34otoXzEQtVs6KBzTmSKvjqs4tO4D/XJesns=;
 b=bYxz5aaHkofv532H6xgpo3TO3zuYAYT6n9tGBavuNxKyOLhEfca/9xKL/VlopCV35M
 HpB1s4nKnrS188CWs9/FiO51t5W2WyD0FgAK8DNUfV/ghNXHY054F8Yyiis5BHl/DEB3
 TjcBu7FY0gMmYW2C2ewQfcsxUJ8GT0qfyQrurJJED1uk+994cT867TSE4Z4SDkG9ZMBN
 XvHGUjVpn5NXicsIH+k/F9xp9wFkbl3HdE0BrmVFItaXjXc1vhAQIQq9taipPUt1brLU
 EtBDDthposho8BPCrPqUBoxwIpIMO2a0S17x8s+/m+nyoJSbISz2SOUF6YDEt9mWa7BJ
 2B6Q==
X-Gm-Message-State: AOAM530IEm4tk2bbc+uE24bKrD5Zmajp1PhUQq8pA4g/QZKReyN5tX/G
 cLJrTz0nIfpbXVLRAsu4VxOJvg==
X-Google-Smtp-Source: ABdhPJxlqFHQPFSvSTtS8zRPd9R0x66nmZ1IAZXnPQ3Diirbk3mNg++UNdY8CCWjzHEbArol67n2uA==
X-Received: by 2002:a17:902:a40b:b029:e0:1096:7fb with SMTP id
 p11-20020a170902a40bb02900e0109607fbmr873193plq.40.1615341312569; 
 Tue, 09 Mar 2021 17:55:12 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id z1sm6040305pfn.127.2021.03.09.17.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 17:55:11 -0800 (PST)
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <YEcHxEvVPPO85BGE@yekko.fritz.box>
 <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
 <d7edd653-4923-fea5-e14-cd4ab871e324@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <80852df2-667a-871f-1f6a-e74723117e01@ozlabs.ru>
Date: Wed, 10 Mar 2021 12:55:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <d7edd653-4923-fea5-e14-cd4ab871e324@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/03/2021 01:00, BALATON Zoltan wrote:
> On Tue, 9 Mar 2021, Alexey Kardashevskiy wrote:
>> On 09/03/2021 16:29, David Gibson wrote:
>>>>>> +struct ClientArchitectureSupportClass {
>>>>>> +    InterfaceClass parent;
>>>>>> +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
>>>>>> +    void (*quiesce)(void);
>>>>>
>>>>> Is there actually any real connection of quiesce behaviour to cas
>>>>> behaviour?  Basically, I'm wondering if this is not so much about
>>>>> client-architecture-support fundamentally as just about
>>>>> machine-specific parts of the VOF behaviour.  Which would be fine, but
>>>>> suggests a different name for the interface.
>>>>
>>>> The most canonical way would be having 2 interfaces.
>>>
>>> Why?  I don't see any reason these shouldn't be a single interface, it
>>> just has a bad name.
>>
>> I renamed it to SpaprVofInterface for now.
>>
>>
>>> [snip]
>>>>>> +typedef int size_t;
>>>>>> +typedef void client(void);
>>>>>> +
>>>>>> +/* globals */
>>>>>> +extern void _prom_entry(void); /* OF CI entry point (i.e. this 
>>>>>> firmware) */
>>>>>> +
>>>>>> +void do_boot(unsigned long addr, unsigned long r3, unsigned long 
>>>>>> r4);
>>>>>> +
>>>>>> +/* libc */
>>>>>> +int strlen(const char *s);
>>>>>> +int strcmp(const char *s1, const char *s2);
>>>>>> +void *memcpy(void *dest, const void *src, size_t n);
>>>>>> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
>>>>>> +void *memmove(void *dest, const void *src, size_t n);
>>>>>> +void *memset(void *dest, int c, size_t size);
>>>>>> +
>>>>>> +/* Prom */
>>>>>> +typedef unsigned long prom_arg_t;
>>>>>> +int call_prom(const char *service, int nargs, int nret, ...);
>>>>>
>>>>> AIUI this isn't so much about calling the PROM, since this *is* the
>>>>> PROM code, but rather about calling the parts that are implemented on
>>>>> the qemu side.  Different names might clarify that.
>>>>
>>>> "call_ci"?
>>>
>>> Works for me.
>>
>> call_ci() it is then.
>>
>> About builtins such as memcmp() - turns out these are not really 
>> builtins as they are not inlined and gcc/ld still want to link against 
>> libc which is trickier for such firmware (not quite sure how to do 
>> this and keep it small and not pull other libc stuff in), gcc just 
>> knows about them a bit more. This is different from, for example, 
>> __builtin_ctz which is inlined. So I am keeping my libc.o for now.
> 
> Do they really want libc or they are in libgcc for which there's 
> --static-libgcc I think to avoid needing it in runtime but not sure what 
> clang has for these.

I was getting "unresolved symbol `memcmp`" when I tried calling memcmp() 
or __builtin_memcmp() and "-lc" did not help (installed some multilib 
packages, did not help either). I figured if I cannot get it compile in 
3 minutes, I should not probably be posting this and better off simply 
keeping the existing small libc.



-- 
Alexey

