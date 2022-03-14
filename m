Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A24D8C8A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:39:14 +0100 (CET)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqXA-0003Nz-Uo
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:39:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nTqVM-0001zF-QB
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nTqVI-0001T2-W2
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647286635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hmVPhj9kwHoBgn8H26pKW9K8lD7U1wNZCSh+FifmG4=;
 b=bE9o4nv/83bizRguN/GNqGWmMZcWMzkWPP8OObdDH4IMIzyiLyazR1i6PkHNktGPgOiAtG
 sNmpMhkFffxk3EiNnFy0kth3futotG3mgMDDU6RKht80AisnR11fOjoZPSzsbt4crqtaUO
 bUy0+2y6d4fFRTYoUA/pnehIGVycfPM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-7px0kWFWPzeyQsHJzGmz_Q-1; Mon, 14 Mar 2022 15:37:14 -0400
X-MC-Unique: 7px0kWFWPzeyQsHJzGmz_Q-1
Received: by mail-pj1-f69.google.com with SMTP id
 h7-20020a17090adb8700b001c62f021a28so156396pjv.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hmVPhj9kwHoBgn8H26pKW9K8lD7U1wNZCSh+FifmG4=;
 b=KQQRcDGegXd2aWMZV3ZUOMbL2QQFn0GWHRLFZRw0MH6hocM573SLY0zFXk3WCkU8C0
 rdQy0DjtRwWm6+ZRgP5gMwbrBEMqt3DMOkNPpfidA1yRZ8oCP7K7E/8qYnL4cOoSm5GF
 4RXBW1lGocNE+k6LbT9juT/uLchTLwd7AHFIZbBi1LFP0g/4L5CDLwZ/KSORTcjX2oyY
 831ns0D5CesP95s6TuhgRMZDVWsEt0pugbZKgxk4ir3HiFvAiegGVYuE7ZIHBSg59tjn
 YArEb9Nu+m17ZtKJKgfh9cgJl09rojppHXmuUIPI9PjU8/GQcbOB+0eoRavoUWViM3y8
 BBQQ==
X-Gm-Message-State: AOAM5325ohoA5xWWFcYnW8rqOJvKf7GiK5Haz4UyV5T7PA4oIVHSvaKQ
 eNIZOuOciGe+g5koB2R1RWoPTW862YYwD9OlcfL43iyvBzG2wMoMq/9v4wSQSPqVuqcw9rmaMcN
 XK7TidGf7yJCCFvjSfivcMAzJxI0zvpY=
X-Received: by 2002:a17:902:d486:b0:151:8e66:621c with SMTP id
 c6-20020a170902d48600b001518e66621cmr24881947plg.141.1647286632881; 
 Mon, 14 Mar 2022 12:37:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxclYNlO48fuPKqA59dheImsDhmDMEZXLSRT82S1nuuXAW6KhRYJHuJ+P3hmlsOSk99wTvji767i1VotixZb8U=
X-Received: by 2002:a17:902:d486:b0:151:8e66:621c with SMTP id
 c6-20020a170902d48600b001518e66621cmr24881931plg.141.1647286632620; Mon, 14
 Mar 2022 12:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-15-pbonzini@redhat.com>
 <Yi9TG2/f6baWIiiR@stefanha-x1.localdomain>
In-Reply-To: <Yi9TG2/f6baWIiiR@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 14 Mar 2022 20:36:59 +0100
Message-ID: <CABgObfahuF9bG7rZetEhDTeDVp3r8=w_RB_fShMybx+mawG9dQ@mail.gmail.com>
Subject: Re: [PATCH experiment 14/16] util: introduce C++ stackless coroutine
 backend
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000094ba2205da32ce99"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "P. Berrange, Daniel" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094ba2205da32ce99
Content-Type: text/plain; charset="UTF-8"

Il lun 14 mar 2022, 15:37 Stefan Hajnoczi <stefanha@redhat.com> ha scritto:

