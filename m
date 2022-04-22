Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBAE50B4A4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:05:53 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqAi-0003tT-5c
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nhq6U-0001Th-D1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:01:32 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nhq6Q-0002Mg-Kz
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650621655; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=6aoZCu+EKBD12SLvNdvRBnrrwnlzAuS1mrM74hWB1Ow=;
 b=R/Hmc/C2c2VrsWfoM/MhR0GuI5xGoz5P4Ll28HL+B/MtfPhHGyUHysDOIIv6QKY6
 vllw2TTT22V8nIOdS4VxPkipOTfI5paiyyzIEfBZUiTV3u1zoDTlHXds7j1qD2eYGDk
 /ATY3XSfzozkZlRLVBzwLRihWke+/Y4t+i9uii8A=
Received: from localhost (91.110.139.125 [91.110.139.125]) by mx.zoho.com.cn
 with SMTPS id 1650621654232423.1415790057031;
 Fri, 22 Apr 2022 18:00:54 +0800 (CST)
Date: Fri, 22 Apr 2022 11:00:47 +0100
From: Fam Zheng <fam@euphon.net>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20220422100047.GB61339@fam-dell>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
References: <20220421163648.4205-1-faithilikerun@gmail.com>
 <20220422083428.GA61339@fam-dell> <YmJs3gzZ9S1+cPmD@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YmJs3gzZ9S1+cPmD@redhat.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-04-22 09:52, Daniel P. Berrang=E9 wrote:
> On Fri, Apr 22, 2022 at 09:34:28AM +0100, Fam Zheng wrote:
> > On 2022-04-22 00:36, Sam Li wrote:
> > > Linux recently added a new io_uring(7) optimization API that QEMU
> > > doesn't take advantage of yet. The liburing library that QEMU uses
> > > has added a corresponding new API calling io_uring_register_ring_fd()=
.
> > > When this API is called after creating the ring, the io_uring_submit(=
)
> > > library function passes a flag to the io_uring_enter(2) syscall
> > > allowing it to skip the ring file descriptor fdget()/fdput()
> > > operations. This saves some CPU cycles.
> > >=20
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > ---
> > >  block/io_uring.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/block/io_uring.c b/block/io_uring.c
> > > index 782afdb433..5247fb79e2 100644
> > > --- a/block/io_uring.c
> > > +++ b/block/io_uring.c
> > > @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
> > >      }
> > > =20
> > >      ioq_init(&s->io_q);
> > > -    return s;
> > > +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> > > +        /*
> > > +         * Only warn about this error: we will fallback to the non-o=
ptimized
> > > +         * io_uring operations.
> > > +         */
> > > +        error_reportf_err(*errp,
> > > +                         "failed to register linux io_uring ring fil=
e descriptor");
> >=20
> > IIUC errp can be NULL, so let's not dereference it without checking. So=
, just
> > use error_report?
>=20
> Plenty of people will be running kernels that lack the new feature,
> so this "failure" will be an expected scenario. We shouldn't be
> spamming the logs with any error or warning message. Assuming  QEMU
> remains fully functional, merely not as optimized, we should be
> totally silent.

Functionally, that's a very valid point. But performance wise, is it good t=
o
have some visibility of this? Since people use io_uring instead of other
options almost certainly for performance, and here the issue does matter qu=
ite
a bit.

Fam

>=20
> At most stick in a 'trace' point so we can record whether the
> optimization is present.
>=20
> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
>=20


