Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E335043F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:14:47 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdUU-0002ci-MN
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRdRg-0008Jl-Qu
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRdRc-0007kz-RN
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617207105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YEKYqNlHdTUn9fBm6Wc6HWdTkFlfwyzHB72RK7x6fEg=;
 b=iTLAbUS1CHz6aZ7d/N2CewYUsRfwB7sSRfwkoU6HzQmFR8K00X3m3sdgZ/mCmOZStkSJL0
 iojwQxZ1vv5hsHKUV2JvoggKeCYtal1CvaIb3AVr9vwv70jBSRmpnu71VarPo+x+kqbgFg
 MPfzuEuQXHKpaUSQmP6JgvpZSSFpvxk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-_Hnvlj7lO1KJ-6Bc7MBsCQ-1; Wed, 31 Mar 2021 12:11:40 -0400
X-MC-Unique: _Hnvlj7lO1KJ-6Bc7MBsCQ-1
Received: by mail-pg1-f200.google.com with SMTP id u12so1699308pgr.3
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEKYqNlHdTUn9fBm6Wc6HWdTkFlfwyzHB72RK7x6fEg=;
 b=OHOpXYUEnU6Nn0gHcyACz0EGIHu5Fhj9rihEzXy8VfH3s0ym36s/j4YKqzIyZdbWY4
 c0C2JVsSb7QbopMo3X5s6BlMTFyzBueSu7nHaGMqZ/Mg5nvuDlbX82hhUsKjHz9ZU8Te
 9+2JAYx82uiO/Yt2xZS4dsxfUl7Dg/ORSwsfK7+gQEBC4v2npHuqRdNT5UaRznY7Ap6k
 dWcSeON1dUESTqHp4V5CYesxSVCGkX4JVW/k0NRTSSep/4ZgNDOz3qeJw8W3UsDM8GpM
 bKzWcPZQ1jymbQm8F/6bCg06OLAMXDt+P4XHpLDDqJTPJ9o8a3iA4QUXMqTS6vbSL0uN
 isRQ==
X-Gm-Message-State: AOAM531eonVFitxjAqJqJI7UjziT+q5IgAGIV9uSJn70iIKhLDPT6HiA
 /j5XoUmMrZq/XemBp+QixcoytzOOoH/zATQjrUdFa9SNqPojAdCuzQ5Nmq4zEkNzlh4R+AkMVsa
 hneVUDTKVpl8HwEMRO1E7o71Brdyx+fU=
X-Received: by 2002:a17:902:e74f:b029:e5:fedb:92b9 with SMTP id
 p15-20020a170902e74fb02900e5fedb92b9mr3654425plf.67.1617207099765; 
 Wed, 31 Mar 2021 09:11:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIRHG2gJfV+fRmCrcQDiZvnOhVRjOoIYBhdtd/JiFsIDd7kF/ui+XJ4dz7SvxL1pxsezV5IxpyLf5WoJqyY6Q=
X-Received: by 2002:a17:902:e74f:b029:e5:fedb:92b9 with SMTP id
 p15-20020a170902e74fb02900e5fedb92b9mr3654406plf.67.1617207099458; Wed, 31
 Mar 2021 09:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <72bc8020-2028-82db-219c-a6ae311e26df@redhat.com>
In-Reply-To: <72bc8020-2028-82db-219c-a6ae311e26df@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 31 Mar 2021 18:11:26 +0200
Message-ID: <CABgObfYkxQwJ6_5rk5_dXqrfT-pmO2zg83AMoz60KXdcGGQZtw@mail.gmail.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b11d8d05bed75e89"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: "Maydell, Peter" <peter.maydell@linaro.org>, "P. Berrange,
 Daniel" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, "Graf,
 Alexander" <agraf@csgraf.de>, "Hajnoczi, Stefan" <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 afaerber <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b11d8d05bed75e89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mer 31 mar 2021, 17:48 Thomas Huth <thuth@redhat.com> ha scritto:

> > +This isn't an exhaustive list of things that you can't do. Rather, tak=
e
> > +it in the spirit in which it's intended=E2=80=94a guide to make it eas=
ier to
>
> s/intended=E2=80=94a/intended =E2=80=94 a/
>

It looks ugly in monospace but it's the way em dashes are typically
formatted. The appropriate spacing is usually included in the font.

But a colon is even better than an em dash here. :) I'll keep your
Reviewed-by and wait anyway for others to chip in.

Paolo


