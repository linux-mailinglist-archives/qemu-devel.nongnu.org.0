Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBE4BFDC3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:53:27 +0100 (CET)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXTi-000070-9h
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:53:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nMXNt-0000iN-Gw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:47:25 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:57722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nMXCY-0006o8-Ii
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:35:44 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-4UKBWnNJOeuUY2RIMH1ROQ-1; Tue, 22 Feb 2022 10:35:29 -0500
X-MC-Unique: 4UKBWnNJOeuUY2RIMH1ROQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FA4F1091DA0;
 Tue, 22 Feb 2022 15:35:28 +0000 (UTC)
Received: from bahia (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0471086489;
 Tue, 22 Feb 2022 15:35:27 +0000 (UTC)
Date: Tue, 22 Feb 2022 16:35:25 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PULL v2 5/5] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220222163525.0f198199@bahia>
In-Reply-To: <3196572.21YWrCmDqH@silver>
References: <cover.1645114783.git.qemu_oss@crudebyte.com>
 <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5.1645114783.git.qemu_oss@crudebyte.com>
 <CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com>
 <3196572.21YWrCmDqH@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 14:54:17 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 22. Februar 2022 14:21:52 CET Peter Maydell wrote:
> > On Thu, 17 Feb 2022 at 16:43, Christian Schoenebeck
> >=20
> > <qemu_oss@crudebyte.com> wrote:
> > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > index d1660d67fa..ce12f64853 100644
> > > --- a/include/qemu/osdep.h
> > > +++ b/include/qemu/osdep.h
> > > @@ -805,6 +805,19 @@ static inline int
> > > platform_does_not_support_system(const char *command)>=20
> > >  }
> > >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > >=20
> > > +/**
> > > + * Duplicate directory entry @dent.
> > > + *
> > > + * It is highly recommended to use this function instead of open cod=
ing
> > > + * duplication of @c dirent objects, because the actual @c struct @c
> > > dirent + * size may be bigger or shorter than @c sizeof(struct dirent=
)
> > > and correct + * handling is platform specific (see gitlab issue #841)=
.
> > > + *
> > > + * @dent - original directory entry to be duplicated
> > > + * @returns duplicated directory entry which should be freed with
> > > g_free()
> > > + */
> > > +struct dirent *qemu_dirent_dup(struct dirent *dent);
> >=20
> > Hi; I just noticed this has landed in git recently.
> > Please don't add new prototypes to osdep.h -- it is
> > a header included by every single C file in the tree, so
> > making it bigger slows down compilation. osdep.h is supposed
> > to contain only:
> >  * things which everybody needs
> >  * things without which code would work on most platforms but
> >    fail to compile or misbehave on a minority of host OSes
> >    (ie system incompatibility handling)
> >=20
> > This prototype is neither of those -- please find or create a more
> > appropriate header file for it, that can be included only by the
> > source files that actually need it.
> >=20
> > thanks
> > -- PMM
>=20
> Good to know, because the pending Darwin series would have added stuff to=
=20
> osdep.h as well:
> https://lore.kernel.org/qemu-devel/20220220165056.72289-10-wwcohen@gmail.=
com/
>=20
> We'll find a different place.
>=20

I suggest you move all that under hw/9pfs for now since it is
the only user and we don't really know if there will ever be
a new one (especially now that development on C virtiofsd is
slowing down).

Cheers,

--
Greg


> Thanks!
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


