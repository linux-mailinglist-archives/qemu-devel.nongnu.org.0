Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F5F69E60F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWVb-0001k8-Iz; Tue, 21 Feb 2023 12:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUWVV-0001jL-KY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:32:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUWVT-0001d0-7P
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677000766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mhCQhZ+sLmlg53sVu3obsY4CgidjLkgQGkEK1qlIhBU=;
 b=ESPRY+duTe/Mzaysb3SAWHMy4600fDC/0veZSF1IKsD9Qo5SNEh2EgH8+fRb+glWWrcp4P
 PVytZEG8djmGajy8OarTMPizy24d+DLKdtOGptImc0eZtLQdWEUrLMbz+O2gUnf+ib15SZ
 c2DZ/GKHWn4xRpO0U49JU8SrMfdU0C8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-nNdb9iJjOCG_cDtjoDb2sA-1; Tue, 21 Feb 2023 12:32:36 -0500
X-MC-Unique: nNdb9iJjOCG_cDtjoDb2sA-1
Received: by mail-pg1-f197.google.com with SMTP id
 b21-20020a63cf55000000b004393806c06eso1482086pgj.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mhCQhZ+sLmlg53sVu3obsY4CgidjLkgQGkEK1qlIhBU=;
 b=njGZ0K+RFwmUUFbwZyocKXTs+yXYiBBepxLsHj2cySPfiw421YXaU/HWbOnobY52o6
 SxMjKm6E68L4CofB5wTGnJyRxHFAGtFEJYxoCmkZaqyV30N0WEenZ1pyn3kBPEymu40u
 98L308JGalVYFHwwEOB8QgCfMyBtJBDpfh8kRcd6No+9W4Ne8Yw6Qmy2mL+78fvTSrVU
 SzIeI0W6g3FGxpbslsRP/NzT3OA1dw8tCbfJpCjp50vCozRJ1TMhQAYatLoJwybmB8S1
 WCjWWZQsuxaRHCN0J6NSMjnKxCG9uaeiOj9jMbdewYP000p954AjpiI7jdPxg79ewZo8
 C8Mg==
X-Gm-Message-State: AO0yUKVCczifTB11erfaO4TekJmtd/HCVkl52Eu+B8Otfpyj1xvkl3HP
 H6nP7sZKV98WJOpKQUQnpoV+vHx2z8q7WoVi5Qwp+FtZd7dfpi2nIhadgqY11DqLqh+FylXwOuX
 F8OTcTUnBNBSOEEtANRa/sFyrzoLE+GY=
X-Received: by 2002:a17:90b:2d90:b0:234:2592:efbe with SMTP id
 sj16-20020a17090b2d9000b002342592efbemr1146873pjb.131.1677000755301; 
 Tue, 21 Feb 2023 09:32:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8deLvNC7F2+mWReKbuX1WwxRUmKNb58FGevXoL/4eTCjPwDKG0bQavjo2QuEZtWJfw9xdiirh4LS4KcDJxrp8=
X-Received: by 2002:a17:90b:2d90:b0:234:2592:efbe with SMTP id
 sj16-20020a17090b2d9000b002342592efbemr1146870pjb.131.1677000755015; Tue, 21
 Feb 2023 09:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <878rgz82v9.fsf@pond.sub.org>
 <CAFn=p-ZAnqRr7SYVO8n_DaFDUavFykNYwaQy4fCWubTx686kJg@mail.gmail.com>
 <87sfezzfh4.fsf@pond.sub.org>
In-Reply-To: <87sfezzfh4.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 21 Feb 2023 12:32:23 -0500
Message-ID: <CAFn=p-ac9ufp8-cohrSfHc4A2OTQLbbGP6dAJ5Wy1X0Ua3Y5_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] qapi: static typing conversion, pt5c
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000004a88e605f5392ade"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000004a88e605f5392ade
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023, 1:42 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > On Wed, Feb 15, 2023 at 8:39 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >>
> >> I had a few suggestions, but none of them requires a respin.  Let's
> >> discuss them, and then I merge.
> >
> > Hiya, I lost track of things a little due to the other Python
> > discussion. Who is waiting for whom?
>
> Just two questions remain:
>
> * PATCH 3: Dumb down check_keys() argument all the way to List[str]?
>

