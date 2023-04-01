Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75646D309E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 13:58:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piZrb-0001DJ-9o; Sat, 01 Apr 2023 07:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1piZrZ-0001Ck-Ba
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 07:57:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1piZrX-0001Oe-Ir
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 07:57:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1DF134000B;
 Sat,  1 Apr 2023 14:57:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 33DFB203;
 Sat,  1 Apr 2023 14:57:33 +0300 (MSK)
Message-ID: <9059b75a-07c2-d90b-83ae-6011b1c2c36a@msgid.tls.msk.ru>
Date: Sat, 1 Apr 2023 14:57:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: xen bits broke x32 build
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
 <8e00cd8d-1914-e9e5-e4c1-23be705399c1@oracle.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <8e00cd8d-1914-e9e5-e4c1-23be705399c1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

01.04.2023 14:45, Joao Martins пишет:
> On 01/04/2023 09:40, Michael Tokarev wrote:
>> After bringing in xen guest support, qemu fails to build on x32:
>> Adding the folks who added the feature too
> 
>> target/i386/kvm/xen-emu.c:876:5: note: in expansion of macro ‘qemu_build_assert’
>>    876 |     qemu_build_assert(sizeof(struct vcpu_info) == 64);
>>        |     ^~~~~~~~~~~~~~~~~
>>
>> This one should be easy to fix, but I wonder if there are other issues
>> with x32 exists..
>>
> Not sure.
> 
> struct vcpu_info is supposed to be 64bytes on both 32-bit and 64-bit builds.
> 
> If anything maybe arch_vcpu_info struct is different on 32-bit and 64-bit...
> David, Paul, any ideas?

Yes, it is arch_vcpu_info. I assumed it is a trivial thing, but let me explain
if it's not the case.

include/hw/xen/interface/arch-x86/xen.h :

#if defined(__i386__)
#include "xen-x86_32.h"
#elif defined(__x86_64__)
#include "xen-x86_64.h"
#endif

(I wonder if it ever possible to have none of the two defined).

Now, xen-x86_32.h has:

struct arch_vcpu_info {
     unsigned long cr2;
     unsigned long pad[5]; /* sizeof(vcpu_info_t) == 64 */
};

Assuming sizeof(long)==32bits. But actually it is 64bits on x32.

While xen-x86_64.h has:

struct arch_vcpu_info {
     unsigned long cr2;
     unsigned long pad; /* sizeof(vcpu_info_t) == 64 */
};


It looks like for x32, the test in arch-x86/xen.h should be:

#if defined(__x86_64__)
#include "xen-x86_64.h"
#else
#include "xen-x86_32.h"
#endif

since x32 is almost like x86_64. The only difference from x86_64
is sizeof(pointer), which is 32bits.


Well. Maybe xen support should be disabled entirely on x32.
Or maybe x32 should be declared as unsupported entirely.
I dunno.

/mjt

