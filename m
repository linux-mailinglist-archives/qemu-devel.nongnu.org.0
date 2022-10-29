Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F286612527
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 21:47:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oornU-0005QO-DI; Sat, 29 Oct 2022 15:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oornQ-0005L8-Da
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 15:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oornO-0007Fq-Mf
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 15:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667072826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWkDpygYrtECi1R+rPAh8THWwr0/JruqJBiIlY3xAFU=;
 b=h7+ykiprOuMKT1oD9r849RUNOWkTCoBGkvZQCH6iW5S3v5Hg3msY0Humq1h+/AsdkvSC7n
 Q6wfd2ISrDDzrHTlx+1gBTOK2Uu9/5nT2fYpf/IbH8kH8goaZPlwqZi/jdo1U3QxW1lvNW
 P4ZWWeRtzIqY4Dg4LPwbIrEX/bGbdIQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-RUkqWfpjOjOoIC5vDW2x2A-1; Sat, 29 Oct 2022 15:47:04 -0400
X-MC-Unique: RUkqWfpjOjOoIC5vDW2x2A-1
Received: by mail-vs1-f70.google.com with SMTP id
 q68-20020a675c47000000b003aa20e77e27so1903618vsb.21
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 12:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KWkDpygYrtECi1R+rPAh8THWwr0/JruqJBiIlY3xAFU=;
 b=dZzkw/u8W9/NXxm5TpQFzc1kv0JFj9Kaj1Bk5AV+ruf3xybmszqni+YMY3EtItm+6g
 tvK254czWUs61ITrMn8MI43cI0YY2TPCFwioyTinN1xWBmRFmzQ01qiWZAYmhNtqXcfc
 Mbsap1mVBTBLTnTU+NSnRElwlPoyDRzuEQnuBuUPkl6XvJcJ70H7FE/yyIXplN9a3JJW
 0r7BLIk2/2cpSkynuepkF0u4gAddKUnx+06dY0h9MdM4e3IxOHA8gAeSTvBbQPzjxDy+
 nRYLe5+Cb2H59UAv3YPuobG1je1qCNoe+/9Ih8N+QyrsrDrovY2R8fxtfjbQyGMSLec3
 zpEg==
X-Gm-Message-State: ACrzQf3/7C5U792ygfV2L8f1TuK6jlVjRnUMihQ+n3jXmq2akgxm3CiS
 7jr0HVb5KdDcAnZQUIfgPtFpIGmGFoRbbhsQh2xYZWP79tZXrohmGIDTMzI7Z41ANp4HUJewEmE
 6rks8pI4sMSApa096bFHKBqfblSDqJj0=
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id
 y23-20020a67c997000000b003aa1d0c6bc7mr1911988vsk.16.1667072823504; 
 Sat, 29 Oct 2022 12:47:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oJM+S240tModxeV4T1G56TftxuPlxZbmtzKW6Yx7ZBjS/b3VepztVWk4LOj4swl6IeNazM+UoXl88lSlWR4E=
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id
 y23-20020a67c997000000b003aa1d0c6bc7mr1911987vsk.16.1667072823286; Sat, 29
 Oct 2022 12:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-30-alex.bennee@linaro.org>
 <72674788-e55a-8429-b1bf-384db3d837aa@linaro.org>
 <306323d5-1bec-078b-9686-7670b4fdf247@weilnetz.de>
In-Reply-To: <306323d5-1bec-078b-9686-7670b4fdf247@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 29 Oct 2022 21:46:51 +0200
Message-ID: <CABgObfazc5opNOdO=Yyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gmail.com>
Subject: Re: [PATCH v2 29/30] tests/docker: remove FROM qemu/ support from
 docker.py
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
 "P. Berrange, Daniel" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Jarno, Aurelien" <aurelien@aurel32.net>, "Hajnoczi,
 Stefan" <stefanha@redhat.com>, 
 "Rosa, Cleber" <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000072834c05ec31a3bc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

--00000000000072834c05ec31a3bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il sab 29 ott 2022, 11:38 Stefan Weil <sw@weilnetz.de> ha scritto:

> Am 15.09.22 um 10:41 schrieb Richard Henderson:
> > On 9/14/22 16:59, Alex Benn=C3=A9e wrote:
> >> We want to migrate from docker.py to building our images directly with
> >> docker/podman. Before we get there we need to make sure we don't
> >> re-introduce our layered builds so bug out if we see FROM qemu/ in a
> >> Dockerfile.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
> >> Acked-by: Thomas Huth<thuth@redhat.com>
> >> Message-Id:<20220826172128.353798-24-alex.bennee@linaro.org>
> >> ---
> >>   tests/docker/docker.py | 38 ++++++++++----------------------------
> >>   1 file changed, 10 insertions(+), 28 deletions(-)
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > r~
> >
>
> I am not sure whether that is related, but with latest QEMU code I now
> get an e-mail "SECURITY information [...]" each time when I run the
> configure script (or just `tests/docker/docker.py probe`):
>
> qemu.weilnetz.de : Oct 29 09:32:32 : stefan : a password is required ;
> TTY=3Dpts/0 ; PWD=3D/home/stefan/qemu/bin/ndebug/i686-w64-mingw32 ;
> USER=3Droot ; COMMAND=3Ddocker version
>
> There is no docker installation on my Debian GNU Linux build machine.
>

It's not related, configure is checking whether "sudo docker" works.

Paolo





> Stefan
>

--00000000000072834c05ec31a3bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 29 ott 2022, 11:38 Stefan Weil &lt;<a href=3D"m=
ailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; ha scritto:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Am 15.09.22 um 10:41 schrieb Richard Henderson:<br>
&gt; On 9/14/22 16:59, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; We want to migrate from docker.py to building our images directly =
with<br>
&gt;&gt; docker/podman. Before we get there we need to make sure we don&#39=
;t<br>
&gt;&gt; re-introduce our layered builds so bug out if we see FROM qemu/ in=
 a<br>
&gt;&gt; Dockerfile.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e&lt;<a href=3D"mailto:alex.bennee@l=
inaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&=
gt;<br>
&gt;&gt; Acked-by: Thomas Huth&lt;<a href=3D"mailto:thuth@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br>
&gt;&gt; Message-Id:&lt;<a href=3D"mailto:20220826172128.353798-24-alex.ben=
nee@linaro.org" target=3D"_blank" rel=3D"noreferrer">20220826172128.353798-=
24-alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 tests/docker/docker.py | 38 ++++++++++---------------------=
-------<br>
&gt;&gt; =C2=A0 1 file changed, 10 insertions(+), 28 deletions(-)<br>
&gt; <br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.=
org</a>&gt;<br>
&gt; <br>
&gt; r~<br>
&gt; <br>
<br>
I am not sure whether that is related, but with latest QEMU code I now <br>
get an e-mail &quot;SECURITY information [...]&quot; each time when I run t=
he <br>
configure script (or just `tests/docker/docker.py probe`):<br>
<br>
<a href=3D"http://qemu.weilnetz.de" rel=3D"noreferrer noreferrer" target=3D=
"_blank">qemu.weilnetz.de</a> : Oct 29 09:32:32 : stefan : a password is re=
quired ; <br>
TTY=3Dpts/0 ; PWD=3D/home/stefan/qemu/bin/ndebug/i686-w64-mingw32 ; <br>
USER=3Droot ; COMMAND=3Ddocker version<br>
<br>
There is no docker installation on my Debian GNU Linux build machine.<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39=
;s not related, configure is checking whether &quot;sudo docker&quot; works=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
Stefan<br>
</blockquote></div></div></div>

--00000000000072834c05ec31a3bc--


