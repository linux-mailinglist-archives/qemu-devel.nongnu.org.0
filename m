Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943B4094F8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:38:34 +0200 (CEST)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPn6O-0004Bo-7j
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mPmUb-0007TF-Ve
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mPmUZ-00076J-Mu
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631541566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tOmLEjzBgelDw7HFajgOHwiVKVNsEpztJKqR94om1GU=;
 b=R5M1br3FR+5wLS11nLrhmUUcnHOk0hIVTPtZWJBHaFFC+gN9erJpBYxexHCM6LiSls2FUC
 /FxjA1SdS86sERK5JTcYRLW6rlEqks18HosJeWAcp8TQ7ZYbnVUQkuNjQ668xpnDslu80k
 d0jJmq1W9m7uWBY/4Kx7h8CbhJGLj6s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-SgkRHaJYNl6eHAAJ9yoVkQ-1; Mon, 13 Sep 2021 09:59:24 -0400
X-MC-Unique: SgkRHaJYNl6eHAAJ9yoVkQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 e7-20020a056a0000c700b004391956f161so3430218pfj.18
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tOmLEjzBgelDw7HFajgOHwiVKVNsEpztJKqR94om1GU=;
 b=FsrCgu9Rioez4SrFolWUNFvbhhHu+/GLRgOzWZkFbP0fqNzGKXsSQwzqYbxF7Rehe7
 whU8d5WpR8h4eJsaZtajjhd9evZwLqNzq/sn/AouQqcFS3PqbfnNomdiDQlYEbAX1K1D
 gmeZ/M15BI52tsnscPojUx+HOftjTnvV5GzatLupU3OXciEFYM0ml+AoaxBWIPV8sGe/
 dvHnGpVXgl1eXHz8FCvzTeDeFoaeVJLOe7FYq+qb343vFJNioTSoBZzLd/uIdRRjg1x0
 bAsgCFLFJOtCsrHGwx6xA1hi6U0OHK1+jk/Pni815wPXxDcyyr1KVVKkSam6vGCFbviW
 6diA==
X-Gm-Message-State: AOAM531jNx3e9CWfIuWqJMCGOQVo89H4Q+egwolcceCGxEA7J6qMrxRV
 C494VP3sUOYwy78rw5+nd2kpYPv3ezNmYaoQ3qnylxJIe7vquWB7d6qmrrQPaPL4Th7RQUTyrHm
 2nJZQ5HAOGMM9esASbCW9gP9DyxrSa6s=
X-Received: by 2002:a63:30d:: with SMTP id 13mr11460755pgd.289.1631541563435; 
 Mon, 13 Sep 2021 06:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLGWPHliLmExklYN8vwDWSSlhpmQjn/e168SmK38f4uioMaDSjcAvpcbD3Ea91kTgCVTv0VNSRI3x9Q9nHqtU=
X-Received: by 2002:a63:30d:: with SMTP id 13mr11460733pgd.289.1631541563121; 
 Mon, 13 Sep 2021 06:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-2-armbru@redhat.com>
 <CAMxuvaxE4fbkK-nX-K7ni9C4tUdXTTbCe=S1eAPvHCb2RUpFOQ@mail.gmail.com>
 <87mtogk2c2.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtogk2c2.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Sep 2021 17:59:12 +0400
Message-ID: <CAMxuvay2yNs4LxoVu8OCKV0AnkdqDvuR9rySAEX=PYkX4pk3KA@mail.gmail.com>
Subject: Re: [PATCH 01/22] qapi: Tidy up unusual line breaks
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004e73d105cbe0df20"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, "Blake, Eric" <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004e73d105cbe0df20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 13, 2021 at 5:55 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Hi
> >
> > On Mon, Sep 13, 2021 at 4:39 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Break lines between members instead of within members.
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >>
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > I wish we would just automated tools to format files. With that git 2.2=
3
> > feature, no more excuses :):
> >
> https://www.moxio.com/blog/43/ignoring-bulk-change-commits-with-git-blame
>
> Interesting.
>

Yeah, unfortunately you would have to add the commit rev after it's merged.


> > Sadly, our mixed json/py format doesn't get parsed after "blake"
> reformats
> > it (strings or trailing commas).
>
> Naming QAPI schema files .json even though their contents isn't was a
> mistake.
>
> We discussed possible improvements in the thread below
>
>     Message-ID: <87ime52wxd.fsf@dusky.pond.sub.org>
>     https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08325.html
>
> Too much to read, but there's a summary:
>
>     Message-ID: <877dt5ofoi.fsf@dusky.pond.sub.org>
>     https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02553.html
>
> The least invasive way to achieve formatting automation could be
> switching from bastardized JSON to proper subset of Python.
>

ok


> What's "blake"?
>

Sorry, don't know why I always remember "blake" when it is simply  "black" =
(
https://github.com/psf/black)

--0000000000004e73d105cbe0df20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 5:55 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" tar=
get=3D"_blank">marcandre.lureau@redhat.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Mon, Sep 13, 2021 at 4:39 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Break lines between members instead of within members.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; I wish we would just automated tools to format files. With that git 2.=
23<br>
&gt; feature, no more excuses :):<br>
&gt; <a href=3D"https://www.moxio.com/blog/43/ignoring-bulk-change-commits-=
with-git-blame" rel=3D"noreferrer" target=3D"_blank">https://www.moxio.com/=
blog/43/ignoring-bulk-change-commits-with-git-blame</a><br>
<br>
Interesting.<br></blockquote><div><br></div><div>Yeah, unfortunately you wo=
uld have to add the commit rev after it&#39;s merged.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Sadly, our mixed json/py format doesn&#39;t get parsed after &quot;bla=
ke&quot; reformats<br>
&gt; it (strings or trailing commas).<br>
<br>
Naming QAPI schema files .json even though their contents isn&#39;t was a<b=
r>
mistake.<br>
<br>
We discussed possible improvements in the thread below<br>
<br>
=C2=A0 =C2=A0 Message-ID: &lt;<a href=3D"mailto:87ime52wxd.fsf@dusky.pond.s=
ub.org" target=3D"_blank">87ime52wxd.fsf@dusky.pond.sub.org</a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020=
-07/msg08325.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.o=
rg/archive/html/qemu-devel/2020-07/msg08325.html</a><br>
<br>
Too much to read, but there&#39;s a summary:<br>
<br>
=C2=A0 =C2=A0 Message-ID: &lt;<a href=3D"mailto:877dt5ofoi.fsf@dusky.pond.s=
ub.org" target=3D"_blank">877dt5ofoi.fsf@dusky.pond.sub.org</a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020=
-09/msg02553.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.o=
rg/archive/html/qemu-devel/2020-09/msg02553.html</a><br>
<br>
The least invasive way to achieve formatting automation could be<br>
switching from bastardized JSON to proper subset of Python.<br></blockquote=
><div><br></div><div>ok<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
What&#39;s &quot;blake&quot;?<br></blockquote><div><br></div><div>Sorry, do=
n&#39;t know why I always remember &quot;blake&quot; when it is simply=C2=
=A0 &quot;black&quot; (<a href=3D"https://github.com/psf/black">https://git=
hub.com/psf/black</a>)</div></div></div>

--0000000000004e73d105cbe0df20--


