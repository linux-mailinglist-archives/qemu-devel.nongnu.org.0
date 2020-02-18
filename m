Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1116240C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 10:58:21 +0100 (CET)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3ze0-0000vx-W8
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 04:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zXn-00063N-5V
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:51:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zXk-0001sB-6R
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:51:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45396
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zXk-0001s4-2W
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8hgF4nH6AGFLF6POOSr/xF+oxDdr2VqiIMYj0uChNc=;
 b=hPCcg8I+Hk8Mah8MLUi/ma4KzEwjd5iYUqdzrwoxZxUu+q1cvIZ18gRAJBAoQ23Hdk3Bkq
 zquHQvIIg8eUc07ba3+fdCcCavHsKHivrcPs+MAhV0OtnRTzy0WZHY2jzSGh+K2fJmJn4j
 nwTXUFdpZz78pbZJtJ8tFWTfruJjmgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-sUWK5E7ROEqPPXhjhJBEIA-1; Tue, 18 Feb 2020 04:51:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A898010E5
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 09:51:47 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21DEA19481;
 Tue, 18 Feb 2020 09:51:40 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:51:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 3/3] tools/virtiofsd/fuse_lowlevel: Fix
 fuse_out_header::error value
Message-ID: <20200218095137.GE3080@work-vm>
References: <20200217094240.9927-1-philmd@redhat.com>
 <20200217094240.9927-4-philmd@redhat.com>
 <20200217200645.GF3434@work-vm>
 <c843c960-3eb2-5f00-e855-372481d0309e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c843c960-3eb2-5f00-e855-372481d0309e@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: sUWK5E7ROEqPPXhjhJBEIA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> On 2/17/20 9:06 PM, Dr. David Alan Gilbert wrote:
> > * Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> > > Fix warning reported by Clang static code analyzer:
> > >=20
> > >      CC      tools/virtiofsd/fuse_lowlevel.o
> > >    tools/virtiofsd/fuse_lowlevel.c:195:9: warning: Value stored to 'e=
rror' is never read
> > >            error =3D -ERANGE;
> > >            ^       ~~~~~~~
> > >=20
> > > Fixes: 2de121f01e
> > > Reported-by: Clang Static Analyzer
> > > Reviewed-by: J=E1n Tomko <jtomko@redhat.com>
> > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >=20
> > Nice, this actually fixes 3db2876
>=20
> Good catch, so this fix can be applied to QEMU (while patch #1 needs
> backport from upstream libfuse), right?

I'll take all 3 into QEMU, libfuse can take it asynchronously.

Dave

> >=20
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
> Thanks.
>=20
> >=20
> > > ---
> > > RFC because untested
> > > ---
> > >   tools/virtiofsd/fuse_lowlevel.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_l=
owlevel.c
> > > index 704c0369b2..2dd36ec03b 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.c
> > > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > > @@ -192,7 +192,7 @@ int fuse_send_reply_iov_nofree(fuse_req_t req, in=
t error, struct iovec *iov,
> > >       if (error <=3D -1000 || error > 0) {
> > >           fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n", error=
);
> > > -        error =3D -ERANGE;
> > > +        out.error =3D -ERANGE;
> > >       }
> > >       iov[0].iov_base =3D &out;
> > > --=20
> > > 2.21.1
> > >=20
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


