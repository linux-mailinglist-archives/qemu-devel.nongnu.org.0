Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4150BD5C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:44:19 +0200 (CEST)
Received: from localhost ([::1]:44348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwOI-0005OG-Ce
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhwLP-0002Fy-3n
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhwLM-0005r7-R9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650645676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kQYybIdMVDYDrDsyKYnK0UdOv2+G8K/HDbpTAey+cYo=;
 b=YH/Ycryb8+lhVplcXMyvMdTabk/jqKRdymjXqHqDBpZfAaYwLf0tNH+jxxjfMRMttLmlTA
 CCH+qXoWt1kGrxFekAVx0d3lpR8AViMm3H7xWS2NC+1vnLEVWqgLAgldHb9GmA7F9HQItA
 KUiSBrVQqqlc5I00FCQr6uio7Bx3/AI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-oty4fHQ1OvehcOo36gO8-A-1; Fri, 22 Apr 2022 12:41:14 -0400
X-MC-Unique: oty4fHQ1OvehcOo36gO8-A-1
Received: by mail-vs1-f70.google.com with SMTP id
 i13-20020a67e2cd000000b0032a26c36119so596566vsm.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQYybIdMVDYDrDsyKYnK0UdOv2+G8K/HDbpTAey+cYo=;
 b=z1XfrZXKKerx5RmC1TXaTOdMr+uvMTh8DPHkjbyI3enO7Dt9u4LgSnyaP3yIo+j0sq
 eW9WaY+uRW6BcyLyCtmdsm0iLUpE0RUFDaaA7beibC5w6STNIywIuKSxJpCHlXODnaqB
 wbCMhhEKpKAy0Pqthof1ExI75V0o5v/kMPCmqmnlqZBsMTGLDXlXY+yOdBi5L2W9SnbC
 fKV4AG9gHtzVCSCRgfjOWBbtHZ4jYX/SaTV22db81rGGQcguSU82IbWQDjAIxc8KrFio
 GFvijaXR4L3e8oqegGLsgst0fUl51YrImaRhofZdIUcSrBzIkhmaeQGJogN0yQeM0Hzi
 VqKg==
X-Gm-Message-State: AOAM531HHPNsYFdy7uyu41saaKOwLMtzvRgMAj+zBCaf2LJm+0MS30AY
 4FYm3q4lulgo8Z4eWv2uiHDvFxq63tocYL56BtonSZn0bp2IPKJcC2KXpzf2Ptd4akFDEshxXX+
 bsKiqxkATXemRYL8+kYscL6Ro0tWbXoQ=
X-Received: by 2002:ab0:7794:0:b0:35c:a50c:df8d with SMTP id
 x20-20020ab07794000000b0035ca50cdf8dmr2012840uar.42.1650645674045; 
 Fri, 22 Apr 2022 09:41:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY636Npt1Lry9CEnSQjWPh+/24aJyApr/wHiCyq8GnnvsXz/9nDiH7OCOvFeJfY9jCN9jAX0CO9mSABYuU4b0=
X-Received: by 2002:ab0:7794:0:b0:35c:a50c:df8d with SMTP id
 x20-20020ab07794000000b0035ca50cdf8dmr2012823uar.42.1650645673809; Fri, 22
 Apr 2022 09:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
 <CABJz62MoAvnTaAYcNzKn7_=ENS+YovowS4OozZ7iYHQV2kL6Cg@mail.gmail.com>
 <CAFn=p-a4P4c9AcoT4mTmikQYyf=09brMP3D464XgHQUzO+th+A@mail.gmail.com>
 <CABJz62Njvm8ibGif87xykZD2cj6SDkAN=6rPVzY9Fen4OpGvgg@mail.gmail.com>
 <CAFn=p-YSPkbco82HYHfUf0mfjPaQABXDRKo0r5HOxOwgth-G8g@mail.gmail.com>
In-Reply-To: <CAFn=p-YSPkbco82HYHfUf0mfjPaQABXDRKo0r5HOxOwgth-G8g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 22 Apr 2022 12:41:03 -0400
Message-ID: <CAFn=p-bdxTJZhJ_A+ofm-z7C=1=rUpAqpu9cACfOguE3T4DSfw@mail.gmail.com>
Subject: Re: Create qemu-project/py-qemu.qmp repo
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000009ab3705dd40e5c5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--00000000000009ab3705dd40e5c5
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022, 10:28 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Apr 22, 2022, 4:37 AM Andrea Bolognani <abologna@redhat.com>
> wrote:
>
>> On Thu, Apr 21, 2022 at 05:00:16PM -0400, John Snow wrote:
>> > On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani <abologna@redhat.com>
>> wrote:
>> > > I think I would go with "python-qemu-qmp". Having a dot in the name
>> > > of a git repo is not very common AFAICT, and I wouldn't rule out the
>> > > possibility of some GitLab feature or other tooling breaking or
>> > > misbehaving because of it.
>> >
>> > The idea is to have the repo name resemble the Python package name,
>> which
>> > is "qemu.qmp". For Python, it's customary to have the package name match
>> > the import name. The import name is "qemu.qmp".
>> >
>> > I tested this name on GitLab and it appears to work just fine.
>>
>> I'm concerned about issues that you'd only trigger when using
>> certain, perhaps less common, features.
>>
>> Here's an example of such an issue from just a year ago:
>>
>>   https://gitlab.com/gitlab-org/gitlab/-/issues/224669
>
>
> For mailing list context, this bug appears to concern label names with a
> dot; due to bad URL generation that can be fixed manually using %2e.
>
>
>> There's an epic tracking more issues of the same kind, though
>> admittedly most were addressed four years ago:
>>
>>   https://gitlab.com/groups/gitlab-org/-/epics/3740
>>
>> Up to you whether you feel confident enough that you're not going to
>> run into issues later.
>>
>
> There's always the chance for bugs, right? I'm not too concerned - I
> didn't run into anything by now, and I've been working on this stuff for a
> while.
>
> Can't promise it won't ever happen, but I value consistency with the
> package name more than I value avoiding possible bugs.
>
> Valid to wonder, but I think the tradeoff is appropriate here.
>
>
>> > > If you're really keen on saving those few extra keystrokes, maybe
>> > > "pyqemu" is a better prefix than "py-qemu"? I don't know, it just
>> > > looks more natural to me.
>> >
>> > I'd add "py:" as a prefix, but the colon doesn't work as a filename in
>> many
>> > places, so I suggested "py-".
>> >
>> > Thus, all together, "py-qemu.qmp".
>> >
>> > (I could spell out "python", I just prefer the shorter prefix because
>> it's
>> > explanatory enough as-is and I like keeping git checkout names short. My
>> > favorite color of bike shed is blue.)
>>
>> You can absolutely have short names locally even when things are
>> spelled out in GitLab.
>>
>
> Sure, but it's more steps and I personally never change the name when
> copy-pasting the "git clone" snippet. I assume most don't either.
>
>
>> Anyway, in this case my taste in names is clearly simply different
>> from yours and you should absolutely feel free to ignore my opinion
>> on the matter :)
>>
>
> Thanks for weighing in. I'm not ignoring your feedback, but I think I'm
> still happiest with "py-qemu.qmp" for now.
>

