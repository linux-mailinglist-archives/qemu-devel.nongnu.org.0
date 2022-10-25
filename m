Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61060C717
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:00:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFnA-0007a8-9w; Tue, 25 Oct 2022 05:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1onFgA-0005jR-Df
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:52:58 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1onFg8-0008A8-CN
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:52:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5A95C29845;
 Tue, 25 Oct 2022 08:52:43 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 25 Oct
 2022 10:52:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001bd871d6b-b7ab-4bf5-9dd9-5d81b8511a00,
 5AA7337ABCEACBE3F99194CB0234B772833894C4) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 25 Oct 2022 10:52:40 +0200
From: Greg Kurz <groug@kaod.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?= "
 <berrange@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Message-ID: <20221025105240.18b43485@bahia>
In-Reply-To: <87wn8pa72j.fsf@linaro.org>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
 <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
 <20221020114937.3558737e@bahia> <Y1Ebv28whPgwdaMW@redhat.com>
 <1b76bdd4-f5ca-cb0a-2593-b025d6575e9b@redhat.com>
 <87wn8pa72j.fsf@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 646f3f0e-d525-420b-9458-59788f46b556
X-Ovh-Tracer-Id: 11807030850183272867
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtiedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueeuieejtdelleeutdfhteejffeiteffueevffeffeetvdeifeeujefgudegteeunecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 10:44:11 +0100
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

>=20
> Paolo Bonzini <pbonzini@redhat.com> writes:
>=20
> <snip>
> >> If we want to connect stdout/err to something when daemonized
> >> then lets either have a dedicated option for that, or simply
> >> tell apps not to use -daemonize and to take care of daemonzing
> >> themselves, thus having full control over stdout/err. The latter
> >> is what libvirt uses, because we actually want stderr/out on a
> >> pipe, not a file, in order to enforce rollover.
> >
> > I would gladly get rid of -daemonize, unfortunately it has many users.
> > Adding further complication to it is not beautiful, but overall I
> > think Greg's patch does make sense.  In particular I would continue
> > the refactoring by moving
> >
> >
> >             /*
> >              * If per-thread, filename contains a single %d that should=
 be
> >              * converted.
> >              */
> >             if (per_thread) {
> >                 fname =3D g_strdup_printf(filename, getpid());
> >             } else {
> >                 fname =3D g_strdup(filename);
> >             }
> >
> >             return fopen(fname, log_append ? "a" : "w");
> >
> > to a new function that can be used in both qemu_log_trylock() and
> > qemu_set_log_internal().  (In fact this refactoring is a bugfix
> > because per-thread log files do not currently obey log_append).
>=20
> What is the use case for log_append. AFAICT it only ever applied if you
> did a dynamic set_log. Was it ever really used or should it be dropped
> as an excessive complication?
>=20

The use case seems to be able to temporarily disable logging,
which closes the log file, without loosing already logged stuff
when logging is re-enabled. QEMU not overwriting previous logs
from the same run is certainly a legitimate expectation from the
user.

Complexity mostly stems from the fact that the log file gets closed
when doing `log none` from the monitor. The logic is also a bit
inconsistent : initial open ensures that we go with a pristine log
file, but renaming the file from the monitor will gladly append
messages to a pre-existing unrelated file...

> From my point of view appending to an existing per-thread log is just
> going to cause confusion.
>=20

... and cause confusion all the same.

I'd rather leave the log file always open, except on renames,
and always open in truncating mode.

> >
> > Paolo
>=20
>=20


