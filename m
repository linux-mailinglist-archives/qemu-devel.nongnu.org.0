Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA9514FEB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:52:35 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSv4-00084Q-RY
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nkSrB-00089G-DC
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nkSr9-0001cR-Iv
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osu+5IbKEEmTBIJillziYCmMpwN8RJpfaMesLPpgQT4=;
 b=X68KRVm78yjqsRBFrRniImWs7UGVHfyfVpHE+uy4bNt4cn4jcV99Texn3yfK21dFfV2Ma0
 ZVgtJHd6gPrrhn3tFb/sJqWeGFBhnL6Bog8JLNk+0yDq/8gGqaHci54E/IwFnJMWFWn9q3
 VFXOlTpedodUZ4GHAW+627vCn1bpdEk=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-FL4Liyq-Nk6g7U7BFQWtZQ-1; Fri, 29 Apr 2022 11:48:29 -0400
X-MC-Unique: FL4Liyq-Nk6g7U7BFQWtZQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 d127-20020a1fe685000000b0033e7682a9c0so1118378vkh.3
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=osu+5IbKEEmTBIJillziYCmMpwN8RJpfaMesLPpgQT4=;
 b=f40kba9YFHipc73Z4C4q8wvTDBpdFDvFCNE765Vf6QE+g3xtzhO/zLIEoOXDavnxGv
 K74nMrjEHejj1oLiZji1ajly//l3aXb25lBDRr6cHKmWNNvew2HyQWLezkzY928OXQGv
 DvMNNx6KNMLgktKihq0xk3gJPTLjY8ebrWXplOL9w3J7d8VQc55PNNiOUC1jKkM4IQn+
 i5xScyuTs7de3BPUiqJr5CQFjcSmZVHIy+qQ3ieJmLcQn2CNx7PBbPzV7ZvEMUyYeobq
 rMcZYQCZesXVxDHzuWo72tW1PEexkZHbYkXOyMwoVytDb6/f2BJjbvophkuX0bMtBs31
 gLDA==
X-Gm-Message-State: AOAM533JVEGNS06HUlTMPqZ7h0mznqBOhhfbqFffGETLPbRUCwS2glHr
 8lpGGaYpBk0nOLPpZXHqXiSMF8w7SVDIQVVxHsUNPPCFbCRhqHno7T3lHbkZvHgY0Qv+66X9g4E
 JLljWchA7z3VlgEeRvLV3PDFawicV5sc=
X-Received: by 2002:a05:6122:f09:b0:34e:40bd:cc4 with SMTP id
 bn9-20020a0561220f0900b0034e40bd0cc4mr2039034vkb.26.1651247308798; 
 Fri, 29 Apr 2022 08:48:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygyrLyZWQQKIDxHpw8CWvQ6GbEERfLSF3YO2cR0jVG4sjavM+ECo1al4NBT8XHYDPjD22qdT1STfyJomGGmmY=
X-Received: by 2002:a05:6122:f09:b0:34e:40bd:cc4 with SMTP id
 bn9-20020a0561220f0900b0034e40bd0cc4mr2039024vkb.26.1651247308559; Fri, 29
 Apr 2022 08:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-5-jsnow@redhat.com>
 <20220429140629.b3swm26lc3olfhlw@laptop.redhat>
In-Reply-To: <20220429140629.b3swm26lc3olfhlw@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Fri, 29 Apr 2022 11:48:18 -0400
Message-ID: <CAFn=p-Zu2LB6m6z2ynVkH8pnorhTN6cGJksjdACg_MdKDqU4tw@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 04/12] update project URLs
To: Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 10:06 AM Beraldo Leal <bleal@redhat.com> wrote:
>
> On Fri, Apr 22, 2022 at 02:49:32PM -0400, John Snow wrote:
> > Point to this library's URLs instead of the entire project's.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  setup.cfg | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/setup.cfg b/setup.cfg
> > index c21f2ce..0a1c215 100644
> > --- a/setup.cfg
> > +++ b/setup.cfg
> > @@ -5,8 +5,8 @@ author =3D QEMU Project
> >  author_email =3D qemu-devel@nongnu.org
> >  maintainer =3D John Snow
> >  maintainer_email =3D jsnow@redhat.com
> > -url =3D https://www.qemu.org/
> > -download_url =3D https://www.qemu.org/download/
> > +url =3D https://gitlab.com/qemu-project/python-qemu-qmp
> > +download_url =3D https://gitlab.com/qemu-project/python-qemu-qmp/-/pac=
kages
>
> Afaik (and I might be wrong), it seems that download_url is not
> recommended nowadays. External downloads got removed due to some abuse
> and problems.
>
> I remember reading about some changes in the distribution of Python
> packages in PyPi where, by default, PyPi will not parse and expose
> "download_url" for newly registered packages anymore. From PEP438:
>
> "Many package uploaders are not aware that specifying the =E2=80=9Chomepa=
ge=E2=80=9D or
> =E2=80=9Cdownload-url=E2=80=9D in their package metadata will needlessly =
slow down the
> installation process for all users."
>
> Please take this comment with a grain of salt, I'm not 100% sure about
> this and I might be missing something.
>

Neat. Good reference on PEP438. It was superseded:
https://peps.python.org/pep-0470/ ... but I am under the impression
that pip does not have this behavior anymore. Maybe I'm wrong? I
wasn't writing Python in 2014.

Though, I didn't realize that this field was *ever* used for external
download links by package managers. Fun. I'll have to do some reading,
but maybe I'll just remove the field for now, thanks for bringing this
to my attention.

--js


