Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AC34D962
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 23:01:29 +0200 (CEST)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQz0p-00077T-ET
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 17:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQyzE-0006SB-FL
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 16:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQyzB-0007hP-ES
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 16:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617051584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q9blz8Jwtd1vfMzOhoXPThX2GtuMAydwLE3qb8RkfmY=;
 b=O2W3BCXQkQSbZnguZWpH45lnWp3bUgOf3pUwJLzPtt9ioET+4ji/LW0RvWBH4LNDLHLD7e
 hrte4HAIBSP6d4hDl7+oNoBHnLlEDYG2bnvHULMRZEfCRvNH85kzpHeE4LxT8hyU4CJawZ
 kM4truWZvkXa+kEcgL2jqgKQx0ShMRY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-ZcqmQEIeNrmbUm2Lo0lBzw-1; Mon, 29 Mar 2021 16:59:36 -0400
X-MC-Unique: ZcqmQEIeNrmbUm2Lo0lBzw-1
Received: by mail-pl1-f199.google.com with SMTP id p12so4658132plw.0
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 13:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9blz8Jwtd1vfMzOhoXPThX2GtuMAydwLE3qb8RkfmY=;
 b=TDMhzXkGqxdEiwS29ONK6erBYSQuzV7EF9/kScT0QENKei7S+MTN3+gqC/9t8DK+2I
 1IB4wgd/pleCayZWo+BN39MMX7hSLjb7cc7J2Y09nT3XyI/knlPrIrS1AgFSkqrayo2e
 03dWh1mJs7EklKL0OktYUwLuG3Iq1KVyPmcVh/JB1GWZGsMhSKn15TBCJ+08OD4lO5Nh
 vetZyZQFyAJ9D9mQynVZalgx/8Qz2IwqGzENMvCb8Zl8GmTYWrQ3jciil0Z1K8lJoBPZ
 p6/rzwCwQUXXUG92Aup2QSOayR/glmlDqBdAoRC+L+yTcP7xwj8x5gcP1QhOkOdoymFo
 JDaA==
X-Gm-Message-State: AOAM533oSN11YQGcVoP3CSAnIbhjekw4iaqTM1mZOi21PCJMHBC/sVt3
 oMJXWVlLpgYwS7DaYhBdP6Bd5n+Yi8LF3IBFk2QFS6SAKRlAaOVczEQld1lsyhZokCrnvL6+Kkz
 HfDltBXRwDLF8jiZ/cr3a2EIf3opIaKE=
X-Received: by 2002:aa7:95b5:0:b029:1ef:272f:920c with SMTP id
 a21-20020aa795b50000b02901ef272f920cmr27610846pfk.21.1617051575612; 
 Mon, 29 Mar 2021 13:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7+4Yd3Bza4PgP2OuyTIeVKBzQBdNvOhR1VVF2KwoBAh0F1jWeZtG6J+UV67UjhG9Pr9dQWUVvVBAk0rZ82J8=
X-Received: by 2002:aa7:95b5:0:b029:1ef:272f:920c with SMTP id
 a21-20020aa795b50000b02901ef272f920cmr27610820pfk.21.1617051575290; Mon, 29
 Mar 2021 13:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210329180140.2761383-1-thuth@redhat.com>
 <YGIdduioIxRIxMMp@redhat.com>
In-Reply-To: <YGIdduioIxRIxMMp@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 29 Mar 2021 22:59:23 +0200
Message-ID: <CABgObfbyDTNyww5QE-tOsBVfkZVziX3uwGJCN+7mrXOQ_ZuHFg@mail.gmail.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000baa62f05beb3286c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000baa62f05beb3286c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 29 mar 2021, 20:33 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> The obvious alternative is to import the contributor covenant
>
>   https://www.contributor-covenant.org/


