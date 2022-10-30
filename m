Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C29612AF1
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 15:19:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op98O-0002Jv-Mr; Sun, 30 Oct 2022 10:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1op98N-0002Jg-BJ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 10:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1op98L-0004t1-Av
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 10:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667139472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7nFDjn+UabxeEH0t9XPd84q+0D1Yh49ed84JLwXb3pA=;
 b=L5N0gKfVLjIunD3tJWEuK7EHNm9RsiyxVL/QEKw7i0nBXMkov3mQq2OM/CGOAw1wNP1Sf7
 fIjKBI7JDMTwGK9cH55lcVBu5JtRSagcf/c8hZI0LESVpusOPny+ZL//Lw6s0uyMtE6Etg
 JWIIT84EYX9bEei1lUq9rtZiicdX8EM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-WEmJtbdrPlGa-Smg6YlDxw-1; Sun, 30 Oct 2022 10:17:49 -0400
X-MC-Unique: WEmJtbdrPlGa-Smg6YlDxw-1
Received: by mail-ua1-f71.google.com with SMTP id
 r3-20020ab04a43000000b0041168b89479so18141uae.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 07:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7nFDjn+UabxeEH0t9XPd84q+0D1Yh49ed84JLwXb3pA=;
 b=7CXifr/2u0q0Rsl4rDaIHivdwNGgBx/I+ttRttVAwzr73CMAW9bP5ettY3yirKmFa6
 pPG6QT+EyTWvXqdWJVkqfeDWWN/S76sv++gVsbVpVqxz23eBJbocFZOWdiAlz8aNQd/y
 sU/yhxC0bPt4qQ89Bvu7QdbKYkQ2GaXEE2LlXXaYRhLbs/+I82uBxDcRxHDeVJuOsyWY
 bmdH/Zkw0lBIDNk1WXLZ5mSoB1eyDQ25tsA+oo8Bh+NDijWTPqrg+A25p6nmqwKvcu64
 Sy+AC8FDLGjcvuDzy3a1Y++rF/U929f0zxyOGPplFCo2sXDTqvbNp6z0bVOT7acbGu3f
 UyAw==
X-Gm-Message-State: ACrzQf0vr8EUMfcwj9SWjX1M7MtxQ9l7mEdDXs7KSpmHgRNPKCb5BuIW
 1Uwn9n5hgongtog+jhzGt7LdekXt1Sq8vZHRkZMFdH3Wmnwffv35JFcBgFcf7pP8u0cyw+p0W4o
 dwV1aoDoUWS2Lq0w/HUXy+hBp1nBgRmY=
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id
 y23-20020a67c997000000b003aa1d0c6bc7mr2812905vsk.16.1667139469445; 
 Sun, 30 Oct 2022 07:17:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4muZhGVfCRD8d6KKzMhbWV84BOMtatdR8T5jIZkHbQflmSWwhQOwWQHdlKqbkDzE9ccO7+bF/6XiSpl2Nf3Ew=
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id
 y23-20020a67c997000000b003aa1d0c6bc7mr2812900vsk.16.1667139469084; Sun, 30
 Oct 2022 07:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-30-alex.bennee@linaro.org>
 <72674788-e55a-8429-b1bf-384db3d837aa@linaro.org>
 <306323d5-1bec-078b-9686-7670b4fdf247@weilnetz.de>
 <CABgObfazc5opNOdO=Yyj_z8nYy4tYOetKs9GkwYzudEtKoAODQ@mail.gmail.com>
 <952d57c2-8493-0a7b-8384-96e0f285853a@weilnetz.de>
In-Reply-To: <952d57c2-8493-0a7b-8384-96e0f285853a@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 30 Oct 2022 15:17:36 +0100
Message-ID: <CABgObfY=esdod+xwcat9htSpwsjza7sToQyK=Ta6XtXM8UAEWQ@mail.gmail.com>
Subject: Re: [PATCH v2 29/30] tests/docker: remove FROM qemu/ support from
 docker.py
To: Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d8a50305ec4127f7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000d8a50305ec4127f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think sudo  needs to be changed to "sudo -n" in docker.py. Thanks for the
report!

Paolo

