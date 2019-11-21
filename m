Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BACA105399
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:53:59 +0100 (CET)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXmuE-0004ue-DA
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1iXmsR-00036M-AH
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:52:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1iXmsM-0003zM-0y
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:52:06 -0500
Received: from relay64.bu.edu ([128.197.228.104]:40100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1iXmsL-0003xp-Td
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:52:01 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id xALDp60m025016
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 21 Nov 2019 08:51:12 -0500
Date: Thu, 21 Nov 2019 08:51:06 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 1/2] net: assert that tx packets have
 nonzero size
Message-ID: <20191121135106.kux5bbojnns7bwv7@mozz.bu.edu>
References: <20190722132344.30798-1-alxndr@bu.edu>
 <20190722132344.30798-2-alxndr@bu.edu>
 <d549979a-3482-febc-4dc8-77dae431ad2c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d549979a-3482-febc-4dc8-77dae431ad2c@redhat.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay64.bu.edu id
 xALDp60m025016
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 128.197.228.104
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 191107 1221, Jason Wang wrote:
>=20
> On 2019/7/22 =E4=B8=8B=E5=8D=889:24, Oleinik, Alexander wrote:
> > Virtual devices should not try to send zero-sized packets. The caller
> > should check the size prior to calling qemu_sendv_packet_async.
> >=20
> > Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> > ---
> > v2:
> >    * Improve the comment to explain the rationale for adding the asse=
rt.
> >   net/net.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >=20
> > diff --git a/net/net.c b/net/net.c
> > index 7d4098254f..4ad21df36f 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -741,6 +741,15 @@ ssize_t qemu_sendv_packet_async(NetClientState *=
sender,
> >       size_t size =3D iov_size(iov, iovcnt);
> >       int ret;
> > +    /*
> > +     * Since this function returns the size of the sent packets, and=
 a return
> > +     * value of zero indicates that the packet will be sent asynchro=
nously,
> > +     * there is currently no way to report that a 0-sized packet has=
 been sent
> > +     * successfully. Forbid it for now, and if someone needs this fu=
nctionality
> > +     * later, the API will require a change.
> > +     */
> > +    assert(size);
>=20
>=20
> This probably will make the assertion triggerable from guest. Is this b=
etter
> to warn and return NET_BUFSIZE + 1 here?

Will do. I'll send a v3 out with this change.
Thank you

> Thanks
>=20
>=20
> > +
> >       if (size > NET_BUFSIZE) {
> >           return size;
> >       }
>=20

