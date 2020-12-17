Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C42DD107
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:03:24 +0100 (CET)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kps0C-0001YJ-11
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprxw-0000ak-Dg
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:01:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprxn-0006RT-Qp
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608206454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kbq8JX5fOckwn1EbcdsMmt7Sz5Y7eRZncyzxXUvWzeE=;
 b=dtCjmbyMI0YNH7S84JMmxbGHmDOxRSjncHLfkoNipEYYU5ojmJv5x2+cC7BQYvJkP7rZmd
 9kQQRSroWrsYZIA+sCcfPsMCQytNZaGVbToJrJ4GVP/xH7+Su08rB+K+13jSFaFWql9HyS
 vxH1kYmTJsOX0XGi4KgArOS7iqMFetA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-N1Ck_LZyP0C511f-eSL2OQ-1; Thu, 17 Dec 2020 07:00:52 -0500
X-MC-Unique: N1Ck_LZyP0C511f-eSL2OQ-1
Received: by mail-io1-f72.google.com with SMTP id x7so26993216ion.12
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbq8JX5fOckwn1EbcdsMmt7Sz5Y7eRZncyzxXUvWzeE=;
 b=F/cfqK3KnKGmKyfOYehF9wfhUcEuQLlKI26+P9yc31bxTC4TVv/chEoEXJdZojijfK
 1G7oxIirBGxMpOBw7D8cpe7Bt3YZmJCc0UlUdzJDNHlkIBoQHuoIDfD/jTEZB5kwLXnI
 oGAm8UhW2lVrWvjWDyMa3qn+MMHDprBh4PEb1SQZXhLcvzIKZWtUABKJHw0f4Wq32i3w
 XG+QFKnKyUWoPxmraJLsYoANMWTk7+b3OiEV6V64FCB3u7wgjXuFFhO0+k/EhbhO1QOX
 E+ILr0KIaMe6PvbdkIrut0oEG9UGD0C/OGB6h7bgmc8GlCegTKnRq0L8Udj/ICo4isy5
 IAtg==
X-Gm-Message-State: AOAM533lzZNJPAATs8wqv1kU9qSBuIiSYWn0cpAI7rY7lNPjkk+6/0gM
 zMXCiPn+nrrXoObkyWmmOzNv4bF7eS0lmroR/QVKyGFt8nJ9FMeOXMZalx2XrJ9Mlcn2gwDh31v
 AMmqT63L/KWp6xy4ZiwMu0WCghTJbhKo=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr10673150iof.0.1608206451628; 
 Thu, 17 Dec 2020 04:00:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3Ai5M3PwAOddWsJh0MRb+Mul7+1cWSQ/sc0sJzmTPwCGRpdpHLq04Mw/64voSr2PPijy7lz9zB0tUsUDRJds=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr10673134iof.0.1608206451440; 
 Thu, 17 Dec 2020 04:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-4-pbonzini@redhat.com>
 <CAMxuvayRJiJNP7xS9BXaSpvfdYBiAbJcTjRJB-Q+wsLM=PPoVA@mail.gmail.com>
In-Reply-To: <CAMxuvayRJiJNP7xS9BXaSpvfdYBiAbJcTjRJB-Q+wsLM=PPoVA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 16:00:40 +0400
Message-ID: <CAMxuvaxTdkqtYX79DfnyxHYViu6o54egf50cTCWTYbM_6T1t3A@mail.gmail.com>
Subject: Re: [PATCH 03/18] curl: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000043920405b6a7be7d"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000043920405b6a7be7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 3:59 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Thu, Dec 17, 2020 at 1:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>
> ---
>>  configure                   | 31 ++++---------------------------
>>  contrib/elf2dmp/meson.build |  2 +-
>>  meson.build                 | 11 +++++++----
>>  meson_options.txt           |  2 ++
>>  4 files changed, 14 insertions(+), 32 deletions(-)
>>
>> diff --git a/configure b/configure
>> index c0a3e1556b..71196b1fe7 100755
>> --- a/configure
>> +++ b/configure
>> @@ -307,7 +307,7 @@ for opt do
>>  done
>>
>>  brlapi=3D"auto"
>> -curl=3D"$default_feature"
>> +curl=3D"auto"
>>
>
> What about default_feature=3Dno ?
>

