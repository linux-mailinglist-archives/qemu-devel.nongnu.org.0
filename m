Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDD60D583
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:28:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQWm-0003C9-2l; Tue, 25 Oct 2022 16:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onQWj-0003BZ-Mh
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onQWh-0005W9-LS
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666729674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjowZkZCFstTXopVvtWh3FQZ5/ibwmV/4D1o/3cJwnI=;
 b=BSRaaQ0wDFcs+BAUWlGml7SAnpfV5niYhK+Dodp7zaIhunElAsioAPl6L1ZkOKGvSWGpCP
 n7DsoGtMca6cDUKHXCYOih3wSN9FP10rK8cVU7kWeftFeWr6d2e6et6VoRzbxzHc3s9wSC
 b8LtOPTHbP6m+Ko8aUzDsL9/0C9Pr7A=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-UGNCrFU3PlC__4bHbWiW3w-1; Tue, 25 Oct 2022 16:27:50 -0400
X-MC-Unique: UGNCrFU3PlC__4bHbWiW3w-1
Received: by mail-vs1-f69.google.com with SMTP id
 a6-20020a671a06000000b003986a4e277dso3758016vsa.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 13:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xjowZkZCFstTXopVvtWh3FQZ5/ibwmV/4D1o/3cJwnI=;
 b=GDbxkWpRvGLCuTRVOG2RVdjZWwIGoiGI8kE+GFp4blUi//uI5EWOWehifDLHaUavB4
 SZ9V4zE3x6TBejKUuT0xvuyTkCk11gYmniN2cIqXY3NAtV9fXj6mWZN/MBlfLlApSWZP
 w2ABggE8ASif5Z4E9DsqH988IkS9zZk6ivnUF94xDL5eNH2mS2KSMHDJgexnbFmp/KYg
 7pyOhQshQMq7XXv7yXgjrUJMORJXeqqPvcsL5vRW463ZKD3Dx7tIeRMYRyoDDaguroXA
 i9HTnjHIgpyv54837FBwlZfAMTQtsQh0Ka1BtZRvV6OOGLX8G54ilHB6oy5bFcmw6aAX
 k60A==
X-Gm-Message-State: ACrzQf29O9dB9ug0zwn50XPEZIJ5F6uUS8h2Odk3MU2vB3GNP91iaKja
 OxrTWJsuAq76GpuOtO0j1DGYG1LDsabHs09qrjivUySpjOYa+HlQmCqN2GaaICUnRhUVCtr+cQd
 Sn12iNO2oGOPYXG/8dcyLqSn0hhwDQdY=
X-Received: by 2002:ab0:6592:0:b0:40c:4374:3aa4 with SMTP id
 v18-20020ab06592000000b0040c43743aa4mr5864165uam.42.1666729669395; 
 Tue, 25 Oct 2022 13:27:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4OzVEOwFkacaNoMfaqZR9A0Su68Gda85H6JCZAFbcByVHY1D6rmfMQDIFJvZBhhR8HRDFmI6K6VMOqy5EsRTY=
X-Received: by 2002:ab0:6592:0:b0:40c:4374:3aa4 with SMTP id
 v18-20020ab06592000000b0040c43743aa4mr5864154uam.42.1666729669144; Tue, 25
 Oct 2022 13:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221025092119.236224-1-pbonzini@redhat.com>
 <20221025143315.5697edad@bahia> <20221025163851.75ac37a1@bahia>
In-Reply-To: <20221025163851.75ac37a1@bahia>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 25 Oct 2022 22:27:36 +0200
Message-ID: <CABgObfZcmAr6S7zMK3N86gnpobL-=aS1mSW6yVitz3t2Va2h7g@mail.gmail.com>
Subject: Re: [PATCH] util/log: do not close and reopen log files when flags
 are turned off
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ddc56f05ebe1bdbe"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000ddc56f05ebe1bdbe
Content-Type: text/plain; charset="UTF-8"

Il mar 25 ott 2022, 16:39 Greg Kurz <groug@kaod.org> ha scritto:

> > > -    if (logfile && (!need_to_open_file || changed_name)) {
> > > -        qatomic_rcu_set(&global_file, NULL);
>
> Hmm... wait, shouldn't this NULLifying be performed...
>
> > > -        if (logfile != stderr) {
> > > +    if (logfile) {
> > > +        fflush(logfile);
> > > +        if (changed_name && logfile != stderr) {
> > >              RCUCloseFILE *r = g_new0(RCUCloseFILE, 1);
> > >              r->fd = logfile;
>
>
> ... here since we the following closes the global_file ?
>
> > >              call_rcu(r, rcu_close_file, rcu);
>

Yes it should.

Paolo

> > +            logfile = NULL;
> > >          }
> > > -        logfile = NULL;
> > >      }
> > >
> > >      if (!logfile && need_to_open_file) {
> > >          if (filename) {
> > > -            logfile = fopen(filename, log_append ? "a" : "w");
> > > +            logfile = fopen(filename, "w");
> > >              if (!logfile) {
> > >                  error_setg_errno(errp, errno, "Error opening logfile
> %s",
> > >                                   filename);
> > > @@ -290,8 +289,6 @@ static bool qemu_set_log_internal(const char
> *filename, bool changed_name,
> > >              logfile = stderr;
> > >          }
> > >
> > > -        log_append = 1;
> > > -
> > >          qatomic_rcu_set(&global_file, logfile);
> > >      }
> > >      return true;
> >
> >
>
>

--000000000000ddc56f05ebe1bdbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 25 ott 2022, 16:39 Greg Kurz &lt;<a href=3D"mai=
lto:groug@kaod.org">groug@kaod.org</a>&gt; ha scritto:</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
&gt; &gt; -=C2=A0 =C2=A0 if (logfile &amp;&amp; (!need_to_open_file || chan=
ged_name)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_rcu_set(&amp;global_file, NU=
LL);<br>
<br>
Hmm... wait, shouldn&#39;t this NULLifying be performed...<br>
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (logfile !=3D stderr) {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (logfile) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fflush(logfile);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (changed_name &amp;&amp; logfile =
!=3D stderr) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RCUCloseFILE *r =
=3D g_new0(RCUCloseFILE, 1);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;fd =3D logf=
ile;<br>
<br>
<br>
... here since we the following closes the global_file ?<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_rcu(r, rcu_c=
lose_file, rcu);<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Yes it should.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logfile =3D NULL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 logfile =3D NULL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!logfile &amp;&amp; need_to_open_file) {<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (filename) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logfile =3D fopen(file=
name, log_append ? &quot;a&quot; : &quot;w&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logfile =3D fopen(file=
name, &quot;w&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!logfile) {<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=
or_setg_errno(errp, errno, &quot;Error opening logfile %s&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename);<br>
&gt; &gt; @@ -290,8 +289,6 @@ static bool qemu_set_log_internal(const char =
*filename, bool changed_name,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logfile =3D stder=
r;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_append =3D 1;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_rcu_set(&amp;global_fil=
e, logfile);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000ddc56f05ebe1bdbe--