Il sab 29 ott 2022, 23:13 Stefan Weil <sw@weilnetz.de> ha scritto:

> Am 29.10.22 um 21:46 schrieb Paolo Bonzini:
>
> Il sab 29 ott 2022, 11:38 Stefan Weil <sw@weilnetz.de> ha scritto:
>
>> Am 15.09.22 um 10:41 schrieb Richard Henderson:
>> > On 9/14/22 16:59, Alex Benn=C3=A9e wrote:
>> >> We want to migrate from docker.py to building our images directly wit=
h
>> >> docker/podman. Before we get there we need to make sure we don't
>> >> re-introduce our layered builds so bug out if we see FROM qemu/ in a
>> >> Dockerfile.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> >> Acked-by: Thomas Huth<thuth@redhat.com>
>> >> Message-Id:<20220826172128.353798-24-alex.bennee@linaro.org>
>> >> ---
>> >>   tests/docker/docker.py | 38 ++++++++++----------------------------
>> >>   1 file changed, 10 insertions(+), 28 deletions(-)
>> >
>> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> >
>> > r~
>> >
>>
>> I am not sure whether that is related, but with latest QEMU code I now
>> get an e-mail "SECURITY information [...]" each time when I run the
>> configure script (or just `tests/docker/docker.py probe`):
>>
>> qemu.weilnetz.de : Oct 29 09:32:32 : stefan : a password is required ;
>> TTY=3Dpts/0 ; PWD=3D/home/stefan/qemu/bin/ndebug/i686-w64-mingw32 ;
>> USER=3Droot ; COMMAND=3Ddocker version
>>
>> There is no docker installation on my Debian GNU Linux build machine.
>>
>
> It's not related, configure is checking whether "sudo docker" works.
>
>
> You are right. "git bisect" finds that the security e-mails occur since
> another commit.
>
> Stefan
>
>
> c4575b59155e2e0065c29d56496dbf3e6ffd035b is the first bad commit
> commit c4575b59155e2e0065c29d56496dbf3e6ffd035b
> Author: Paolo Bonzini <pbonzini@redhat.com> <pbonzini@redhat.com>
> Date:   Thu Sep 29 12:41:58 2022 +0100
>
>     configure: store container engine in config-host.mak
>
>     In preparation for removing $(DOCKER_SCRIPT) from the tests/tcg
> configuration
>     files, have Make use the same container engine that had been probed a=
t
>     configure time.
>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> <pbonzini@redhat.com>
>     Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> <alex.bennee@linaro.org>
>     Message-Id: <20220929114231.583801-19-alex.bennee@linaro.org>
> <20220929114231.583801-19-alex.bennee@linaro.org>
>
>  configure                     | 11 ++++++++---
>  tests/docker/Makefile.include |  2 +-
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
>

--000000000000d8a50305ec4127f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think sudo=C2=A0 needs to be changed to &quot;sudo -n&q=
uot; in docker.py. Thanks for the report!<div dir=3D"auto"><br></div><div d=
ir=3D"auto">Paolo=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il sab 29 ott 2022, 23:13 Stefan Weil &lt;<a =
href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; ha scritto:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Am 29.10.22 um 21:46 schrieb Paolo Bonzini:<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"auto">
        <div>Il sab 29 ott 2022, 11:38 Stefan Weil &lt;<a href=3D"mailto:sw=
@weilnetz.de" target=3D"_blank" rel=3D"noreferrer">sw@weilnetz.de</a>&gt; h=
a
          scritto:<br>
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote">Am 15.09.22 um 10:41 schrieb
              Richard Henderson:<br>
              &gt; On 9/14/22 16:59, Alex Benn=C3=A9e wrote:<br>
              &gt;&gt; We want to migrate from docker.py to building our
              images directly with<br>
              &gt;&gt; docker/podman. Before we get there we need to
              make sure we don&#39;t<br>
              &gt;&gt; re-introduce our layered builds so bug out if we
              see FROM qemu/ in a<br>
              &gt;&gt; Dockerfile.<br>
              &gt;&gt;<br>
              &gt;&gt; Signed-off-by: Alex Benn=C3=A9e&lt;<a href=3D"mailto=
