Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B51327D22
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:25:42 +0100 (CET)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGggG-0005WI-1F
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lGgXn-0001Py-B5
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:16:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lGgXk-00029O-9m
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:16:54 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F3C5A400F2;
 Mon,  1 Mar 2021 14:16:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id CB64DDA;
 Mon,  1 Mar 2021 14:16:47 +0300 (MSK)
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
 <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
 <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
 <ba3a2bae-d2a4-ca3d-cf3f-c2effc9d6ca9@msgid.tls.msk.ru>
 <1f1c6fa9-a9cc-b169-1c9a-57008752efb4@physik.fu-berlin.de>
 <644a53ea-852e-b60c-973d-10e37096d99e@msgid.tls.msk.ru>
 <b2095785-3477-ccaf-ad88-1da88f3f597a@physik.fu-berlin.de>
 <b39b1254-e76c-a793-6c13-058926ffdd65@msgid.tls.msk.ru>
 <6b0c8faf-98c8-29f7-a6be-7901b94deb38@physik.fu-berlin.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <185ce154-c34e-a417-69db-3d1da5609468@msgid.tls.msk.ru>
Date: Mon, 1 Mar 2021 14:16:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6b0c8faf-98c8-29f7-a6be-7901b94deb38@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.03.2021 14:07, John Paul Adrian Glaubitz wrote:
> On 3/1/21 11:40 AM, Michael Tokarev wrote:
>> 01.03.2021 13:35, John Paul Adrian Glaubitz wrote:
>> ..
>>> I have been trying to get qemu-user working with sbuild as it is shipped in Debian
>>> unstable now but I didn't have any success.
>>>
>>> Do you have some instructions somewhere how to get qemu-user working with sbuild?
>>
>> Have you seen #983087 which I fixed yesterday?
> 
> Thanks, but it doesn't help, unfortunately.
> 
> Do I need to use qemu-user-static or qemu-user-binfmt?

Oh. You tried to use qemu-user, not qemu-user-static..
Well.

In order for it to work it should be registered with the
in-kernel binfmt-misc subsystem. qemu-user-static package
does this automatically for you, but qemu-user does not,
for that with qemu-user you'll have to additionally install
qemu-user-binfmt package.

But I guess it wont work with qemu-user even if it is registered
(by means of installing qemu-user-binfmt or manual registration
or whatever), - because regular qemu-user binaries aren't
statically linked and hence require all the shared libraries
within the chroot in order to run.

I never tried to use regular (non-static) qemu-user with
foreign chroot, and I suspect it wont work because of that
very reason, and at least extra setup is needed (like
copying appropriate /lib/ld.so and libc&glib&Co to the
chroot).

This is all about how qemu-user works, be it debian or
any other distribution, - it is basically the same.
I can only guess the wiki page you mentioned is wrong
here.

Thanks,

/mjt


