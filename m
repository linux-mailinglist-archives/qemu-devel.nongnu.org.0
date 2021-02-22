Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E8321B3E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:21:51 +0100 (CET)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lED1y-00065z-IB
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECsW-0000ip-Mp
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:12:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECsR-0000Xe-Pe
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:12:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A287940727;
 Mon, 22 Feb 2021 18:11:53 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1E7EC8D;
 Mon, 22 Feb 2021 18:11:54 +0300 (MSK)
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
 <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
 <d0076988-a8f9-cd4c-1d19-bcb0b0a28dfb@physik.fu-berlin.de>
 <ba3a2bae-d2a4-ca3d-cf3f-c2effc9d6ca9@msgid.tls.msk.ru>
 <1f1c6fa9-a9cc-b169-1c9a-57008752efb4@physik.fu-berlin.de>
 <644a53ea-852e-b60c-973d-10e37096d99e@msgid.tls.msk.ru>
 <e14413e5-af09-e101-6320-34e90811f414@gmx.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <c36947bf-81e3-cc18-4b81-7a36cf5585fa@msgid.tls.msk.ru>
Date: Mon, 22 Feb 2021 18:11:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e14413e5-af09-e101-6320-34e90811f414@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.02.2021 18:02, Helge Deller wrote:
> On 2/22/21 3:58 PM, Michael Tokarev wrote:
>> 22.02.2021 17:54, John Paul Adrian Glaubitz wrote:
>>
>>> OK, gotcha. Is it supposed to work with systemd-binfmt? It looks like it depends
>>> on the old binfmt-support package.
>>
>> the qemu 4-line patch does not depend on any particular system, it relies on a
>> special name of its own argv[0] when registering the binfmt entry.  In order to
>> utilize it, we create a special-named symlink to qemu-foo and register that one
>> with the binfmt-misc subsystem, no matter if it is systemd or binfmt-support or
>> whatever else.
> 
> ... which is pretty hackish (although it apparently works; I haven't tested myself).

While it is hackish at first glance, the more I think about it the less hackish it
becomes.  The thing is - we're talking about different behavour of some program when
it sees different argv[0]. We can just as well use the same mechanism to support this.

> The big question remains:
> Is this "hack" just a temporary workaround which should be kept, or
> is the support via the kernel-patch from Laurent the long-term and better solution?

I don't care either way or the other, and I don't see the Laurent's one as better,
either. It's a long-term issue where quite some bullets has been spent already and
quite some spears has been broken. I come across a solution which actually works and
let others who waited for this issue to be solved to do their work.

At the very least, the one requiring kernel patch does not work on current distributions,
while my version works just fine, and we'll keep it in debian for now since it allows
to unbreak quite some other things. If qemu upstream will take another approach it is
entirely fine with me (after all that's why I sent an RFC in the first place, - to show
another (at least one) possible solution and to hear comments, and to develop something
which is good in the end). Hopefully we'll be able to switch to a better solution once
it's settled and will be available within current distributions.

Thanks,

/mjt

