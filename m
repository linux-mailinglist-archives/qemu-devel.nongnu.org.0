Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240E0605A1F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 10:44:01 +0200 (CEST)
Received: from localhost ([::1]:35406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olR9j-0008Ai-RU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:43:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olR9j-00082A-Nj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olR6D-0003Vi-DU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 04:40:25 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:55119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olR6A-0002Dk-Vr
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 04:40:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B42742A7B8;
 Thu, 20 Oct 2022 08:40:13 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 10:40:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006245e16ae-9484-43d9-ab42-311a1753d40f,
 1F689060A0B44BE6777CA4BD0FC13A24F8265309) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 20 Oct 2022 10:40:06 +0200
From: Greg Kurz <groug@kaod.org>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/2] util/log: Derive thread id from getpid() on
 hosts w/o gettid() syscall
Message-ID: <20221020104006.5060cd02@bahia>
In-Reply-To: <Y1AeglCfb6SHaf4N@redhat.com>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-2-groug@kaod.org>
 <Y1AeglCfb6SHaf4N@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 4e29bc46-9537-4a1b-8600-fb2e1600c4d2
X-Ovh-Tracer-Id: 679199120902298019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueeuieejtdelleeutdfhteejffeiteffueevffeffeetvdeifeeujefgudegteeunecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=groug@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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

On Wed, 19 Oct 2022 16:57:54 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Oct 19, 2022 at 05:16:50PM +0200, Greg Kurz wrote:
> > A subsequent patch needs to be able to differentiate the main QEMU
> > thread from other threads. An obvious way to do so is to compare
> > log_thread_id() and getpid(), based on the fact that they are equal
> > for the main thread on systems that have the gettid() syscall (e.g.
> > linux).
> >=20
> > Adapt the fallback code for systems without gettid() to provide the
> > same assumption.
> >=20
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  util/log.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/util/log.c b/util/log.c
> > index d6eb0378c3a3..e1c2535cfcd2 100644
> > --- a/util/log.c
> > +++ b/util/log.c
> > @@ -72,8 +72,13 @@ static int log_thread_id(void)
> >  #elif defined(SYS_gettid)
> >      return syscall(SYS_gettid);
> >  #else
> > +    static __thread int my_id =3D -1;
> >      static int counter;
> > -    return qatomic_fetch_inc(&counter);
> > +
> > +    if (my_id =3D=3D -1) {
> > +        my_id =3D getpid() + qatomic_fetch_inc(&counter);
> > +    }
> > +    return my_id;
>=20
> This doesn't look safe for linux-user when we fork, but don't exec.
>=20

... which is a "dangerous" situation if the parent is already
multi-threaded at fork() time. The child thread must only call
async-signal-safe functions and...


> The getpid() will change after the fork, but counter won't be
> reset, so a thread in the parent could clash with a thread
> in the forked child.
>=20

... pthread_create() isn't one AFAIK. This case has undefined
behavior.

Anyway, no matter what we do, even with a regular fork+exec pattern,
log_thread_id() no longer guarantees unique values for all threads
that could be running concurrently (unlike gettid() or counter++),
e.g.=20
- parent process with pid A and one extra thread
  =3D> parent uses thread ids A and A+1
- fork child process with pid B =3D=3D A+1
- child execs
  =3D> child uses thread id A+1

> I feel like if we want to check for the main thread, we should
> be using pthread_self(), and compare result against the value
> cached from main. Or cache in a __constructor__ function in
> log.c to keep it isolated from main().
>=20

Hmm... pthread_self() is only guaranteed to be unique within
a process. It doesn't look safe either to compare results
of pthread_self() from different process contexts.

>=20
> With regards,
> Daniel

Thanks for bringing this corner case up ! It highlights that
I should definitely go for another approach that doesn't
require to check for the main thread at all.

Cheers,

--
Greg

