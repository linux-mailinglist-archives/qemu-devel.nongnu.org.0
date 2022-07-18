Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D233557875A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:28:00 +0200 (CEST)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTbD-00008k-EP
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDTZA-0006u5-9q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:25:53 -0400
Received: from mout.gmx.net ([212.227.17.21]:55731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDTZ7-0001K9-FI
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658161544;
 bh=jKY7nNlOdHvNI2w3Snwe8PX+JVLCE5Buzc3zoOvJ9Kg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MwUPj5Qo6ApZNj7Y2d2uiS17NX0bbeimJB9viQz0q4vw/sHw1NReLYztzhqm5Rj1W
 nYF4UwQcjsrcRsWxtsFlpG+qpr87tIzvdxiYtD5/vBu3tuzF8zRHN+sBLMdUwqlA/w
 f3RPSU3sytEr5OAyJ1YS2ju0BeaQkd5iV8YHVQl4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.57]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRQq-1o5sLb3gei-00ThmU; Mon, 18
 Jul 2022 18:25:43 +0200
Message-ID: <830ee712-dce7-d054-282e-d6c0c3911ac8@gmx.de>
Date: Mon, 18 Jul 2022 18:25:39 +0200
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
 <eefad438-67ad-8313-87dc-c2c476340032@gmx.de>
 <CAFEAcA_2w+T_cg3ctNnS5i-gZgU3OwGCRX5pvH3AXUsStDOvtw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAFEAcA_2w+T_cg3ctNnS5i-gZgU3OwGCRX5pvH3AXUsStDOvtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5hlubWayfEBwVOL8UEfnskVmnKF86Nu/HC3g/lov4F5qu51sSpC
 aeSOmEB9Qv6fs1PfFJJToXI8wqudMf+ibB8t8y63baVgNys0/B6Av2JnbLKEnJzIdy5Oyt/
 XtmJYQflzn5aHKt+nJei1lc5ZR3PIf+I9lfAMRpyc7SpbClGbKKk//5xk01piA1SXbBEdns
 qJN9c7R6OI/pJaUiyn2vQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2s4QNwdbyeM=:6t8vGPWl+aCCmY7ZkRrwkB
 KSExdj5hfeonlOnwWBQoJ8pD+PMgsLMzK1qSUyTGjInXyB7S2g5nd6kLlX5YQ2eD2e/xX5J6d
 qgXnayuiPjoWt8hTABiW9ooJ1jXzlF/urYi+qwLECX53AnIQ6i/WbnkbDw2XoCQAME+m/Xb8D
 tQf/2ssi/PnFg9C6RKcO8cGAXPNdM0e/YDIJmA/48TGhNc7NLYNI9Ef3XIFjz1kl6BeAFG6K0
 cna6AgiwwlVReD0iOBCwKJs0wvLvcC/gqop3xRCCQxkFhPJHjGcJG0+Wx6t9NxXC0QCiHf3e5
 Xwg0398MPCkuhDN/1ufZm5SWKpX3YIlzcCWNQXPfVI4PKtSmB9QFW9SkC2OlTvpfR30VETDkL
 YFw+GRdxbCR70RpIcTwTpRaCm42qQEtr4NtWHFWS0mtjopXVMjs+jfqIMFpF0Ck4KwzGoVeWB
 3IoI4I5VRAfAWA52BHcxbV8oXIp+2H2h0KKJTDRnVCAfhs83KJWdG2WjHiLjFtUdkbRl774rT
 tqvJGjAauAGL0EHdA5ZnWwN50I30IdODrHlM7F2odKflJkjwhecP/V+q227mSem7bWBMzdQUH
 PlAfyq7RQLiCq4y0B1iniM1moo7NgwcSJXSKf0erDEGYjqWfZa3l6ZqBHI49oHD7dsHRJmHi0
 ZdiKXIYVXtRgqrWv/Va9dw+PfW3ifaDOs1V4FgO5nntfQTXp9HRBmW/6F5jDP7Z3QKycZjC6j
 uNLNO0+xpiqwvRNws/xIUfz4OYapSTDP46LvoMxsUyGF4BIZhDTPBu61PaaJI2iMmTPiOUhWs
 gQizkFCbFWZLbS/9h3ZHKMwa7B3ye9+0tD/RYOEMB1A35yRCbbUI2W18UG1cjk0UmckVcs0OH
 vHs6zv36V+14P6LwBhLxVK1F5u2oLcFzkAJesIan3j0MPl86SHksc/9DqG1u36XFN4e/crsV5
 xL2KuextD2xjjAaqkfUJgRc/x9QKhrop1XpAXCWPjbxuMuTXL+0LutJVfR9rOEvCzXxEiGgoX
 qmhgYSodeqRigg5jpzHkObvi600oJf9bt27TEudGGMh+NiVoWFzXwFGoii2e4iExnqkGn7FBx
 TsJoxN5onMS8zx1rzdt3e5PA+gzsvVnCpi760wsgWV9MDHlEJIJ260rJw==
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

On 7/18/22 18:17, Peter Maydell wrote:
> On Mon, 18 Jul 2022 at 16:50, Helge Deller <deller@gmx.de> wrote:
>> On 7/18/22 16:33, Peter Maydell wrote:
>>> So my preference would be that we should just say "we can assume
>>> that pipe2 is always available and implemented on linux hosts" and
>>> remove the code that handles the possibility that it isn't.
>>
>> Ok for me.
>> Do you want me to send a patch or will you do?
>
> If you'd like to write the patch that would be great.
> You can remove the meson.build line that sets CONFIG_PIPE2
> as well, since we have no other places that check it.

Ok, I'll do.

Btw, you asked:
> Did you run into this in practice, or is it just a
> theoretical concern ?

I didn't faced the problem in practice. I'm trying to solve another
issue and while debugging I stumbled over that code.

Helge

