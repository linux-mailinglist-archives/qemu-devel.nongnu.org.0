Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8284E66BB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 17:14:30 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXQ6X-0008Aa-CJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 12:14:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXPzx-0003rl-U4
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 12:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXPzu-0001Xm-Od
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 12:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648138058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ta4wMxhiPt93oGeazvrdnZ/iXw33aMvBOXSL8yzopk0=;
 b=KwA2HESD7KunFP/GJsc6ZpFhVj5PMFpI0rQ2uqpWnzq0tbKWfMi72P/ESiCz2chuKF/2aF
 o0gXl6oXuJ++wbmfWDYEfgYM6qFUFbWKBplRk3/UpAPlSjehAcKDR2vuYZdoz4dcUqOIZv
 zZ5qPvzOrq5Bok676vA+qh8/DMljh/U=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-yJvqb6RbMi6JSKF1eqaW7Q-1; Thu, 24 Mar 2022 12:07:35 -0400
X-MC-Unique: yJvqb6RbMi6JSKF1eqaW7Q-1
Received: by mail-vs1-f72.google.com with SMTP id
 n7-20020a0561020a8700b00322bc971ed4so1064853vsg.15
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 09:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ta4wMxhiPt93oGeazvrdnZ/iXw33aMvBOXSL8yzopk0=;
 b=edaI/BCY2uFoV07/Ymd7UsToyGDVbMXvUosAy9GZljyNeJKPReqsU8SWZybpl9kBr+
 txt5RMTmfGBysVMw6zI4gszY93NuNYVNA+zrAnWUcgWYuKv0fzWVWSMXNtiiweX4yTdt
 bz2/hSjEeVWQevWf0SHNkHn/lctJenV05zrINOO8xbsn0z3WnuTrrIDD63LmCiFAQUml
 qNDMya/zzr/RKuOYj9KG02vkgI8Ax2vHQL5EvH+btwXyTwfT0dr4ck0EJV5x55A9fTen
 p65g7X9ThvGehn/rQNxRYoN/1Nfh/G+JFGeJmjQrMHVAXf8kNuzPDysIpD1JcTZxEmhu
 2JrA==
X-Gm-Message-State: AOAM531rTywhN5kqS20SH15ebD4Xo6uF9C+bhlyvt4uKPR6WDiAZBckr
 t4/55HSzRvXR0vpPDMfsdJWoHzwdb9CNtKQyVbjmlMZzsLoX6Us2sj77VcUfr0fJ0rwLVADPBtu
 TgpRw202qEyEBEUSf79/rzDxjNJxtS5M=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3022318vst.11.1648138055294; 
 Thu, 24 Mar 2022 09:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcmddFYEhzoA1j0nxkon/etNaZKQKyxRC7YqzfLQozP970dhtmlNnuhbZeErk0zxRF5I/i8vLCKrdD5Ubw5EU=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3022292vst.11.1648138054937; Thu, 24
 Mar 2022 09:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
 <CAFn=p-Zj24yJYvPTpnXLA3wG-Fm8okVTXM-QG0rSAjp3AJuCvQ@mail.gmail.com>
 <YjyNcDjRLWZGiEwU@redhat.com>
