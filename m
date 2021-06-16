Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360423AA37B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:49:07 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltab4-0005kv-8n
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ltaWE-00086p-5e
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:44:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ltaWA-000519-VD
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:44:05 -0400
Received: from [192.168.100.43] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MJWgK-1lZjFg2zQO-00Jqem; Wed, 16 Jun 2021 20:44:00 +0200
Subject: Re: [RFC PATCH] linux-user/sparc: Implement v8plus signals
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210526011340.440284-1-richard.henderson@linaro.org>
 <a8938653-3f26-ba97-3672-ff10e56a9a60@vivier.eu>
 <2a3fb13c-d793-c910-7f86-0b021d2c1642@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0a8c264d-21f5-456e-1b04-f164f8c4b36d@vivier.eu>
Date: Wed, 16 Jun 2021 20:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a3fb13c-d793-c910-7f86-0b021d2c1642@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O/FWBsRKiYmrdp3cE+IQIDcDoyT7hu1SPyeikGBO1puv/hMYiah
 oZHOTDqJNcPF4CuqMB0t8rTfryCCEhk7JUDrbvyMENQ/kHC7pXdFJOVdPoT33owD2VuknFL
 UKT96sALGfD9mNUnZ6DaOe623SufpnxrHNPneaCO7Y1gloUmZ1M7BEh92NBAAGoRWoykU8c
 yKJ5N43o/sF614cPBFPTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dbYOCXEjD28=:2WKYou+HAXrI1l4JWPCJcK
 dx9nokgn8ZddKiA/TtcwqZLpp5wUxDlhDNqMXmbDkkX/K6YOXrNyK9HoEO0dwsgGy7HwGjx0N
 udKCYYS5ZTv33Cv9Gzb4TcEIMu/fVbligrKRseMITf+KOtqqEw6iZtM0y/bN0hw4gNjy/uh5v
 UI6Kabs9lRq65YKwta/7AabiO21+RPFPWiSm5iPoJqhD/0Dw/igb5om0+Qv5PFCwO8iCrbFdG
 zqr3xTUR3kB/UZ/bZtKP59CkZPyoCMLBT1/Mv0qu9q3UjoArX+i6xqowm/83ttdaui80LIxpR
 wTHqQYif9170/PjLcYpSWkWgqky1MHmpewM/7Rr0T6p/ml2HfQsJgXyuZgQh8ulRoPtuJh8q3
 m4ykr9xyIZbNz/ylyVcf6I9gmiCXiQfvH6F5TQqhuolotNF6nlMClcR+w5IpU+BAAvFebKzJs
 yjJKSueyMYzsTOjM7kcP5tPfCixiaTPuWH6bl73tzOs9hQZSYYAmBiNje59Ji4nPGnH/tHiMt
 Qfaw/BDdBTlU9VejQ4WvC8=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 16:44, Richard Henderson wrote:
> On 6/14/21 11:48 PM, Laurent Vivier wrote:
>> Le 26/05/2021 à 03:13, Richard Henderson a écrit :
>>> Sparc v8plus is a sparc64 running a 32-bit ABI.
>>> The significant difference vs sparc32 is that all 64 bits of
>>> the %g and %o registers, plus %xcc, are saved across interrupts,
>>> context switches, and signals.
>>>
>>> There's a special marker in the saved %psr value that's used to
>>> indicate that %xcc and the high bits are present in the frame.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>
>>> I have been unable to find an extant v8plus distribution with
>>> which to test this beyond compilation.  Thus the RFC.  I know
>>> debian used to have one, but they have moved to pure sparc64 now.
>>>
>>> Thoughts?
>>
>> In my test, I use debian wheezy, and it seems to be sparc32plus v8+:
>>
>> $ file chroot/sparc/wheezy/bin/ls
>> chroot/sparc/wheezy/bin/ls: ELF 32-bit MSB executable, SPARC32PLUS, V8+ Required, total
>> store
>> ordering, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for
>> GNU/Linux
>> 2.6.26, BuildID[sha1]=3fdfb5b9f829824f6110b7a2d91efd9947614263, stripped
>>
>> I get wheezy from http://archive.debian.org/debian
>>
>> If you want I can make a try with your patch.
> 
> Yes, please.
> 

This breaks two tests in LTP: sigaction01 and rt_sigaction01 (they hang).

Tested with debian wheezy and LTP 20200930.

Note: even with master, debootstrap is broken and needs manual hacks to have a working chroot.

Thanks,
Laurent


