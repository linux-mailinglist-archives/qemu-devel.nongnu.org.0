Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8B5301C3
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 10:01:52 +0200 (CEST)
Received: from localhost ([::1]:34476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsgX7-0002ED-Hf
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 04:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nsgQQ-0006yA-JK
 for qemu-devel@nongnu.org; Sun, 22 May 2022 03:54:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nsgQO-0005xZ-EN
 for qemu-devel@nongnu.org; Sun, 22 May 2022 03:54:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A5B5240107;
 Sun, 22 May 2022 10:54:40 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2764A12D;
 Sun, 22 May 2022 10:54:40 +0300 (MSK)
Message-ID: <ef7e3563-dd54-e838-c429-e9359c9e77e2@msgid.tls.msk.ru>
Date: Sun, 22 May 2022 10:54:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: qemu-user (arm64) fails (null ptr deref) under qemu-system-x86_64
 w/o avx?
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <7c82caac-4426-b107-af3c-79b99856fca9@msgid.tls.msk.ru>
 <7ebb70a9-96ff-a3c0-f872-ea2eefdda18c@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <7ebb70a9-96ff-a3c0-f872-ea2eefdda18c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Richard!

22.05.2022 04:17, Richard Henderson wrote:
> On 5/18/22 02:13, Michael Tokarev wrote:
>> Hi!
>>
>> Here's an interesting bug. Interesting because qemu-user does not run under qemu-system.
>>
>> Running 7.0.0 qemu-aarch64-static under 7.0.0 qemu-system-x86_64 -enable-kvm with
>> default cpu type, getting:
> 
> What is the test case?
> 
> I thought I'd be able to see the same problem by disabling AVX support in tcg/i386/tcg-target.c.inc.  But so far everything I have tried works.

Do you really mean "everything", that is, you didn't able to reproduce it at all?

> And for completeness, what's the compiler that produced the qemu-aarch64-static binary?

And this is a *very* good question really. Even better than I initially thought.

Because I think it all started after gcc upgrade on debian and recompiling
qemu-user with the new compiler. There was no other user-related changes in
the version of qemu-user binary in debian which triggered this issue in the
first place.  Becaise the reporter found which particular package upgrade
causes this new issue to appear. It is the upgrade of qemu-user-static
package in debian, minor version upgrade from 7.0.0-2 to 7.0.0-3 with
changes in the packaging which are unrelated to qemu-user (actually to
any code, - just the packaging stuff).

Now I'm even more puzzled than before.  Because both packages were compiled
by the same tool set versions. In particular, it was gcc-12 (= 12-20220428-1).
I *thought* it is a gcc upgrade which caused that, but it is not. Compiler
flags used, other relevant packages - it's all the same (we did upgrade, say,
libsdl, but it is obviously has no effect on qemu-user).

(Here's the initial bug report about this: https://bugs.debian.org/1011003 -
but it contains too much unrelated information).

I can reproduce the problem locally quite easily. I can't reproduce it on
a baremetal system without AVX support (tried on a few older systems, in
particular on a Celeron N3050) - it works there just fine, the same binary
which fails under qemu-system. Previous qemu-aarch64-static works fine,
this qemu-aarch64-static breaks, this qemu-aarch64-static but built on
an older debian system (bullseye, with older toolchain) works fine either
way.

Even under qemu-system it has somewhat strange (but 100% reproducible, with
exactly the same null-ptr deref) results: eg. it still fails with
qemu-system-x86_64 -cpu Westmere,+avx, - so turning on avx for westmere does
not fix it. But removing avx from SandyBridge does trigger it.  So it is not
*just* avx, it is something more interesting than that. Maybe it is the
qemu-system which does something wrong, not the qemu-user - because we can't
reproduce it on a few baremetal systems (but it is way more difficult to
experiment in this context obviously, since you can't turn CPU features on/off
at will there).

Hmm...... :)

/mjt