In-Reply-To: <YjyNcDjRLWZGiEwU@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 12:07:24 -0400
Message-ID: <CAFn=p-aAfEABN3E7in78HEWhSV3ywVzDGiB-aHaPU2an3e9qfw@mail.gmail.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 11:25 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Mar 24, 2022 at 11:03:12AM -0400, John Snow wrote:
> > On Thu, Mar 24, 2022, 5:03 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> > wrote:
> >
> > > On Thu, Mar 24, 2022 at 09:00:05AM +0000, Daniel P. Berrang=C3=A9 wro=
te:
> > > > I've not fully audited the git history, but what little I've looked
> > > > at, the relicensing doesn't look too hard. The overwhealming majori=
ty
> > > > of code was by @redhat.com authors, so we can cope with that fairly
> > > > easily. There are a handful of other contributors still around in
> > > > QEMU, and some of the patches are so trivial you couldn't claim
> > > > copyright on them ie where adding 1 parameter to a method call is
> > > > literally the only possible way you could implmenent the change.
> > > > It is never fun to contact everyone, but it looks viable.
> > > >
> > > > > (2) Re-licensing async QMP as GPLv2+. (Next patch)
> > > > >
> > > > > (3) Someday, eventually, adding a different sync interface that
> > > > > doesn't re-mix this specific compatibility interface and will pro=
vide
> > > > > better event-waiting primitives and so on. legacy.py will get dro=
pped
> > > > > at that point and the sub-project will become wholly GPLv2+. Unti=
l
> > > > > then, it will be mixed.
> > > >
> > > > Overall making it *all* GPLv2+ compat is going to be important if y=
ou
> > > > want people to be comfortable using it. If it has a mix of GPLv2+
> > > > and GPLv2-only code in the source tarball, then the overall combine=
d
> > > > work will have to be considered GPLv2-only and that will put people
> > > > off using it. Even if they could theoreticallly restrict their usag=
e
> > > > to only the GPLv2+ parts, many won't get that far before moving on.
> > >
> >
> > I agree. Just a matter of which intermediate states we'll see enroute.
> >
> >
> > > Actually I'll go furthuer and suggest that if we're going to do a
> > > relicensing at all, and your goal is to encourage usage, then GPLv2+
> > > is the wrong choice. Use LGPLv2+ if you want to facilitate usage, whi=
le
> > > retaining a copyleft license.
> > >
> >
> > Same question as Andrea. Does the linking exception matter for Python? =
(The
> > lawyer seemed to intuit to me that it was somewhat untested. I don't th=
ink
> > the answer was clear.)
> >
> > I have no opposition towards LGPL whatsoever, so I guess if it doesn't =
hurt
> > anything I can just do that instead.
>
> Let us contemplate two scenarios
>
>  - GPL vs LGPL  *does* make a legal difference for Python, in the
>    same way it does for C
>
>       =3D> Using LGPL over GPL is therefore a benefit for QEMU users
>
>  - GPL vs LGPL does *not* make  a legal difference for Python, in
>    the same way it does for C
>
>       =3D> Using LGPL over GPL makes zero differnce for QEMU users
>
> In the absence of information that can confidently predict
> which scenario applies, then the right answer is to pick LGPL.
> It might be a benefit, and if no, it has no downside [1].
>
>
> [1] Yes, there could be some subtle reason why LGPL is worse
>     than GPL in Python than in C, but I've not seen sign of
>     that being raised, and I have seen plenty of POVs saying
>     LGPL is still a benefit.
>
> > (The lawyer did suggest that MIT was likely the absolute most compatibl=
e
> > license I could choose here; but I'm unsure I want to open the floodgat=
es
> > that wide without strong reason. MIT feels like an off-ramp out of open
> > source, and I like to avoid it when possible. That said, the point of t=
his
> > package is to get people to use QEMU and drive them towards our GPL pro=
ject
> > and ecosystem, so... Maybe MIT would be reasonable. Still, if this
> > component grows in complexity and becomes integrated into a commercial
> > product, I'd be *pretty upset* if any improvements were not published f=
or
> > everyone to benefit from. I think that's why I lean GPL, even though I =
want
> > to maximize use.)
>
> Yep, as I mentioned, I don't want to see us abandon copyleft either.
>
> Of course everyone has their own preferred license, so I'm sure
> people who write apps with MIT, will think we should use MIT
> too. Ultimately though, if we choose LGPL, they can still use
> our module from an MIT licensed app, or any other licensed app
> for that matter.
>

OK, thanks for your input here. My plan right now, then, is:

(1) Relicense aqmp as LGPLv2+
(2) Fork into new repo as discussed previously on qemu-devel
(3) Work on dropping legacy.py (GPLv2) in favor of sync.py (LGPLv2+)

I plan to version the fledgling forked repo as 0.0.z until I drop
legacy.py, and then I'll version as 0.y.z for "a while", (A release or
two for QEMU?), and then tag v1.0.0.
(As we discussed earlier, with a non-finalized API, I'll be pinning
QEMU to use specific versions until it stabilizes.)

I think you're right that we probably could relicense legacy.py
without too much fuss, I think the most significant contributions that
didn't come from Luiz or myself were made to docstrings, and only
extremely few contributions came from non-RH addresses. Still, I plan
to drop the whole file anyway, so I figured I'd side-step the
relicensing justification there, even if it's doable.

--js


