Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A059D2DD233
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:34:50 +0100 (CET)
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptQf-0004XR-Ng
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptOv-0003fO-3E
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:33:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kptOs-0003Wq-K0
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608211977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DjSiuIjcYuXbeMZablWuLkczonUrLuD54utHwFRR1m0=;
 b=VHVZ/7V96ZbMOOdwA2vzKRG+/+QJ773M6VPTgFWqCJ20/W1QIuocL9eW/9GMKkHuXNljUv
 TWeRyVqyZFwSrJwvmNpD2hD/y5cRhotM9EY1yMXWIx59DENR8JJTb0XJAeyE/VQrb4q4k1
 3rqcgrIMgF7cWB8FPVwj1wh+2j1gAVY=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-oy9YoqijMfev2BitH-i49w-1; Thu, 17 Dec 2020 08:32:56 -0500
X-MC-Unique: oy9YoqijMfev2BitH-i49w-1
Received: by mail-il1-f199.google.com with SMTP id p10so20070304ilo.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DjSiuIjcYuXbeMZablWuLkczonUrLuD54utHwFRR1m0=;
 b=DKWpwBMhj94U8UaIwG7y2JM5uYSHsDABe862K7v10XlUpXwIH+SwXXyA4qpSjiN3hC
 34ufUPN0/qodZkPZbyvwxtrkWRdkRJqNQl3C8ze3Z19cmCrNhG08jiiXRKeKriEk8JP4
 240nNbp164DjoEQJm+WPItI/3chC9DS/FdYKXDw+bMWdauABcJXyLPQNdnmoL4WZ/X/3
 aSfwN9NtLUw3f4npO2Ld4gmetRsZeK4H0ct6QdcBVNBByck9aQIkDe91Ei5pLKQ9+tNR
 ajmUM262MTZ1Q5PWWhl/OAf51l8LgC0r0nbueVpBjHOpQvLFpa0tH37gou9jcAJiVf1o
 ADAg==
X-Gm-Message-State: AOAM533FOGdv5HIgyhPQ982JPW2iZQ+aR/0/1Zn/wyzGgFZZGR2ZVe+S
 u5ffPjbpk6ZX7QmPg5ddfB9j+EGzadL4A5OoN3Qf+cwWpE1AF2QwpWp+n8mVTRJ8q9CV0KcC/hS
 kxXdK2yFAQX3ial/nBmbVb++KD3205Qk=
X-Received: by 2002:a05:6e02:cb:: with SMTP id
 r11mr50900644ilq.11.1608211974695; 
 Thu, 17 Dec 2020 05:32:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUuw+AEkXtJPecw4p4wykgVyrVEPAc0VODzUCCvKFu7WtBz9CEkQF7ejtnPtT3Tp+IM1o4lUeOsaKtPQaHjL0=
X-Received: by 2002:a05:6e02:cb:: with SMTP id
 r11mr50900625ilq.11.1608211974522; 
 Thu, 17 Dec 2020 05:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-14-pbonzini@redhat.com>
 <CAMxuvaySnEMbHGNUSNPEEtMstO=iM5kG3NtYvshw_TX5x+o9sQ@mail.gmail.com>
In-Reply-To: <CAMxuvaySnEMbHGNUSNPEEtMstO=iM5kG3NtYvshw_TX5x+o9sQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 17:32:43 +0400
Message-ID: <CAMxuvazk5YjS9j-J_rOomPa=jfZ+QMYCOpa5HbS36h2_16xpbQ@mail.gmail.com>
Subject: Re: [PATCH 13/18] zstd: convert to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007718e005b6a907f4"
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

--0000000000007718e005b6a907f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 5:31 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

