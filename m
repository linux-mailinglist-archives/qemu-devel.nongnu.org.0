Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A991C664768
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFI5M-00068V-9c; Tue, 10 Jan 2023 12:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFI5K-00067l-2T
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFI5H-00034g-8e
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673370406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7zBF1l9DZVWA2XrCb9R7aQRaSJS3gclEmswKeLETcU=;
 b=E7eYtgWj6zRG+Pk+jqmvFAIzkE4Ylj0lDLZ+UCCAM8lzy63k5kGVza8OcP30TC8ofxQr8b
 GfLUEZSTF1yeZJKioguzMAfR00X38kyJddbe6vG9OTcYkmXr3FbIliFdsbSJIEhlLSEJgU
 PK26QmDAN94MA4t+4dzMWn/RzJ4kxPM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-S3jbiJ3hPSmVuU8PnwHgyw-1; Tue, 10 Jan 2023 12:06:44 -0500
X-MC-Unique: S3jbiJ3hPSmVuU8PnwHgyw-1
Received: by mail-lf1-f71.google.com with SMTP id
 l15-20020a056512110f00b004b6fe4513b7so4745259lfg.23
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X7zBF1l9DZVWA2XrCb9R7aQRaSJS3gclEmswKeLETcU=;
 b=WRsO762DosYpxjtfxxrkhYIcH3XoP0ZdZm9v/OJVLrgv5mW9cEYZrOT/MYzuiNSVIf
 ptTqMelyvo/DAEHNEYACg4yLiRy8JEIsIKAVwCn+peJ0HgcDNml5U0JPGNfn79qxG37+
 gi6Gx4z4FQuWOMa3E0oJ3ZVGbItIHnjy0yyaoQIdSYsyvrYtEy7Ma423vgzqz/STkV35
 UIxs8LzAB/3Vknj+EW2dNplsd2qaq+BoteRmO/YgS+u3RWYqr1GZRjUlyJghOlH8knfT
 lxlGnhGbKwYjRRw+D3ScFHrOADKN4RJETpvjNQJdR89FfwTPOb+QAV0pI4ByMQguPatg
 0GOQ==
X-Gm-Message-State: AFqh2kpyzxd/Q8NHTeSC30WSfyCdQY8flhSusxjiONLsBo3ld0Zn8aJN
 VNDpAp5ava/tPdu7hde0cl+WPpM9h0wTk88zel23DZB3/bvuRuQ/FQPwE8nbqyax5Nlbs8N8MuA
 dnFLW1o0QRWTtz8SH2r3/MidOb7kUZI4=
X-Received: by 2002:a19:f018:0:b0:4cc:8e53:e698 with SMTP id
 p24-20020a19f018000000b004cc8e53e698mr165161lfc.280.1673370403474; 
 Tue, 10 Jan 2023 09:06:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt4CHI//EMmEV8+/n7piGH65cjH1uAnXaJf7IA1wmZG8CC37kfAz8l5qP2JpJdcumHaw1Wy08zGfX1Hy+D+TYI=
X-Received: by 2002:a19:f018:0:b0:4cc:8e53:e698 with SMTP id
 p24-20020a19f018000000b004cc8e53e698mr165155lfc.280.1673370403222; Tue, 10
 Jan 2023 09:06:43 -0800 (PST)
MIME-Version: 1.0
References: <20220624195252.175249-1-vsementsov@yandex-team.ru>
 <CAFn=p-bzPUmF4YZ-461Tzr9MO_ReotL+wuot2egKW7jQgvaHOw@mail.gmail.com>
 <CAFn=p-bwAXCJnWPj7JwSmN2N52hv7R0p1Fn2GxPpHPpDaDaDHQ@mail.gmail.com>
 <9b5a291e-d8a2-e789-0a87-b923240a3e3a@yandex-team.ru>
