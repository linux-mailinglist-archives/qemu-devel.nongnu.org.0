Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B44B5785BB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:46:31 +0200 (CEST)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDS10-0005iV-6D
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDRcn-00045f-JL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:21:29 -0400
Received: from mout.gmx.net ([212.227.17.21]:47381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDRcl-0006tw-Ep
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658154082;
 bh=Of4IhmwczXB+TLtZ5Qe3EjVDmzQPZFGiCohtr0/1fRE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=b1JE9WQ6BURpj/KycvvGkYN1oBWAQvVwsXYQmDXQlhetIeRJ1+Xl1RYEkkuy3JXZ1
 MA3IXy80yfYVszTvEEp+gqvLY6WTSlBnF3roMwOMWUG2qZVfPLbvBzbU5nGGu+TD2i
 KsgFRYW+bi/R1IXiQtqJGt0P1g5fc5123B/aL5pM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacOQ-1nh80m2jes-00c5QB; Mon, 18
 Jul 2022 16:21:22 +0200
Message-ID: <273d6b49-332c-9563-a90f-4d1a889314d3@gmx.de>
Date: Mon, 18 Jul 2022 16:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Fix pipe() vs. pipe2() usage for ALPHA, MIPS, 
 SH4 and SPARC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <YtQzMUuBOfBiMNlY@p100>
 <CAFEAcA9GzSJw4GpCkdOQPx7j24chp3WDq5tD=8FVkyYYtdrHuQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAFEAcA9GzSJw4GpCkdOQPx7j24chp3WDq5tD=8FVkyYYtdrHuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xx2Uy/9XK5sHY1aNPmKGHK2qb5tMUGcA8Fvl8PDPLecB6o0qDRM
 4SsAr1PEGy31BKRqYmr0wGPMj3sLpI6F1BcQt7cwTbDZygfAJDjheJlAietT3O1Oc3/EPnJ
 dleDY3SsMa5csGegY49pA8oWUjfnwWn4FgoI1GVGc+JBSPVOHcSiK7zuvUeapZl1iZXALps
 F/RMwrapD1mc8hvKpUArA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ay7jVncVtSU=:gEfTxQU1xdsU33JLNxjLgL
 NRKd0IEkrCC4j0coqVcPnSG2sYyiP/2wBxhyZWP3EAvO1sKqM5IM03mQ2BKIwkCV+BAv/soKq
 iswrxE3rAEvTgiALYNYDUgy7/vXeO3Rf3ZjDJn4apo9xw4Ps8IYAMpMZAfNNX157Tp2iPZf8H
 FyUYorvhNuR9g9IfHNSoTnytGzlzCCWu90aXRZcRSprU5I7Cqm9sbyrFWITVJmSaonwuqdBYU
 pXrydWtclAUixJMImry9X5NAts+sDPrbj5/kiABh05vTJvEh938DPFaxeMggmIUge/wPpyZbR
 z4KF18i5xoVNSavSubn4tNkonihHBEAM9pvRd1n+8Qez3nELIItZmaRG633Gg4SyZrVakI6cs
 ivag0tVIXhkk1CSsrE9HqKgwkk/Luk+qNp7c3ruaUwHCsd6Pc3rSSxTG5qhP6R7hv5dPruUQd
 1En3rMY45MeW0O2PidHp/DjCSROT1XerlOKwRfalzHUo8YjjgURU9LDeaugWShK1qFrVTuZ3B
 L0nkQ/3VsmzMO4Wreu1UZ5tM50uvF+VrgXD4hRNJz/gJ11BuAaU5SN7SXNLYBhUVX7kCl/cYO
 D+ifxGqWfB6fr6CSO30OO/IuzzUbDVB1tBBIQ2yuyd10BZYyOBnrOhiXWnhxBarVw9tfF7Cjw
 ezEj38slartlq1FUGBnU6nZfP1nzGNv6a5e3sckGpJ8WzVftCUsl8FHUTVifFD1s5dEmqdwRS
 H+4Knmg38sPhg5CWPaYYNxNcaJr/DVDuXpxasDR+FfiWocCkUOO7VGstoI3L1C0Und2gId4Oh
 LAHYBSUo8vkFRBFNka1xDLxfksXGngjaYHc/QIUliV2NHea3cOsHZcJLSleqrz+F3USmXxdXf
 qR4YBtnT5gNI+qg/N2+WkGq6jd6auK0g3QYg9YFkGAh845jg3KhpNCa8uquthmL4NFY+iw80l
 BzIy0ntZKl+N6fV3A2/vKRQr4ujRHiWUb0ewaPF1GMUYFwzW0q4MfZj+9hEM5J39KdtTqjM2p
 etxj5j4gUZVdzEHQyrmOCDQB6XeiAbhU328SFp3re1oQjDqTjz/i1ZxZ/LHPmtPF3wTJYYhaZ
 eBSsgwfT0bnYwAiT0W+JkXR/qh8sbqo+XACvFv9aDVpxyvhC5MygepoHg==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/18/22 14:51, Peter Maydell wrote:
> On Sun, 17 Jul 2022 at 17:10, Helge Deller <deller@gmx.de> wrote:
>>
>> In 2010, the commit b41a66edd0c added a thrird parameter "is_pipe2" to =
the
>
> typo in commit hash (lost the first letter). Should be
> fb41a66edd0c7bd6 ("alpha-linux-user: Fix pipe return mechanism."
> I think ?

Yes. I missed that "f" although I had it in the Fixes: tag.

>> internal do_pipe() function, but missed to actually use this parameter =
to
>> decide if the pipe() or pipe2() syscall should be used.
>> Instead it just continued to check the flags parameter and used pipe2()
>> unconditionally if flags is non-zero.
>>
>> This change should make a difference for the ALPHA, MIPS, SH4 and SPARC
>> targets if the emulated code calls pipe2() with a flags value of 0.
>>
>> Fixes: fb41a66edd0c ("alpha-linux-user: Fix pipe return mechanism.")
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 991b85e6b4..1e6e814871 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -1600,7 +1600,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, ab=
i_ulong pipedes,
>>  {
>>      int host_pipe[2];
>>      abi_long ret;
>> -    ret =3D flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
>> +    ret =3D is_pipe2 ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
>
> Why do we need to do this?

Yep, we don't *need* to...

> If the flags argument is 0,
> then pipe2() is the same as pipe(), so we can safely
> emulate it with the host pipe() call. It is, or at
> least was, worth doing that, so that guests that use
> pipe2(fds, 0) can still run on hosts that don't implement
> the pipe2 syscall.

True, but only for pipe2(fds,0), not e.g. for pipe2(fds,1).
On the other side if a guest explicitly calls pipe2()
and if it isn't available, then IMHO -ENOSYS should be returned.
Let's assume userspace checks in configure/make scripts if pipe2()
is available and succeeds due to pipe2(fds,0), it will assume pipe2()
is generally available which isn't necessarily true.

> There's probably a reasonable argument to be made that we don't
> care any more about hosts so old they don't have pipe2 and that
> we could just dump do_pipe2() and the CONFIG_PIPE2 check, and
> have do_pipe() unconditionally call pipe2(). Would just need
> somebody to check what kernel/glibc versions pipe2() came in.

Yes.

> The architecture specific bit of target behaviour that
> we need the is_pipe2 flag for is purely for handling the
> weird return code that only the pipe syscall has, and
> for that we are correctly looking at the is_pipe2 argument.
> (The bug that fb41a66edd0c7bd6 fixes is that we used to
> incorrectly give the pipe syscall return argument behaviour
> for pipe2-with-flags-zero.)

Yes, that part is ok.

In summary, IMHO the patch isn't necessary, but probably more correct.

Helge

