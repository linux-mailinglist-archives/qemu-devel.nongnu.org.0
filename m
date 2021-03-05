Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FBC32F2FC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:43:25 +0100 (CET)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFQ4-00023N-SD
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIEr7-00044t-EA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:07:17 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:35957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lIEr3-0006NH-SX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:07:17 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOAJt-1l7R4R0sIb-00Oag3; Fri, 05 Mar 2021 19:07:10 +0100
Subject: Re: RFC: linux-user: preserving argv[0] of the original binary in
 context of binfmt-misc
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <27dfe8eb-adce-8db4-f28b-c42858b086db@msgid.tls.msk.ru>
 <CAFEAcA-d811Ou-Ks_c_j4kPnD2DrUSfvUYwfsOgonazj16RokA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e6048b19-2759-edfa-f129-8438341e07aa@vivier.eu>
Date: Fri, 5 Mar 2021 19:07:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-d811Ou-Ks_c_j4kPnD2DrUSfvUYwfsOgonazj16RokA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qwod/m9hSc8TCvjvl9uB1uMfocWD2HOhtFrk1/sQ4MTHbW/uy0O
 hYyN8TbpF6FpktkLBxFEy0MSqoT4BnMcMjmlBWP6mJinHW8lbEIZ+PDHZGA8QX2xan1XFN3
 am3MXXYCOfPssjLnGul3EooN7gOxRfp1xWjAoHcnz2WhzxphstIygsKZ4Euk2RMVU8tzjiJ
 sdxwWUQlcgf0pYBEGQVPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0hrJW3Wgg/A=:8/tTegPua0Q99zhOJmCYaU
 rReJstiedUpsKdVxs+NFZsbaV/UQP8LQ8qv+QXx5I1hXaXfbT/xQ89VWKZe9lgSUnHWfnTzcV
 Op65xePPe7qtCRqREHT7DJ6/ewPsKadVryEebKz6Qfi8XBKwHUNIkN7r2daNxhCL+2mXXIGij
 gHaLyGlE+Mo0GTmcDmvrLl2U0RUKpQj+BfUf4tt/HwGeFStRY3XeepJitYjRUDae+JY+z+04U
 A8OUD7csthX7eSpTVIqLq5apfgzawjmZlZ7zidWw4GQYe1owzLzi3bQQRdsGPQzeh47oQPiyY
 a/ifCqX3CvR1d1xcKG0Jb4Q/LoGICimkovZAk2ZK31JHm5/d4t5oUDbWqQF4lKXt946uJTIvq
 fiuldZ+nvCylnQe8hiUDs2MYRJ2STdHwI98O1wZl6ozb8XwcBR6MTC2PjY/KHELxnbp5YHika
 RfF8auieBg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/03/2021 à 18:53, Peter Maydell a écrit :
> On Sun, 14 Feb 2021 at 15:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> As known for a long time, qemu's linux-user, when invoked in context of binfmt-misc mechanism,
>> does not preserve the original argv[0] element, so some software which relies on argv[0] is
>> not functioning under qemu-user.  When run this way, argv[0] of the program being run under
>> qemu-user points to this qemu-user binary, instead of being what has been used to spawn the
>> original binary.
>>
>> There's an interpreter flag in binfmt handling in recent kernels, P, or preserve, which meant
>> to pass 3 extra first arguments to the binfmt interpeter, - namely, the path to interpreter
>> itself, the argv[0] as used when spawning the original binary, and the actual path of the
>> said binary. But qemu-user/main does not handle this situation, - it should be prepared for
>> this unusual way of being invoked.
>>
>> There are several hackish solutions exists on this theme used by downstreams, which introduces
>> a wrapper program especially for binfmt registration and nothing else, uses this P flag, and
>> uses -argv0 qemu-user argument to pass all the necessary information to qemu-user.
>>
>> But these wrappers introduce a different issue: since the wrapper executes the qemu binary,
>> we can't use F binfmt-misc flag anymore without copying the qemu-user binary inside any
>> foreign chroot being used with it.
>>
>> So the possible solution is to made qemu-user aware of this in-kernel binfmt mechanism,
>> which I implemented for Debian for now, as a guinea pig :)
> 
> I've always felt that the fundamental problem is that the kernel has never
> provided any way for the binfmt handler to know in what way it is being
> invoked. So you can't have a handler that backwards-compatibly says "if the
> user/distro/whatever installed me with the P flag then I should expect my
> arguments like this, but if it didn't then I should do the other thing".
> 
>> Since the original problem is the proper handling of programs which depend on their own
>> name in argv[0], the proposed solution is also based on the program name, - this time
>> it is the name under which qemu-user binary is called.
>>
>> I introduced a special name for qemu-user binaries to be used _only_ for binfmt registration.
>> This is, in my case, /usr/libexec/qemu-binfmt/foo-binfmt-P - where "foo" is the architecture
>> name, and "-binfmt-P" is the literal suffix. This name is just a (sym)link to /usr/bin/qemu-foo,
>> - just an alternative name for qemu-foo, nothing more.
> 
> Mmm, you can work around the kernel's missing feature by using a particular
> naming convention. I guess that's better than nothing but I think that if
> we want to go this route we should try to get buy-in from more than one
> distro that this is the right way to do it...
> 
> Alternatively, if anybody has a bright idea for how to get the kernel
> to tell us how it's invoking us (ELF auxv entry???) maybe we could make
> a proposal to the kernel folks.

My patch has been merged in v5.12:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2347961b11d4079deace3c81dceed460c08a8fc1

And I will push soon the qemu part:

https://patchew.org/QEMU/20210222105004.1642234-1-laurent@vivier.eu/

Thanks,
Laurent