> With that fixed:
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> Thanks for putting this together!
>
>
> > +be excellent to each other.
> > +
> > +This code of conduct applies to all spaces managed by the QEMU project=
.
> > +This includes IRC, the mailing lists, the issue tracker, community
> > +events, and any other forums created by the project team which the
> > +community uses for communication. This code of conduct also applies
> > +outside these spaces, when an individual acts as a representative or a
> > +member of the project or its community.
> > +
> > +By adopting this code of conduct, project maintainers commit themselve=
s
> > +to fairly and consistently applying these principles to every aspect o=
f
> > +managing this project.  If you believe someone is violating the code o=
f
> > +conduct, please read the +:ref:`conflict-resolution` document for
> > +information about how to proceed.
> > +
> > +Sources
> > +-------
> > +
> > +This document is based on the `Fedora Code of Conduct
> > +<https://fedoraproject.org/code-of-conduct>`__ and the
> > +`Contributor Covenant version 1.3.0
> > +<https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/
> >`__.
> > diff --git a/docs/devel/conflict-resolution.rst
> b/docs/devel/conflict-resolution.rst
> > new file mode 100644
> > index 0000000000..1e0bb41674
> > --- /dev/null
> > +++ b/docs/devel/conflict-resolution.rst
> > @@ -0,0 +1,80 @@
> > +.. _conflict-resolution:
> > +
> > +Conflict Resolution Policy
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +Conflicts in the community can take many forms, from someone having a
> > +bad day and using harsh and hurtful language on the mailing list to mo=
re
> > +serious code of conduct violations (including sexist/racist statements
> > +or threats of violence), and everything in between.
> > +
> > +For the vast majority of issues, we aim to empower individuals to firs=
t
> > +resolve conflicts themselves, asking for help when needed, and only
> > +after that fails to escalate further. This approach gives people more
> > +control over the outcome of their dispute.
> > +
> > +How we resolve conflicts
> > +------------------------
> > +
> > +If you are experiencing conflict, please consider first addressing the
> > +perceived conflict directly with other involved parties, preferably
> through
> > +a real-time medium such as IRC. You could also try to get a third-part=
y
> (e.g.
> > +a mutual friend, and/or someone with background on the issue, but not
> > +involved in the conflict) to intercede or mediate.
> > +
> > +If this fails or if you do not feel comfortable proceeding this way, o=
r
> > +if the problem requires immediate escalation, report the issue to the
> QEMU
> > +leadership committee by sending an email to qemu@sfconservancy.org,
> providing
> > +references to the misconduct.
> > +For very urgent topics, you can also inform one or more members throug=
h
> IRC.
> > +The up-to-date list of members is `available on the QEMU wiki
> > +<https://wiki.qemu.org/Conservancy>`__.
> > +
> > +Your report will be treated confidentially by the leadership committee
> and
> > +not be published without your agreement. The QEMU leadership committee
> will
> > +then do its best to review the incident timely, and will either seek
> further
> > +information, or will make a determination on next steps.
> > +
> > +Remedies
> > +--------
> > +
> > +Escalating an issue to the QEMU leadership committee may result in
> actions
> > +impacting one or more involved parties. In the event the leadership
> > +committee has to intervene, here are some of the ways they might
> respond:
> > +
> > +1. Take no action. For example, if the leadership committee determines
> > +   the complaint has not been substantiated or is being made in bad
> faith,
> > +   or if it is deemed to be outside its purview.
> > +
> > +2. A private reprimand, explaining the consequences of continued
> behavior,
> > +   to one or more involved individuals.
> > +
> > +3. A private reprimand and request for a private or public apology
> > +
> > +4. A public reprimand and request for a public apology
> > +
> > +5. A public reprimand plus a mandatory cooling off period. The cooling
> > +   off period may require, for example, one or more of the following:
> > +   abstaining from maintainer duties; not interacting with people
> involved,
> > +   including unsolicited interaction with those enforcing the guidelin=
es
> > +   and interaction on social media; being denied participation to
> in-person
> > +   events.  The cooling off period is voluntary but may escalate to a
> > +   temporary ban in order to enforce it.
> > +
> > +6. A temporary or permanent ban from some or all current and future QE=
MU
> > +   spaces (mailing lists, IRC, wiki, etc.), possibly including in-pers=
on
> > +   events.
> > +
> > +In the event of severe harassment, the leadership committee may advise
> that
> > +the matter be escalated to the relevant local law enforcement agency. =
It
> > +is however not the role of the leadership committee to initiate contac=
t
> > +with law enforcement on behalf of any of the community members involve=
d
> > +in an incident.
> > +
> > +Sources
> > +-------
> > +
> > +This document was developed based on the `Drupal Conflict Resolution
> > +Policy and Process <https://www.drupal.org/conflict-resolution>`__
> > +and the `Mozilla Consequence Ladder
> > +<
> https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcem=
ent/consequence-ladder.md
> >`__
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index 7c424ea6d7..416261505f 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -14,6 +14,8 @@ Contents:
> >      :maxdepth: 2
> >      :includehidden:
> >
> > +   code-of-conduct
> > +   conflict-resolution
> >      build-system
> >      style
> >      kconfig
> >
>
>