The Contributor Covenant 1.x and 2.x are very different in that 2.x also
includes conflict resolution. Unlike the code of conduct, the consequences
of bad behavior are hard to generalize across multiple projects, so I would
prefer anyway the 1.x version. The differences with the Django CoC aren't
substantial.

However this does mean being more careful about the language in the
"custom" documents such as the conflict resolution policy.


The second, it isn't a static document. It is being evolved over
> time with new versions issued as understanding of problematic
> situations evolves. We can choose to periodically update to stay
> current with the broadly accepted norms.
>

This however has the same issues as the "or later" clause of the GPL (see
the above example of 1.x vs 2.x for the Contributor Covenant). I don't
think upgrade of the CoC should be automatic since there are no
"compatibility" issues.

Overall I think it is a good idea to introduce an explicit CoC
> doc to QEMU, and indeed any community project, so thanks for
> bringing this up again.
>

Agreed!

>
> > +If you are experiencing conflict, you should first address the perceiv=
ed
> > +conflict directly with other involved parties, preferably through a
> > +real-time medium such as IRC. If this fails,


I agree with Daniel that this part should only be advisory. For example:

If you are experiencing conflict, please consider first addressing the
perceived  conflict directly with other involved parties, preferably
through a real-time medium such as IRC. If this fails or if you do not feel
comfortable proceeding this way,...

Also this document doesn't mention anything about ensuring the
> confidentiality/privacy for any complaints reported, which I
> think is important to state explicitly.
>

Agreed, and also the part about keeping a record should be removed from the
consequences part because it's a privacy regulation minefield.

Thanks,

Paolo


>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000baa62f05beb3286c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 29 mar 2021, 20:33 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">The obvious alternative is to i=
mport the contributor covenant<br>
<br>
=C2=A0 <a href=3D"https://www.contributor-covenant.org/" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://www.contributor-covenant.org/</a></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The Cont=
ributor Covenant 1.x and 2.x are very different in that 2.x also includes c=
onflict resolution. Unlike the code of conduct, the consequences of bad beh=
avior are hard to generalize across multiple projects, so I would prefer an=
yway the 1.x version. The differences with the Django CoC aren&#39;t substa=
ntial.</div><div dir=3D"auto"><br></div><div dir=3D"auto">However this does=
 mean being more careful about the language in the &quot;custom&quot; docum=
ents such as the conflict resolution policy.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">The second, it isn&#39;t a static document.=
 It is being evolved over<br>
time with new versions issued as understanding of problematic<br>
situations evolves. We can choose to periodically update to stay<br>
current with the broadly accepted norms.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">This however has the same issues as=
 the &quot;or later&quot; clause of the GPL (see the above example of 1.x v=
s 2.x for the Contributor Covenant). I don&#39;t think upgrade of the CoC s=
hould be automatic since there are no &quot;compatibility&quot; issues.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Overall I think it is a good idea to introdu=
ce an explicit CoC<br>
doc to QEMU, and indeed any community project, so thanks for<br>
bringing this up again.<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Agreed!</div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
&gt; +If you are experiencing conflict, you should first address the percei=
ved<br>
&gt; +conflict directly with other involved parties, preferably through a<b=
r>
&gt; +real-time medium such as IRC. If this fails,</blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I agree with Daniel that this=
 part should only be advisory. For example:</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">If you are experiencing conflict, please consider first=
 addressing the perceived=C2=A0 conflict<span style=3D"font-family:sans-ser=
if">=C2=A0directly with other involved parties, preferably through a r</spa=
n><span style=3D"font-family:sans-serif">eal-time medium such as IRC. If th=
is fails or if you do not feel comfortable proceeding this way,...</span></=
div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Also this document doesn&#39;t mention anything about ensuring the<br>
confidentiality/privacy for any complaints reported, which I<br>
think is important to state explicitly.<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Agreed, and also the part about keep=
ing a record should be removed from the consequences part because it&#39;s =
a privacy regulation minefield.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000baa62f05beb3286c--


