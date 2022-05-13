Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F95266C8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:11:34 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXt7-0008Q0-96
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXii-0007X9-5E
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXif-0002pt-EG
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4DgrNo4l6x3OvNaMnAiVKdz1qLZVfCzsQi4S3WVnmiA=;
 b=Z1HdA3zqmCoXno8MMGFA9qZYIAuBNFyoQp1CUzDQVT3eHieejvy/8Q242dODVulUvfp3R9
 ewOkUB73h0DmJenaoK80emabTw5ikkivRz45DwfrbauGT0/fFqgHa0XCUvIp/9iHgsGg+M
 W9BzehWwUq+cDvC4DpyAzF2fVUBAhWU=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-N9eS9gHiMISYfxTSZslxJw-1; Fri, 13 May 2022 12:00:43 -0400
X-MC-Unique: N9eS9gHiMISYfxTSZslxJw-1
Received: by mail-vs1-f69.google.com with SMTP id
 e24-20020a056102355800b0032ce5dd4cbeso603467vss.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4DgrNo4l6x3OvNaMnAiVKdz1qLZVfCzsQi4S3WVnmiA=;
 b=y30I7bdX0E8dUZcxdLQLVR+XWtAbGQ0lYMsNl3/NBoLhTggIY9KH443m4Is0H2QDmU
 CF3pAuEVteJCyHcyD8tGKVcIxaRnLmd5GFEaKYoG8x8KA95OBwTwb2NgI+Qtc8P+Xu+2
 upKzCDW8HAhqJMYwyj0FTlk+KwwLyGRuDnmReuc0Q2rGXHNhMC4+u2DrqMGAGyN/Q9nf
 U9AsZF8J/DkcPMuMZA2f3iP8Hf3LM7B9tgqEEyEd9sDEqapIm9YzP0fjeiC91+6LvHss
 R90dfstSAxJzlyLgJKb0b0t/vozq9AZsUvqfIbwSk5AZ1spgd+VO7BHyk49PnlmUVe95
 yHgA==
X-Gm-Message-State: AOAM533Nm6lG9D5gwnxhL6S6/0hVPmXe8tdjniLT8whJmwL9IUZ4GxjM
 UPyM9XVItPlAlgT/88NVi5pkkufsYPCSsfy2q5CDxLM2TNgKXwB2ZSS0/9YBYBhzhr6A4kP/rJG
 xfg4QgwePYZhSesyA8wxudjD0fI90X+Q=
X-Received: by 2002:a1f:17cf:0:b0:352:62f2:f5a0 with SMTP id
 198-20020a1f17cf000000b0035262f2f5a0mr2609086vkx.1.1652457641721; 
 Fri, 13 May 2022 09:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNal7+0OZbK6ryJVEOZEX3eTCcfQr8V49XPOTkIZ+OKKgH7ZRiLF/YEXrntiQzFxYQ28bM/0hUGDLmoym0A/o=
X-Received: by 2002:a1f:17cf:0:b0:352:62f2:f5a0 with SMTP id
 198-20020a1f17cf000000b0035262f2f5a0mr2609066vkx.1.1652457641237; Fri, 13 May
 2022 09:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-10-jsnow@redhat.com>
 <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
 <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
 <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
In-Reply-To: <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 12:00:30 -0400
Message-ID: <CAFn=p-YkeSLN1f=sHqmXVrBCNpaPJVR=nuJh=wE4bQ2XwJRryg@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b674f805dee6c67e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b674f805dee6c67e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022, 11:33 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 16:38, John Snow wrote:
> > It *should*, because "#!/usr/bin/env python3" is the preferred shebang
> > for Python scripts.
> >
> > https://peps.python.org/pep-0394/ <https://peps.python.org/pep-0394/>
> >
> > 'python3' "should" be available. 'python' may not be.
> >
> > Probably the "python" name in Makefile for TESTS_PYTHON should actually
> > be "python3" as well. In practice, all permutations (python, python3,
> > python3.9, etc.) are symlinks* to the binary used to create the venv.
> > Which links are present may be site configurable, but pep394 should
> > guarantee that python3 is always available.
>
> IIRC we have some cases (FreeBSD?) where only the python3.x executable
> is available.  This is why we 1) default to Meson's Python 3 if neither
> --meson nor --python are passed, and 2) use the shebang you mention but
> with *non-executable* files, which Meson treats magically as "invoke
> with the Python interpreter that was used to launch me".
>

This tidbit is particularly =F0=9F=98=A5


> Paolo
>

FreeBSD, why do you insist on hurting me?

(I'm surprised - python3 is *supposed* to be defined. Isn't this supremely
annoying for FreeBSD users to have every last Python shebang script not
work?)

OK. I'll test, and possibly update avocado's existing makefile magic if
necessary. It may be the case that the venv just works anyway. No way to
know but to test, I guess.

--000000000000b674f805dee6c67e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 11:33 AM Paolo Bonzini &lt;<a hr=
ef=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 5/13/22 16:38, John Snow wrote:<br>
&gt; It *should*, because &quot;#!/usr/bin/env python3&quot; is the preferr=
ed shebang <br>
&gt; for Python scripts.<br>
&gt; <br>
&gt; <a href=3D"https://peps.python.org/pep-0394/" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://peps.python.org/pep-0394/</a> &lt;<a href=
=3D"https://peps.python.org/pep-0394/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://peps.python.org/pep-0394/</a>&gt;<br>
&gt; <br>
&gt; &#39;python3&#39; &quot;should&quot; be available. &#39;python&#39; ma=
y not be.<br>
&gt; <br>
&gt; Probably the &quot;python&quot; name in Makefile for TESTS_PYTHON shou=
ld actually <br>
&gt; be &quot;python3&quot; as well. In practice, all permutations (python,=
 python3, <br>
&gt; python3.9, etc.)=C2=A0are symlinks* to the binary used to create the v=
env. <br>
&gt; Which links are present may be site configurable, but pep394 should <b=
r>
&gt; guarantee that python3 is always available.<br>
<br>
IIRC we have some cases (FreeBSD?) where only the python3.x executable <br>
is available.=C2=A0 This is why we 1) default to Meson&#39;s Python 3 if ne=
ither <br>
--meson nor --python are passed, and 2) use the shebang you mention but <br=
>
with *non-executable* files, which Meson treats magically as &quot;invoke <=
br>
with the Python interpreter that was used to launch me&quot;.<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">This tidbit is=
 particularly =F0=9F=98=A5</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">FreeBSD, why do you insist on hurting me?</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">(I&#39;m surprised - python3 is *supposed* to be def=
ined. Isn&#39;t this supremely annoying for FreeBSD users to have every las=
t Python shebang script not work?)</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">OK. I&#39;ll test, and possibly update avocado&#39;s existing ma=
kefile magic if necessary. It may be the case that the venv just works anyw=
ay. No way to know but to test, I guess.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000b674f805dee6c67e--