:alex.bennee@linaro.org" rel=3D"noreferrer noreferrer" target=3D"_blank">al=
ex.bennee@linaro.org</a>&gt;<br>
              &gt;&gt; Acked-by: Thomas Huth&lt;<a href=3D"mailto:thuth@red=
hat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">thuth@redhat.com</=
a>&gt;<br>
              &gt;&gt; Message-Id:&lt;<a href=3D"mailto:20220826172128.3537=
98-24-alex.bennee@linaro.org" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">20220826172128.353798-24-alex.bennee@linaro.org</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt; =C2=A0 tests/docker/docker.py | 38
              ++++++++++----------------------------<br>
              &gt;&gt; =C2=A0 1 file changed, 10 insertions(+), 28
              deletions(-)<br>
              &gt; <br>
              &gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:ric=
hard.henderson@linaro.org" rel=3D"noreferrer noreferrer" target=3D"_blank">=
richard.henderson@linaro.org</a>&gt;<br>
              &gt; <br>
              &gt; r~<br>
              &gt; <br>
              <br>
              I am not sure whether that is related, but with latest
              QEMU code I now <br>
              get an e-mail &quot;SECURITY information [...]&quot; each tim=
e when
              I run the <br>
              configure script (or just `tests/docker/docker.py probe`):<br=
>
              <br>
              <a href=3D"http://qemu.weilnetz.de" rel=3D"noreferrer
                noreferrer noreferrer" target=3D"_blank">qemu.weilnetz.de</=
a>
              : Oct 29 09:32:32 : stefan : a password is required ; <br>
              TTY=3Dpts/0 ;
              PWD=3D/home/stefan/qemu/bin/ndebug/i686-w64-mingw32 ; <br>
              USER=3Droot ; COMMAND=3Ddocker version<br>
              <br>
              There is no docker installation on my Debian GNU Linux
              build machine.<br>
            </blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">It&#39;s not related, configure is checking wheth=
er
          &quot;sudo docker&quot; works.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>You are right. &quot;git bisect&quot; finds that the security e-mail=
s occur
      since another commit.</p>
    <p>Stefan</p>
    <p><br>
    </p>
    <p>c4575b59155e2e0065c29d56496dbf3e6ffd035b is the first bad commit<br>
      commit c4575b59155e2e0065c29d56496dbf3e6ffd035b<br>
      Author: Paolo Bonzini <a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">&lt;pbonzini@redhat.com&gt;</a><br>
      Date:=C2=A0=C2=A0 Thu Sep 29 12:41:58 2022 +0100<br>
      <br>
      =C2=A0=C2=A0=C2=A0 configure: store container engine in config-host.m=
ak<br>
      =C2=A0=C2=A0 =C2=A0<br>
      =C2=A0=C2=A0=C2=A0 In preparation for removing $(DOCKER_SCRIPT) from =
the
      tests/tcg configuration<br>
      =C2=A0=C2=A0=C2=A0 files, have Make use the same container engine tha=
t had been
      probed at<br>
      =C2=A0=C2=A0=C2=A0 configure time.<br>
      =C2=A0=C2=A0 =C2=A0<br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Paolo Bonzini <a href=3D"mailto:pbo=
nzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">&lt;pbonzini@redhat.=
com&gt;</a><br>
      =C2=A0=C2=A0=C2=A0 Signed-off-by: Alex Benn=C3=A9e <a href=3D"mailto:=
alex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">&lt;alex.benne=
e@linaro.org&gt;</a><br>
      =C2=A0=C2=A0=C2=A0 Message-Id:
      <a href=3D"mailto:20220929114231.583801-19-alex.bennee@linaro.org" ta=
rget=3D"_blank" rel=3D"noreferrer">&lt;20220929114231.583801-19-alex.bennee=
@linaro.org&gt;</a><br>
      <br>
      =C2=A0configure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++=
+++++---<br>
      =C2=A0tests/docker/Makefile.include |=C2=A0 2 +-<br>
      =C2=A02 files changed, 9 insertions(+), 4 deletions(-)<br>
      <br>
    </p>
  </div>

</blockquote></div>

--000000000000d8a50305ec4127f7--


