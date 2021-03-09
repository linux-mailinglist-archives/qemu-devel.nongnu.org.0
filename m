Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6F332801
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:03:42 +0100 (CET)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcxZ-00036o-L8
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJcup-0001vO-7s; Tue, 09 Mar 2021 09:00:51 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:26994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJcui-0002NR-CD; Tue, 09 Mar 2021 09:00:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7125A7456B7;
 Tue,  9 Mar 2021 15:00:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4FCDA7456B4; Tue,  9 Mar 2021 15:00:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4EDB57456E3;
 Tue,  9 Mar 2021 15:00:39 +0100 (CET)
Date: Tue, 9 Mar 2021 15:00:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
In-Reply-To: <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
Message-ID: <d7edd653-4923-fea5-e14-cd4ab871e324@eik.bme.hu>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <YEcHxEvVPPO85BGE@yekko.fritz.box>
 <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021, Alexey Kardashevskiy wrote:
> On 09/03/2021 16:29, David Gibson wrote:
>>>>> +struct ClientArchitectureSupportClass {
>>>>> +    InterfaceClass parent;
>>>>> +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
>>>>> +    void (*quiesce)(void);
>>>> 
>>>> Is there actually any real connection of quiesce behaviour to cas
>>>> behaviour?  Basically, I'm wondering if this is not so much about
>>>> client-architecture-support fundamentally as just about
>>>> machine-specific parts of the VOF behaviour.  Which would be fine, but
>>>> suggests a different name for the interface.
>>> 
>>> The most canonical way would be having 2 interfaces.
>> 
>> Why?  I don't see any reason these shouldn't be a single interface, it
>> just has a bad name.
>
> I renamed it to SpaprVofInterface for now.
>
>
>> [snip]
>>>>> +typedef int size_t;
>>>>> +typedef void client(void);
>>>>> +
>>>>> +/* globals */
>>>>> +extern void _prom_entry(void); /* OF CI entry point (i.e. this 
>>>>> firmware) */
>>>>> +
>>>>> +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
>>>>> +
>>>>> +/* libc */
>>>>> +int strlen(const char *s);
>>>>> +int strcmp(const char *s1, const char *s2);
>>>>> +void *memcpy(void *dest, const void *src, size_t n);
>>>>> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
>>>>> +void *memmove(void *dest, const void *src, size_t n);
>>>>> +void *memset(void *dest, int c, size_t size);
>>>>> +
>>>>> +/* Prom */
>>>>> +typedef unsigned long prom_arg_t;
>>>>> +int call_prom(const char *service, int nargs, int nret, ...);
>>>> 
>>>> AIUI this isn't so much about calling the PROM, since this *is* the
>>>> PROM code, but rather about calling the parts that are implemented on
>>>> the qemu side.  Different names might clarify that.
>>> 
>>> "call_ci"?
>> 
>> Works for me.
>
> call_ci() it is then.
>
> About builtins such as memcmp() - turns out these are not really builtins as 
> they are not inlined and gcc/ld still want to link against libc which is 
> trickier for such firmware (not quite sure how to do this and keep it small 
> and not pull other libc stuff in), gcc just knows about them a bit more. This 
> is different from, for example, __builtin_ctz which is inlined. So I am 
> keeping my libc.o for now.

Do they really want libc or they are in libgcc for which there's 
--static-libgcc I think to avoid needing it in runtime but not sure what 
clang has for these.

Regards,
BALATON Zoltan

