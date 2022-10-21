Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FA60793F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:09:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsiC-0000R4-4T
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:09:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsi6-0000KK-9J
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olshm-00070i-Im
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:09:01 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olshk-00007v-Bs
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:08:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 01B081349AC87;
 Fri, 21 Oct 2022 16:08:50 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 21 Oct
 2022 16:08:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013cc5171d-b4df-4576-9fa8-3d8cc8484924,
 2C53638FF1EB3B99BA3D288868CF79D16C3369BD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 21 Oct 2022 16:08:48 +0200
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 <qemu-devel@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/2] util/log: Derive thread id from getpid() on
 hosts w/o gettid() syscall
Message-ID: <20221021160848.28ff96a4@bahia>
In-Reply-To: <e5d785bb-3865-75a3-f1aa-c99acf127c5f@redhat.com>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-2-groug@kaod.org>
 <Y1AeglCfb6SHaf4N@redhat.com>
 <e5d785bb-3865-75a3-f1aa-c99acf127c5f@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 5991c7ad-e8e0-4df3-95e2-f7c2cb24fb7a
X-Ovh-Tracer-Id: 12101735149093755299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudevueegfefhleekueeihfdvvdejleelvdehteetteevteejueefueegveegvddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpqhgvmhhurdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 20 Oct 2022 12:39:41 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 10/19/22 17:57, Daniel P. Berrang=C3=A9 wrote:
> >> +    if (my_id =3D=3D -1) {
> >> +        my_id =3D getpid() + qatomic_fetch_inc(&counter);
> >> +    }
> >> +    return my_id;
> > This doesn't look safe for linux-user when we fork, but don't exec.
>=20
> Linux-user won't ever get here, however bsd-user might.  We should have=20
> get_thread_id() somewhere in util/, for example
>=20
> https://github.com/wine-mirror/wine/blob/master/dlls/ntdll/unix/server.c
>=20

We have qemu_get_thread_id() already :

https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dutil/oslib-posix.c;h=3D827a=
7aadba444cdb128284f5b4ba43934c78c3db;hb=3DHEAD#l96

> > The getpid() will change after the fork, but counter won't be
> > reset, so a thread in the parent could clash with a thread
> > in the forked child.
>=20
> It might clash even if the counter is reset for that matter.
>=20

Yes.

> Paolo
>=20


