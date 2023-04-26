Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8A6EF842
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:19:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhpr-0008Ie-RR; Wed, 26 Apr 2023 12:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prhpp-0008IT-Vz
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prhpm-00059A-Gk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682525852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AM/NzgYBN1rnzao5owuLKpOti5NitlYwBu98c3NYiII=;
 b=EpqtbvtzVl8C+WKYvBxaNIHOrh8Fgre8zgsgKf8KmxNXzVwy6x1SYQvtuLuQNCt/2LjQxN
 LQfWsqmvLJfsnaXtzax3Y2S+ToxjNqFxzm6mrGdBBtJHR4FHafIQ/F96l1xkN68wTNcLh+
 3ra+5CComY04J5O1OWx/Y8UD9phDEZY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-fA1BzgLzOJaRdSad2ffcKw-1; Wed, 26 Apr 2023 12:16:58 -0400
X-MC-Unique: fA1BzgLzOJaRdSad2ffcKw-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-246627022c7so4318833a91.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682525805; x=1685117805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AM/NzgYBN1rnzao5owuLKpOti5NitlYwBu98c3NYiII=;
 b=VVaT8ezWf6R8lumNEISGb9EpkIqu2UTEkS+wqUfBfqlGa9FO4BF0rGVjxlXUxLwetB
 eRA5fi1Pi0gB0r2I4PooLzIwmpMO7Fwp7ak6+e/QyrL90kdeZH0hQ8KVRb2Mzmf/4KdS
 7Hu5e+7/1JOOUnXqhh5nZcrBDkiAug2lOlZv85vS5Kdg/g/QuCBTeZrnQplakq/4g9sB
 hUINcRViuewt5ccvovqtIJ5R0NjpxkYjYQ8sHFcCia5jz5xKn/3yw/Lz5ApD5vLTTqNL
 wRv4IKJUOtOtPIXmnCAV7qIOOcjSO7jnzi9G2kVt5BQ1OX89omwcIrMfOgsolgGQipeH
 M+UA==
X-Gm-Message-State: AAQBX9cYVO6sSK8ZJWkxqt/iE9oaOPazm3NEFgv+QeItvX1pRF0XKNZy
 Y7xn7Ca0fi4oTl20lWvdVn/0G5JuMeXf5YiSSnKNdICvshrFdKLVoQYMA5p8yAmt47KeV3+0qIx
 B4gIiveeHKYu9RSmUTQMjPo7KY3rQS0w=
X-Received: by 2002:a17:90a:f507:b0:24b:9460:6b19 with SMTP id
 cs7-20020a17090af50700b0024b94606b19mr13420346pjb.9.1682525805021; 
 Wed, 26 Apr 2023 09:16:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350b31BJumhzRrz1recHMNC/f0WNzkRuPIbQLthj/8Gr9ZPE/2OxKTX7A+6bNbhDtjuHIEludXZR2QOMGhVwHZbE=
X-Received: by 2002:a17:90a:f507:b0:24b:9460:6b19 with SMTP id
 cs7-20020a17090af50700b0024b94606b19mr13420325pjb.9.1682525804643; Wed, 26
 Apr 2023 09:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <87ab99cd-b3a6-22a5-ce2a-f569b2ef1213@redhat.com>
 <74877b05-a904-8c51-4b50-bdd078a2fab3@redhat.com>
In-Reply-To: <74877b05-a904-8c51-4b50-bdd078a2fab3@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 26 Apr 2023 12:16:33 -0400
Message-ID: <CAFn=p-ZRUocSC+UhTs1FPNBbnY0q2c6b5_ZAxT7_C9LjB8MKWA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e9598c05fa3f90f5"
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

--000000000000e9598c05fa3f90f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023, 4:49 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 4/26/23 10:05, Paolo Bonzini wrote:
> >>
> >
> > Thanks, this looks pretty good.  Some changes I'd make for the non-RFC
> > version:
> >
> > - I think we should just check in the meson wheel (which also removes
> > the need for patch 12, so it can be done in its stead) and remove the
> > submodule
>

