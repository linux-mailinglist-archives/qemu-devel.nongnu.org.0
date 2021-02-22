Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD24321230
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:44:51 +0100 (CET)
Received: from localhost ([::1]:43856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6pm-00018o-GD
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lE6le-0005dT-PJ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lE6lb-00046E-Lu
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613983229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp8Ir18XdEFq8yMY183Erx1ipE7ib8JNuVWwLD7Hc/4=;
 b=bkwT2jfBIbp0LAU/gFqKdAwxQsy4FQP/VBwQWN0EBHz596m82SzSGQtpAVt0jyc3bGXDeH
 TXsRBN3RVvC8XaHT3vl2bHDllF241nr7RhTHcd1sKIZbZjWrC7+7RZiZwbHTydiRkIlA8/
 +cm8dS3T2ClDaT3vL1O2YFQYbM0KjQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-z9xtmn6NM6KQrnCyZSUh2w-1; Mon, 22 Feb 2021 03:40:27 -0500
X-MC-Unique: z9xtmn6NM6KQrnCyZSUh2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5D7A192AB79;
 Mon, 22 Feb 2021 08:40:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6C51001281;
 Mon, 22 Feb 2021 08:40:26 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DD514E58D;
 Mon, 22 Feb 2021 08:40:26 +0000 (UTC)
Date: Mon, 22 Feb 2021 03:40:06 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <1306072831.56396199.1613983206292.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAC_L=vVoqVdetQfxDdvb=v9einKj+mhNs=p7Vybh1D6OgR1FvQ@mail.gmail.com>
References: <20210122180029.575284-1-cohuck@redhat.com>
 <20210129162719.7438dea2.cohuck@redhat.com>
 <20210208181745.1ac08f12.cohuck@redhat.com>
 <29651c01-6e9d-c7ef-def8-96dc75b00a3a@redhat.com>
 <a8e4d6ee-cc78-75d8-d626-705477dfd134@redhat.com>
 <CAC_L=vVoqVdetQfxDdvb=v9einKj+mhNs=p7Vybh1D6OgR1FvQ@mail.gmail.com>
Subject: Re: [PATCH RFC] pvrdma: wean code off pvrdma_ring.h kernel header
MIME-Version: 1.0
X-Originating-IP: [10.72.12.244, 10.4.195.26]
Thread-Topic: pvrdma: wean code off pvrdma_ring.h kernel header
Thread-Index: fDYjdeYciwU8egUsfP4Mv4GFbcESFw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 -----
> Hi Jason.
>=20
> On Tue, Feb 9, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wrote:
>=20
> >
> > On 2021/2/9 =E4=B8=8A=E5=8D=881:28, Paolo Bonzini wrote:
> > > On 08/02/21 18:17, Cornelia Huck wrote:
> > >> On Fri, 29 Jan 2021 16:27:19 +0100
> > >> Cornelia Huck <cohuck@redhat.com> wrote:
> > >>
> > >>> On Fri, 22 Jan 2021 19:00:29 +0100
> > >>> Cornelia Huck <cohuck@redhat.com> wrote:
> > >>>
> > >>>> The pvrdma code relies on the pvrdma_ring.h kernel header for some
> > >>>> basic ring buffer handling. The content of that header isn't very
> > >>>> exciting, but contains some (q)atomic_*() invocations that (a)
> > >>>> cause manual massaging when doing a headers update, and (b) are
> > >>>> an indication that we probably should not be importing that header
> > >>>> at all.
> > >>>>
> > >>>> Let's reimplement the ring buffer handling directly in the pvrdma
> > >>>> code instead. This arguably also improves readability of the code.
> > >>>>
> > >>>> Importing the header can now be dropped.
> > >>>>
> > >>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > >>>> ---
> > >>>>
> > >>>> Compile-tested only, needs both testing and more eyeballs :)
> > >>>
> > >>> Friendly ping :)
> > >>>
> > >>> Suggestions for a test setup to do some sanity checks (that does no=
t
> > >>> require special hardware) also welcome.
> > >>
> > >> Can I interest anyone in this? I'd be happy doing sanity tests mysel=
f,
> > >> but I have a hard time figuring out even where to start...
> > >
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > >
> > > Jason, Michael, are you going to pick this up?
> > >
> > > Paolo
> >
> >
> > I will queue this.
> >
>=20
>=20
> Have you picked it up? It will be great so I'll not send a PR with a sing=
le
> patch...
> BTW, Yuval tested and acked the patch.

Plan to send a pull request this Friday.

It should be part of that.

Thanks

>=20
> Thanks,
> Marcel
>=20
> [...]
>=20
>=20
> >
> >
>=20


