Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43D31C431
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 00:10:42 +0100 (CET)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBn0r-00005T-Kc
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 18:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBmzi-0007zs-DV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBmze-0002JC-7s
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613430565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gImZ1ZsAx99yXVOUSbQSc+AewgbAOKj2pW2lzBEfucM=;
 b=P7XqXhncuDi/R5QMggDXJdlsdP+6GGF6QmacFs0t1hc3qxQFnn2UADvHVPAX/gK+YMEzsE
 5Lg4gZiAgf47K8d2phX/OJXic9azadRum1v9bFvqamfPcTgpyPBD7d27X+75o2ig7/SmLz
 nN/svppeKII6x3nzGvTqAhC1xqK44r8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Ej1Qs-SKOvOGtF_t_2eXRg-1; Mon, 15 Feb 2021 18:09:21 -0500
X-MC-Unique: Ej1Qs-SKOvOGtF_t_2eXRg-1
Received: by mail-pl1-f197.google.com with SMTP id d19so7739606plr.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 15:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gImZ1ZsAx99yXVOUSbQSc+AewgbAOKj2pW2lzBEfucM=;
 b=Fo+Rb8+ut+7L2ZQwrEz2Lk73eDRFJW4VJYXi/joMDI5dOKvqFUPNzWM5MfkdeDE7Uu
 3WiMfMb/W3dEDDODeFqKs81JLph8t2ef7qKD+OI2otPw3/YxOe75wfegKHlIEJ9dE/5c
 7UUdh6Ox5Yp/aETY4pR5ip74TcpKM7FlA7p2ZsRj4W5RdFVeIAcLEBe54gzrEDRCIoCP
 bx77WucBIEcNoebuGd92ghcfoCBX9Jo67bMjb7r+2tD9H8YdhWERS6x7O97tJm90vh+z
 HTqas+MtazxfuH0XKzalC/DvBxBNLo0gTj0wLw+wteIRwKhOq0fo4oa/0jBDwC8to17f
 12Lw==
X-Gm-Message-State: AOAM532TTG4/Hg5lSposWXgc92BLhr1OJ8MBiZLa83KhHphnsEMWt/u8
 KaXUPAizo8Tc3cOEuMMKrNwtsuPsHgjL8GHyKlhD+x49sKi/bScSQ5htEgRC5xIYkEQzX0M06S2
 x2fE9Yjt1rkrlhf/wF8UyRQAAa04RaWc=
X-Received: by 2002:aa7:99db:0:b029:1e1:fe8a:4948 with SMTP id
 v27-20020aa799db0000b02901e1fe8a4948mr17012845pfi.59.1613430560594; 
 Mon, 15 Feb 2021 15:09:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQF9pAB2IcXbGfuINQ/Lc1OeFZ9lOmEi6sd9Y0B+dY6Dzk/NM7gEM+zC//eBi/+cvsGXO2YcDYadOd9IWN8Nk=
X-Received: by 2002:aa7:99db:0:b029:1e1:fe8a:4948 with SMTP id
 v27-20020aa799db0000b02901e1fe8a4948mr17012825pfi.59.1613430560335; Mon, 15
 Feb 2021 15:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20210215225511.23286-1-alex.bennee@linaro.org>
In-Reply-To: <20210215225511.23286-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Feb 2021 00:09:07 +0100
Message-ID: <CABgObfbZqQkb4DiPVABS6VbWTEdL+Xi_9XGtkf+di5Kf4L2X9A@mail.gmail.com>
Subject: Re: [PATCH] meson.build: expose TCG cross compiler information in
 summary
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006b44ad05bb6813cd"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b44ad05bb6813cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Very nice, but perhaps you can reuse target_dirs and test for each
individual tests/tcg/config-$target.mak with fs.exists(), instead of using
find?

Thanks,

Paolo

