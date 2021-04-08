Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C284358D3E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:06:19 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUZyr-0006W3-DN
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUZwx-00058f-EB
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lUZwu-00020J-P1
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617908655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsOKEMbsBYpWZr2jmnaeJ270veGzm+BlZGjGdqb5n4o=;
 b=a6iYhDplHWc6JZj5uIQDSCSVbfndSg+XCS/UkYYX18VNlpkZF2n4X8DTNJBnxNttEY+Kv5
 xwDDdlevaXiBIHABYRvi0bt0i7LgrlO1PsrwmL5fWC57g5fuDHdAmo4x+KZumff+1pehjs
 B0H+G82pBX2e1BrNHQj+DpN+1PLzBLg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-q8Iy929xO8eCSTxrLXY34Q-1; Thu, 08 Apr 2021 15:04:11 -0400
X-MC-Unique: q8Iy929xO8eCSTxrLXY34Q-1
Received: by mail-pj1-f70.google.com with SMTP id q95so1813602pja.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PsOKEMbsBYpWZr2jmnaeJ270veGzm+BlZGjGdqb5n4o=;
 b=N2DNzuSAOYwtiabTX/OHnN4HWkK2m2c1UZACWwIN7ctDLGoN/SDOfaQU1pvwRkKZVW
 ojUvf/zCqcYfcPwZdQSEXfUREtdjMCgmeV56LtfEQluAeRMa4avGKFcjLCwgM3jbfDOq
 uHdeolWkJdgf6SXF5UQAx3aXmzXZ+cTU0uA9lQKpN8H0gdSIaLysh8f3vTp/eTotnCH7
 nDqdXFc8F5n6Llsd9v4m4mOoZjMB5gTiVx7fgxQjtHNrwS8NwgCaqa2w0Lz/mfihwKK9
 vtM4sU7DC7QAK8N5KwsGNA57+6oVnu/h8VuhuoPL7aa1MP8N+buJ9P7iak4GXgmRhL84
 lHkA==
X-Gm-Message-State: AOAM532hrQicLJq47vzzBmm6LibCEbXt3j95usGbvmlv9k6YypxJrfZ0
 mwz4RXpb0vWmb0VEI4YH9DfBwhLe4ZAwyFquAzeHUav2awotLE1H+beeq4NHNuZdLEsj1bqHXLy
 udgtGrbvgRyExOHAcBTVjHAPXzQzx6n4=
X-Received: by 2002:a63:3ecb:: with SMTP id l194mr9457629pga.146.1617908650728; 
 Thu, 08 Apr 2021 12:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3NalgJptAv1AWDmjGV+V+rXaiW/Y6iOEFI48YXkAdUH3rTn+gvRy1LrY2ApNwEL41g56i/xx2wNcnpHyv4BA=
X-Received: by 2002:a63:3ecb:: with SMTP id l194mr9457601pga.146.1617908650458; 
 Thu, 08 Apr 2021 12:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-5-eesposit@redhat.com>
 <ac7c35c0-8597-5450-e80a-cb8adac5d85f@redhat.com>
 <ef103aa2-d585-22ce-0aaf-45a6e190d2ef@redhat.com>
In-Reply-To: <ef103aa2-d585-22ce-0aaf-45a6e190d2ef@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 8 Apr 2021 21:03:57 +0200
Message-ID: <CABgObfad1g5n=Ya5+b9m0v_gVbFF1Tbg8Zo+iCuNWsJwiD6oNQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/11] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000063d57e05bf7ab6f8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063d57e05bf7ab6f8
Content-Type: text/plain; charset="UTF-8"

Il gio 8 apr 2021, 18:06 Emanuele Giuseppe Esposito <eesposit@redhat.com>
ha scritto:

>
>
> On 08/04/2021 17:40, Paolo Bonzini wrote:
> > On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:
> >>       def get_qmp_events_filtered(self, wait=60.0):
> >>           result = []
> >> -        for ev in self.get_qmp_events(wait=wait):
> >> +        qmp_wait = wait
> >> +        if qemu_gdb:
> >> +            qmp_wait = 0.0
> >> +        for ev in self.get_qmp_events(wait=qmp_wait):
> >>               result.append(filter_qmp_event(ev))
> >>           return result
> >
> > Should this be handled in get_qmp_events instead, since you're basically
> > changing all the callers?
>
> get_qmp_events is in python/machine.py, which as I understand might be
> used also by some other scripts, so I want to keep the changes there to
> the minimum. Also, machine.py has no access to qemu_gdb or
> qemu_valgrind, so passing a boolean or something to delay the timer
> would still require to add a similar check in all sections.
>
> Or do you have a cleaner way to do this?
>

Maybe a subclass IotestsMachine?

Paolo


> Emanuele
>
>

--00000000000063d57e05bf7ab6f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 8 apr 2021, 18:06 Emanuele Giuseppe Esposito &l=
t;<a href=3D"mailto:eesposit@redhat.com">eesposit@redhat.com</a>&gt; ha scr=
itto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 08/04/2021 17:40, Paolo Bonzini wrote:<br>
&gt; On 07/04/21 15:50, Emanuele Giuseppe Esposito wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def get_qmp_events_filtered(self, w=
ait=3D60.0):<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D =
[]<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ev in self.get_qmp=
_events(wait=3Dwait):<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qmp_wait =3D wait<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if qemu_gdb:<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qmp_wait =3D 0.0<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ev in self.get_qmp=
_events(wait=3Dqmp_wait):<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 result.append(filter_qmp_event(ev))<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return resu=
lt<br>
&gt; <br>
&gt; Should this be handled in get_qmp_events instead, since you&#39;re bas=
ically <br>
&gt; changing all the callers?<br>
<br>
get_qmp_events is in python/machine.py, which as I understand might be <br>
used also by some other scripts, so I want to keep the changes there to <br=
>
the minimum. Also, machine.py has no access to qemu_gdb or <br>
qemu_valgrind, so passing a boolean or something to delay the timer <br>
would still require to add a similar check in all sections.<br>
<br>
Or do you have a cleaner way to do this?<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Maybe a subclass IotestsMachine?</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Emanuele<br>
<br>
</blockquote></div></div></div>

--00000000000063d57e05bf7ab6f8--


