Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE16F1A78
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 16:29:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psP4T-0007RL-Tf; Fri, 28 Apr 2023 10:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psP4S-0007RC-9e
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 10:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psP4Q-0005rW-5A
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 10:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682692029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yWJPzDW5JVBfnavrdZG7cIQRQVakRS5Jw+OEZg4Ly0g=;
 b=IKkAsIG23tfOFJxvR9evkHkA2XJqoFT3k6Ro89GsLVT0KxzeeU0ZnqIb07lBxTvGxAvK7m
 EcyIIDqE9az/OU8Joiz6r+gyTxzyhYQrIHTYjKVO4UqJ2i1zrxZqy8jqWN9rX9Hwq+MHah
 v6CS0buRb4Wck4EXCiahyAOp12j9KO8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-aAzG0L_rNZS2WaoaicKkzQ-1; Fri, 28 Apr 2023 10:26:15 -0400
X-MC-Unique: aAzG0L_rNZS2WaoaicKkzQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-77a0464f6b0so2378775241.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 07:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682691973; x=1685283973;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yWJPzDW5JVBfnavrdZG7cIQRQVakRS5Jw+OEZg4Ly0g=;
 b=RlLBk/hLw2nvnJ8NJ4IBbxZ04AyPUN+vzxfUFOOeNaVCVfv3UpxaExOwylk2F3ciFc
 cytaPVYI9gKhSunPmS4Y/lIGzL0E0XlmufQMonR0myqvpvFRaT4BzddpURVk1vDvFaPU
 FZgOImCbl4YnpWn3FtZt36tscWIRdCey27kWnE4JjWgsR8tstMNNYx5PR++FZbLbsOWC
 1eLEaX3lQ1eJS72r60WS+6MrG1QiuZpYgzEXANrDbE6oGNOD6NqiUTpfSerrWkL8i8C0
 Izr7JwT2/naF0Jq87icPKYz+23EkgZXfLnicEJxHWPT2Pq7nASA9bURwq65YPHi2oraG
 hafQ==
X-Gm-Message-State: AC+VfDxx0BpBkein/y4dI++XmatnsDgYnWGtNk/KdWy3oMqG2U0U0q/U
 Y7helmGkYoB9Ng1RXzUB190yJsLtbMlX2ykkjr3Gu9DIzQ6we1lvoUFZHE3b0SgDLNWLZVnx4DT
 RjEZjrgQtZlOYzgaH08SIGwTi/hQFIf8=
X-Received: by 2002:a67:f495:0:b0:41f:5d5a:b34a with SMTP id
 o21-20020a67f495000000b0041f5d5ab34amr2752019vsn.10.1682691972842; 
 Fri, 28 Apr 2023 07:26:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4e+fk2WQHMm3I+6joeOVk6/p6pMoy6tnIeHG0HrpWTgxuGARBjN0N/QWLMzhy6txP+x1XBFke6CXNaRv+q3iQ=
X-Received: by 2002:a67:f495:0:b0:41f:5d5a:b34a with SMTP id
 o21-20020a67f495000000b0041f5d5ab34amr2752009vsn.10.1682691972536; Fri, 28
 Apr 2023 07:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230420202939.1982044-1-clg@kaod.org>
 <87a5ywgkqg.fsf@secure.mitica>
 <ZEfUq52l/wut8puM@redhat.com> <ZEfWAciwsB+t7Crk@redhat.com>
In-Reply-To: <ZEfWAciwsB+t7Crk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 28 Apr 2023 16:26:01 +0200
Message-ID: <CABgObfY1ZmfRGjVnsQ6NC7jTe_X+Gx4uxW4R048xxaJ3Vdt+9A@mail.gmail.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004a2b6f05fa664185"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--0000000000004a2b6f05fa664185
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 25 apr 2023, 15:31 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> > > -    BHListSlice slice;
> > > +    /*
> > > +     * gcc13 complains about putting a local variable
> > > +     * in a global list, so put it on the heap.
> > > +     */
> > > +    g_autofree BHListSlice *slice =3D g_new(BHListSlice, 1);
> > >      BHListSlice *s;
> > >      int ret =3D 0;
> > >
> >
> > This must be a memory leak since you're adding a g_new but not
> > adding any g_free
>
> Sorry, I'm failing to read properly today. It uses g_autofree
> so there is no leak.
>

On the other hand, if the pointer to the heap-allocated BHListSlice
escaped, this would be a dangling pointer as well=E2=80=94just not the kind=
 that
the new GCC warning can report.

So this patch is also doing nothing but shut up the compiler; but it's
doing so in an underhanded manner and with a runtime cost, and as such it's
worse than Cedric's patch.

Paolo


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

--0000000000004a2b6f05fa664185
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 25 apr 2023, 15:31 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
&gt; &gt; -=C2=A0 =C2=A0 BHListSlice slice;<br>
&gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* gcc13 complains about putting a local vari=
able<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* in a global list, so put it on the heap.<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 g_autofree BHListSlice *slice =3D g_new(BHListSlic=
e, 1);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 BHListSlice *s;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; &gt;=C2=A0<br>
&gt; <br>
&gt; This must be a memory leak since you&#39;re adding a g_new but not<br>
&gt; adding any g_free<br>
<br>
Sorry, I&#39;m failing to read properly today. It uses g_autofree<br>
so there is no leak.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">On the other hand, if the pointer to the heap-allocated=
 BHListSlice escaped, this would be a dangling pointer as well=E2=80=94just=
 not the kind that the new GCC warning can report.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">So this patch is also doing nothing but shut up =
the compiler; but it&#39;s doing so in an underhanded manner and with a run=
time cost, and as such it&#39;s worse than Cedric&#39;s patch.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
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

--0000000000004a2b6f05fa664185--


