Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A236EF87C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:32:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pri4M-00020Y-G0; Wed, 26 Apr 2023 12:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pri4I-0001zj-Ts
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pri4G-0007w3-DP
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682526751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OeTDoLXS6RltfLC6Fu5jlG1TPes/2zUMmmT55z2xi4k=;
 b=A/ca5MB0ynGzbCHhAVYxci2LlC4Roxw4VtPMJ8IKSJZti3QFUARKOTOpENHe6H8cmyt27s
 Tiz5PxCHDNBRwPEZzBf3P6T6UPX96XY1VL8iWTZXXvCp4Ez/aicXqXj5wlyItMgPJ5GzIL
 xkYY4F29PqajbhG0uiU7cFUMAtR4M3Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-3JtXjnG-Nnu_BasG-ToNhw-1; Wed, 26 Apr 2023 12:32:29 -0400
X-MC-Unique: 3JtXjnG-Nnu_BasG-ToNhw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f43679bcf5so4219544f8f.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526736; x=1685118736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeTDoLXS6RltfLC6Fu5jlG1TPes/2zUMmmT55z2xi4k=;
 b=PdeTsclKAg8pNjaDIpxTR4ahdofYUdi/U0FZ++ems6KjgUoqPuWCCa4BV5RHnLFf5t
 TElF7f5XLr/ZSx3caaq8tCHJ1UuSoj70F3OUt9sZoZV3VmdEukQZNG7hYU169MARiAD5
 uDn1A0aW5cqJbeNgdD8Yx+HT/ORuq+Hl6jaQaL9a4iHWEQJWceAQpCMrh4WguFims5/a
 mwb9tlGOmmJlTrfw2NRiuh5ociCJrbM9q/3uesVYtCFFDUTTWRLOd0V56rySXpVVx6y1
 sqyocnrS+mqZ7n55aLOmeslH50XyxdkH31tGTaaf6sC+GjyC66jNL1Ot5M0jo0eqaqLQ
 yxeg==
X-Gm-Message-State: AC+VfDwrbX0aiaKCeFPogyl7wvKg272wJkiQPfzaG7BEKV7qCzOtH+oy
 UYEX1FCCCxy2bARtWSadUTgCgfr19ZBRhBX7JiP7hHknQBrpwnfQz7dngopuXFB+mMp220VCnGz
 sGILaTbD2Cy9QOMZhSZ3gMTBbg8UoWkU=
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr3101869wrq.32.1682526736671; 
 Wed, 26 Apr 2023 09:32:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54wtmwg9wM0T61qy3gCLdnR6Fi2krR7r8lh0pS2WUhsJb8IRcLcAa8OH5NRm9XwrwZcuJSp46+pfuvm55/9oU=
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr3101856wrq.32.1682526736420; Wed, 26
 Apr 2023 09:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEjmo7dRO0Vwcmo5@redhat.com>
 <1f69da1d-ef7a-40f9-7116-fdd572962543@redhat.com>
In-Reply-To: <1f69da1d-ef7a-40f9-7116-fdd572962543@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 26 Apr 2023 12:32:02 -0400
Message-ID: <CAFn=p-a9Nz446twKediLqu-dzox7X_27MG+=mxDEBAdj+uehFQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, Thomas Huth <thuth@redhat.com>, 
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000073283d05fa3fc82d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000073283d05fa3fc82d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023, 5:08 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 4/26/23 10:53, Daniel P. Berrang=C3=A9 wrote:
> > I think it'd be useful for support purposes if the configure
> > script summary printed details of how we setup the venv.
> > eg perhaps a summary for each python module of whether we
> > added it to the venv, or relied on te site packages:
> >
> >     python venv: meson (site), sphinx (venv), avocado (venv)
>

OK, I'll try to work this out.

At the moment "already had the package" or "installed it from vendored
source" is the same pip call, so it's hard to differentiate post-hoc
without some further analysis.

One reason this is hard is because I don't have a good method for quickly
determining "Do we already have $package that fulfills $depspec" except by
invoking pip, and that's costly, 500ms at the absolute fastest I have yet
managed. 1.2s in more typical cases. Owowowow.

So, for speed, I combine "do we already have it" and "can we install it
from vendored source" into a single call to amortize pip startup cost.

With Python 3.8+ I might be able to inspect the package post-hoc to find
where it's installed to and determine if it came from system packages or
not.

It's easy to tell the user if we used PyPI or not, though.

I'll experiment.


> Yes, I agree John did a great job with the errors but a little more work
> is needed to cleanup of mkvenv.py's logging of the "good" case.


In the good case, it worked! you should be happy! :D

(kidding.)

  The
> installation case is already covered by "pip install"'s output, but we
> need to have something like:
>
> mkvenv: Creating {isolated|non-isolated} virtual environment [based on
> /home/pbonzini/myvenv]
>

"based on ..." for nested venv case only?


> and when creating the console-scripts shims:
>
> mkvenv: Found avocado v90.0
>

Sure. Up to the user at that point to figure out if we used that package or
not.

e.g. "found meson 0.5.0" might occur even if we require >=3D1.0.

Simple to implement, though.


> Paolo
>
>

--00000000000073283d05fa3fc82d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Apr 26, 2023, 5:08 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 4/26/23 10:53, Daniel P. Berrang=C3=A9 =
wrote:<br>
&gt; I think it&#39;d be useful for support purposes if the configure<br>
&gt; script summary printed details of how we setup the venv.<br>
&gt; eg perhaps a summary for each python module of whether we<br>
&gt; added it to the venv, or relied on te site packages:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0python venv: meson (site), sphinx (venv), avocado (=
venv)<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">OK, I&#39;ll try to work this out.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">At the moment &quot;already had the package&quot; or &quot;=
installed it from vendored source&quot; is the same pip call, so it&#39;s h=
ard to differentiate post-hoc without some further analysis.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">One reason this is hard is because I =
don&#39;t have a good method for quickly determining &quot;Do we already ha=
ve $package that fulfills $depspec&quot; except by invoking pip, and that&#=
39;s costly, 500ms at the absolute fastest I have yet managed. 1.2s in more=
 typical cases. Owowowow.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">So, for speed, I combine &quot;do we already have it&quot; and &quot;can =
we install it from vendored source&quot; into a single call to amortize pip=
 startup cost.</div><div dir=3D"auto"><br></div><div dir=3D"auto">With Pyth=
on 3.8+ I might be able to inspect the package post-hoc to find where it&#3=
9;s installed to and determine if it came from system packages or not.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s easy to tell the us=
er if we used PyPI or not, though.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I&#39;ll experiment.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Yes, I agree John did a great job with the errors but a little more work <b=
r>
is needed to cleanup of mkvenv.py&#39;s logging of the &quot;good&quot; cas=
e.</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">In=
 the good case, it worked! you should be happy! :D</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">(kidding.)</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=
=A0 The <br>
installation case is already covered by &quot;pip install&quot;&#39;s outpu=
t, but we <br>
need to have something like:<br>
<br>
mkvenv: Creating {isolated|non-isolated} virtual environment [based on <br>
/home/pbonzini/myvenv]<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">&quot;based on ...&quot; for nested venv case only?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
and when creating the console-scripts shims:<br>
<br>
mkvenv: Found avocado v90.0<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Sure. Up to the user at that point to figure out=
 if we used that package or not.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">e.g. &quot;found meson 0.5.0&quot; might occur even if we require=
 &gt;=3D1.0.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Simple to i=
mplement, though.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Paolo<br>
<br>
</blockquote></div></div></div>

--00000000000073283d05fa3fc82d--


