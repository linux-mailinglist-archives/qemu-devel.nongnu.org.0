Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490041C88F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 13:53:27 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWf5i-0003ps-Bl
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 07:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWf4Y-0003FD-MJ
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:52:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37793
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWf4W-0003hJ-E8
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588852330;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLdemT+VNc81PgW9e/tmFRApx9eZOiuq0r8Ixs6TCTQ=;
 b=P4S39jldO7Mg13OSRt4vnQ/ySVchuN4wT0Yao6sbkAg4Gy+Ro67Q2OetFa9UTAksAIvjaU
 Lm8Z/xEVhdGTcq64G/TQ/tZ+yU2phLrTqAijGsWf59X5nJUqkKuZ1qeDZKQtwN/BBriQ4G
 ohkGAR6wqcY27i2iZIpV3baXyt83z68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-CTZMv696OZyFwcZagR0c3g-1; Thu, 07 May 2020 07:52:08 -0400
X-MC-Unique: CTZMv696OZyFwcZagR0c3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DA13107B0E1;
 Thu,  7 May 2020 11:52:07 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 210BB62A42;
 Thu,  7 May 2020 11:52:04 +0000 (UTC)
Date: Thu, 7 May 2020 12:52:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [Qemu-devel] [PATCH V2 4/4] hw/tpm: fix usage of bool in tpm-tis.c
Message-ID: <20200507115201.GA1120808@redhat.com>
References: <1553351197-14581-1-git-send-email-cafer.abdi@gmail.com>
 <1553351197-14581-5-git-send-email-cafer.abdi@gmail.com>
 <a467e1f5-b104-ae69-8ea0-10c05f1263cf@redhat.com>
 <471c060c-2abc-50e9-1a51-871ab62185ea@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <471c060c-2abc-50e9-1a51-871ab62185ea@linux.ibm.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Jafar Abdi <cafer.abdi@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, stefanha@gmail.com,
 qemu-devel@nongnu.org, jusual@mail.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping, again, for either qemu-trivial or TPM maintainers to take this
patch.

The other three in this series are merged, but this TPM patch is
still pending.

On Tue, Mar 26, 2019 at 09:55:24AM -0400, Stefan Berger wrote:
> On 3/24/19 3:41 PM, Thomas Huth wrote:
> > On 23/03/2019 15.26, Jafar Abdi wrote:
> > > Clean up wrong usage of FALSE and TRUE in places that use "bool" from=
 stdbool.h.
> > >=20
> > > FALSE and TRUE (with capital letters) are the constants defined by gl=
ib for
> > > being used with the "gboolean" type of glib. But some parts of the co=
de also use
> > > TRUE and FALSE for variables that are declared as "bool" (the type fr=
om <stdbool.h>).
> > >=20
> > > Signed-off-by: Jafar Abdi <cafer.abdi@gmail.com>
> > > ---
> > >   hw/tpm/tpm_tis.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> > > index fd183e8..c1eb094 100644
> > > --- a/hw/tpm/tpm_tis.c
> > > +++ b/hw/tpm/tpm_tis.c
> > > @@ -611,7 +611,7 @@ static void tpm_tis_mmio_write(void *opaque, hwad=
dr addr,
> > >               while ((TPM_TIS_IS_VALID_LOCTY(s->active_locty) &&
> > >                       locty > s->active_locty) ||
> > >                       !TPM_TIS_IS_VALID_LOCTY(s->active_locty)) {
> > > -                bool higher_seize =3D FALSE;
> > > +                bool higher_seize =3D false;
> > >                   /* already a pending SEIZE ? */
> > >                   if ((s->loc[locty].access & TPM_TIS_ACCESS_SEIZE)) =
{
> > > @@ -621,7 +621,7 @@ static void tpm_tis_mmio_write(void *opaque, hwad=
dr addr,
> > >                   /* check for ongoing seize by a higher locality */
> > >                   for (l =3D locty + 1; l < TPM_TIS_NUM_LOCALITIES; l=
++) {
> > >                       if ((s->loc[l].access & TPM_TIS_ACCESS_SEIZE)) =
{
> > > -                        higher_seize =3D TRUE;
> > > +                        higher_seize =3D true;
> > >                           break;
> > >                       }
> > >                   }
> > >=20
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> >=20
>=20
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


