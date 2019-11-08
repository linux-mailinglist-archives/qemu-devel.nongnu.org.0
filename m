Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81ECF527F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 18:24:49 +0100 (CET)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT808-0001Ph-B9
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 12:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iT7yt-0000dE-Qh
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 12:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iT7ys-0003Le-D7
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 12:23:31 -0500
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:41270)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iT7ys-0003KW-7G
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 12:23:30 -0500
Received: from player738.ha.ovh.net (unknown [10.108.42.196])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 89D9571A94
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 18:23:26 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 28484C0A8AA3;
 Fri,  8 Nov 2019 17:23:16 +0000 (UTC)
Date: Fri, 8 Nov 2019 18:23:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] spapr: Fix VSMT mode when it is not supported by the
 kernel
Message-ID: <20191108182315.4c26b3fa@bahia.lan>
In-Reply-To: <cafafbdc-7869-f8ac-bfc0-5b93cacc5542@redhat.com>
References: <20191108154035.12913-1-lvivier@redhat.com>
 <20191108174759.2d4040f1@bahia.lan>
 <cafafbdc-7869-f8ac-bfc0-5b93cacc5542@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11857133397968591142
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvuddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.50.107
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
Cc: =?UTF-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Nov 2019 18:03:08 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> On 08/11/2019 17:47, Greg Kurz wrote:
> > On Fri,  8 Nov 2019 16:40:35 +0100
> > Laurent Vivier <lvivier@redhat.com> wrote:
> > 
> >> Commit 29cb4187497d sets by default the VSMT to smp_threads,
> >> but older kernels (< 4.13) don't support that.
> >>
> >> We can reasonably restore previous behavior with this kernel
> >> to allow to run QEMU as before.
> >>
> >> If VSMT is not supported, VSMT will be set to MAX(8, smp_threads)
> >> as it is done for previous machine types (< pseries-4.2)
> >>
> > 
> > It is usually _bad_ to base the machine behavior on host capabilities.
> 
> This is already the case, statically: your patch guesses the kernel
> always support VSMT. So you can't start the machine (and thus can't
> migrate it to/from).
> 

Failing to start the machine is okay. The thing we want to avoid is
to successfully start the guest and discover later on we cannot
migrate it.

> > What happens if we migrate between an older kernel and a recent one ?
> 
> I think migration is supported correctly only if parameters are
> explicitly set. So this is not our case.
> 

Hence my suggestion to introspect...

> > I understand this is to fix tests/migration-test on older kernels.
> > Couldn't this be achieved with migration-test doing some introspection
> > and maybe pass vsmt=8 on the QEMU command line ?
> 
> It could be a little bit complicated to instrospect this.

... ah, you likely know migration-test better than I do :)

> We could also set by default vsmt=8 at the test level.
> 

This would mean that we don't test an exact default setup, but this
would still test most of the migration paths. I guess this could be
an acceptable trade-off only if 'make check' must *really* support
older kernels.

> Thanks,
> Laurent
> 