> On Mon, Mar 14, 2022 at 10:32:01AM +0100, Paolo Bonzini wrote:
> > +// ------------------------
> > +
> > +// CoroutineFn does not even need anything more than what
> > +// BaseCoroutine provides, so it's just a type alias.  The magic
> > +// is all in ValuePromise<T>.
> > +//
> > +// Suspended CoroutineFns are chained between themselves.  Whenever a
> > +// coroutine is suspended, all those that have done a co_await are
> > +// also suspended, and whenever a coroutine finishes, it has to
> > +// check if its parent can now be resumed.
> > +//
> > +// The two auxiliary classes Awaiter and ResumeAndFinish take
> > +// care of the two sides of this.  Awaiter's await_suspend() stores
> > +// the parent coroutine into ValuePromise; ResumeAndFinish's runs
> > +// after a coroutine returns, and resumes the parent coroutine.
> > +
> > +template<typename T> struct ValuePromise;
> > +template<typename T>
> > +using CoroutineFn = BaseCoroutine<ValuePromise<T>>;
> > +
> > +typedef CoroutineFn<void> CoroutineFunc(void *);
>
> CoroutineFunc looks like a coroutine entry point function. If that's
> correct then I suggest naming it CoroutineEntryFunc to avoid confusion
> between CoroutineFn vs CoroutineFunc (their names are too similar).
>

Nevermind, it's a useless dup of CoroutineEntry.


> Also, where is CoroutineFunc used?
>
> > +// The actu promises, respectively for non-void and void types.
>
> s/actu/actual/?
>

Yes.

Paolo

>

--00000000000094ba2205da32ce99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il lun 14 mar 2022, 15:37 Stefan Hajnoczi &lt;<a href=3D"mailt=
o:stefanha@redhat.com">stefanha@redhat.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Mon, Mar 14, 2022 at 10:32:01AM +0100, Paolo=
 Bonzini wrote:<br>
&gt; +// ------------------------<br>
&gt; +<br>
&gt; +// CoroutineFn does not even need anything more than what<br>
&gt; +// BaseCoroutine provides, so it&#39;s just a type alias.=C2=A0 The m=
agic<br>
&gt; +// is all in ValuePromise&lt;T&gt;.<br>
&gt; +//<br>
&gt; +// Suspended CoroutineFns are chained between themselves.=C2=A0 Whene=
ver a<br>
&gt; +// coroutine is suspended, all those that have done a co_await are<br=
>
&gt; +// also suspended, and whenever a coroutine finishes, it has to<br>
&gt; +// check if its parent can now be resumed.<br>
&gt; +//<br>
&gt; +// The two auxiliary classes Awaiter and ResumeAndFinish take<br>
&gt; +// care of the two sides of this.=C2=A0 Awaiter&#39;s await_suspend()=
 stores<br>
&gt; +// the parent coroutine into ValuePromise; ResumeAndFinish&#39;s runs=
<br>
&gt; +// after a coroutine returns, and resumes the parent coroutine.<br>
&gt; +<br>
&gt; +template&lt;typename T&gt; struct ValuePromise;<br>
&gt; +template&lt;typename T&gt;<br>
&gt; +using CoroutineFn =3D BaseCoroutine&lt;ValuePromise&lt;T&gt;&gt;;<br>
&gt; +<br>
&gt; +typedef CoroutineFn&lt;void&gt; CoroutineFunc(void *);<br>
<br>
CoroutineFunc looks like a coroutine entry point function. If that&#39;s<br=
>
correct then I suggest naming it CoroutineEntryFunc to avoid confusion<br>
between CoroutineFn vs CoroutineFunc (their names are too similar).<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Nevermin=
d, it&#39;s a useless dup of CoroutineEntry.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
Also, where is CoroutineFunc used?<br>
<br>
&gt; +// The actu promises, respectively for non-void and void types.<br>
<br>
s/actu/actual/?<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Yes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paol=
o</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
</blockquote></div></div></div>

--00000000000094ba2205da32ce99--


