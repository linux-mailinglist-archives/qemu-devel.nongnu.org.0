Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1447307800
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:29:27 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58IY-0007Xq-O9
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l58GA-0006Nf-4b
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:26:58 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:60373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l58G3-00024T-Jj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:26:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 385E886B799C;
 Thu, 28 Jan 2021 15:26:44 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 15:26:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003146736e0-d751-4e3a-b0d6-f14b669fdd39,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 15:26:41 +0100
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
Message-ID: <20210128152641.0e9d5fa0@bahia.lan>
In-Reply-To: <CAOssrKff8FyC0i+Q1MY0paEiXdARp2=vkSnTwNHZxpntyV7oxA@mail.gmail.com>
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
 <20210127112023.0e97f909@bahia.lan>
 <CAOssrKfezsvcECQ=mO_4T2B09e+2S4LA3=_U6TQyiTtPbE=OYg@mail.gmail.com>
 <20210127144909.22dd778e@bahia.lan>
 <CAOssrKeN9iYT-Z46FVtzdKnWcTLfMqK77b1faf78m3XTXnEVGw@mail.gmail.com>
 <20210127160920.062e47f0@bahia.lan>
 <CAOssrKc=kSQQLmrAR2VrKfDzkyNDEAAa5qusK1x6+-fCM4+yCA@mail.gmail.com>
 <20210127163524.4e34596d@bahia.lan>
 <CAOssrKcbymmsVtU=jMMcE=K1T9oC=NmOzt3aSCe27K7TxXF61A@mail.gmail.com>
 <CAOssrKfGuDOoJKvia4yLcYy7udYDHHs-EtFeEvjrfKiV9UkLPw@mail.gmail.com>
 <20210128131454.2f66ed21@bahia.lan>
 <CAOssrKff8FyC0i+Q1MY0paEiXdARp2=vkSnTwNHZxpntyV7oxA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4c74b3c3-0853-4f2d-823a-f707468303ea
X-Ovh-Tracer-Id: 14529456826062903599
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedvveeugeeiveefgeefleehfeevleetvefhgfffteeuudeftdeiueeuieevkeeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvhhgohihrghlsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 15:00:58 +0100
Miklos Szeredi <mszeredi@redhat.com> wrote:

> On Thu, Jan 28, 2021 at 1:15 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > On Wed, 27 Jan 2021 16:52:56 +0100
> > Miklos Szeredi <mszeredi@redhat.com> wrote:
> >
> > > On Wed, Jan 27, 2021 at 4:47 PM Miklos Szeredi <mszeredi@redhat.com> wrote:
> > > >
> > > > On Wed, Jan 27, 2021 at 4:35 PM Greg Kurz <groug@kaod.org> wrote:
> > > > >
> > > > > On Wed, 27 Jan 2021 16:22:49 +0100
> > > > > Miklos Szeredi <mszeredi@redhat.com> wrote:
> > > > >
> > > > > > On Wed, Jan 27, 2021 at 4:09 PM Greg Kurz <groug@kaod.org> wrote:
> > > > > > >
> > > > > > > On Wed, 27 Jan 2021 15:09:50 +0100
> > > > > > > Miklos Szeredi <mszeredi@redhat.com> wrote:
> > > > > > > > The semantics of O_CREATE are that it can fail neither because the
> > > > > > > > file exists nor because it doesn't.  This doesn't matter if the
> > > > > > > > exported tree is not modified outside of a single guest, because of
> > > > > > > > locking provided by the guest kernel.
> > > > > > > >
> > > > > > >
> > > > > > > Wrong. O_CREAT can legitimately fail with ENOENT if one element
> > > > > >
> > > > > > Let me make my  statement more precise:
> > > > > >
> > > > > > O_CREAT cannot fail with ENOENT if parent directory exists throughout
> > > > > > the operation.
> > > > > >
> > > > >
> > > > > True, but I still don't see what guarantees guest userspace that the
> > > > > parent directory doesn't go away... I must have missed something.
> > > > > Please elaborate.
> > > >
> > > > Generally there's no guarantee, however there can be certain
> > > > situations where the caller can indeed rely on the existence of the
> > > > parent (e.g. /tmp).
> > >
> > > Example from the virtiofs repo:
> > >
> > > https://gitlab.com/virtio-fs/ireg/-/blob/master/ireg.c#L315
> > > https://gitlab.com/virtio-fs/ireg/-/blob/master/ireg.c#L382
> > >
> > > In that case breaking O_CREAT would be harmless, since no two
> > > instances are allowed anyway, so it would just give a confusing error.
> > > But it is breakage and it probably wouldn't be hard to find much worse
> > > breakage in real life applications.
> > >
> >
> > Ok, I get your point : a guest userspace application can't expect
> > to hit ENOENT when doing open("/some_dir/foo", O_CREAT) even if
> > someone else is doing unlink("/some_dir/foo"), which is a different
> > case than somebody doing rmdir("/some_dir").
> >
> > But we still have a TOCTOU : the open(O_CREAT|O_EXCL) acts as
> > the check to use open(O_PATH) and retry+timeout can't fix it
> > reliably.
> 
> Right.
> 
> > A possible fix for the case where the race comes from the
> > client itself would be to serialize FUSE requests that
> > create/remove paths in the same directory. I don't know
> > enough the code yet to assess if it's doable though.
> >
> > Then this would leave the case where something else on
> > the host is racing with virtiofsd. IMHO this belongs to
> > the broader family of "bad things the host can do
> > in our back". This requires a bigger hammer than
> > adding band-aids here and there IMHO. So in the
> > scope of this patch, I don't think we should retry
> > and timeout, but just return whatever errno that
> > makes sense.
> 
> I never suggested a timeout, that would indeed be nonsense.
> 

Yeah sorry for that, by timeout I was lazily expressing "retry
a bit and bail out if it doesn't work".

> Just do a simple retry loop with a counter.  I'd set counter to a
> small number (5 or whatever), so that basically any accidental races
> are cared for, and the only case that would trigger the EIO is if the
> file was constantly removed and recreated (and even in that case it
> would be pretty difficult to trigger).  This would add only minimal
> complexity or overhead.
> 

I still don't like the counter thing very much but I can't think of
anything better that _works_ in all cases in the short term... so be
it.

> The proper solution might be adding O_REGULAR, and it actually would
> be useful for other O_CREAT users, since it's probably what they want
> anyway (but existing semantics can't be changed).
> 

Yeah only the kernel can handle this race gracefully and O_REGULAR
would be great, but it might take some time until this percolates
up to QEMU.

> Thanks,
> Miklos
> 