In-Reply-To: <9b5a291e-d8a2-e789-0a87-b923240a3e3a@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Tue, 10 Jan 2023 12:06:31 -0500
Message-ID: <CAFn=p-bhDkvrQfYNRyuyx2bu6jKhhfTa85AUw1Ab2xavYh3wXw@mail.gmail.com>
Subject: Re: [PATCH] python: QEMUMachine: enable qmp accept timeout by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000076486f05f1ebe80f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000076486f05f1ebe80f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023, 3:53 AM Vladimir Sementsov-Ogievskiy <
vsementsov@yandex-team.ru> wrote:

> On 7/12/22 00:21, John Snow wrote:
> > On Mon, Jul 11, 2022 at 5:16 PM John Snow <jsnow@redhat.com> wrote:
> >>
> >> On Fri, Jun 24, 2022 at 3:53 PM Vladimir Sementsov-Ogievskiy
> >> <vsementsov@yandex-team.ru> wrote:
> >>>
> >>> I've spent much time trying to debug hanging pipeline in gitlab. I
> >>> started from and idea that I have problem in code in my series (which
> >>> has some timeouts). Finally I found that the problem is that I've used
> >>> QEMUMachine class directly to avoid qtest, and didn't add necessary
> >>> arguments. Qemu fails and we wait for qmp accept endlessly. In gitlab
> >>> it's just stopped by timeout (one hour) with no sign of what's going
> >>> wrong.
> >>>
> >>> With timeout enabled, gitlab don't wait for an hour and prints all
> >>> needed information.
> >>>
> >>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru
> >
> >>> ---
> >>>
> >>> Hi all!
> >>>
> >>> Just compare this
> >>>    https://gitlab.com/vsementsov/qemu/-/pipelines/572232557
> >>> and this
> >>>    https://gitlab.com/vsementsov/qemu/-/pipelines/572526252
> >>>
> >>> and you'll see that the latter is much better.
> >>>
> >>>   python/qemu/machine/machine.py | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> >>> index 37191f433b..01a12f6f73 100644
> >>> --- a/python/qemu/machine/machine.py
> >>> +++ b/python/qemu/machine/machine.py
> >>> @@ -131,7 +131,7 @@ def __init__(self,
> >>>                    drain_console: bool = False,
> >>>                    console_log: Optional[str] = None,
> >>>                    log_dir: Optional[str] = None,
> >>> -                 qmp_timer: Optional[float] = None):
> >>> +                 qmp_timer: float = 30):
> >>>           '''
> >>>           Initialize a QEMUMachine
> >>>
> >>> --
> >>> 2.25.1
> >>>
> >>
> >> Oh, this is because machine.py uses the qmp_timer for *all* timeouts,
> >> and not just the QMP commands themselves, and this relates to the work
> >> Marc Andre is doing with regards to changing the launch mechanism to
> >> handle the race condition when the QEMU launch fails, but the QMP
> >> connection just sits waiting.
> >>
> >> I'm quite of the mind that it's really time to rewrite machine.py to
> >> use the native asyncio interfaces I've been writing to help manage
> >> this, but in the meantime I think this is probably a reasonable
> >> concession and a more useful default.
> >>
> >> ...I think. Willing to take it for now and re-investigate when the
> >> other fixes make it to the tree.
> >>
> >> Reviewed-by: John Snow <jsnow@redhat.com>
> >
> > Oh, keep the type as Optional[float], though, so the timeout can be
> > disabled again, and keeps the type consistent with the qtest
> > derivative class. I've staged your patch with that change made, let me
> > know if that's not OK. Modified patch is on my python branch:
> >
> > Thanks, merged.
> >
>
> Hmm, seems that's lost.. I don't see it neither in master nor in your
> python branch..
>
> --
> Best regards,
> Vladimir
>

:(

I'll fix it. Thanks for resending the iotests series, too - the old version
was at the very top of my inbox :)

>

--00000000000076486f05f1ebe80f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jan 10, 2023, 3:53 AM Vladimir Sementsov-Ogiev=
skiy &lt;<a href=3D"mailto:vsementsov@yandex-team.ru">vsementsov@yandex-tea=
m.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 7/12/22 00:2=
1, John Snow wrote:<br>
&gt; On Mon, Jul 11, 2022 at 5:16 PM John Snow &lt;<a href=3D"mailto:jsnow@=
redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Jun 24, 2022 at 3:53 PM Vladimir Sementsov-Ogievskiy<br>
&gt;&gt; &lt;<a href=3D"mailto:vsementsov@yandex-team.ru" target=3D"_blank"=
 rel=3D"noreferrer">vsementsov@yandex-team.ru</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve spent much time trying to debug hanging pipeline in g=
itlab. I<br>
&gt;&gt;&gt; started from and idea that I have problem in code in my series=
 (which<br>
&gt;&gt;&gt; has some timeouts). Finally I found that the problem is that I=
&#39;ve used<br>
&gt;&gt;&gt; QEMUMachine class directly to avoid qtest, and didn&#39;t add =
necessary<br>
&gt;&gt;&gt; arguments. Qemu fails and we wait for qmp accept endlessly. In=
 gitlab<br>
&gt;&gt;&gt; it&#39;s just stopped by timeout (one hour) with no sign of wh=
at&#39;s going<br>
&gt;&gt;&gt; wrong.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With timeout enabled, gitlab don&#39;t wait for an hour and pr=
ints all<br>
&gt;&gt;&gt; needed information.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mai=
lto:vsementsov@yandex-team.ru" target=3D"_blank" rel=3D"noreferrer">vsement=
sov@yandex-team.ru</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi all!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Just compare this<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/vsementsov/qemu/-/p=
ipelines/572232557" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/gitlab.com/vsementsov/qemu/-/pipelines/572232557</a><br>
&gt;&gt;&gt; and this<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/vsementsov/qemu/-/p=
ipelines/572526252" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/gitlab.com/vsementsov/qemu/-/pipelines/572526252</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; and you&#39;ll see that the latter is much better.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 2 +-<br>
&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/mach=
ine/machine.py<br>
&gt;&gt;&gt; index 37191f433b..01a12f6f73 100644<br>
&gt;&gt;&gt; --- a/python/qemu/machine/machine.py<br>
&gt;&gt;&gt; +++ b/python/qemu/machine/machine.py<br>
&gt;&gt;&gt; @@ -131,7 +131,7 @@ def __init__(self,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 drain_console: bool =3D False,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 console_log: Optional[str] =3D None,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 log_dir: Optional[str] =3D None,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0qmp_timer: Optional[float] =3D None):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0qmp_timer: float =3D 30):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Initialize a QEMUMachi=
ne<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Oh, this is because machine.py uses the qmp_timer for *all* timeou=
ts,<br>
&gt;&gt; and not just the QMP commands themselves, and this relates to the =
work<br>
&gt;&gt; Marc Andre is doing with regards to changing the launch mechanism =
to<br>
&gt;&gt; handle the race condition when the QEMU launch fails, but the QMP<=
br>
&gt;&gt; connection just sits waiting.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m quite of the mind that it&#39;s really time to rewrite mac=
hine.py to<br>
&gt;&gt; use the native asyncio interfaces I&#39;ve been writing to help ma=
nage<br>
&gt;&gt; this, but in the meantime I think this is probably a reasonable<br=
>
&gt;&gt; concession and a more useful default.<br>
&gt;&gt;<br>
&gt;&gt; ...I think. Willing to take it for now and re-investigate when the=
<br>
&gt;&gt; other fixes make it to the tree.<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Oh, keep the type as Optional[float], though, so the timeout can be<br=
>
&gt; disabled again, and keeps the type consistent with the qtest<br>
&gt; derivative class. I&#39;ve staged your patch with that change made, le=
t me<br>
&gt; know if that&#39;s not OK. Modified patch is on my python branch:<br>
&gt; <br>
&gt; Thanks, merged.<br>
&gt; <br>
<br>
Hmm, seems that&#39;s lost.. I don&#39;t see it neither in master nor in yo=
ur python branch..<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">:(</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll fi=
x it. Thanks for resending the iotests series, too - the old version was at=
 the very top of my inbox :)</div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--00000000000076486f05f1ebe80f--


