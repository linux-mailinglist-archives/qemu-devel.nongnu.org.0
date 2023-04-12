Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42E6DE8DF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 03:29:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmPH9-000409-HF; Tue, 11 Apr 2023 21:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmPH4-0003zg-O8
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 21:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmPH2-0003DT-BI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 21:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681262867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=52dKt1oQ4xluuTs2qhKvt9UzIKMNaJpci5gnofT/QUQ=;
 b=HdXM65WVq2Cz+B7ywJP27VBcI23GIPSNuPhCtIUZN8Wx+NDCTikhbwSpMWPR7erNSUXcG+
 eUdDIZlf6nXRzerZXwCh3klrmX9AK8Y8BhNHJQYCn+ZzvhbbdB4ICZ7q//uSuD8o7ls0DY
 YxGRs28EI+NQ7smxR7if6/uIJLYueLU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-oEZfZQcgMm2eEktTjzvjHA-1; Tue, 11 Apr 2023 21:27:45 -0400
X-MC-Unique: oEZfZQcgMm2eEktTjzvjHA-1
Received: by mail-pj1-f71.google.com with SMTP id
 j19-20020a17090a841300b00246f53c6eecso460641pjn.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 18:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681262864; x=1683854864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52dKt1oQ4xluuTs2qhKvt9UzIKMNaJpci5gnofT/QUQ=;
 b=HAdpB7b/J3tat4K8vzKmueljSShKJzBNRggBmZmyMEvajskiAEFJDJbuXGdHPDfIB7
 GP5lNkw4+HxG/hYeVyoocwO8y2z8H0jMwaNSBLX09g9XyfGKYYykC66L8PUPGaMpuxzR
 L/dGGaZp36fjyN/AAA9Rw75qSFXMODujHLT66JkmAEK0azsxTyHPNLMUd2ULPo5rt5oD
 HqeF5OR1GFdp1rnopVPLjMZT2TY68XZwAEOIq/T0Dicf9FI7zO7UXLByZdRkLpTmRxE2
 FVVCQL4iz9y/Tn+heG+irFhKpnxEnl7gxGRtAjDIznsXj22Z/iqEwC08x7Vbn6t12kRE
 KVvA==
X-Gm-Message-State: AAQBX9f5dMj7lGBT/XF8iJXgxDagOTRfAjaV1mHadpznVs+umKcWEnKL
 cnIlwGwWb4ygXCuJGhYQXGsLHzV7T8ratwvbDS0n8TkAKBUQ/bJyLBXFNTmLw5fzi4edjECBEuH
 6Ky0WSHY6DDktTjg4F4a0giXxHc4kkPA=
X-Received: by 2002:a63:e10c:0:b0:503:7bbb:9a77 with SMTP id
 z12-20020a63e10c000000b005037bbb9a77mr3931615pgh.8.1681262864448; 
 Tue, 11 Apr 2023 18:27:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350amKKQqYxnizq1pQSnUuatdL2oqpz9SIUgcIVlxq6CvBRBn3+mVReJSw7s426NSUFgVo9hSxAnXWokf+I9RUYQ=
X-Received: by 2002:a63:e10c:0:b0:503:7bbb:9a77 with SMTP id
 z12-20020a63e10c000000b005037bbb9a77mr3931606pgh.8.1681262863996; Tue, 11 Apr
 2023 18:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-4-jsnow@redhat.com>
 <ZCQ0x3cDXOUsSX76@redhat.com>
 <88e77761-e9fe-d473-a4fa-c1d553bff4f3@redhat.com>
 <ZCQ9yfIDIhcm74n/@redhat.com>
In-Reply-To: <ZCQ9yfIDIhcm74n/@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Apr 2023 21:27:32 -0400
Message-ID: <CAFn=p-b_KpRxEsmzUUfzTEuq2Fwp3c_C9__gWMOM+MpS1786mw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] configure: install meson to a python virtual
 environment
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c8772e05f919835a"
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

--000000000000c8772e05f919835a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023, 9:32 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Wed, Mar 29, 2023 at 03:27:53PM +0200, Paolo Bonzini wrote:
> > On 3/29/23 14:53, Daniel P. Berrang=C3=A9 wrote:
> > > I would love to see a day where configure isn't involved in the
> > > build process. Obviously we can't put this new logic into
> > > meson as its a chicken & egg problem. Could we potentially
> > > have your new  python/scripts/mkvenv.py script be responsible
> > > for setting up meson in the venv though, so we can avoid
> > > adding more shell code to configure ?
> >
> > Not sure this is the same thing a what you want, but I do have a
> pipedream
> > of rewriting configure in Python.  At this point it has a lot more logi=
c
> > than it has command invocations.
>
> In a choice between 'shell configure' and 'python configure', I'll
> take the python version, as it is a fundamentally better language to
> be writing anything non-trivial in. My desire is to see the elimination
> of as much shell code as possible. As a broad goal, python should be the
> only scripting language we aim to use, in preference to shell or perl
> or any equivalent.
>

I certainly prefer python to shell; I can try to move as much logic as I
can into mkvenv.

For this RFC I tried to "disrupt" as little as I could so it was easier to
see the through-line and gain a sense for what exactly was changing. If
there's an appetite for being bolder and more aggressive, we can certainly
do that. I'm going to work out the kinks for the baseline functionality
first, then we can apply the lipstick.

Thanks,
(And sorry for the hiatus again. I haven't been feeling well, please
forgive my spotty attention.)

--js


> With regards,
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

--000000000000c8772e05f919835a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29, 2023, 9:32 AM Daniel =
P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blan=
k">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Wed, Mar 29, 2023 at 03:27:53PM +0200, Paolo Bonzini wrote:<br>
&gt; On 3/29/23 14:53, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; I would love to see a day where configure isn&#39;t involved in t=
he<br>
&gt; &gt; build process. Obviously we can&#39;t put this new logic into<br>
&gt; &gt; meson as its a chicken &amp; egg problem. Could we potentially<br=
>
&gt; &gt; have your new=C2=A0 python/scripts/mkvenv.py script be responsibl=
e<br>
&gt; &gt; for setting up meson in the venv though, so we can avoid<br>
&gt; &gt; adding more shell code to configure ?<br>
&gt; <br>
&gt; Not sure this is the same thing a what you want, but I do have a piped=
ream<br>
&gt; of rewriting configure in Python.=C2=A0 At this point it has a lot mor=
e logic<br>
&gt; than it has command invocations.<br>
<br>
In a choice between &#39;shell configure&#39; and &#39;python configure&#39=
;, I&#39;ll<br>
take the python version, as it is a fundamentally better language to<br>
be writing anything non-trivial in. My desire is to see the elimination<br>
of as much shell code as possible. As a broad goal, python should be the<br=
>
only scripting language we aim to use, in preference to shell or perl<br>
or any equivalent.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I certainly prefer python to shell; I can try to move as =
much logic as I can into mkvenv.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">For this RFC I tried to &quot;disrupt&quot; as little as I could =
so it was easier to see the through-line and gain a sense for what exactly =
was changing. If there&#39;s an appetite for being bolder and more aggressi=
ve, we can certainly do that. I&#39;m going to work out the kinks for the b=
aseline functionality first, then we can apply the lipstick.</div><div dir=
=3D"auto"><br></div><div>Thanks,</div><div>(And sorry for the hiatus again.=
 I haven&#39;t been feeling well, please forgive my spotty attention.)</div=
><div><br></div><div>--js<br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
With regards,<br>
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
</div>

--000000000000c8772e05f919835a--


