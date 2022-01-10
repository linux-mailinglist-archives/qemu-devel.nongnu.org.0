Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B548A062
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:45:50 +0100 (CET)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70c1-0005Iy-Rf
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:45:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n70ZM-0002eS-Cc
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n70ZI-0000hs-V2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641843779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KmBiP5fsc5bvudeLKFY2+j5HRVD+vUfriM7l0omGpQs=;
 b=L1YwqreX4TQ7N+zkQQZCn4jVMrFhW8f52BdSlh7bYW4DQAtFfcH/9j6l0UTZKDEIQFuKvw
 cql5ibIshdzSl6srT22MPMqyX69eoYnQ7dFjrKqzPh+ZbrpmLACnTKBRjO70NS8MdPWGq8
 heugOT3pZYR7o9NykFPNzJYv7jphmEc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-n1nYi9TdPPC7VA82h3SMIA-1; Mon, 10 Jan 2022 14:42:57 -0500
X-MC-Unique: n1nYi9TdPPC7VA82h3SMIA-1
Received: by mail-ua1-f72.google.com with SMTP id
 u4-20020ab05b04000000b00302f6c576aeso8267719uae.20
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 11:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KmBiP5fsc5bvudeLKFY2+j5HRVD+vUfriM7l0omGpQs=;
 b=OqfAWGI4kcusy6D2GhYFTruHM7d27MHdVYPRS+pTH1dzCDzykXdVFCeq9xmk8PRpSh
 WKHUS9cSnjjKnBI6ghkrDrTgHE96vMAWjFk29c9Y2yQJVMFG5ZhfKR/0OfOawSCk0QJt
 dMKbQTX7a3PPfGX4e3aL+TuKK+6WdXfhWCrL2M57s2SZCVsOnF2JMQVJ+smZ/5FPCtdF
 rQek9TwNU/0oRtwd6nBzokuWXpsmXtyfECr/+Z3Kyfv3BQ65Stul9LKB+B17jW2Y7top
 L92QrVPvkdXMuaYJ9WQUNzt4THYQcdZudv6I0jN+k5WY+46aUKFbdBRntSPZNQzFM2ki
 314A==
X-Gm-Message-State: AOAM531WNw7l5+Swke8J7Q5poUhNq2e5jEWML2NLgkfhx9bO5gBu1DXS
 IvoenDNtvrH8Ft+HfB5AhyZ0IKvlbd/OT85NnidQmAsFA0YsB3BmxIaALZfiLsVW6JN95slczPS
 95pA06pavXelWkFC87IwdsOd6JfUr1nU=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr590338uak.79.1641843776542;
 Mon, 10 Jan 2022 11:42:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPOXCi/eI2Xfy2ssLKKrNWoHTDCWoT6zDwOX1+DYM2DnctNu0Kl0TVLJP8ZyuV8stYR/g6Wr63bo98sNprOvM=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr590326uak.79.1641843776224;
 Mon, 10 Jan 2022 11:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20220104143841.25116-1-email@aabouzied.com>
 <94aebec7-0bf7-18b1-a10e-dda5f476f70b@vivier.eu>
 <CANL98e9RO38rmP8oSmEcoop3Pr_qC741Om91Bw9FQxAZcqf2QQ@mail.gmail.com>
 <e81ec4c9-9315-bf7f-2e74-65544664f430@vivier.eu>
In-Reply-To: <e81ec4c9-9315-bf7f-2e74-65544664f430@vivier.eu>
From: John Snow <jsnow@redhat.com>
Date: Mon, 10 Jan 2022 14:42:45 -0500
Message-ID: <CAFn=p-b2oY+MHFUULEL2AprD+Uyy=61g12U7EYPjb3qgr=KtOQ@mail.gmail.com>
Subject: Re: Byte Sized task (was Re: [PATCH] linux-user/syscall.c: malloc to
 g_try_malloc)
