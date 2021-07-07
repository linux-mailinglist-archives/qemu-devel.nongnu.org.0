Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8593BEDC7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:15:36 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1C58-0004C7-Me
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1m1C3h-0003Ho-LX; Wed, 07 Jul 2021 14:14:05 -0400
Received: from kerio.kamp.de ([195.62.97.192]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1m1C3f-0004WM-PC; Wed, 07 Jul 2021 14:14:05 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.69] ([172.20.250.69])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Wed, 7 Jul 2021 20:13:54 +0200
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
From: Peter Lieven <pl@kamp.de>
In-Reply-To: <YOR14GzLqr3EKzcm@redhat.com>
Date: Wed, 7 Jul 2021 20:13:54 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE0414CF-3FC8-44DF-A453-671DDE9CFAD5@kamp.de>
References: <YORYaF3tWDoNOqIw@redhat.com>
 <2F1CA650-9CE2-4AD9-BAF0-AD07829973B7@kamp.de> <YOR14GzLqr3EKzcm@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
>=20
> Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
>>> Am 06.07.2021 um 15:19 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>=20
>>> =EF=BB=BFAm 02.07.2021 um 19:23 hat Ilya Dryomov geschrieben:
>>>> This series migrates the qemu rbd driver from the old aio emulation
>>>> to native coroutines and adds write zeroes support which is =
important
>>>> for block operations.
>>>>=20
>>>> To achieve this we first bump the librbd requirement to the already
>>>> outdated luminous release of ceph to get rid of some wrappers and
>>>> ifdef'ry in the code.
>>>=20
>>> Thanks, applied to the block branch.
>>>=20
>>> I've only had a very quick look at the patches, but I think there is =
one
>>> suggestion for a cleanup I can make: The qemu_rbd_finish_bh()
>>> indirection is probably unnecessary now because aio_co_wake() is =
thread
>>> safe.
>>=20
>> But this is new, isn=E2=80=99t it?
>=20
> Not sure in what sense you mean. aio_co_wake() has always been thread
> safe, as far as I know.
>=20
> Obviously, the old code didn't use aio_co_wake(), but directly called
> some callbacks, so the part that is new is your coroutine conversion
> that enables getting rid of the BH.
>=20
>> We also have this indirection in iscsi and nfs drivers I think.
>=20
> Indeed, the resulting codes look the same. In iscsi and nfs it doesn't
> come from an incomplete converstion to coroutines, but they both used
> qemu_coroutine_enter() originally, which resumes the coroutine in the
> current thread...
>=20
>> Does it matter that the completion callback is called from an librbd
>> thread? Will the coroutine continue to run in the right thread?
>=20
> ...whereas aio_co_wake() resumes the coroutine in the thread where it
> was running before.
>=20
> (Before commit 5f50be9b5, this would have been buggy from an librbd
> thread, but now it should work correctly even for threads that are
> neither iothreads nor vcpu threads.)
>=20
>> I will have a decent look after my vacation.
>=20
> Sounds good, thanks. Enjoy your vacation!


As I had to fire up my laptop to look into another issue anyway, I have =
sent two patches for updating MAINTAINERS and to fix the int vs. bool =
mix for task->complete. As Paolos fix (5f50be9b5) is relatively new and =
there are maybe other non obvious problems when removing the BH =
indirection and we are close to soft freeze I would leave the BH removal =
change for 6.2.

Best,
Peter



