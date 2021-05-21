Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6338C626
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:01:43 +0200 (CEST)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3qY-0006da-A4
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lk3oy-0005a5-6M
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:00:04 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lk3ow-0003XH-Fm
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:00:03 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-JrUesKUON_GNh1M6N8OYEA-1; Fri, 21 May 2021 07:59:50 -0400
X-MC-Unique: JrUesKUON_GNh1M6N8OYEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094C7801106;
 Fri, 21 May 2021 11:59:50 +0000 (UTC)
Received: from bahia.lan (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD665C1BB;
 Fri, 21 May 2021 11:59:48 +0000 (UTC)
Date: Fri, 21 May 2021 13:59:47 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs: scope of rename_lock?
Message-ID: <20210521135947.6ea005e5@bahia.lan>
In-Reply-To: <3386244.1hTsTelUFx@silver>
References: <3386244.1hTsTelUFx@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 May 2021 19:06:44 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Hi Greg,
>=20
> while reviewing the 9p code base for further optimizations, I stumbled ov=
er=20
> the 'rename_lock' introduced by 02cb7f3a2 and wondered about what exactly=
 it=20
> shall protect?
>=20
> As far as I understand it, the original intention at introduction=20
> (aforementioned 02cb7f3a2) was to protect
>=20
> =091. fidp->path variable
>=20
> =09and
>=20
> =092.  *ANY* filesystem path from being renamed during the *entire* durat=
ion
> =09    of some concurrent 9p operation.
>=20
> So because of (2.) it was introduced as a global lock. But (2.) is a dead=
 end=20
> approach anyway, isn't it?
>=20

I agree that this looks terrible.

> Therefore my question: rename_lock is currently a global lock. Wouldn't i=
t=20
> make more sense to transform it from a global lock from struct V9fsState =
->=20
> struct V9fsFidState and just let it protect that fidp->path variable loca=
lly=20
> there?
>=20

Nothing comes to the top of my mind right now... Maybe Aneesh (Cc'd) can sh=
ed
some light on:

commit 02cb7f3a256517cbf3136caff2863fbafc57b540
Author: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Date:   Tue May 24 15:10:56 2011 +0530

    hw/9pfs: Use read-write lock for protecting fid path.
   =20
    On rename we take the write lock and this ensure path
    doesn't change as we operate on them.
   =20
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>


Why are we serializing all operations on all fid paths with a single
global lock ?

> Best regards,
> Christian Schoenebeck
>=20
>=20


