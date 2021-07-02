Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE583BA2C2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:28:13 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzL5Q-00051J-Lr
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lzL4B-0004LY-2T
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:26:55 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:32762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lzL49-0002Xu-5j
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:26:54 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-b1m8HX-GOImjvFGGRa4JGw-1; Fri, 02 Jul 2021 11:26:48 -0400
X-MC-Unique: b1m8HX-GOImjvFGGRa4JGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA962100CF6F;
 Fri,  2 Jul 2021 15:26:47 +0000 (UTC)
Received: from bahia.lan (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07F0F10016DB;
 Fri,  2 Jul 2021 15:26:46 +0000 (UTC)
Date: Fri, 2 Jul 2021 17:26:45 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 7/7] 9pfs: reduce latency of Twalk
Message-ID: <20210702172645.177c315c@bahia.lan>
In-Reply-To: <16093217.on2isagWAK@silver>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
 <1a6701674afc4f08d40396e3aa2631e18a4dbb33.1622821729.git.qemu_oss@crudebyte.com>
 <20210702163656.2b6a8975@bahia.lan> <16093217.on2isagWAK@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 02 Jul 2021 17:05:32 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 2. Juli 2021 16:36:56 CEST Greg Kurz wrote:
> > On Fri, 4 Jun 2021 17:38:31 +0200
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > As with previous performance optimization on Treaddir handling;
> > > reduce the overall latency, i.e. overall time spent on processing
> > > a Twalk request by reducing the amount of thread hops between the
> > > 9p server's main thread and fs worker thread(s).
> > >=20
> > > In fact this patch even reduces the thread hops for Twalk handling
> > > to its theoritical minimum of exactly 2 thread hops:
> > >=20
> > > main thread -> fs worker thread -> main thread
> > >=20
> > > This is achieved by doing all the required fs driver tasks altogether
> > > in a single v9fs_co_run_in_worker({ ... }); code block.
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  hw/9pfs/9p.c | 89 +++++++++++++++++++++++++++++++++++++++++---------=
--
> > >  1 file changed, 70 insertions(+), 19 deletions(-)
> > >=20

[...]

>=20
> Yeah, there is a lot more to do on v9fs_walk(), both cleanup, as well as =
the=20
> previously (couple weeks ago) mentioned protocol fix (i.e. Twalk should o=
nly=20
> reply Rerror if there is an error on the very first path element).
>=20

Ah yes... I had forgotten about this one. One more argument for a thorough
rewrite of this function.

> If you don't mind, I queue this patch as is for now and prepare a PR for =
the=20
> current 9p patches in my queue in order to bring them into the soft freez=
e=20
> deadline.
>=20

Sure, please do.

> Thanks for looking at this Greg, I appreciate it!
>=20

Upcoming soft freeze provided the extra motivation to finish the review :-)

> Best regards,
> Christian Schoenebeck
>=20
>=20

Cheers,

--
Greg