Il lun 15 feb 2021, 23:55 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> Blink and you miss the cross TCG compiler stuff so lets display it
> with the rest of the compiler information.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  meson.build            | 18 ++++++++++++++++++
>  tests/tcg/configure.sh |  8 --------
>  2 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index a923f249d8..3c8135add2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2508,6 +2508,24 @@ endif
>  summary_info +=3D {'strip binaries':    get_option('strip')}
>  summary_info +=3D {'sparse':            sparse.found() ? sparse.full_pat=
h()
> : false}
>  summary_info +=3D {'mingw32 support':   targetos =3D=3D 'windows'}
> +
> +# snarf the cross-compilation information for tests
> +tcg_compile_config =3D run_command('find',
> +                                 meson.current_build_dir() / 'tests/tcg'=
,
> +                                 '-iname',
> '*.mak').stdout().strip().split('\n')
> +foreach tcg_mak: tcg_compile_config
> +  config_cross_tcg =3D keyval.load(tcg_mak)
> +  target =3D config_cross_tcg['TARGET_NAME']
> +  compiler =3D ''
> +  if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
> +    summary_info +=3D {target + ' tests':
> config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
> +                                      ' via ' +
> config_cross_tcg['DOCKER_IMAGE']}
> +  elif 'CROSS_CC_GUEST' in config_cross_tcg
> +    summary_info +=3D {target + ' tests'
> +                     : config_cross_tcg['CROSS_CC_GUEST'] }
> +  endif
> +endforeach
> +
>  summary(summary_info, bool_yn: true, section: 'Compilation')
>
>  # Targets and accelerators
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index e1b70e25f2..77a18fd289 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -257,11 +257,3 @@ for target in $target_list; do
>      echo "DOCKER_CROSS_CC_GUEST=3D$container_cross_cc" >> $config_target=
_mak
>    fi
>  done
> -
> -# report container support state
> -echo "cross containers  $container"
> -
> -if test -n "$enabled_cross_compilers"; then
> -    echo
> -    echo "NOTE: guest cross-compilers enabled:$enabled_cross_compilers"
> -fi
> --
> 2.20.1
>
>

--0000000000006b44ad05bb6813cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Very nice, but perhaps you can reuse target_dirs and test=
 for each individual tests/tcg/config-$target.mak with fs.exists(), instead=
 of using find?<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 15 feb 2021,=
 23:55 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.=
bennee@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Blink and you miss the cross TCG compiler stuff so lets display it<br>
with the rest of the compiler information.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++=
+++++++<br>
=C2=A0tests/tcg/configure.sh |=C2=A0 8 --------<br>
=C2=A02 files changed, 18 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index a923f249d8..3c8135add2 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2508,6 +2508,24 @@ endif<br>
=C2=A0summary_info +=3D {&#39;strip binaries&#39;:=C2=A0 =C2=A0 get_option(=
&#39;strip&#39;)}<br>
=C2=A0summary_info +=3D {&#39;sparse&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sparse.found() ? sparse.full_path() : false}<br>
=C2=A0summary_info +=3D {&#39;mingw32 support&#39;:=C2=A0 =C2=A0targetos =
=3D=3D &#39;windows&#39;}<br>
+<br>
+# snarf the cross-compilation information for tests<br>
+tcg_compile_config =3D run_command(&#39;find&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson.current_build_dir() / &#=
39;tests/tcg&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-iname&#39;, &#39;*.mak&#=
39;).stdout().strip().split(&#39;\n&#39;)<br>
+foreach tcg_mak: tcg_compile_config<br>
+=C2=A0 config_cross_tcg =3D keyval.load(tcg_mak)<br>
+=C2=A0 target =3D config_cross_tcg[&#39;TARGET_NAME&#39;]<br>
+=C2=A0 compiler =3D &#39;&#39;<br>
+=C2=A0 if &#39;DOCKER_CROSS_CC_GUEST&#39; in config_cross_tcg<br>
+=C2=A0 =C2=A0 summary_info +=3D {target + &#39; tests&#39;: config_cross_t=
cg[&#39;DOCKER_CROSS_CC_GUEST&#39;] +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; via &#39;=
 + config_cross_tcg[&#39;DOCKER_IMAGE&#39;]}<br>
+=C2=A0 elif &#39;CROSS_CC_GUEST&#39; in config_cross_tcg<br>
+=C2=A0 =C2=A0 summary_info +=3D {target + &#39; tests&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: config_cross_tcg[&#39;CROSS_CC_GUEST&#39;] }<br>
+=C2=A0 endif<br>
+endforeach<br>
+<br>
=C2=A0summary(summary_info, bool_yn: true, section: &#39;Compilation&#39;)<=
br>
<br>
=C2=A0# Targets and accelerators<br>
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh<br>
index e1b70e25f2..77a18fd289 100755<br>
--- a/tests/tcg/configure.sh<br>
+++ b/tests/tcg/configure.sh<br>
@@ -257,11 +257,3 @@ for target in $target_list; do<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;DOCKER_CROSS_CC_GUEST=3D$container_cross_cc&=
quot; &gt;&gt; $config_target_mak<br>
=C2=A0 =C2=A0fi<br>
=C2=A0done<br>
-<br>
-# report container support state<br>
-echo &quot;cross containers=C2=A0 $container&quot;<br>
-<br>
-if test -n &quot;$enabled_cross_compilers&quot;; then<br>
-=C2=A0 =C2=A0 echo<br>
-=C2=A0 =C2=A0 echo &quot;NOTE: guest cross-compilers enabled:$enabled_cros=
s_compilers&quot;<br>
-fi<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000006b44ad05bb6813cd--