Kinda prefer not to, but maybe I'm being too precious. (I have some more
exploratory patches that do use tuples here instead, but admit it's not
crucial.)

From a pure typing perspective, I wish I could leave it as it is now,
because I prefer to type input types as loosely as possible: claim only the
minimum power we need, instead of enforcing the specificity we happen to
have.

With the bug for 3.6 that is forcing me to use a more specific type anyway,
maybe you're right and I should just use List[] until I'm allowed to have
my proper abstraction.

OK, before I go further, lemme say that you can change it to List[] if you
want. I won't be too precious about it. (You can rewrite the patch in
question if you don't want to wait 24h.)

But, a question about typing strategy:

As a python tooling maintainer, should I push people to type as flexible as
possible or as *specific* as possible in general?

Flexible: (e.g. Sequence or Iterable)
- More likely to get along with other code
- More "pythonic", abstractly
- Less useful as documentation; if a function always happens to get a list,
is it annoying to pretend it's merely a sequence?

Specific: (e.g. List)
- Most useful as documentation
- Can assert greater knowledge of all callers
- More power afforded to function ("room to grow"?)
- More likely to require non-local edits when changing functionality or
refactoring
- More likely to require "casts" at callsites to convert data types

I think I lean towards the flexible/broad typing strategy in general, but
lament it cannot be applied appropriately here today.


> * PATCH 4: Suggested commit message addition okay?
>

Yes, ACK.


> We settle them, and then I'll take it from there.
>
>

--0000000000004a88e605f5392ade
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 21, 2023, 1:42 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; write=
s:<br>
<br>
&gt; On Wed, Feb 15, 2023 at 8:39 AM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank" rel=3D"noreferrer">armbru@redhat.com=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I had a few suggestions, but none of them requires a respin.=C2=A0=
 Let&#39;s<br>
&gt;&gt; discuss them, and then I merge.<br>
&gt;<br>
&gt; Hiya, I lost track of things a little due to the other Python<br>
&gt; discussion. Who is waiting for whom?<br>
<br>
Just two questions remain:<br>
<br>
* PATCH 3: Dumb down check_keys() argument all the way to List[str]?<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Kinda p=
refer not to, but maybe I&#39;m being too precious. (I have some more explo=
ratory patches that do use tuples here instead, but admit it&#39;s not cruc=
ial.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">From a pure typing=
 perspective, I wish I could leave it as it is now, because I prefer to typ=
e input types as loosely as possible: claim only the minimum power we need,=
 instead of enforcing the specificity we happen to have.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">With the bug for 3.6 that is forcing me to=
 use a more specific type anyway, maybe you&#39;re right and I should just =
use List[] until I&#39;m allowed to have my proper abstraction.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">OK, before I go further, lemme say =
that you can change it to List[] if you want. I won&#39;t be too precious a=
bout it. (You can rewrite the patch in question if you don&#39;t want to wa=
it 24h.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">But, a question=
 about typing strategy:</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
As a python tooling maintainer, should I push people to type as flexible as=
 possible or as *specific* as possible in general?</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Flexible: (e.g. Sequence or Iterable)</div><div =
dir=3D"auto">- More likely to get along with other code</div><div dir=3D"au=
to">- More &quot;pythonic&quot;, abstractly</div><div dir=3D"auto">- Less u=
seful as documentation; if a function always happens to get a list, is it a=
nnoying to pretend it&#39;s merely a sequence?</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Specific: (e.g. List)</div><div dir=3D"auto">- Most =
useful as documentation</div><div dir=3D"auto">- Can assert greater knowled=
ge of all callers</div><div dir=3D"auto">- More power afforded to function =
(&quot;room to grow&quot;?)</div><div dir=3D"auto">- More likely to require=
 non-local edits when changing functionality or refactoring</div><div dir=
=3D"auto">- More likely to require &quot;casts&quot; at callsites to conver=
t data types</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think I l=
ean towards the flexible/broad typing strategy in general, but lament it ca=
nnot be applied appropriately here today.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
* PATCH 4: Suggested commit message addition okay?<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, ACK.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
We settle them, and then I&#39;ll take it from there.<br>
<br>
</blockquote></div></div></div>

--0000000000004a88e605f5392ade--


