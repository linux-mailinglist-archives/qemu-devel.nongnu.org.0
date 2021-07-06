Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFC3BD93C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:57:14 +0200 (CEST)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mVd-0002Jk-RL
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1m0mUP-0000i8-W1; Tue, 06 Jul 2021 10:55:58 -0400
Received: from kerio.kamp.de ([195.62.97.192]:52966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1m0mUM-0000HE-Nj; Tue, 06 Jul 2021 10:55:57 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.30.124.17] ([62.159.140.18])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Tue, 6 Jul 2021 16:55:36 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Date: Tue, 6 Jul 2021 16:55:38 +0200
Message-Id: <2F1CA650-9CE2-4AD9-BAF0-AD07829973B7@kamp.de>
References: <YORYaF3tWDoNOqIw@redhat.com>
In-Reply-To: <YORYaF3tWDoNOqIw@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: iPhone Mail (18D70)
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 06.07.2021 um 15:19 schrieb Kevin Wolf <kwolf@redhat.com>:
>=20
> =EF=BB=BFAm 02.07.2021 um 19:23 hat Ilya Dryomov geschrieben:
>> This series migrates the qemu rbd driver from the old aio emulation
>> to native coroutines and adds write zeroes support which is important
>> for block operations.
>>=20
>> To achieve this we first bump the librbd requirement to the already
>> outdated luminous release of ceph to get rid of some wrappers and
>> ifdef'ry in the code.
>=20
> Thanks, applied to the block branch.
>=20
> I've only had a very quick look at the patches, but I think there is one
> suggestion for a cleanup I can make: The qemu_rbd_finish_bh()
> indirection is probably unnecessary now because aio_co_wake() is thread
> safe.

But this is new, isn=E2=80=99t it?

We also have this indirection in iscsi and nfs drivers I think.

Does it matter that the completion callback is called from an librbd thread?=
 Will the coroutine continue to run in the right thread?

I will have a decent look after my vacation.

Anyway, Thanks for applying,
Peter

>=20
> (Also, if I were the responsible maintainer, I would prefer true/false
> rather than 0/1 for bools, but that's minor. :-))
>=20
> Kevin
>=20