Oh got it:
        $(if test "$default_features" =3D no; then echo
"-Dauto_features=3Ddisabled"; fi) \

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>  iconv=3D"auto"
>>  curses=3D"auto"
>>  docs=3D"auto"
>> @@ -1216,9 +1216,9 @@ for opt do
>>    ;;
>>    --enable-iconv) iconv=3D"enabled"
>>    ;;
>> -  --disable-curl) curl=3D"no"
>> +  --disable-curl) curl=3D"disabled"
>>    ;;
>> -  --enable-curl) curl=3D"yes"
>> +  --enable-curl) curl=3D"enabled"
>>    ;;
>>    --disable-fdt) fdt=3D"disabled"
>>    ;;
>> @@ -3425,25 +3425,6 @@ for drv in $audio_drv_list; do
>>      esac
>>  done
>>
>> -##########################################
>> -# curl probe
>> -if test "$curl" !=3D "no" ; then
>> -  cat > $TMPC << EOF
>> -#include <curl/curl.h>
>> -int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0=
;
>> }
>> -EOF
>> -  curl_cflags=3D$($pkg_config libcurl --cflags 2>/dev/null)
>> -  curl_libs=3D$($pkg_config libcurl --libs 2>/dev/null)
>> -  if compile_prog "$curl_cflags" "$curl_libs" ; then
>> -    curl=3Dyes
>> -  else
>> -    if test "$curl" =3D "yes" ; then
>> -      feature_not_found "curl" "Install libcurl devel"
>> -    fi
>> -    curl=3Dno
>> -  fi
>> -fi # test "$curl"
>> -
>>  ##########################################
>>  # glib support probe
>>
>> @@ -6104,11 +6085,6 @@ fi
>>  if test "$bswap_h" =3D "yes" ; then
>>    echo "CONFIG_MACHINE_BSWAP_H=3Dy" >> $config_host_mak
>>  fi
>> -if test "$curl" =3D "yes" ; then
>> -  echo "CONFIG_CURL=3Dy" >> $config_host_mak
>> -  echo "CURL_CFLAGS=3D$curl_cflags" >> $config_host_mak
>> -  echo "CURL_LIBS=3D$curl_libs" >> $config_host_mak
>> -fi
>>  if test "$gtk" =3D "yes" ; then
>>    echo "CONFIG_GTK=3Dy" >> $config_host_mak
>>    echo "GTK_CFLAGS=3D$gtk_cflags" >> $config_host_mak
>> @@ -6943,6 +6919,7 @@ NINJA=3D$ninja $meson setup \
>>          -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
>> -Dvnc_png=3D$vnc_png \
>>          -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
>> -Dvirtiofsd=3D$virtiofsd \
>>          -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=
=3D$brlapi \
>> +        -Dcurl=3D$curl \
>>          -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
>>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=
=3D$blobs
>> \
>>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>> diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build
>> index b3de173316..4d86cb390a 100644
>> --- a/contrib/elf2dmp/meson.build
>> +++ b/contrib/elf2dmp/meson.build
>> @@ -1,4 +1,4 @@
>> -if 'CONFIG_CURL' in config_host
>> +if curl.found()
>>    executable('elf2dmp', files('main.c', 'addrspace.c', 'download.c',
>> 'pdb.c', 'qemu_elf.c'),
>>               dependencies: [glib, curl],
>>               install: true)
>> diff --git a/meson.build b/meson.build
>> index 70f81121d7..83dbc61acd 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -392,9 +392,11 @@ if 'CONFIG_VIRGL' in config_host
>>                               link_args:
>> config_host['VIRGL_LIBS'].split())
>>  endif
>>  curl =3D not_found
>> -if 'CONFIG_CURL' in config_host
>> -  curl =3D declare_dependency(compile_args:
>> config_host['CURL_CFLAGS'].split(),
>> -                            link_args: config_host['CURL_LIBS'].split()=
)
>> +if not get_option('curl').auto() or have_block
>> +  curl =3D dependency('libcurl', version: '>=3D7.29.0',
>> +                    method: 'pkg-config',
>> +                    required: get_option('curl'),
>> +                    static: enable_static)
>>  endif
>>  libudev =3D not_found
>>  if targetos =3D=3D 'linux' and (have_system or have_tools)
>> @@ -872,6 +874,7 @@ config_host_data.set('CONFIG_COCOA', cocoa.found())
>>  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
>>  config_host_data.set('CONFIG_MPATH', mpathpersist.found())
>>  config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
>> +config_host_data.set('CONFIG_CURL', curl.found())
>>  config_host_data.set('CONFIG_CURSES', curses.found())
>>  config_host_data.set('CONFIG_SDL', sdl.found())
>>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>> @@ -2160,7 +2163,7 @@ summary_info +=3D {'iconv support':     iconv.foun=
d()}
>>  summary_info +=3D {'curses support':    curses.found()}
>>  # TODO: add back version
>>  summary_info +=3D {'virgl support':
>>  config_host.has_key('CONFIG_VIRGL')}
>> -summary_info +=3D {'curl support':      config_host.has_key('CONFIG_CUR=
L')}
>> +summary_info +=3D {'curl support':      curl.found()}
>>  summary_info +=3D {'mingw32 support':   targetos =3D=3D 'windows'}
>>  summary_info +=3D {'Audio drivers':
>>  config_host['CONFIG_AUDIO_DRIVERS']}
>>  summary_info +=3D {'Block whitelist (rw)':
>> config_host['CONFIG_BDRV_RW_WHITELIST']}
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 62efe96a91..2b845ac62b 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -44,6 +44,8 @@ option('brlapi', type : 'feature', value : 'auto',
>>         description: 'brlapi character device driver')
>>  option('cocoa', type : 'feature', value : 'auto',
>>         description: 'Cocoa user interface (macOS only)')
>> +option('curl', type : 'feature', value : 'auto',
>> +       description: 'CURL block device driver')
>>  option('mpath', type : 'feature', value : 'auto',
>>         description: 'Multipath persistent reservation passthrough')
>>  option('iconv', type : 'feature', value : 'auto',
>> --
>> 2.29.2
>>
>>
>>

--00000000000043920405b6a7be7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 3:59 PM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:=
40 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_b=
lank">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto=
:pbonzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br></bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 31 ++++---------------------------<br>
=C2=A0contrib/elf2dmp/meson.build |=C2=A0 2 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 +++++++----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
+<br>
=C2=A04 files changed, 14 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index c0a3e1556b..71196b1fe7 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -307,7 +307,7 @@ for opt do<br>
=C2=A0done<br>
<br>
=C2=A0brlapi=3D&quot;auto&quot;<br>
-curl=3D&quot;$default_feature&quot;<br>
+curl=3D&quot;auto&quot;<br></blockquote><div><br></div><div>What about def=
ault_feature=3Dno ?</div></div></div></blockquote><div><br></div><div>Oh go=
t it:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if test &quot;$default_featur=
es&quot; =3D no; then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \</d=
iv><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"m=
ailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br>=
</div><div><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0iconv=3D&quot;auto&quot;<br>
=C2=A0curses=3D&quot;auto&quot;<br>
=C2=A0docs=3D&quot;auto&quot;<br>
@@ -1216,9 +1216,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-iconv) iconv=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-curl) curl=3D&quot;no&quot;<br>
+=C2=A0 --disable-curl) curl=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-curl) curl=3D&quot;yes&quot;<br>
+=C2=A0 --enable-curl) curl=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-fdt) fdt=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -3425,25 +3425,6 @@ for drv in $audio_drv_list; do<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0done<br>
<br>
-##########################################<br>
-# curl probe<br>
-if test &quot;$curl&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;curl/curl.h&gt;<br>
-int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }=
<br>
-EOF<br>
-=C2=A0 curl_cflags=3D$($pkg_config libcurl --cflags 2&gt;/dev/null)<br>
-=C2=A0 curl_libs=3D$($pkg_config libcurl --libs 2&gt;/dev/null)<br>
-=C2=A0 if compile_prog &quot;$curl_cflags&quot; &quot;$curl_libs&quot; ; t=
hen<br>
-=C2=A0 =C2=A0 curl=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$curl&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;curl&quot; &quot;Install libc=
url devel&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 curl=3Dno<br>
-=C2=A0 fi<br>
-fi # test &quot;$curl&quot;<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# glib support probe<br>
<br>
@@ -6104,11 +6085,6 @@ fi<br>
=C2=A0if test &quot;$bswap_h&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MACHINE_BSWAP_H=3Dy&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0fi<br>
-if test &quot;$curl&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_CURL=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;CURL_CFLAGS=3D$curl_cflags&quot; &gt;&gt; $config_host_m=
ak<br>
-=C2=A0 echo &quot;CURL_LIBS=3D$curl_libs&quot; &gt;&gt; $config_host_mak<b=
r>
-fi<br>
=C2=A0if test &quot;$gtk&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GTK=3Dy&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;GTK_CFLAGS=3D$gtk_cflags&quot; &gt;&gt; $config_hos=
t_mak<br>
@@ -6943,6 +6919,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc=
_jpeg=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgettext=3D$gettext -Dxkbcommon=3D$xkbco=
mmon -Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dslirp=3D$slirp -=
Dfdt=3D$fdt -Dbrlapi=3D$brlapi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$curses -Dlib=
udev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build<br>
index b3de173316..4d86cb390a 100644<br>
--- a/contrib/elf2dmp/meson.build<br>
+++ b/contrib/elf2dmp/meson.build<br>
@@ -1,4 +1,4 @@<br>
-if &#39;CONFIG_CURL&#39; in config_host<br>
+if curl.found()<br>
=C2=A0 =C2=A0executable(&#39;elf2dmp&#39;, files(&#39;main.c&#39;, &#39;add=
rspace.c&#39;, &#39;download.c&#39;, &#39;pdb.c&#39;, &#39;qemu_elf.c&#39;)=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [glib, curl]=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true)<br>
diff --git a/meson.build b/meson.build<br>
index 70f81121d7..83dbc61acd 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -392,9 +392,11 @@ if &#39;CONFIG_VIRGL&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;VIRGL_LIBS&#39;=
].split())<br>
=C2=A0endif<br>
=C2=A0curl =3D not_found<br>
-if &#39;CONFIG_CURL&#39; in config_host<br>
-=C2=A0 curl =3D declare_dependency(compile_args: config_host[&#39;CURL_CFL=
AGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;CURL_LIBS&#39;].split(=
))<br>
+if not get_option(&#39;curl&#39;).auto() or have_block<br>
+=C2=A0 curl =3D dependency(&#39;libcurl&#39;, version: &#39;&gt;=3D7.29.0&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meth=
od: &#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
ired: get_option(&#39;curl&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
ic: enable_static)<br>
=C2=A0endif<br>
=C2=A0libudev =3D not_found<br>
=C2=A0if targetos =3D=3D &#39;linux&#39; and (have_system or have_tools)<br=
>
@@ -872,6 +874,7 @@ config_host_data.set(&#39;CONFIG_COCOA&#39;, cocoa.foun=
d())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBUDEV&#39;, libudev.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH&#39;, mpathpersist.found())<br=
>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH_NEW_API&#39;, mpathpersist_new=
_api)<br>
+config_host_data.set(&#39;CONFIG_CURL&#39;, curl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURSES&#39;, curses.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
@@ -2160,7 +2163,7 @@ summary_info +=3D {&#39;iconv support&#39;:=C2=A0 =C2=
=A0 =C2=A0iconv.found()}<br>
=C2=A0summary_info +=3D {&#39;curses support&#39;:=C2=A0 =C2=A0 curses.foun=
d()}<br>
=C2=A0# TODO: add back version<br>
=C2=A0summary_info +=3D {&#39;virgl support&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_VIRGL&#39;)}<br>
-summary_info +=3D {&#39;curl support&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_CURL&#39;)}<br>
+summary_info +=3D {&#39;curl support&#39;:=C2=A0 =C2=A0 =C2=A0 curl.found(=
)}<br>
=C2=A0summary_info +=3D {&#39;mingw32 support&#39;:=C2=A0 =C2=A0targetos =
=3D=3D &#39;windows&#39;}<br>
=C2=A0summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host[&#39;CONFIG_AUDIO_DRIVERS&#39;]}<br>
=C2=A0summary_info +=3D {&#39;Block whitelist (rw)&#39;: config_host[&#39;C=
ONFIG_BDRV_RW_WHITELIST&#39;]}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 62efe96a91..2b845ac62b 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -44,6 +44,8 @@ option(&#39;brlapi&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;brlapi character device drive=
r&#39;)<br>
=C2=A0option(&#39;cocoa&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
+option(&#39;curl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;CURL block device driver&#39;=
)<br>
=C2=A0option(&#39;mpath&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Multipath persistent reservat=
ion passthrough&#39;)<br>
=C2=A0option(&#39;iconv&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000043920405b6a7be7d--


