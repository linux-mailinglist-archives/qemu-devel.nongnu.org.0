Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A54EABE3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:05:59 +0200 (CEST)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9fi-0002CO-CQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:05:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nZ9Zu-0000ff-5q
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:59:58 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nZ9Zs-0004Zd-E5
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:59:57 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-0TOCVWdMMQmu9Nsrdo69IQ-1; Tue, 29 Mar 2022 06:59:46 -0400
X-MC-Unique: 0TOCVWdMMQmu9Nsrdo69IQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08FD02999B2C;
 Tue, 29 Mar 2022 10:59:46 +0000 (UTC)
Received: from bahia (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0FAC4C7A0;
 Tue, 29 Mar 2022 10:59:45 +0000 (UTC)
Date: Tue, 29 Mar 2022 12:59:43 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 0/7] 9pfs: fix 'Twalk' protocol violation
Message-ID: <20220329125943.0be073c2@bahia>
In-Reply-To: <2664983.LghzH4s2Bn@silver>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
 <2664983.LghzH4s2Bn@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 12:21:13 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 15. M=C3=A4rz 2022 11:10:25 CEST Christian Schoenebeck wrote=
:
> > Currently the implementation of 'Twalk' does not behave exactly as spec=
ified
> > by the 9p2000 protocol specification. Actual fix is patch 5; see the
> > description of that patch for details of what this overall fix and seri=
es
> > is about.
> >=20
> > PREREQUISITES
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > This series requires the following additional patch to work correctly:
> > https://lore.kernel.org/qemu-devel/E1nTpyU-0000yR-9o@lizzy.crudebyte.co=
m/
> >=20
> > OVERVIEW OF PATCHES
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Patch 4 is a preparatory (pure) refactoring change to make actual 'Twal=
k'
> > fix patch 5 better readable.
> >=20
> > All the other patches are just additional test cases for guarding 'Twal=
k'
> > behaviour.
> >=20
> > v3 -> v4:
> >=20
> >   * QID returned by Twalk request in fs_walk_2nd_nonexistent() test sho=
uld
> > NOT be identical to root node's QID. [patch 7]
> >=20
> >   * Fix actual 'fid unaffected' check in fs_walk_2nd_nonexistent() test=
 by
> >     sending a subsequent 'Tgetattr' request. [patch 7]
> >=20
> > Christian Schoenebeck (7):
> >   tests/9pfs: walk to non-existent dir
> >   tests/9pfs: Twalk with nwname=3D0
> >   tests/9pfs: compare QIDs in fs_walk_none() test
> >   9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
> >   9pfs: fix 'Twalk' to only send error if no component walked
> >   tests/9pfs: guard recent 'Twalk' behaviour fix
> >   tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent
> >=20
> >  hw/9pfs/9p.c                 |  57 ++++++----
> >  tests/qtest/virtio-9p-test.c | 201 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 231 insertions(+), 27 deletions(-)
>=20
> ping
>=20
> No hurry, as this is something for the subsequent QEMU release cycle, but=
=20
> would be good to know whether you will be able to look at this at all.
>=20

Yes I will but probably not before next week.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
>=20
>=20


