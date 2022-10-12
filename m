Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC75FC114
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 09:09:03 +0200 (CEST)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiVrE-00013W-Rv
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 03:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiVW9-0004nK-AT
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 02:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiVW5-00053S-I2
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 02:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665557216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAxZF6+PVj+uQ067zL9c+mHShyklUPndq2GyFQ+pspY=;
 b=TCgmShHCtyaYdl3Jw9yBVCrwo4nFbckvyzaoAautbx4TXa9gCLUz7zJIsyPtbWR70VL865
 kuk/UfghTR/DHb8lg4dvlmqWSPyAeQUKlMVHP5MP4gAO1jlLnE+0bhIDhGju/Z4b/B9Unw
 ZxF2mS5TaKKRYRJIRrt6AaZ8W7p5K48=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-1P0p7yDbOJ6X9CXROICu0Q-1; Wed, 12 Oct 2022 02:46:48 -0400
X-MC-Unique: 1P0p7yDbOJ6X9CXROICu0Q-1
Received: by mail-vs1-f72.google.com with SMTP id
 a6-20020a671a06000000b003986a4e277dso3878651vsa.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 23:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mAxZF6+PVj+uQ067zL9c+mHShyklUPndq2GyFQ+pspY=;
 b=Zag9MJXpWp9AOhY3nU/HlXMrhQFsfFAuFS0cGqJufgLKg/EIfdqGmZSXHnZwQDEFnq
 SEmk7o9sQTEIKuXgUyw8i0ID7UWC1ehwhZWWGkBN0koQEOUXmhM4xCrkclcDJ38zWu/w
 zXRsoQ3kt8ytc1kHiSEFJ0VP46WuYDmu7rehV+OMjUgVvA6/+XkXhQkB6RIdHc9bEm/9
 6+KMnHawsGixJwCZ2TfEkRUClTuoNF3/2481JXWtGmzHjpCwazdNIqWq1t73P51ySYpX
 qqqs6v0w8TV4UXfNW0cxXLEAJA8wKjacOat5msUVAi5H+JvFajk6gsrwuBwgaUHyk3zt
 suDQ==
X-Gm-Message-State: ACrzQf3OtI8UzaItnxxhQmQPptyNnk2mNLlAFIm5NDLYKIEiygZIDIf5
 +xN4ip9Ix6Se2ZNGRhCRGCRKrXsq6Rsi2D2Wn+efcPAq72h6FD3JLOfMB5zsfnxqiW6hIq0uG/c
 Y1VNeLqrGjNvecuO31u4FtiE69NS1WSQ=
X-Received: by 2002:ab0:7083:0:b0:3d1:8663:cb9c with SMTP id
 m3-20020ab07083000000b003d18663cb9cmr14413826ual.75.1665557208119; 
 Tue, 11 Oct 2022 23:46:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Hg3NasyibcZ/X6g0HLpV8P1bSqy4cyCCuF12wd0pq/7+339psNEDAxlOlUfIcCtTp1FGMMmW+80rzX/YSRfA=
X-Received: by 2002:ab0:7083:0:b0:3d1:8663:cb9c with SMTP id
 m3-20020ab07083000000b003d18663cb9cmr14413824ual.75.1665557207923; Tue, 11
 Oct 2022 23:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
In-Reply-To: <20221011192858.956078-2-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Oct 2022 08:46:35 +0200
Message-ID: <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi,
 Stefan" <stefanha@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bb501c05ead0c145"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000bb501c05ead0c145
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 11 ott 2022, 21:29 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
>
> Unconditionally building all the bios for all arches was a little too
> far too fast.
>

I would like to understand the issue better, because chances are that it is
preexisting and applies to the TCG tests as well.

Daniel, does building the TCG tests work for you? If not, I think we should
just disable containers by default.



> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org>
>
> diff --git a/configure b/configure
> index baa69189f0..45ee6f4eb3 100755
> --- a/configure
> +++ b/configure
> @@ -2121,7 +2121,7 @@ probe_target_compiler() {
>      target_ranlib=3D
>      target_strip=3D
>    fi
> -  test -n "$target_cc" || test -n "$container_image"
> +  test -n "$target_cc"
>  }
>
>  write_target_makefile() {
> @@ -2268,7 +2268,7 @@ if test "$targetos" !=3D "darwin" && test "$targeto=
s"
> !=3D "sunos" && \
>      config_mak=3Dpc-bios/optionrom/config.mak
>      echo "# Automatically generated by configure - do not modify" >
> $config_mak
>      echo "TOPSRC_DIR=3D$source_path" >> $config_mak
> -    write_target_makefile pc-bios/optionrom/all >> $config_mak
> +    write_target_makefile >> $config_mak
>  fi
>
>  if test "$softmmu" =3D yes && probe_target_compiler ppc-softmmu; then
> @@ -2276,31 +2276,25 @@ if test "$softmmu" =3D yes && probe_target_compil=
er
> ppc-softmmu; then
>      config_mak=3Dpc-bios/vof/config.mak
>      echo "# Automatically generated by configure - do not modify" >
> $config_mak
>      echo "SRC_DIR=3D$source_path/pc-bios/vof" >> $config_mak
> -    write_target_makefile pc-bios/vof/all >> $config_mak
> +    write_target_makefile >> $config_mak
>  fi
>
>  # Only build s390-ccw bios if the compiler has -march=3Dz900 or -march=
=3Dz10
>  # (which is the lowest architecture level that Clang supports)
>  if test "$softmmu" =3D yes && probe_target_compiler s390x-softmmu; then
> -  got_cross_cc=3Dno
> -  if test -n "$target_cc"; then
> -    write_c_skeleton
> -    do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 -o $TMPO -c
> $TMPC
> -    has_z900=3D$?
> -    if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $target_cc_cflags
> -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> -      if [ $has_z900 !=3D 0 ]; then
> -        echo "WARNING: Your compiler does not support the z900!"
> -        echo "         The s390-ccw bios will only work with guest CPUs
> >=3D z10."
> -      fi
> -      got_cross_cc=3Dyes
> +  write_c_skeleton
> +  do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 -o $TMPO -c $=
TMPC
> +  has_z900=3D$?
> +  if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $target_cc_cflags
> -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> +    if [ $has_z900 !=3D 0 ]; then
> +      echo "WARNING: Your compiler does not support the z900!"
> +      echo "         The s390-ccw bios will only work with guest CPUs >=
=3D
> z10."
>      fi
> -  fi
> -  if test "$got_cross_cc" =3D yes || test -n "$container_image"; then
>      roms=3D"$roms pc-bios/s390-ccw"
>      config_mak=3Dpc-bios/s390-ccw/config-host.mak
>      echo "# Automatically generated by configure - do not modify" >
> $config_mak
>      echo "SRC_PATH=3D$source_path/pc-bios/s390-ccw" >> $config_mak
> -    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
> +    write_target_makefile >> $config_mak
>      # SLOF is required for building the s390-ccw firmware on s390x,
>      # since it is using the libnet code from SLOF for network booting.
>      git_submodules=3D"${git_submodules} roms/SLOF"
> @@ -2488,7 +2482,7 @@ for target in $target_list; do
>        ;;
>    esac
>
> -  if probe_target_compiler $target; then
> +  if probe_target_compiler $target || test -n "$container_image"; then
>        test -n "$container_image" && build_static=3Dy
>        mkdir -p "tests/tcg/$target"
>        config_target_mak=3Dtests/tcg/$target/config-target.mak
> --
> 2.34.1
>
>

--000000000000bb501c05ead0c145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 11 ott 2022, 21:29 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This reverts commit 730fe750fba6=
3023e294ff0acf0f874369f1946f.<br>
<br>
Unconditionally building all the bios for all arches was a little too<br>
far too fast.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I would like to understand the issue better, because chances a=
re that it is preexisting and applies to the TCG tests as well.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Daniel, does building the TCG tests=
 work for you? If not, I think we should just disable containers by default=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
Reviewed-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:danielhb413@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">danielhb413@gmail.com</a>&gt;<b=
r>
Tested-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:danielhb413@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">danielhb413@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20221011113417.794841-4-alex.bennee@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">20221011113417.794841-4-alex.be=
nnee@linaro.org</a>&gt;<br>
<br>
diff --git a/configure b/configure<br>
index baa69189f0..45ee6f4eb3 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2121,7 +2121,7 @@ probe_target_compiler() {<br>
=C2=A0 =C2=A0 =C2=A0target_ranlib=3D<br>
=C2=A0 =C2=A0 =C2=A0target_strip=3D<br>
=C2=A0 =C2=A0fi<br>
-=C2=A0 test -n &quot;$target_cc&quot; || test -n &quot;$container_image&qu=
ot;<br>
+=C2=A0 test -n &quot;$target_cc&quot;<br>
=C2=A0}<br>
<br>
=C2=A0write_target_makefile() {<br>
@@ -2268,7 +2268,7 @@ if test &quot;$targetos&quot; !=3D &quot;darwin&quot;=
 &amp;&amp; test &quot;$targetos&quot; !=3D &quot;sunos&quot; &amp;&amp; \<=
br>
=C2=A0 =C2=A0 =C2=A0config_mak=3Dpc-bios/optionrom/config.mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;# Automatically generated by configure - do =
not modify&quot; &gt; $config_mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;TOPSRC_DIR=3D$source_path&quot; &gt;&gt; $co=
nfig_mak<br>
-=C2=A0 =C2=A0 write_target_makefile pc-bios/optionrom/all &gt;&gt; $config=
_mak<br>
+=C2=A0 =C2=A0 write_target_makefile &gt;&gt; $config_mak<br>
=C2=A0fi<br>
<br>
=C2=A0if test &quot;$softmmu&quot; =3D yes &amp;&amp; probe_target_compiler=
 ppc-softmmu; then<br>
@@ -2276,31 +2276,25 @@ if test &quot;$softmmu&quot; =3D yes &amp;&amp; pro=
be_target_compiler ppc-softmmu; then<br>
=C2=A0 =C2=A0 =C2=A0config_mak=3Dpc-bios/vof/config.mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;# Automatically generated by configure - do =
not modify&quot; &gt; $config_mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;SRC_DIR=3D$source_path/pc-bios/vof&quot; &gt=
;&gt; $config_mak<br>
-=C2=A0 =C2=A0 write_target_makefile pc-bios/vof/all &gt;&gt; $config_mak<b=
r>
+=C2=A0 =C2=A0 write_target_makefile &gt;&gt; $config_mak<br>
=C2=A0fi<br>
<br>
=C2=A0# Only build s390-ccw bios if the compiler has -march=3Dz900 or -marc=
h=3Dz10<br>
=C2=A0# (which is the lowest architecture level that Clang supports)<br>
=C2=A0if test &quot;$softmmu&quot; =3D yes &amp;&amp; probe_target_compiler=
 s390x-softmmu; then<br>
-=C2=A0 got_cross_cc=3Dno<br>
-=C2=A0 if test -n &quot;$target_cc&quot;; then<br>
-=C2=A0 =C2=A0 write_c_skeleton<br>
-=C2=A0 =C2=A0 do_compiler &quot;$target_cc&quot; $target_cc_cflags -march=
=3Dz900 -o $TMPO -c $TMPC<br>
-=C2=A0 =C2=A0 has_z900=3D$?<br>
-=C2=A0 =C2=A0 if [ $has_z900 =3D 0 ] || do_compiler &quot;$target_cc&quot;=
 $target_cc_cflags -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; the=
n<br>
-=C2=A0 =C2=A0 =C2=A0 if [ $has_z900 !=3D 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;WARNING: Your compiler does not sup=
port the z900!&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T=
he s390-ccw bios will only work with guest CPUs &gt;=3D z10.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 got_cross_cc=3Dyes<br>
+=C2=A0 write_c_skeleton<br>
+=C2=A0 do_compiler &quot;$target_cc&quot; $target_cc_cflags -march=3Dz900 =
-o $TMPO -c $TMPC<br>
+=C2=A0 has_z900=3D$?<br>
+=C2=A0 if [ $has_z900 =3D 0 ] || do_compiler &quot;$target_cc&quot; $targe=
t_cc_cflags -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then<br>
+=C2=A0 =C2=A0 if [ $has_z900 !=3D 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;WARNING: Your compiler does not support th=
e z900!&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The s390=
-ccw bios will only work with guest CPUs &gt;=3D z10.&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 fi<br>
-=C2=A0 if test &quot;$got_cross_cc&quot; =3D yes || test -n &quot;$contain=
er_image&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0roms=3D&quot;$roms pc-bios/s390-ccw&quot;<br>
=C2=A0 =C2=A0 =C2=A0config_mak=3Dpc-bios/s390-ccw/config-host.mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;# Automatically generated by configure - do =
not modify&quot; &gt; $config_mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;SRC_PATH=3D$source_path/pc-bios/s390-ccw&quo=
t; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 write_target_makefile pc-bios/s390-ccw/all &gt;&gt; $config_=
mak<br>
+=C2=A0 =C2=A0 write_target_makefile &gt;&gt; $config_mak<br>
=C2=A0 =C2=A0 =C2=A0# SLOF is required for building the s390-ccw firmware o=
n s390x,<br>
=C2=A0 =C2=A0 =C2=A0# since it is using the libnet code from SLOF for netwo=
rk booting.<br>
=C2=A0 =C2=A0 =C2=A0git_submodules=3D&quot;${git_submodules} roms/SLOF&quot=
;<br>
@@ -2488,7 +2482,7 @@ for target in $target_list; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0esac<br>
<br>
-=C2=A0 if probe_target_compiler $target; then<br>
+=C2=A0 if probe_target_compiler $target || test -n &quot;$container_image&=
quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0test -n &quot;$container_image&quot; &amp;&amp; =
build_static=3Dy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;tests/tcg/$target&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0config_target_mak=3Dtests/tcg/$target/config-tar=
get.mak<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div></div>

--000000000000bb501c05ead0c145--


