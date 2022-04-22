Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8EF50BA1B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:30:19 +0200 (CEST)
Received: from localhost ([::1]:55686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuIc-0001ti-JP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhuGw-0008M4-Mu
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhuGs-0002LQ-TS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650637709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=psViCmXsREVJPps1SE10wLSUV6lzhId4pAYeiftsoC4=;
 b=EGtVzT+aE+OzTHt3/GmNrFmjw+HeowF5Hkkto1UxegT+k9NdQ2XTXwkB8AcgXKf4bvGNLX
 itHI14yC5wS8bZifj9cBMCb1ir0w32UBdmJpsKgk5CwO5fFOHEvNfpkGAIh8ug5z54VieX
 6pDmMiMwCmRccxik0UjuthyGwr8QiBI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-k1_DLZCAOn6p9mYRkwZb6Q-1; Fri, 22 Apr 2022 10:28:27 -0400
X-MC-Unique: k1_DLZCAOn6p9mYRkwZb6Q-1
Received: by mail-vk1-f200.google.com with SMTP id
 u7-20020ac5ca87000000b003495b55ea6bso1093536vkk.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 07:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psViCmXsREVJPps1SE10wLSUV6lzhId4pAYeiftsoC4=;
 b=QDqiptODhIeZSMRWLPlEZ/TxSyTl3kPThowOpyTak7Q4geDr7YmTtcc5RYV0+8ezOe
 jmRUFuBxlgZnGpKRGWqNBKa2f5L1jqYtMLxw8MDP8r6+UbHFJMAbs1SItPmdo3Brc/Ct
 lVQjIpQc0P+bIkara/sgUiqcFS3TyhN/6CJvEmuJpO18q5xQ3bFuzQMuIWdAkUTYzqT3
 NUbvQtdTt2cRU+Y9B2dtj21PHZSQ7bR982a82ilHMISYlEE0/ihtQGAvgt916QoBRHr+
 dWiiTsnKc8FGtHv2w6ILuaWexRdMWH6Qsbu8jXS5ENqIJz7PmP2tfLqm3soGZKrM5dlS
 AKAw==
X-Gm-Message-State: AOAM530r+dMQXKYL3Ot5S8cGy+erd45Fx7Z3JOlpGc/SbeCtOGRjuXik
 s3/a2bSg/JXH15Bnkkn94VRk+OiHq/lVhgkga6BazAe94vcigNGfU042Y6pMUTEbthQBvl291vE
 aDZ627lMpGVFo79S12cyStKSlhK5fj0Y=
X-Received: by 2002:a05:6102:22fa:b0:32a:67aa:8131 with SMTP id
 b26-20020a05610222fa00b0032a67aa8131mr1421791vsh.61.1650637706664; 
 Fri, 22 Apr 2022 07:28:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWx4wtwmudLok4FM3kzXiK4URWg3GsGf19Focd8HU8kTugvBfjCHJVQJCr9D2rgAbfqifwcFY5C0uoE3oRWT8=
X-Received: by 2002:a05:6102:22fa:b0:32a:67aa:8131 with SMTP id
 b26-20020a05610222fa00b0032a67aa8131mr1421777vsh.61.1650637706495; Fri, 22
 Apr 2022 07:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
 <CABJz62MoAvnTaAYcNzKn7_=ENS+YovowS4OozZ7iYHQV2kL6Cg@mail.gmail.com>
 <CAFn=p-a4P4c9AcoT4mTmikQYyf=09brMP3D464XgHQUzO+th+A@mail.gmail.com>
 <CABJz62Njvm8ibGif87xykZD2cj6SDkAN=6rPVzY9Fen4OpGvgg@mail.gmail.com>
In-Reply-To: <CABJz62Njvm8ibGif87xykZD2cj6SDkAN=6rPVzY9Fen4OpGvgg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 22 Apr 2022 10:28:15 -0400
Message-ID: <CAFn=p-YSPkbco82HYHfUf0mfjPaQABXDRKo0r5HOxOwgth-G8g@mail.gmail.com>
Subject: Re: Create qemu-project/py-qemu.qmp repo
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000261b6005dd3f0ad6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000261b6005dd3f0ad6
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022, 4:37 AM Andrea Bolognani <abologna@redhat.com> wrote:

> On Thu, Apr 21, 2022 at 05:00:16PM -0400, John Snow wrote:
> > On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani <abologna@redhat.com>
> wrote:
> > > I think I would go with "python-qemu-qmp". Having a dot in the name
> > > of a git repo is not very common AFAICT, and I wouldn't rule out the
> > > possibility of some GitLab feature or other tooling breaking or
> > > misbehaving because of it.
> >
> > The idea is to have the repo name resemble the Python package name, which
> > is "qemu.qmp". For Python, it's customary to have the package name match
> > the import name. The import name is "qemu.qmp".
> >
> > I tested this name on GitLab and it appears to work just fine.
>
> I'm concerned about issues that you'd only trigger when using
> certain, perhaps less common, features.
>
> Here's an example of such an issue from just a year ago:
>
>   https://gitlab.com/gitlab-org/gitlab/-/issues/224669


For mailing list context, this bug appears to concern label names with a
dot; due to bad URL generation that can be fixed manually using %2e.


> There's an epic tracking more issues of the same kind, though
> admittedly most were addressed four years ago:
>
>   https://gitlab.com/groups/gitlab-org/-/epics/3740
>
> Up to you whether you feel confident enough that you're not going to
> run into issues later.
>

There's always the chance for bugs, right? I'm not too concerned - I didn't
run into anything by now, and I've been working on this stuff for a while.

Can't promise it won't ever happen, but I value consistency with the
package name more than I value avoiding possible bugs.

Valid to wonder, but I think the tradeoff is appropriate here.


> > > If you're really keen on saving those few extra keystrokes, maybe
> > > "pyqemu" is a better prefix than "py-qemu"? I don't know, it just
> > > looks more natural to me.
> >
> > I'd add "py:" as a prefix, but the colon doesn't work as a filename in
> many
> > places, so I suggested "py-".
> >
> > Thus, all together, "py-qemu.qmp".
> >
> > (I could spell out "python", I just prefer the shorter prefix because
> it's
> > explanatory enough as-is and I like keeping git checkout names short. My
> > favorite color of bike shed is blue.)
>
> You can absolutely have short names locally even when things are
> spelled out in GitLab.
>

Sure, but it's more steps and I personally never change the name when
copy-pasting the "git clone" snippet. I assume most don't either.


> Anyway, in this case my taste in names is clearly simply different
> from yours and you should absolutely feel free to ignore my opinion
> on the matter :)
>

