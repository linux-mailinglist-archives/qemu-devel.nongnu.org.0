Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4278382ACF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:21:40 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libJb-0006bj-Oz
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libGa-0003me-KP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1libGX-0004xx-2R
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+eb+M9NfSAuIgABtfhFInItiD6geODHIVYkVnuimyg=;
 b=RgIgRtE7TwYgpsjlXNWZFa4jRIunkpux7MjqT9w9tgaDZ7YFjju54i7581TlvPLDfLAPKk
 wjxn1MOtg926q7I6coOcaEbI4nHQFAGt3PnLyMre113fC2oYdR8dZNP7GJ3vAhVyUN+Ysc
 5rFwiw8FXN2R1iGZ0lKZSr3MKQBeVE8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-7jiVo4FrO8-w0ybp1FKzKA-1; Mon, 17 May 2021 07:18:24 -0400
X-MC-Unique: 7jiVo4FrO8-w0ybp1FKzKA-1
Received: by mail-pj1-f70.google.com with SMTP id
 u13-20020a17090a3fcdb0290155c6507e67so4754465pjm.6
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+eb+M9NfSAuIgABtfhFInItiD6geODHIVYkVnuimyg=;
 b=dStnaoNSCQZLlrvI9GTWRBTKRrqt+ziiu9zQiV5TUe+ruZsMXQOOiHPwqspRGt39DA
 lE8WKfl/u8D4qXfKJDsBZj4ByQy4UOewhACE30Bc8nRPxz2kxTqDSRBBTyHnTgCSE/jV
 G0fzjkWuAtpfWJ2UJTBkaC+/NRy/Omzk//yGAtg8qwvnjcUNrcrTo3ScLCFB5aiAHg3b
 10mmrYBwhlItmUZmrsOyzihfvLTRcFQn9CfMUZ1AzTSiuPx5+s82PBm663BE4GeAYVFZ
 jD+WO2oBbEvOgLiWn7y+mrZp/X1owzBQ+p4fSj4WVAqaOwL5sa7zuDAaHz2ZPFFe+huS
 m97A==
X-Gm-Message-State: AOAM530GkLGqftCw2tiTlWzB4ui7FZDB2SPpea7KE4Ms8ERr3loch6mb
 owA/z7a1sV24pjsnO7JKzOq+icyfqT6QAQgE/UMfXah+Pb4W0IAVDV6XqghLC6mALZqbck/LUPa
 5V6njm14Gxb7t1fv+QuHcXkY8JtFyh4c=
X-Received: by 2002:aa7:85d0:0:b029:28e:80ff:cbf4 with SMTP id
 z16-20020aa785d00000b029028e80ffcbf4mr59214098pfn.59.1621250303758; 
 Mon, 17 May 2021 04:18:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxIOZKAT8WKRhm2/L/SeU6taGD/eHPk9Au363ymTjGITg6okUq4MFvtmFerkOzqV/6RkMoAl0YD/tSDKxJH/k=
X-Received: by 2002:aa7:85d0:0:b029:28e:80ff:cbf4 with SMTP id
 z16-20020aa785d00000b029028e80ffcbf4mr59214086pfn.59.1621250303488; Mon, 17
 May 2021 04:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-3-marcandre.lureau@redhat.com>
 <YJqzVkWfOo3MPzj2@stefanha-x1.localdomain>
 <41ed2922-84f2-7d27-5fc3-39f0f180a706@redhat.com>
In-Reply-To: <41ed2922-84f2-7d27-5fc3-39f0f180a706@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 May 2021 15:18:12 +0400
Message-ID: <CAMxuvayYEaoCQvWiDLPbhf0RYa33jt0nKxRA8H+2kYxx6K5PGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] qapi: move gen_if/gen_endif to QAPISchemaIfCond
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006e970105c284c022"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Armbruster, Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e970105c284c022
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 12, 2021 at 10:53 PM John Snow <jsnow@redhat.com> wrote:

> On 5/11/21 12:39 PM, Stefan Hajnoczi wrote:
> > On Thu, Apr 29, 2021 at 05:40:25PM +0400, marcandre.lureau@redhat.com
> wrote:
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Move the generating function to the QAPISchemaIfCond class.
> >
> > I'm not familiar enough with the QAPI code generator to know whether
> > schema.py is supposed to generate C code directly. Otherwise this
> > refactoring makes sense.
> >
>
> It's not supposed to, necessarily, but schema.py *does* already have
> some "built-in" ties to the C language -- in particular its use of
> POINTER_SUFFIX and c_name. It isn't split ultra-cleanly.
>
> Ideally, and I am neither asking for nor requiring this, I would like to
> see code generator backends factored neatly such that the C generative
> code is all in one place, or at least outside of the abstract QAPI
> internals.
>
> (Maybe gen.py can be split into gen.py and c_gen.py, and the C-specific
> bits for gen_if et al can go into c_gen.py.)
>
> Since you are working towards a Rust backend, I assume that the
> C-specific portions of this code don't remain in schema.py for too long?
> I can't imagine them being here helps you with your Rust generator, but
> I could be wrong.
>

I agree. Let's not mix everything in this series which would delay it even
further. Let's address this when we get to actually add other bindings.

thanks

--0000000000006e970105c284c022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at 10:53 PM John Snow &l=
t;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
5/11/21 12:39 PM, Stefan Hajnoczi wrote:<br>
&gt; On Thu, Apr 29, 2021 at 05:40:25PM +0400, <a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:=
<br>
&gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Move the generating function to the QAPISchemaIfCond class.<br>
&gt; <br>
&gt; I&#39;m not familiar enough with the QAPI code generator to know wheth=
er<br>
&gt; schema.py is supposed to generate C code directly. Otherwise this<br>
&gt; refactoring makes sense.<br>
&gt; <br>
<br>
It&#39;s not supposed to, necessarily, but schema.py *does* already have <b=
r>
some &quot;built-in&quot; ties to the C language -- in particular its use o=
f <br>
POINTER_SUFFIX and c_name. It isn&#39;t split ultra-cleanly.<br>
<br>
Ideally, and I am neither asking for nor requiring this, I would like to <b=
r>
see code generator backends factored neatly such that the C generative <br>
code is all in one place, or at least outside of the abstract QAPI <br>
internals.<br>
<br>
(Maybe gen.py can be split into gen.py and c_gen.py, and the C-specific <br=
>
bits for gen_if et al can go into c_gen.py.)<br>
<br>
Since you are working towards a Rust backend, I assume that the <br>
C-specific portions of this code don&#39;t remain in schema.py for too long=
? <br>
I can&#39;t imagine them being here helps you with your Rust generator, but=
 <br>
I could be wrong.<br></blockquote><div><br></div><div>I agree. Let&#39;s no=
t mix everything in this series which would delay it even further. Let&#39;=
s address this when we get to actually add other bindings.=C2=A0</div><div>=
<br></div><div>thanks<br></div></div></div>

--0000000000006e970105c284c022--


