Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8235786C3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 17:52:27 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDT2o-0006xm-5W
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 11:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDT0X-0004rg-FJ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:50:05 -0400
Received: from mout.gmx.net ([212.227.17.20]:56765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDT0U-0004AX-PQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658159400;
 bh=2o3V28IBzos7oB0R+sVIrC7gVl70VigiXgVxe0ouCRk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Igl92l48Xaad3pOO7Tf8h0mw7g93M8pK4JGHZmyln0Ga7BEORabLbI5p9J0NWtr52
 xzZxqeIGOcDcjGly+1szvltrv81M18arSC7NlbCe3Se16VzFEEo6r66OnxRmIMWKtS
 gPnp0C2cd/ccTB9EvNAan9S1N6i0W4iyUcn3gRIk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.57]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUosT-1o4UjB1Dwf-00QgKx; Mon, 18
 Jul 2022 17:50:00 +0200
Message-ID: <eefad438-67ad-8313-87dc-c2c476340032@gmx.de>
Date: Mon, 18 Jul 2022 17:49:55 +0200
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
 <273d6b49-332c-9563-a90f-4d1a889314d3@gmx.de>
 <CAFEAcA_68kFSveyvJtwAb8XbsseDhepwXsPC6Bxe=Ha8-Kx3cw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAFEAcA_68kFSveyvJtwAb8XbsseDhepwXsPC6Bxe=Ha8-Kx3cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ewds+5m6Kx5txSLdyk88TklgHWCkYqojMHPHKB6jSTpNAGd4J3D
 A904nHVIxvFvF88EsdOXGJAEF79WB6A1jZF1YKvGZOC7MBumEXK2506FOgD7pySiTDY9FLA
 rleMRiNxs77iDm6els6bqCUm/wY81lzirr44B/Kw2sQARip3wi9T4vBYMESUerLBWCSDNam
 attVp60hyvzCnAItipsig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JP0YbLTQC7U=:fsEyqcabOEh9UkJQu0TSIT
 mFofY4OTpe2NTJQv0DnkA4WxzqwurJzU9b9IiKo1DW7JtdSDB4TZMhmlgeObecw96ooSE9NaP
 U/OH/f369rsdhDhmUCjOezm5ksAeKeJrrUN1A01rwg//bleiBpzOksS8UctbzH9o/+ycLGrzI
 aTOdXXHhN6UP+kr07KQRXUhPqmvrSqfvMCXEFG57M4Chk6lcjI8OoD1p+gOCrLjhU9ToMg++M
 VkZ/vk1f5ec/TkRikF9kMFaGcr+cgteLIkO8rrT21Rw/gO09gYRptdAxbb1WqgNkITHtl9aFL
 PCjS11RLnHqlySEsq4Gc6Ce63SDQ32Hs9PbJYOMqIt+7chf2f05n3SkgTE0bISHA9VVgknZBN
 PTbNp9BUnOiEtu1QFSVaczVpCRMNgBZlxisC07A7L+8XnCql/39Cvw3lPb89S5fUvOnCJrSK7
 EFiBe8V8hxJhKDb/H/NcYH7XpnSww6DW3ikC8hyDQK5DFFVUrABGZkJp78iPg1IvqqxQ/xy8I
 ek3LhXG66L9nbVPDBHf8FE0SFz7KEJqM2mxT1QqjEAaunjUuLjIP2oS8+WA8XhIOmIFyTb63F
 GgxXki0RED5dlycIvNkkSRcjCsAHMTajilZki7aUAsjACZkVYaAoSdbi2DWQHQ/tgD+yeW/Mu
 2iWK6BlSYnWAmPT1WqI2G5tPyl7JWapKEecnQoNZK1sn5iN1QUyKN5xe8mLgI99zPqK2tcejm
 2EmCNHWPCgrFatloBCz9o2Kb/LCQk7nqFU8S40ZJrbj20C7Mc252avYjXDg4TRR0tvKWJ/3BG
 MUQ+dR2CRtph30lHQqPPEoSTjypl4pO4OetoX+I2O3FIZcB+/ePyer46tCJ2X3FHAC0evRcK5
 efRUpUGtpAMipFjasfEVX/suC31l0M0H+GLnrTc9V9r16eRqWD1ZTL0nh7Ra4SA4wkenvNG3K
 h3ptSdLF3171A3x1vGJT0kkaS/K1Eoc+8fbNeZkxoYIajCF70swSOiU9I2mFnOkUzv5VUTz7L
 F49fondwV24Jp3jJ0OEEIC9onZpkF4HtwSW6tMP8D7uGr3Pkxa6BPxtziXIQbM6y61G0cF1Cn
 O02V0FpLOgamWUWa0GMrxgG7dl6dXsaMTLI25dBKtXniC03KIDvmvXTxw==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

On 7/18/22 16:33, Peter Maydell wrote:
> On Mon, 18 Jul 2022 at 15:21, Helge Deller <deller@gmx.de> wrote:
>> On 7/18/22 14:51, Peter Maydell wrote:
>>> Why do we need to do this?
>>
>> Yep, we don't *need* to...
>>
>>> If the flags argument is 0,
>>> then pipe2() is the same as pipe(), so we can safely
>>> emulate it with the host pipe() call. It is, or at
>>> least was, worth doing that, so that guests that use
>>> pipe2(fds, 0) can still run on hosts that don't implement
>>> the pipe2 syscall.
>>
>> True, but only for pipe2(fds,0), not e.g. for pipe2(fds,1).
>> On the other side if a guest explicitly calls pipe2()
>> and if it isn't available, then IMHO -ENOSYS should be returned.
>> Let's assume userspace checks in configure/make scripts if pipe2()
>> is available and succeeds due to pipe2(fds,0), it will assume pipe2()
>> is generally available which isn't necessarily true.
>
> Fair point. Did you run into this in practice, or is it just a
> theoretical concern ?
>
> NB that any probing code that does that will also get the wrong
> answer on musl libc, though, because musl's pipe2() implementation
> always calls pipe() for a zero-flags call:
> https://git.musl-libc.org/cgit/musl/tree/src/unistd/pipe2.c
>
>>> There's probably a reasonable argument to be made that we don't
>>> care any more about hosts so old they don't have pipe2 and that
>>> we could just dump do_pipe2() and the CONFIG_PIPE2 check, and
>>> have do_pipe() unconditionally call pipe2(). Would just need
>>> somebody to check what kernel/glibc versions pipe2() came in.
>>
>> Yes.
>
> I just had a look, and the pipe2 syscall came in in Linux 2.6.27.
> musl has implemented pipe2() since at least 2013, and glibc must
> have had it for at least that long.
>
> In fact current glibc always implements pipe() in terms of pipe2():
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Defc6b2dbc47231d=
ee7a7ac39beec808deb4e4d1f
>
> So my preference would be that we should just say "we can assume
> that pipe2 is always available and implemented on linux hosts" and
> remove the code that handles the possibility that it isn't.

Ok for me.
Do you want me to send a patch or will you do?

Helge

