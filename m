Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778DB140604
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 10:28:40 +0100 (CET)
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isNvj-0003CT-Fq
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 04:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1isNv0-0002mL-74
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:27:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1isNux-000652-KF
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:27:54 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1isNux-00064r-GT
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579253271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZZb60iD0ZDUBUORUGwv8YmDcSmN5NVD5fOBf3tCECo=;
 b=Ffj40fWxivrUxbjChGeJYc6xYmYBaJxGRrVc+01kZ2oKspIAYlU7k3HLkUWer9htXMT3L/
 JAitIKHdBr0ksGedrh7ZjmOCUcvVtgUXgvpkHe4A+VW0iq2XAbqN0lNznBq1W+8jdA2Y3S
 jIlGQ3F1ME3Gi4Gw4gJoSAkVY+j/lEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-NLTapg_UOay8TBuCMxmh1w-1; Fri, 17 Jan 2020 04:27:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2686B800D41;
 Fri, 17 Jan 2020 09:27:47 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5D410016EB;
 Fri, 17 Jan 2020 09:27:43 +0000 (UTC)
Date: Fri, 17 Jan 2020 09:27:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 085/104] virtiofsd: Support remote posix locks
Message-ID: <20200117092741.GA3209@work-vm>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-86-dgilbert@redhat.com>
 <20200115233831.mw6sttmepespg4kk@gabell>
 <20200116132631.GA25291@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200116132631.GA25291@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: NLTapg_UOay8TBuCMxmh1w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Masayoshi Mizuma <msys.mizuma@gmail.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Wed, Jan 15, 2020 at 06:38:31PM -0500, Masayoshi Mizuma wrote:
>=20
> [..]
> > > +/* Should be called with inode->plock_mutex held */
> > > +static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data=
 *lo,
> > > +                                                      struct lo_inod=
e *inode,
> > > +                                                      uint64_t lock_=
owner,
> > > +                                                      pid_t pid, int=
 *err)
> > > +{
> > > +    struct lo_inode_plock *plock;
> > > +    char procname[64];
> > > +    int fd;
> > > +
> > > +    plock =3D
> > > +        g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(loc=
k_owner));
> > > +
> > > +    if (plock) {
> > > +        return plock;
> > > +    }
> > > +
> > > +    plock =3D malloc(sizeof(struct lo_inode_plock));
> > > +    if (!plock) {
> > > +        *err =3D ENOMEM;
> > > +        return NULL;
> > > +    }
> > > +
> > > +    /* Open another instance of file which can be used for ofd locks=
. */
> > > +    sprintf(procname, "%i", inode->fd);
> > > +
> > > +    /* TODO: What if file is not writable? */
> > > +    fd =3D openat(lo->proc_self_fd, procname, O_RDWR);
> > > +    if (fd =3D=3D -1) {
> >=20
> > > +        *err =3D -errno;
> >=20
> > I think the errno is positive value, so the minus isn't needed?
> >=20
> >            *err =3D errno;
>=20
> That's sounds right. Thanks.=20
>=20
> David, will you be able to do this tweak in your tree or you want me to
> send a separate fix patch.

Fixed in my tree.

> Thanks
> Vivek
>=20
> >=20
> > Otherwise looks good to me.
> >=20
> > Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks!

Dave

> > Thanks,
> > Masa
> >=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


