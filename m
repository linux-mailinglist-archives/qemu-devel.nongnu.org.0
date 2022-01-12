Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B90948C392
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:53:57 +0100 (CET)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cCS-0006de-4p
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1n7bnB-0002mM-Sa
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:49 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:42179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1n7bn5-0003NB-Un
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:49 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1n7bmk-001wWv-Py; Wed, 12 Jan 2022 12:27:22 +0100
Received: from p57bd9010.dip0.t-ipconnect.de ([87.189.144.16]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1n7bmk-003wRc-Jh; Wed, 12 Jan 2022 12:27:22 +0100
Message-ID: <a9a107d8-f30a-a6d4-5569-4c541630a97e@physik.fu-berlin.de>
Date: Wed, 12 Jan 2022 12:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
 <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
 <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
 <d2553511-b83c-d4f1-5a88-b661bc97eb@eik.bme.hu>
 <9189dbe7-cf92-19c7-dee5-b707262964d1@physik.fu-berlin.de>
 <3f483f63-9e68-b1da-01ab-a1e05dcf45aa@physik.fu-berlin.de>
 <378d863-abbb-57b7-d624-ce1ca81d09c@eik.bme.hu>
 <105383e6-9dab-e2bd-ffe2-fead5555f37c@physik.fu-berlin.de>
 <c3cf7b52-10bc-eff3-c08a-d6e743cb863@eik.bme.hu>
 <db8b375b-0403-e7b3-44a6-89e440b5e2d2@physik.fu-berlin.de>
 <82c6635-68c7-9b51-3f6c-7555dfb7958c@eik.bme.hu>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <82c6635-68c7-9b51-3f6c-7555dfb7958c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.16
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Robert_=c5=9awi=c4=99cki?= <robert@swiecki.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan!

On 10/26/21 00:40, BALATON Zoltan wrote:
> On Tue, 26 Oct 2021, John Paul Adrian Glaubitz wrote:
>> Hi Zoltan!
>>
>> On 10/23/21 15:22, BALATON Zoltan wrote:
>>>> You either need to strip the kernel with "strip vmlinux" or use the image from arch/sh/
>>>> boot/zImage.
>>>
>>> I've actually used that kernel but looked at the wrong uncompressed size, it's indeed just
>>> 9.2MB when stripped so that should work. I was trying to debug further and found two problems:
>>>
>>> Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have broken -singlestep -d in_asm,cpu
>>> output with sh after a delay slot. Since that commit I get:
>>> (...)
>>> This seems to take a wrong turn at the delayed branch and somehow ends up at 0x8c800964 instead of
>>> 0x8c801528 but I'm not sure where to look firther why. I'm cc-ing Richard for both the -d cpu and
>>> this hoping he has some more insight.
>>
>> Shall we open a bug report?
> 
> Well, we don't know yet what to put in the bug report apart from there is some bug somewhere. That's
> not too useful. I now understand that the -d output is not showing already translated TBs (I knew this
> but most of the time with -singlestep it gives good results anyway) but here it runs the loops without
> further output then we only see the first loop iteration and the end result. So the problem is not that
> it goes to 0x8c800964 as I think that's part of the loop for decompressing the kernel but it seems
> something is overwriting 0x8c800964 while it still expects to run code from there but I don't know what
> and why. One way to find could be to disassemble the kernel code and compare that with the -d output and
> check every instruction manually but that takes a lot of time or if you have a cross debugger you could
> try attaching that to QEMU and try to debug it that way but I don't have that either. Any other idea how
> to find out what is happening?

Robert Święcki (CC'ed) found out that disabling tracing support makes Debian's kernel bootable [1].

Not sure if this is a kernel bug or a QEMU bug then. Does QEMU have any support for kernel tracing?

Adrian

> [1] https://marc.info/?l=linux-sh&m=164193147916418&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913