OK, if there's no objections.

As a consequence, meson will likely never be downloaded from PyPI with the
patch set written as-is.

No real problem with that, just a difference.

>
> > - The verbosity of mkvenv.py can be tuned down and most prints replaced
> > with logger.info() or logger.debug()
>

=F0=9F=98=85

>
> > - While I agree with keeping patch 18 separate, I would move it earlier
> > so that patch 19 can be squashed into patch 14
> >


Agree. It was newer / more experimental so I kept it unsquash'd. If you
like it enough, asquashing I shall go.


> > - I am ambivalent about keeping --enable/--disable-pypi in the first
> > committed patchset, but in any case I would move patches 16 and 20
> > before patch 15
>

I might be stubborn but I think I want to keep it in for now. If it needs
redesigned to fit with the other flags you want to add, I think that's OK.

if we vendor the whl directly in qemu.git we won't need PyPI for meson, but
it's still useful for Sphinx so I think I'm still leaning towards keeping
it.

I'll try to refactor to keep it at the tail end of the series.


> Just one extra thing, since we're changing so much of Python handling
> and since the code is written, I would keep the Debian 10 workarounds
> for now, and only drop them after we drop support for 3.6.
>

This series was written assuming we get to drop 3.6 as a prereq. Is that
not the case?

Or did you mean to write 3.7 there?


> Paolo
>
>

--000000000000e9598c05fa3f90f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Apr 26, 2023, 4:49 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 4/26/23 10:05, Paolo Bonzini wrote:<br>
&gt;&gt;<br>
&gt; <br>
&gt; Thanks, this looks pretty good.=C2=A0 Some changes I&#39;d make for th=
e non-RFC <br>
&gt; version:<br>
&gt; <br>
&gt; - I think we should just check in the meson wheel (which also removes =
<br>
&gt; the need for patch 12, so it can be done in its stead) and remove the =
<br>
&gt; submodule<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">OK, if there&#39;s no objections.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">As a consequence, meson will likely never be downlo=
aded from PyPI with the patch set written as-is.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">No real problem with that, just a difference.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
&gt; <br>
&gt; - The verbosity of mkvenv.py can be tuned down and most prints replace=
d <br>
&gt; with <a href=3D"http://logger.info" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">logger.info</a>() or logger.debug()<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">=F0=9F=98=85</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
&gt; <br>
&gt; - While I agree with keeping patch 18 separate, I would move it earlie=
r <br>
&gt; so that patch 19 can be squashed into patch 14<br>
&gt;</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Agree. It was newer / more experimental so I kept it unsquash&#39;d. If you=
 like it enough, asquashing I shall go.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> =
<br>
&gt; - I am ambivalent about keeping --enable/--disable-pypi in the first <=
br>
&gt; committed patchset, but in any case I would move patches 16 and 20 <br=
>
&gt; before patch 15<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I might be stubborn but I think I want to keep it in fo=
r now. If it needs redesigned to fit with the other flags you want to add, =
I think that&#39;s OK.</div><div dir=3D"auto"><br></div><div dir=3D"auto">i=
f we vendor the whl directly in qemu.git we won&#39;t need PyPI for meson, =
but it&#39;s still useful for Sphinx so I think I&#39;m still leaning towar=
ds keeping it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll =
try to refactor to keep it at the tail end of the series.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><br>
Just one extra thing, since we&#39;re changing so much of Python handling <=
br>
and since the code is written, I would keep the Debian 10 workarounds <br>
for now, and only drop them after we drop support for 3.6.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">This series was w=
ritten assuming we get to drop 3.6 as a prereq. Is that not the case?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Or did you mean to write 3.7 =
there?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Paolo<br>
<br>
</blockquote></div></div></div>

--000000000000e9598c05fa3f90f5--


