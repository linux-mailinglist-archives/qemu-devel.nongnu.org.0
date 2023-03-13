Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210256B8163
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbnVF-0005q5-6W; Mon, 13 Mar 2023 15:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pbnVA-0005pr-0C
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pbnV8-0004pM-G3
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678734389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0ryC5UCWWQFneAiCYCRIeydGuM65RGw+Zg8DrxKqMA=;
 b=jGJ/3wqMFp+5eBeXVbVlHwnRAznW97oZm2oYWyPyVQxpqr4BdoUmbrevTdkXrNI08QQbS6
 2oKBPXGzhWeK5zbh30C029HCKy6d+HYjgvwquZvEaKe5iU4uJ+976+OOZxFldugme+Ilb0
 xhzlKSKeTmB5XEVEJ1HaenI0gUG4V3A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-7PcdpLEzORC5-RzzOSpphg-1; Mon, 13 Mar 2023 15:06:27 -0400
X-MC-Unique: 7PcdpLEzORC5-RzzOSpphg-1
Received: by mail-qk1-f197.google.com with SMTP id
 l27-20020a05620a211b00b00745b3e62004so737133qkl.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 12:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678734386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A0ryC5UCWWQFneAiCYCRIeydGuM65RGw+Zg8DrxKqMA=;
 b=l0hi8LtAO8RV6AF4Zu/wPFqRTaUNttYJB2mdG69TqjYK4ytPMyv/RiscRxmvKAmKq+
 ceGMy8IBClJI2NnTCygRidgPU1sILVqohR5lMh+VKATo73yi9KgurPpZsZ3CBbB+6hKT
 urMJorM6KcladbPwdhxKKw15LAp0S1n3VUufz0X7Z3a4SVwWB/dL0Khh3W9+hU1tVlEj
 ha+Q6z0qeDI0p6NNTlrKoZgFXSPupynQuyh6KaSS4VQCqBIC9APqqYDKE4nlHARDBdtv
 Dd/KR78BXxP4v9SVjy3QElvIHlHUZRP9iD/zopQ4zH2ztPEkkdkqFnnUWxzUWgI7geyV
 X0xQ==
X-Gm-Message-State: AO0yUKXZy4aNao5EjMYcJR1GhnkRrlrzh9fUIcb1VtiV0WxFdXMjf6CW
 TQ7cHLGyPS3VCLVXlJ/wzLyhY4FVU4eMQ5Qe/EcRdz96NqAC2Sa/byMGopRpYz1d0NGPbXZCdjH
 rFBdhAjovBZc61EvAY2Epnvzm9+wUasY=
X-Received: by 2002:a37:db09:0:b0:745:9624:1b4b with SMTP id
 e9-20020a37db09000000b0074596241b4bmr731504qki.13.1678734386664; 
 Mon, 13 Mar 2023 12:06:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set/6nbAqfWzUqPJlVVNJjbwOT1Glcn94UyeV1JuWKuiu/yD/UqDWdWSVitsjZrtyiTxSsEC5S2G9+b7Fqx/xar4=
X-Received: by 2002:a37:db09:0:b0:745:9624:1b4b with SMTP id
 e9-20020a37db09000000b0074596241b4bmr731498qki.13.1678734386426; Mon, 13 Mar
 2023 12:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230306171020.381116-1-dbassey@redhat.com>
 <64425814-c379-ef8f-b217-11d47f9f3bab@t-online.de>
 <CACzuRyyyt-L+iwFHOS3Tq5hQ9OToedyM79fmtKU3+X6KpUDSsw@mail.gmail.com>
 <3379148.aeAvL9zz9z@silver>
In-Reply-To: <3379148.aeAvL9zz9z@silver>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Mon, 13 Mar 2023 20:06:15 +0100
Message-ID: <CACzuRyz39A0ptHGY=8LNf=mXEkiTDD3OQ2a8gnk1_dbEn72YPw@mail.gmail.com>
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, 
 qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="000000000000c68a6905f6ccce59"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dbassey@redhat.com;
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

--000000000000c68a6905f6ccce59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Are you sure about sizeof(n_bytes) here? That's 4. ;-)
>
my bad!