>
>
> On Thu, Dec 17, 2020 at 1:41 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  configure             | 30 ++++--------------------------
>>  meson.build           | 10 ++++++----
>>  meson_options.txt     |  2 ++
>>  migration/meson.build |  2 +-
>>  4 files changed, 13 insertions(+), 31 deletions(-)
>>
>> diff --git a/configure b/configure
>> index ea5650acca..649da881a2 100755
>> --- a/configure
>> +++ b/configure
>> @@ -398,7 +398,7 @@ lzo=3D"auto"
>>  snappy=3D"auto"
>>  bzip2=3D"auto"
>>  lzfse=3D"auto"
>> -zstd=3D"$default_feature"
>> +zstd=3D"auto"
>>  guest_agent=3D"$default_feature"
>>  guest_agent_with_vss=3D"no"
>>  guest_agent_ntddscsi=3D"no"
>> @@ -1328,9 +1328,9 @@ for opt do
>>    ;;
>>    --disable-lzfse) lzfse=3D"disabled"
>>    ;;
>> -  --disable-zstd) zstd=3D"no"
>> +  --disable-zstd) zstd=3D"disabled"
>>    ;;
>> -  --enable-zstd) zstd=3D"yes"
>> +  --enable-zstd) zstd=3D"enabled"
>>    ;;
>>    --enable-guest-agent) guest_agent=3D"yes"
>>    ;;
>> @@ -2458,23 +2458,6 @@ EOF
>>    fi
>>  fi
>>
>> -##########################################
>> -# zstd check
>> -
>> -if test "$zstd" !=3D "no" ; then
>> -    libzstd_minver=3D"1.4.0"
>> -    if $pkg_config --atleast-version=3D$libzstd_minver libzstd ; then
>> -        zstd_cflags=3D"$($pkg_config --cflags libzstd)"
>> -        zstd_libs=3D"$($pkg_config --libs libzstd)"
>> -        zstd=3D"yes"
>> -    else
>> -        if test "$zstd" =3D "yes" ; then
>> -            feature_not_found "libzstd" "Install libzstd devel"
>> -        fi
>> -        zstd=3D"no"
>> -    fi
>> -fi
>> -
>>  ##########################################
>>  # libseccomp check
>>
>> @@ -6070,12 +6053,6 @@ if test "$avx512f_opt" =3D "yes" ; then
>>    echo "CONFIG_AVX512F_OPT=3Dy" >> $config_host_mak
>>  fi
>>
>> -if test "$zstd" =3D "yes" ; then
>> -  echo "CONFIG_ZSTD=3Dy" >> $config_host_mak
>> -  echo "ZSTD_CFLAGS=3D$zstd_cflags" >> $config_host_mak
>> -  echo "ZSTD_LIBS=3D$zstd_libs" >> $config_host_mak
>> -fi
>> -
>>  if test "$seccomp" =3D "yes"; then
>>    echo "CONFIG_SECCOMP=3Dy" >> $config_host_mak
>>    echo "SECCOMP_CFLAGS=3D$seccomp_cflags" >> $config_host_mak
>> @@ -6629,6 +6606,7 @@ NINJA=3D$ninja $meson setup \
>>          -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
>> -Dlibiscsi=3D$libiscsi \
>>          -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
>> -Dlibudev=3D$libudev\
>>          -Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy
>> -Dlzfse=3D$lzfse \
>> +        -Dzstd=3D$zstd \
>>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=
=3D$blobs
>> \
>>          -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek \
>> diff --git a/meson.build b/meson.build
>> index c02d9c3e1a..93a95d7a7f 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -380,9 +380,10 @@ if not get_option('libiscsi').auto() or have_block
>>                           method: 'pkg-config', static: enable_static)
>>  endif
>>  zstd =3D not_found
>> -if 'CONFIG_ZSTD' in config_host
>> -  zstd =3D declare_dependency(compile_args:
>> config_host['ZSTD_CFLAGS'].split(),
>> -                            link_args: config_host['ZSTD_LIBS'].split()=
)
>> +if not get_option('zstd').auto() or have_block
>> +  zstd =3D dependency('zstd', version: '>=3D1.4.0',
>>
>
> -> libzstd
>
> Interestingly, meson didn't seem to overwrite config-host.h correctly
> (that's how I noticed failed to link). I removed it and now it regenerate=
s
> it correctly.. weird.
>
>
with that fix,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

+                    required: get_option('zstd'),
>> +                    method: 'pkg-config', static: enable_static)
>>  endif
>>  gbm =3D not_found
>>  if 'CONFIG_GBM' in config_host
>> @@ -1003,6 +1004,7 @@ config_host_data.set('CONFIG_KEYUTILS',
>> keyutils.found())
>>  config_host_data.set('CONFIG_GETTID', has_gettid)
>>  config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
>>  config_host_data.set('CONFIG_STATX', has_statx)
>> +config_host_data.set('CONFIG_ZSTD', zstd.found())
>>  config_host_data.set('CONFIG_FUSE', fuse.found())
>>  config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
>>  config_host_data.set('CONFIG_CFI', get_option('cfi'))
>> @@ -2377,7 +2379,7 @@ summary_info +=3D {'lzo support':       lzo.found(=
)}
>>  summary_info +=3D {'snappy support':    snappy.found()}
>>  summary_info +=3D {'bzip2 support':     libbzip2.found()}
>>  summary_info +=3D {'lzfse support':     liblzfse.found()}
>> -summary_info +=3D {'zstd support':      config_host.has_key('CONFIG_ZST=
D')}
>> +summary_info +=3D {'zstd support':      zstd.found()}
>>  summary_info +=3D {'NUMA host support': config_host.has_key('CONFIG_NUM=
A')}
>>  summary_info +=3D {'libxml2':
>>  config_host.has_key('CONFIG_LIBXML2')}
>>  summary_info +=3D {'memory allocator':  get_option('malloc')}
>> diff --git a/meson_options.txt b/meson_options.txt
>> index f74a3d78c4..5a1de9b1fe 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -92,6 +92,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
>>         description: 'build virtiofs daemon (virtiofsd)')
>>  option('vhost_user_blk_server', type: 'feature', value: 'auto',
>>         description: 'build vhost-user-blk server')
>> +option('zstd', type : 'feature', value : 'auto',
>> +       description: 'zstd compression support')
>>  option('fuse', type: 'feature', value: 'auto',
>>         description: 'FUSE block device export')
>>  option('fuse_lseek', type : 'feature', value : 'auto',
>> diff --git a/migration/meson.build b/migration/meson.build
>> index 980e37865c..c783f2f2ae 100644
>> --- a/migration/meson.build
>> +++ b/migration/meson.build
>> @@ -29,6 +29,6 @@ softmmu_ss.add(files(
>>
>>  softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
>>  softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true:
>> files('block.c'))
>> -softmmu_ss.add(when: 'CONFIG_ZSTD', if_true: [files('multifd-zstd.c'),
>> zstd])
>> +softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
>>
>>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c',
>> 'ram.c'))
>> --
>> 2.29.2
>>
>>
>>

--0000000000007718e005b6a907f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 5:31 PM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, =
2020 at 1:41 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" ta=
rget=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&g=
t;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++++---=
-----------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++----<b=
r>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0migration/meson.build |=C2=A0 2 +-<br>
=C2=A04 files changed, 13 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index ea5650acca..649da881a2 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -398,7 +398,7 @@ lzo=3D&quot;auto&quot;<br>
=C2=A0snappy=3D&quot;auto&quot;<br>
=C2=A0bzip2=3D&quot;auto&quot;<br>
=C2=A0lzfse=3D&quot;auto&quot;<br>
-zstd=3D&quot;$default_feature&quot;<br>
+zstd=3D&quot;auto&quot;<br>
=C2=A0guest_agent=3D&quot;$default_feature&quot;<br>
=C2=A0guest_agent_with_vss=3D&quot;no&quot;<br>
=C2=A0guest_agent_ntddscsi=3D&quot;no&quot;<br>
@@ -1328,9 +1328,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-lzfse) lzfse=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-zstd) zstd=3D&quot;no&quot;<br>
+=C2=A0 --disable-zstd) zstd=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-zstd) zstd=3D&quot;yes&quot;<br>
+=C2=A0 --enable-zstd) zstd=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-guest-agent) guest_agent=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2458,23 +2458,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# zstd check<br>
-<br>
-if test &quot;$zstd&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 libzstd_minver=3D&quot;1.4.0&quot;<br>
-=C2=A0 =C2=A0 if $pkg_config --atleast-version=3D$libzstd_minver libzstd ;=
 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 zstd_cflags=3D&quot;$($pkg_config --cflags lib=
zstd)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 zstd_libs=3D&quot;$($pkg_config --libs libzstd=
)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 zstd=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$zstd&quot; =3D &quot;yes&quot; =
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;libzstd&=
quot; &quot;Install libzstd devel&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 zstd=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# libseccomp check<br>
<br>
@@ -6070,12 +6053,6 @@ if test &quot;$avx512f_opt&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_AVX512F_OPT=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$zstd&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_ZSTD=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;ZSTD_CFLAGS=3D$zstd_cflags&quot; &gt;&gt; $config_host_m=
ak<br>
-=C2=A0 echo &quot;ZSTD_LIBS=3D$zstd_libs&quot; &gt;&gt; $config_host_mak<b=
r>
-fi<br>
-<br>
=C2=A0if test &quot;$seccomp&quot; =3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_SECCOMP=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0 =C2=A0echo &quot;SECCOMP_CFLAGS=3D$seccomp_cflags&quot; &gt;&gt; $co=
nfig_host_mak<br>
@@ -6629,6 +6606,7 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcurl=3D$curl -Dglusterfs=3D$glusterfs -=
Dbzip2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcur=
ses=3D$curses -Dlibudev=3D$libudev\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlibssh=3D$libssh -Drbd=3D$rbd -Dlzo=3D$=
lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=3D$sphinx_b=
uild -Dinstall_blobs=3D$blobs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 \<br>
diff --git a/meson.build b/meson.build<br>
index c02d9c3e1a..93a95d7a7f 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -380,9 +380,10 @@ if not get_option(&#39;libiscsi&#39;).auto() or have_b=
lock<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 method: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
=C2=A0zstd =3D not_found<br>
-if &#39;CONFIG_ZSTD&#39; in config_host<br>
-=C2=A0 zstd =3D declare_dependency(compile_args: config_host[&#39;ZSTD_CFL=
AGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;ZSTD_LIBS&#39;].split(=
))<br>
+if not get_option(&#39;zstd&#39;).auto() or have_block<br>
+=C2=A0 zstd =3D dependency(&#39;zstd&#39;, version: &#39;&gt;=3D1.4.0&#39;=
,<br></blockquote><div><br></div><div>-&gt; libzstd<br></div><div><br></div=
><div>Interestingly, meson didn&#39;t seem to overwrite config-host.h corre=
ctly (that&#39;s how I noticed failed to link). I removed it and now it reg=
enerates it correctly.. weird.<br></div><div><br></div></div></div></blockq=
uote><div><br></div><div>with that fix,</div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lur=
eau@redhat.com</a>&gt; <br></div><div><br> </div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requ=
ired: get_option(&#39;zstd&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meth=
od: &#39;pkg-config&#39;, static: enable_static)<br>
=C2=A0endif<br>
=C2=A0gbm =3D not_found<br>
=C2=A0if &#39;CONFIG_GBM&#39; in config_host<br>
@@ -1003,6 +1004,7 @@ config_host_data.set(&#39;CONFIG_KEYUTILS&#39;, keyut=
ils.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_GETTID&#39;, has_gettid)<br>
=C2=A0config_host_data.set(&#39;CONFIG_MALLOC_TRIM&#39;, has_malloc_trim)<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_STATX&#39;, has_statx)<br>
+config_host_data.set(&#39;CONFIG_ZSTD&#39;, zstd.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_FUSE&#39;, fuse.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_FUSE_LSEEK&#39;, fuse_lseek.found())=
<br>
=C2=A0config_host_data.set(&#39;CONFIG_CFI&#39;, get_option(&#39;cfi&#39;))=
<br>
@@ -2377,7 +2379,7 @@ summary_info +=3D {&#39;lzo support&#39;:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0lzo.found()}<br>
=C2=A0summary_info +=3D {&#39;snappy support&#39;:=C2=A0 =C2=A0 snappy.foun=
d()}<br>
=C2=A0summary_info +=3D {&#39;bzip2 support&#39;:=C2=A0 =C2=A0 =C2=A0libbzi=
p2.found()}<br>
=C2=A0summary_info +=3D {&#39;lzfse support&#39;:=C2=A0 =C2=A0 =C2=A0liblzf=
se.found()}<br>
-summary_info +=3D {&#39;zstd support&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_ZSTD&#39;)}<br>
+summary_info +=3D {&#39;zstd support&#39;:=C2=A0 =C2=A0 =C2=A0 zstd.found(=
)}<br>
=C2=A0summary_info +=3D {&#39;NUMA host support&#39;: config_host.has_key(&=
#39;CONFIG_NUMA&#39;)}<br>
=C2=A0summary_info +=3D {&#39;libxml2&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0config_host.has_key(&#39;CONFIG_LIBXML2&#39;)}<br>
=C2=A0summary_info +=3D {&#39;memory allocator&#39;:=C2=A0 get_option(&#39;=
malloc&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index f74a3d78c4..5a1de9b1fe 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -92,6 +92,8 @@ option(&#39;virtiofsd&#39;, type: &#39;feature&#39;, valu=
e: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;build virtiofs daemon (virtio=
fsd)&#39;)<br>
=C2=A0option(&#39;vhost_user_blk_server&#39;, type: &#39;feature&#39;, valu=
e: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;build vhost-user-blk server&#=
39;)<br>
+option(&#39;zstd&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;zstd compression support&#39;=
)<br>
=C2=A0option(&#39;fuse&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;FUSE block device export&#39;=
)<br>
=C2=A0option(&#39;fuse_lseek&#39;, type : &#39;feature&#39;, value : &#39;a=
uto&#39;,<br>
diff --git a/migration/meson.build b/migration/meson.build<br>
index 980e37865c..c783f2f2ae 100644<br>
--- a/migration/meson.build<br>
+++ b/migration/meson.build<br>
@@ -29,6 +29,6 @@ softmmu_ss.add(files(<br>
<br>
=C2=A0softmmu_ss.add(when: [&#39;CONFIG_RDMA&#39;, rdma], if_true: files(&#=
39;rdma.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_LIVE_BLOCK_MIGRATION&#39;, if_true: =
files(&#39;block.c&#39;))<br>
-softmmu_ss.add(when: &#39;CONFIG_ZSTD&#39;, if_true: [files(&#39;multifd-z=
std.c&#39;), zstd])<br>
+softmmu_ss.add(when: zstd, if_true: files(&#39;multifd-zstd.c&#39;))<br>
<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SOFTMMU&#39;, if_true: files(&#39;d=
irtyrate.c&#39;, &#39;ram.c&#39;))<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000007718e005b6a907f4--


