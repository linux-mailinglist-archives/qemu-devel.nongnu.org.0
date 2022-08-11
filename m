Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06C590807
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 23:28:31 +0200 (CEST)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMFjB-0006Ue-PD
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 17:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@freepascal.org>)
 id 1oMFhm-00056v-LK
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 17:27:02 -0400
Received: from mail.freepascal.org ([178.33.235.90]:44292)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1oMFhk-0003r9-2E
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 17:27:01 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id 3265318038B;
 Thu, 11 Aug 2022 21:26:57 +0000 (UTC)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefixng.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjuMs7Z-SDEY; Thu, 11 Aug 2022 21:26:57 +0000 (UTC)
Received: from [192.168.1.23]
 (i16-les02-ix2-176-180-129-30.sfr.lns.abo.bbox.fr [176.180.129.30])
 by mail.freepascal.org (Postfix) with ESMTPSA id CD6D2180389;
 Thu, 11 Aug 2022 21:26:56 +0000 (UTC)
Message-ID: <dea1c082-54e7-de1a-0f0c-a7b8a1060a1b@freepascal.org>
Date: Thu, 11 Aug 2022 23:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC] Testing 7.1.0-rc2, qemu-ppc does not give valid disassembly
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>
References: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
 <CAFEAcA-0wkYiDgs7DOpnMuwVw=z=H_440Yyrfaa9_V-YRyoU-w@mail.gmail.com>
Content-Language: fr, en-US
From: Pierre Muller <pierre@freepascal.org>
In-Reply-To: <CAFEAcA-0wkYiDgs7DOpnMuwVw=z=H_440Yyrfaa9_V-YRyoU-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.33.235.90; envelope-from=pierre@freepascal.org;
 helo=mail.freepascal.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Pierre Muller <pierre@freepascal.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 11/08/2022 à 19:11, Peter Maydell a écrit :
> On Thu, 11 Aug 2022 at 14:35, Pierre Muller <pierre@freepascal.org> wrote:
>>     I don't know if this is the right place to submit this report,
>> but I have a problem with my attempt to check the 7.1.0 release candidate
>> for linux user powerpc CPU.
>>
>>     I am testing a simple executable, compiled with Free Pacal compiler,
>> but also linked to libc.
>>
>> This is what I obtain with the new rc:
>>
>> ~/gnu/qemu/build-qemu-7.1.0-rc1/qemu-ppc -L ~/sys-root/powerpc-linux -d in_asm tprintf
>> ----------------
>> IN: _start
>> 0x3ffda784:
>> OBJD-T: 7c230b78388000003821fff0908100004bfe756d
> 
> This is because you don't have the libcapstone development package
> installed on your host system.
> 
>>     I did find that this is related to the fact that
>> upon configuration, meson finds no capstone library,
>> while disassembly of powerpc CPU has been moved to use of
>> capstone in this commit:
> 
> The other relevant commit here is
> 
> commit 83602083b4ada6ceb86bfb327e83556ebab120fc
> Author: Thomas Huth <thuth@redhat.com>
> Date:   Mon May 16 16:58:23 2022 +0200
> 
>      capstone: Remove the capstone submodule
> 
>      Now that we allow compiling with Capstone v3.0.5 again, all our supported
>      build hosts should provide at least this version of the disassembler
>      library, so we do not need to ship this as a submodule anymore.

   Ok, this explains why there is no way to specific the use of the submodule!
--enable-capstone works indeed to force configure to fail
if capstone is not found.

>> Even when trying to compile the git checkout,
>> which contains capstone as a sub-module, in capstone sub-directory,
>> I always get capstone support set to NO by meson configuration.
> 
> If your git checkout still has a capstone subdirectory this
> is an old leftover from a checkout that predated 83602083b4ada.
> ('git status' will tell you this, and a suitable 'git clean'
> command will get rid of it for you.)

   There are still git domain I don't really master...

>> Why doesn't it use the sub-module if pkg-config says that there
>> is not system capstone library installed?
> 
> Because we now can rely on all our supported host distributions
> being modern enough to ship libcapstone, and we don't need to
> cart around a submodule any more (which reduces our maintenance
> burden). As Cédric suggests, you can pass '--enable-capstone'
> to configure if you would like configure to fail if it can't
> find the system libcapstone, rather than falling back to the
> binary-blob disassembler.

   But as I use machines on which I am not admin,
I needed to compile capstone locally, install it inside my home dir,
and export PKG_CONFIG_PATH to allow the meson configuration
to correctly detect this local installation...

   However, this is not optimal, especially if I want to be able to
copy over the resulting binaries to other test machines,
on which the configuration completely fails,
like gcc188 for which the current clib is too old according to
the configure requirements.

   Is it really required to have glibc 2.56?
On several of these test machines, the version is much older...
I tried to force acceptance by reducing the requirement,
and it did compile successfully after that.

   Is there a solid reason to be so restrictive?


Pierre Muller

