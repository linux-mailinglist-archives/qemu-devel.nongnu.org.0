Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB1457702B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 18:41:42 +0200 (CEST)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCkrM-0002r5-N8
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 12:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCkph-0001PQ-CP
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 12:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCkpe-0006ER-2Z
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 12:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657989592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IuXm0HixS3C969OQesIDU8ydsfGZuw5paWSL74ZJi5g=;
 b=I86HYy40da0+Q9v4LeZuiK31nmX2ZcsotoE5Wq6l959sAlFRNyfLsPn8rUDZIxWRdAGVml
 4crizGN1eJgXC9r2fDV7ni+DQaT54ZOcpHgUA95XM2HtODiBLNLu4k5sRcZKxHYqcvVG3l
 loe7oOMBplu0twTG8WIw8Zp4eV8TDFM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-Hx4a1oGsNRSbCn4yBjJ5sQ-1; Sat, 16 Jul 2022 12:39:45 -0400
X-MC-Unique: Hx4a1oGsNRSbCn4yBjJ5sQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 y8-20020ac24208000000b0047f9fc8f632so2901906lfh.11
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 09:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuXm0HixS3C969OQesIDU8ydsfGZuw5paWSL74ZJi5g=;
 b=PeDc/poFc1sFV5CFBoGZ36Vz+p0tImZMZ6xuosjDPYchaC0b7er5Oa67GlFYdUMnCb
 v0DeeMELi5Zfbyle5NcnZDCePleo4WfyGLG1kkDZqfR6To8SLT32DKz/reU490HmZtDo
 v9yaAPtj0kylF+2lDVQArZYgdIDVjVPLAnkFYeMNMmqTEsdIHM64Ewr1bx50WWmByX0J
 9na4yYawpuAPgOGg28Ww9UthiJSwdAn5fFhbred9ougV/2iHhWudos/whqGwavVlBpwS
 N/kgdOF2kuBS9vo6ahJnQMmg4MY8E8fjzcITQYFsWuchGahCRIjSiFw8YjBBRZFQ0Q3e
 vX4w==
X-Gm-Message-State: AJIora9To+tRZQvvCn1VCTgghsA/GIzbRs4rz8W5/TKOkvDmtXihJrl0
 TowLpH5LoCOyGIfpm9osLX7dlNv6ylCFBxmtcmHUJMP8/LP0VilovvF4wMqUf1J3mk5Kxxoe0dw
 GPtXJiqBlhOJ/ZtCfkr982g8MUhux1YM=
X-Received: by 2002:a2e:6e19:0:b0:25d:5cee:a2e8 with SMTP id
 j25-20020a2e6e19000000b0025d5ceea2e8mr8942640ljc.425.1657989583846; 
 Sat, 16 Jul 2022 09:39:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyQ5N6/B3FEz/JQ6sikDbrd25u2p6cZQJXR8xEymRnEegVnN0/LNJOeWROieNCwwERBhZr6/rAVkVlgjQKqbg=
X-Received: by 2002:a2e:6e19:0:b0:25d:5cee:a2e8 with SMTP id
 j25-20020a2e6e19000000b0025d5ceea2e8mr8942631ljc.425.1657989583581; Sat, 16
 Jul 2022 09:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
 <20220715134750.63090-2-akihiko.odaki@gmail.com>
 <675d98f9-9045-5bf9-27c7-c2d5cb0b088d@redhat.com>
 <2704624f-6e89-1938-e54f-f5ddcb0daf6e@gmail.com>
In-Reply-To: <2704624f-6e89-1938-e54f-f5ddcb0daf6e@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 16 Jul 2022 18:39:31 +0200
Message-ID: <CABgObfb3HL_JyW2PLT-WdMH+yFDPwLaWMoFoqu_18iT+LKuZsQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ui/cocoa: Run qemu_init in the main thread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000002bc9a805e3eec80b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000002bc9a805e3eec80b
Content-Type: text/plain; charset="UTF-8"

Il sab 16 lug 2022, 13:30 Akihiko Odaki <akihiko.odaki@gmail.com> ha
scritto:

> On 2022/07/16 19:16, Paolo Bonzini wrote:
> > On 7/15/22 15:47, Akihiko Odaki wrote:
> >>   static void *call_qemu_main(void *opaque)
> >>   {
> >>      ...
> >> +    [NSApp terminate:nil];
> > Is this thread-safe?  I think it should be something like:
>
> Yes, -[NSApplication terminate:] is thread-safe. Methods of
> NSApplication handle dispatches to the main thread by themselves.
>

Is this documented anywhere?

Paolo

Regards,
> Akihiko Odaki
>
> >
> > - here:
> >
> >      /*
> >       * Nothing more to do in the QEMU thread, ask the application
> >       * to exit.
> >       */
> >      dispatch_async(dispatch_get_main_queue(), ^{
> >          [NSApp terminate: nil];
> >      });
> >
> > - in verifyQuit:
> >
> >      if([alert runModal] == NSAlertSecondButtonReturn) {
> >          with_iothread_lock(^{
> >              shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> >              qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> >          });
> >      }
> >      /* and just return void */
> >
> > - applicationShouldTerminate: should be just
> >
> >      if (qatomic_read(&qemu_main_terminating)) {
> >          return NSTerminateNow;
> >      } else {
> >          dispatch_async(dispatch_get_main_queue(), ^{
> >              [self verifyQuit];
> >          });
> >      }
> >      return NSTerminateCancel;
> >
> > - applicationWillTerminate: can be just the qemu_thread_join
> >
> > Paolo
>
>

--0000000000002bc9a805e3eec80b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 16 lug 2022, 13:30 Akihiko Odaki &lt;<a href=3D=
"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail.com</a>&gt; ha scritto=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 2022/07/16 19:16, Paolo Bonzin=
i wrote:<br>
&gt; On 7/15/22 15:47, Akihiko Odaki wrote:<br>
&gt;&gt; =C2=A0 static void *call_qemu_main(void *opaque)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 ...<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 [NSApp terminate:nil];<br>
&gt; Is this thread-safe?=C2=A0 I think it should be something like:<br>
<br>
Yes, -[NSApplication terminate:] is thread-safe. Methods of <br>
NSApplication handle dispatches to the main thread by themselves.<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Is this do=
cumented anywhere?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; <br>
&gt; - here:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 * Nothing more to do in the QEMU thread=
, ask the application<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 * to exit.<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 dispatch_async(dispatch_get_main_queue(), ^{<=
br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [NSApp terminate: nil=
];<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 });<br>
&gt; <br>
&gt; - in verifyQuit:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 if([alert runModal] =3D=3D NSAlertSecondButto=
nReturn) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with_iothread_lock(^{=
<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 shutdown_action =3D SHUTDOWN_ACTION_POWEROFF;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 /* and just return void */<br>
&gt; <br>
&gt; - applicationShouldTerminate: should be just<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 if (qatomic_read(&amp;qemu_main_terminating))=
 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NSTerminateNow=
;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dispatch_async(dispat=
ch_get_main_queue(), ^{<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [self verifyQuit];<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 return NSTerminateCancel;<br>
&gt; <br>
&gt; - applicationWillTerminate: can be just the qemu_thread_join<br>
&gt; <br>
&gt; Paolo<br>
<br>
</blockquote></div></div></div>

--0000000000002bc9a805e3eec80b--