--000000000000b11d8d05bed75e89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 31 mar 2021, 17:48 Thomas Huth &lt;<a href=3D"m=
ailto:thuth@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.c=
om</a>&gt; ha scritto:</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +This isn&#39;t an exhaustive list of things that you can&#39;t do. Ra=
ther, take<br>
&gt; +it in the spirit in which it&#39;s intended=E2=80=94a guide to make i=
t easier to<br>
<br>
s/intended=E2=80=94a/intended =E2=80=94 a/<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">It looks ugly in monospace but it=
&#39;s the way em dashes are typically formatted. The appropriate spacing i=
s usually included in the font.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">But a colon is even better than an em dash here. :) I&#39;ll keep=
 your Reviewed-by and wait anyway for others to chip in.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
With that fixed:<br>
<br>
Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">thuth@redhat.com</a>&gt;<br>
<br>
Thanks for putting this together!<br>
<br>
<br>
&gt; +be excellent to each other.<br>
&gt; +<br>
&gt; +This code of conduct applies to all spaces managed by the QEMU projec=
t.<br>
&gt; +This includes IRC, the mailing lists, the issue tracker, community<br=
>
&gt; +events, and any other forums created by the project team which the<br=
>
&gt; +community uses for communication. This code of conduct also applies<b=
r>
&gt; +outside these spaces, when an individual acts as a representative or =
a<br>
&gt; +member of the project or its community.<br>
&gt; +<br>
&gt; +By adopting this code of conduct, project maintainers commit themselv=
es<br>
&gt; +to fairly and consistently applying these principles to every aspect =
of<br>
&gt; +managing this project.=C2=A0 If you believe someone is violating the =
code of<br>
&gt; +conduct, please read the +:ref:`conflict-resolution` document for<br>
&gt; +information about how to proceed.<br>
&gt; +<br>
&gt; +Sources<br>
&gt; +-------<br>
&gt; +<br>
&gt; +This document is based on the `Fedora Code of Conduct<br>
&gt; +&lt;<a href=3D"https://fedoraproject.org/code-of-conduct" rel=3D"nore=
ferrer noreferrer noreferrer" target=3D"_blank">https://fedoraproject.org/c=
ode-of-conduct</a>&gt;`__ and the<br>
&gt; +`Contributor Covenant version 1.3.0<br>
&gt; +&lt;<a href=3D"https://www.contributor-covenant.org/version/1/3/0/cod=
e-of-conduct/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://www.contributor-covenant.org/version/1/3/0/code-of-conduct/</a>&gt;`=
__.<br>
&gt; diff --git a/docs/devel/conflict-resolution.rst b/docs/devel/conflict-=
resolution.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1e0bb41674<br>
&gt; --- /dev/null<br>
&gt; +++ b/docs/devel/conflict-resolution.rst<br>
&gt; @@ -0,0 +1,80 @@<br>
&gt; +.. _conflict-resolution:<br>
&gt; +<br>
&gt; +Conflict Resolution Policy<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; +<br>
&gt; +Conflicts in the community can take many forms, from someone having a=
<br>
&gt; +bad day and using harsh and hurtful language on the mailing list to m=
ore<br>
&gt; +serious code of conduct violations (including sexist/racist statement=
s<br>
&gt; +or threats of violence), and everything in between.<br>
&gt; +<br>
&gt; +For the vast majority of issues, we aim to empower individuals to fir=
st<br>
&gt; +resolve conflicts themselves, asking for help when needed, and only<b=
r>
&gt; +after that fails to escalate further. This approach gives people more=
<br>
&gt; +control over the outcome of their dispute.<br>
&gt; +<br>
&gt; +How we resolve conflicts<br>
&gt; +------------------------<br>
&gt; +<br>
&gt; +If you are experiencing conflict, please consider first addressing th=
e<br>
&gt; +perceived conflict directly with other involved parties, preferably t=
hrough<br>
&gt; +a real-time medium such as IRC. You could also try to get a third-par=
ty (e.g.<br>
&gt; +a mutual friend, and/or someone with background on the issue, but not=
<br>
&gt; +involved in the conflict) to intercede or mediate.<br>
&gt; +<br>
&gt; +If this fails or if you do not feel comfortable proceeding this way, =
or<br>
&gt; +if the problem requires immediate escalation, report the issue to the=
 QEMU<br>