Hah. Except Paolo decided on "python-qemu-qmp" and he has the keys and I
don't, so I guess that settles that :p

--00000000000009ab3705dd40e5c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 22, 2022, 10:28 AM John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022, 4:37 A=
M Andrea Bolognani &lt;<a href=3D"mailto:abologna@redhat.com" target=3D"_bl=
ank" rel=3D"noreferrer">abologna@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Thu, Apr 21, 2022 at 05:00:16PM -0400, John Snow=
 wrote:<br>
&gt; On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani &lt;<a href=3D"mailto:a=
bologna@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">abologn=
a@redhat.com</a>&gt; wrote:<br>
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
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitlab.com/=
gitlab-org/gitlab/-/issues/224669</a></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">For mailing list context, this bug appears=
 to concern label names with a dot; due to bad URL generation that can be f=
ixed manually using %2e.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
There&#39;s an epic tracking more issues of the same kind, though<br>
admittedly most were addressed four years ago:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/groups/gitlab-org/-/epics/3740" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitlab.com/gro=
ups/gitlab-org/-/epics/3740</a><br>
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
div></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Hah. Except Paolo decided on &quot;python-qemu-qmp&quot; and he has t=
he keys and I don&#39;t, so I guess that settles that :p</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote=
></div></div></div>
</blockquote></div></div></div>

--00000000000009ab3705dd40e5c5--