>
> Volker's point was that "silence" is the center of the wave range. With
> signed
> range that's zero, yes, but with unsigned range that's 2^(bitdepth) / 2.
>
> So you need to memset() the correct value to generate "silence".
>
I understand now, Thanks. I guess it should work for signed range, so I
would do:

@@ -117,7 +117,9 @@ playback_on_process(void *data)
     }

     if (avail =3D=3D 0) {
-        memset(p, 0, n_bytes);
+        memset(p, 0, (int32_t) n_bytes);

CMIIW

Thanks,
Dorinda.

On Mon, Mar 13, 2023 at 2:37=E2=80=AFPM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Monday, March 13, 2023 2:11:11 PM CET Dorinda Bassey wrote:
> > Hi Volker,
> >
> >
> > > To hear this,
> > > start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=3Daudio0
> > > -device ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev
> > > pipewire,id=3Daudio0,out.mixing-engine=3Doff ...
> > >
> > I hear the clipped audio stream with these options. IMO, I don't think
> > memset is responsible for that behaviour, I still hear the harsh sound
> with
> > "-audiodev pa". I also tried using an alternative like:
> >
> > @@ -117,7 +118,7 @@ playback_on_process(void *data)
> >      }
> >
> >      if (avail =3D=3D 0) {
> > -        memset(p, 0, n_bytes);
> > +        p =3D g_malloc0(sizeof(n_bytes));
> >      } else {
> >
> > The clipped audio issue is still persistent.
>
> Are you sure about sizeof(n_bytes) here? That's 4. ;-)
>
> Volker's point was that "silence" is the center of the wave range. With
> signed
> range that's zero, yes, but with unsigned range that's 2^(bitdepth) / 2.
>
> So you need to memset() the correct value to generate "silence".
>
> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000c68a6905f6ccce59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Are=
 you sure about sizeof(n_bytes) here? That&#39;s 4. ;-)<br>
</div></blockquote><div>my bad!</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div><br></div><div>Volker&#39;s point was that &quot;silence&q=
uot; is the center of the wave range. With signed<br>
range that&#39;s zero, yes, but with unsigned range that&#39;s 2^(bitdepth)=
 / 2.<br>
<br>
So you need to memset() the correct value to generate &quot;silence&quot;.<=
br>
</div></blockquote><div>I understand now, Thanks. I guess it should work fo=
r signed range, so I would do:</div><div><br></div><div>@@ -117,7 +117,9 @@=
 playback_on_process(void *data)<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>=C2=
=A0 =C2=A0 =C2=A0if (avail =3D=3D 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0mems=
et(p, 0, n_bytes);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p, 0, (int32_t) n=
_bytes);</div><div><br></div><div>CMIIW</div><div><br></div><div>Thanks,</d=
iv><div>Dorinda.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Mar 13, 2023 at 2:37=E2=80=AFPM Christian=
 Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudeby=
te.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Monday, March 13, 2023 2:11:11 PM CET Dorinda Bassey wrote:<br>
&gt; Hi Volker,<br>
&gt; <br>
&gt; <br>
&gt; &gt; To hear this,<br>
&gt; &gt; start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=3Daudi=
o0<br>
&gt; &gt; -device ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audi=
odev<br>
&gt; &gt; pipewire,id=3Daudio0,out.mixing-engine=3Doff ...<br>
&gt; &gt;<br>
&gt; I hear the clipped audio stream with these options. IMO, I don&#39;t t=
hink<br>
&gt; memset is responsible for that behaviour, I still hear the harsh sound=
 with<br>
&gt; &quot;-audiodev pa&quot;. I also tried using an alternative like:<br>
&gt; <br>
&gt; @@ -117,7 +118,7 @@ playback_on_process(void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (avail =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(p, 0, n_bytes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D g_malloc0(sizeof(n_bytes));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; <br>
&gt; The clipped audio issue is still persistent.<br>
<br>
Are you sure about sizeof(n_bytes) here? That&#39;s 4. ;-)<br>
<br>
Volker&#39;s point was that &quot;silence&quot; is the center of the wave r=
ange. With signed<br>
range that&#39;s zero, yes, but with unsigned range that&#39;s 2^(bitdepth)=
 / 2.<br>
<br>
So you need to memset() the correct value to generate &quot;silence&quot;.<=
br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--000000000000c68a6905f6ccce59--