Thanks for weighing in. I'm not ignoring your feedback, but I think I'm
still happiest with "py-qemu.qmp" for now.


> --
> Andrea Bolognani / Red Hat / Virtualization
>

--js

>

--000000000000261b6005dd3f0ad6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 22, 2022, 4:37 AM Andrea Bolognani &lt;<a =
href=3D"mailto:abologna@redhat.com">abologna@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Thu, Apr 21, 2022 at 05:00:16PM -040=
0, John Snow wrote:<br>
&gt; On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani &lt;<a href=3D"mailto:a=
bologna@redhat.com" target=3D"_blank" rel=3D"noreferrer">abologna@redhat.co=
m</a>&gt; wrote:<br>
&gt; &gt; I think I would go with &quot;python-qemu-qmp&quot;. Having a dot=
 in the name<br>
&gt; &gt; of a git repo is not very common AFAICT, and I wouldn&#39;t rule =
out the<br>
&gt; &gt; possibility of some GitLab feature or other tooling breaking or<b=
r>
&gt; &gt; misbehaving because of it.<br>
&gt;<br>
&gt; The idea is to have the repo name resemble the Python package name, wh=
ich<br>
&gt; is &quot;qemu.qmp&quot;. For Python, it&#39;s customary to have the pa=
ckage name match<br>
&gt; the import name. The import name is &quot;qemu.qmp&quot;.<br>
&gt;<br>
&gt; I tested this name on GitLab and it appears to work just fine.<br>
<br>
I&#39;m concerned about issues that you&#39;d only trigger when using<br>
certain, perhaps less common, features.<br>
<br>
Here&#39;s an example of such an issue from just a year ago:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/gitlab-org/gitlab/-/issues/224669" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/gitlab-org/=
gitlab/-/issues/224669</a></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">For mailing list context, this bug appears to concern=
 label names with a dot; due to bad URL generation that can be fixed manual=
ly using %2e.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
There&#39;s an epic tracking more issues of the same kind, though<br>
admittedly most were addressed four years ago:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/groups/gitlab-org/-/epics/3740" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/groups/gitlab-=
org/-/epics/3740</a><br>
<br>
Up to you whether you feel confident enough that you&#39;re not going to<br=
>
run into issues later.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">There&#39;s always the chance for bugs, right? I&#39;=
m not too concerned - I didn&#39;t run into anything by now, and I&#39;ve b=
een working on this stuff for a while.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Can&#39;t promise it won&#39;t ever happen, but I value cons=
istency with the package name more than I value avoiding possible bugs.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Valid to wonder, but I thin=
k the tradeoff is appropriate here.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; &gt; If you&#39;re really keen on saving those few extra keystrokes, m=
aybe<br>
&gt; &gt; &quot;pyqemu&quot; is a better prefix than &quot;py-qemu&quot;? I=
 don&#39;t know, it just<br>
&gt; &gt; looks more natural to me.<br>
&gt;<br>
&gt; I&#39;d add &quot;py:&quot; as a prefix, but the colon doesn&#39;t wor=
k as a filename in many<br>
&gt; places, so I suggested &quot;py-&quot;.<br>
&gt;<br>
&gt; Thus, all together, &quot;py-qemu.qmp&quot;.<br>
&gt;<br>
&gt; (I could spell out &quot;python&quot;, I just prefer the shorter prefi=
x because it&#39;s<br>
&gt; explanatory enough as-is and I like keeping git checkout names short. =
My<br>
&gt; favorite color of bike shed is blue.)<br>
<br>
You can absolutely have short names locally even when things are<br>
spelled out in GitLab.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Sure, but it&#39;s more steps and I personally never =
change the name when copy-pasting the &quot;git clone&quot; snippet. I assu=
me most don&#39;t either.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Anyway, in this case my taste in names is clearly simply different<br>
from yours and you should absolutely feel free to ignore my opinion<br>
on the matter :)<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thanks for weighing in. I&#39;m not ignoring your feedback,=
 but I think I&#39;m still happiest with &quot;py-qemu.qmp&quot; for now.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Andrea Bolognani / Red Hat / Virtualization<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></=
div></div>

--000000000000261b6005dd3f0ad6--