To: Laurent Vivier <laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000f2b6305d53f8b96"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Ahmed Abouzied <email@aabouzied.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f2b6305d53f8b96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 6, 2022 at 9:10 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Hi Ahmed,
>
> the email address you use for the trivial ML is broken. I've fixed it for
> my answer and added
> qemu-devel.
>
> Le 05/01/2022 =C3=A0 20:09, Ahmed Abouzied a =C3=A9crit :
> > Hello,
> >
> > Thanks for the review. I also found some occurrences of
> "cpu_physical_memor_*" calls that should be
> > replaced with "address_space_*" around the codebase as mentioned
> > [here](https://wiki.qemu.org/Contribute/BiteSizedTasks
> > <https://wiki.qemu.org/Contribute/BiteSizedTasks>) in the API
> conversion section. The "/hw"
> > directory for instance. Should I go about replacing those as well?
> Should I create a Gitlab issue
> > first to track the changes?
>
>
> According to the wiki, the gitlab issue are already created with the "Byt=
e
> Sized" label.
>
>
> https://gitlab.com/qemu-project/qemu/-/issues?scope=3Dall&state=3Dopened&=
label_name[]=3DBite%20Sized
>
> But this one is not, I think John can help you for that (added in cc:)
>
> Thanks,
> Laurent
>
> > Best regards,
> > Ahmed
> >
> > On Wed, 5 Jan 2022 at 12:26, Laurent Vivier <laurent@vivier.eu <mailto:
> laurent@vivier.eu>> wrote:
> >
> >     Le 04/01/2022 =C3=A0 15:38, Ahmed Abouzied a =C3=A9crit :
> >      > Use g_try_malloc instead of malloc to alocate the target ifconfi=
g.
> >      > Also replace the corresponding free with g_free.
> >      >
> >      > Signed-off-by: Ahmed Abouzied <email@aabouzied.com <mailto:
> email@aabouzied.com>>
> >      > ---
> >      >
> >      > Hello,
> >      >
> >      > I noticed that there was a `malloc` call in this file. It seems
> that it
> >      > was added by the commit 22e4a267 (3 years ago) which was after
> the commit
> >      > 0e173b24 (6 years ago) that replaced malloc calls with glib
> alternative calls.
> >      >
> >      > There is no issue for this on Gitlab. Should I have created an
> issue
> >      > first?
> >      >
> >      > Best regards,
> >      >
> >      >   linux-user/syscall.c | 4 ++--
> >      >   1 file changed, 2 insertions(+), 2 deletions(-)
> >      >
> >      > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> >      > index 56a3e17183..715f9430e1 100644
> >      > --- a/linux-user/syscall.c
> >      > +++ b/linux-user/syscall.c
> >      > @@ -4867,7 +4867,7 @@ static abi_long do_ioctl_ifconf(const
> IOCTLEntry *ie, uint8_t *buf_temp,
> >      >                * We can't fit all the extents into the fixed siz=
e
> buffer.
> >      >                * Allocate one that is large enough and use it
> instead.
> >      >                */
> >      > -            host_ifconf =3D malloc(outbufsz);
> >      > +            host_ifconf =3D g_try_malloc(outbufsz);
> >      >               if (!host_ifconf) {
> >      >                   return -TARGET_ENOMEM;
> >      >               }
> >      > @@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const
> IOCTLEntry *ie, uint8_t *buf_temp,
> >      >       }
> >      >
> >      >       if (free_buf) {
> >      > -        free(host_ifconf);
> >      > +        g_free(host_ifconf);
> >      >       }
> >      >
> >      >       return ret;
> >
> >     Applied to my linux-user-for-7.0 branch.
> >
> >     Thanks,
> >     Laurent
> >
>
>
IIRC, consensus was that this task was not "bite sized", as it might
possibly be a large task without an easily attainable "end". You don't need
to worry about creating a GitLab issue to track it (Unless you WANT to for
your own tracking, then go ahead and make one), but if you believe that the
task is now *done* in its entirety, the task should be removed from the
wiki.

Feel free to send me questions if you've got any.

--js

--0000000000000f2b6305d53f8b96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 6, 2022 at 9:10 AM Lauren=
t Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ahmed=
,<br>
<br>
the email address you use for the trivial ML is broken. I&#39;ve fixed it f=
or my answer and added <br>
qemu-devel.<br>
<br>
Le 05/01/2022 =C3=A0 20:09, Ahmed Abouzied a =C3=A9crit=C2=A0:<br>
&gt; Hello,<br>
&gt; <br>
&gt; Thanks for the review. I also found some occurrences of &quot;cpu_phys=
ical_memor_*&quot; calls that should be <br>
&gt; replaced with &quot;address_space_*&quot; around the codebase as menti=
oned <br>
&gt; [here](<a href=3D"https://wiki.qemu.org/Contribute/BiteSizedTasks" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Contribute/BiteSize=
dTasks</a> <br>
&gt; &lt;<a href=3D"https://wiki.qemu.org/Contribute/BiteSizedTasks" rel=3D=
"noreferrer" target=3D"_blank">https://wiki.qemu.org/Contribute/BiteSizedTa=
sks</a>&gt;) in the API conversion section. The &quot;/hw&quot; <br>
&gt; directory for instance. Should I go about replacing those as well? Sho=
uld I create a Gitlab issue <br>
&gt; first to track the changes?<br>
<br>
<br>
According to the wiki, the gitlab issue are already created with the &quot;=
Byte Sized&quot; label.<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues?scope=3Dall&amp;st=
ate=3Dopened&amp;label_name[]=3DBite%20Sized" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.com/qemu-project/qemu/-/issues?scope=3Dall&amp;state=
=3Dopened&amp;label_name[]=3DBite%20Sized</a><br>
<br>
But this one is not, I think John can help you for that (added in cc:)<br>
<br>
Thanks,<br>
Laurent<br>
<br>
&gt; Best regards,<br>
&gt; Ahmed<br>
&gt; <br>
&gt; On Wed, 5 Jan 2022 at 12:26, Laurent Vivier &lt;<a href=3D"mailto:laur=
ent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a> &lt;mailto:<a href=
=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a>&gt;&g=
t; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 04/01/2022 =C3=A0 15:38, Ahmed Abouzied a =C3=A9=
crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Use g_try_malloc instead of malloc to alocate=
 the target ifconfig.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Also replace the corresponding free with g_fr=
ee.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Ahmed Abouzied &lt;<a href=3D"=
mailto:email@aabouzied.com" target=3D"_blank">email@aabouzied.com</a> &lt;m=
ailto:<a href=3D"mailto:email@aabouzied.com" target=3D"_blank">email@aabouz=
ied.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I noticed that there was a `malloc` call in t=
his file. It seems that it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; was added by the commit 22e4a267 (3 years ago=
) which was after the commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 0e173b24 (6 years ago) that replaced malloc c=
alls with glib alternative calls.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; There is no issue for this on Gitlab. Should =
I have created an issue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; first?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0linux-user/syscall.c | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), =
2 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/linux-user/syscall.c b/linux-use=
r/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 56a3e17183..715f9430e1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/linux-user/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/linux-user/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -4867,7 +4867,7 @@ static abi_long do_ioct=
l_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * We can&#39;t fit all the extents into the fixed size buffer.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Allocate one that is large enough and use it instead.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ho=
st_ifconf =3D malloc(outbufsz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ho=
st_ifconf =3D g_try_malloc(outbufsz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!host_ifconf) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return -TARGET_ENOMEM;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -4915,7 +4915,7 @@ static abi_long do_ioct=
l_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (free_buf) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(host_ifconf=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(host_ifco=
nf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Applied to my linux-user-for-7.0 branch.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Laurent<br>
&gt; <br>
<br></blockquote><div><br></div><div>IIRC, consensus was that this task was=
 not &quot;bite sized&quot;, as it might possibly be a large task without a=
n easily attainable &quot;end&quot;. You don&#39;t need to worry about crea=
ting a GitLab issue to track it (Unless you WANT to for your own tracking, =
then go ahead and make one), but if you believe that the task is now *done*=
 in its entirety, the task should be removed from the wiki.</div><div><br><=
/div><div>Feel free to send me questions if you&#39;ve got any.<br></div><d=
iv><br></div><div>--js<br></div></div></div>

--0000000000000f2b6305d53f8b96--