&gt; +leadership committee by sending an email to <a href=3D"mailto:qemu@sf=
conservancy.org" rel=3D"noreferrer noreferrer" target=3D"_blank">qemu@sfcon=
servancy.org</a>, providing<br>
&gt; +references to the misconduct.<br>
&gt; +For very urgent topics, you can also inform one or more members throu=
gh IRC.<br>
&gt; +The up-to-date list of members is `available on the QEMU wiki<br>
&gt; +&lt;<a href=3D"https://wiki.qemu.org/Conservancy" rel=3D"noreferrer n=
oreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/Conservancy</=
a>&gt;`__.<br>
&gt; +<br>
&gt; +Your report will be treated confidentially by the leadership committe=
e and<br>
&gt; +not be published without your agreement. The QEMU leadership committe=
e will<br>
&gt; +then do its best to review the incident timely, and will either seek =
further<br>
&gt; +information, or will make a determination on next steps.<br>
&gt; +<br>
&gt; +Remedies<br>
&gt; +--------<br>
&gt; +<br>
&gt; +Escalating an issue to the QEMU leadership committee may result in ac=
tions<br>
&gt; +impacting one or more involved parties. In the event the leadership<b=
r>
&gt; +committee has to intervene, here are some of the ways they might resp=
ond:<br>
&gt; +<br>
&gt; +1. Take no action. For example, if the leadership committee determine=
s<br>
&gt; +=C2=A0 =C2=A0the complaint has not been substantiated or is being mad=
e in bad faith,<br>
&gt; +=C2=A0 =C2=A0or if it is deemed to be outside its purview.<br>
&gt; +<br>
&gt; +2. A private reprimand, explaining the consequences of continued beha=
vior,<br>
&gt; +=C2=A0 =C2=A0to one or more involved individuals.<br>
&gt; +<br>
&gt; +3. A private reprimand and request for a private or public apology<br=
>
&gt; +<br>
&gt; +4. A public reprimand and request for a public apology<br>
&gt; +<br>
&gt; +5. A public reprimand plus a mandatory cooling off period. The coolin=
g<br>
&gt; +=C2=A0 =C2=A0off period may require, for example, one or more of the =
following:<br>
&gt; +=C2=A0 =C2=A0abstaining from maintainer duties; not interacting with =
people involved,<br>
&gt; +=C2=A0 =C2=A0including unsolicited interaction with those enforcing t=
he guidelines<br>
&gt; +=C2=A0 =C2=A0and interaction on social media; being denied participat=
ion to in-person<br>
&gt; +=C2=A0 =C2=A0events.=C2=A0 The cooling off period is voluntary but ma=
y escalate to a<br>
&gt; +=C2=A0 =C2=A0temporary ban in order to enforce it.<br>
&gt; +<br>
&gt; +6. A temporary or permanent ban from some or all current and future Q=
EMU<br>
&gt; +=C2=A0 =C2=A0spaces (mailing lists, IRC, wiki, etc.), possibly includ=
ing in-person<br>
&gt; +=C2=A0 =C2=A0events.<br>
&gt; +<br>
&gt; +In the event of severe harassment, the leadership committee may advis=
e that<br>
&gt; +the matter be escalated to the relevant local law enforcement agency.=
 It<br>
&gt; +is however not the role of the leadership committee to initiate conta=
ct<br>
&gt; +with law enforcement on behalf of any of the community members involv=
ed<br>
&gt; +in an incident.<br>
&gt; +<br>
&gt; +Sources<br>
&gt; +-------<br>
&gt; +<br>
&gt; +This document was developed based on the `Drupal Conflict Resolution<=
br>
&gt; +Policy and Process &lt;<a href=3D"https://www.drupal.org/conflict-res=
olution" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:/=
/www.drupal.org/conflict-resolution</a>&gt;`__<br>
&gt; +and the `Mozilla Consequence Ladder<br>
&gt; +&lt;<a href=3D"https://github.com/mozilla/diversity/blob/master/code-=
of-conduct-enforcement/consequence-ladder.md" rel=3D"noreferrer noreferrer =
noreferrer" target=3D"_blank">https://github.com/mozilla/diversity/blob/mas=
ter/code-of-conduct-enforcement/consequence-ladder.md</a>&gt;`__<br>
&gt; diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
&gt; index 7c424ea6d7..416261505f 100644<br>
&gt; --- a/docs/devel/index.rst<br>
&gt; +++ b/docs/devel/index.rst<br>
&gt; @@ -14,6 +14,8 @@ Contents:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :maxdepth: 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :includehidden:<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0code-of-conduct<br>
&gt; +=C2=A0 =C2=A0conflict-resolution<br>
&gt;=C2=A0 =C2=A0 =C2=A0 build-system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 style<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kconfig<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000b11d8d05bed75e89--


