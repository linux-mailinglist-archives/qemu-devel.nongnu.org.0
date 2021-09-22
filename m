Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724FA41518D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:43:19 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT95K-0001ql-Hk
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT93W-0000Tu-Qt
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT93R-0006MA-6Y
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632343280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9oelikejYOqj3gjikOoDhLNQ+YssP9xCdxMHWMwWk8U=;
 b=AkzN2wyGnpz1k2QaqgxOgnanXrAAXeC3XcC8IeuGytwPL2h4m7eV7nelffH0L4XbAqmZsR
 vrB8TUZsnbmlVZeKj2cEEDzXMx+OyxLxqu36giZIJ5v4J3A3tmu+rB7FPW4QHlEqZ1uVWp
 iNgEqn0HER3rlpVBrjiMGRQ2km+HAU0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-sa5_hYQyMsClWqg6GIxrCw-1; Wed, 22 Sep 2021 16:41:18 -0400
X-MC-Unique: sa5_hYQyMsClWqg6GIxrCw-1
Received: by mail-ot1-f71.google.com with SMTP id
 t26-20020a9d749a000000b00547047a5594so1863582otk.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 13:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9oelikejYOqj3gjikOoDhLNQ+YssP9xCdxMHWMwWk8U=;
 b=WiBjVyZpz6xnD39+uM6PoR4d0oYwemFye41B0nX4YIZoGq9KJ4MDzC8pFW7dOjbfDS
 6sy43/vAb3z1Wd+doEbxEjBhEYDWKTww13kQ6v4qjoqNKrZVZvtxpNp+jzYPwljFSula
 Ixi4U9ssBC4M1MFcvwxN08COultRLH74pX0tI8/T/PjV52oEeZz/lU1Nn4voiuGkktfn
 mS0Cyb1liz04AnXa8PdUOVoaebSRdLd+iqjMw3tgwDTiqOTjXI84ieJ5pwPjIiar36/b
 fCYiFpIQCX1HQb4pprJ8Bi/KTsL2QkcxddgHQJaZcGyykqOgTwWqA0RzpOKPscLvytE9
 CyzA==
X-Gm-Message-State: AOAM530iKjqBArphbumuDIulIk0/i0XJpn31XbXT6I4zSOkRip+nV7ho
 qSOQF7Xujak0i+NEXstzV/5ihbms26IfAXMuCpg0ECqQ8eknIHmtDbj8AKs5gRPx7XnNhSF0zYJ
 j9HnH6usH14ZYF67OkoUvkZ5x4eH4o5M=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr996384otj.129.1632343277973;
 Wed, 22 Sep 2021 13:41:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1GyUEE58bK/I7g3VaM3Dj3Lu/2Bbu+V03jSBrIL3KuVnoUBLWXK7xx2QVz2IUonXbW8TGSIM1WsVK3Bmzg2k=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr996371otj.129.1632343277820;
 Wed, 22 Sep 2021 13:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-17-jsnow@redhat.com>
 <2235c3ee-0987-c6e2-1929-7785c74db286@redhat.com>
In-Reply-To: <2235c3ee-0987-c6e2-1929-7785c74db286@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 16:41:07 -0400
Message-ID: <CAFn=p-YcS4z2Nt1kHcstYfCnzGaivqSwJ8qjjERT6QRn0iuMfg@mail.gmail.com>
Subject: Re: [PATCH v3 16/16] iotests/linters: check mypy files all at once
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000039f1c005cc9b899b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000039f1c005cc9b899b
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 7:23 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 16.09.21 06:09, John Snow wrote:
> > We can circumvent the '__main__' redefinition problem by passing
> > --scripts-are-modules. Take mypy out of the loop per-filename and check
> > everything in one go: it's quite a bit faster.
>
> Is it possible to pull this to the beginning of the series?  Just
> because patch 14 has to make everything quite slow (which might be a
> tiny nuisance in bisecting some day?).
>
>
Reasonable. Yes.

--js

>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/linters.py | 62 ++++++++++++++++-------------------
> >   1 file changed, 29 insertions(+), 33 deletions(-)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>

--00000000000039f1c005cc9b899b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 7:23 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16.09.2=
1 06:09, John Snow wrote:<br>
&gt; We can circumvent the &#39;__main__&#39; redefinition problem by passi=
ng<br>
&gt; --scripts-are-modules. Take mypy out of the loop per-filename and chec=
k<br>
&gt; everything in one go: it&#39;s quite a bit faster.<br>
<br>
Is it possible to pull this to the beginning of the series?=C2=A0 Just <br>
because patch 14 has to make everything quite slow (which might be a <br>
tiny nuisance in bisecting some day?).<br>
<br></blockquote><div><br></div><div>Reasonable. Yes.<br></div><div>=C2=A0<=
/div><div>--js <br></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 62 ++++++++++++++++-------=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 29 insertions(+), 33 deletions(-)<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--00000000000039f1c005cc9b899b--


