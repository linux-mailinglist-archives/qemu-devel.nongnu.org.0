Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AF68C7C1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP8Fa-0006Ed-Pn; Mon, 06 Feb 2023 15:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pP8FR-0006E4-C8
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pP8FP-0000Nm-LK
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675715874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcHLhBiBeUSKNDAZobURRzlpDkUv1iPr0SvkvKjbFbg=;
 b=P9WBCctLlJsnsaJG+bfGPsXEmYZNLblIZ5dZiJXejqJrhQdOJDWoWGAcm3hk08tNEjqSBJ
 B/AoZ1rpavui5dqCfFfrkixEFu1FvRNgneuRAhJdizFM4TfDKUc8uF2rj4RdZFM11l7Kby
 yg7OYPLxbdRnSkDXYqYFMzYlxPX9rrI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-aCdtkEN9O86wCcLmY7hTxw-1; Mon, 06 Feb 2023 15:37:53 -0500
X-MC-Unique: aCdtkEN9O86wCcLmY7hTxw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gz8-20020a170907a04800b0087bd94a505fso9452203ejc.16
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 12:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fcHLhBiBeUSKNDAZobURRzlpDkUv1iPr0SvkvKjbFbg=;
 b=F3KbAQDJ/bCzRCSDg/BXVOlj3hi8UwovHlrbAKPSekM2Q1CRiSXSWnHV/avdnHAvAI
 foJUhZF0rN9YpCMQf2w9tUWKhNhJ/1xlNQMI4MwpvnjyCT3rOgFieP2w9BF81mRZ1JVV
 LoFeQox/aPw3oyH2noeklQrOsTm5ucnrKw0Z1o3FIsBU+aJCd5P2Qmh1nDlfi+TG7Vzu
 Nfw4i9UnsaznG/bWp2ZL0wvXqhoGN08DaTzjbZjRWQTFKKEvIdgWF6PWYLxj5G24tQfN
 JJgfL2BnGby/06TaMUwIQCZndfZbCpws7R8BsCSXDWNSx/ODVAI5shsNX57Ba9tromIV
 Qyrw==
X-Gm-Message-State: AO0yUKURAbPjZF3qb2OHwDGg3mPmJ8Q5luPvhkCEIMZF2YLWSUuAFHD4
 +YkIuraVhENewy4MrpdEqONWKzcm1+i/N5dp9VM1tF97b5Q/YiEdWlItJVHzr/y4Jiukb3ZIaz6
 aOpqRxTFbN9e+lj+kHzvCckGJY8MC9Uw=
X-Received: by 2002:a17:907:f97:b0:884:3298:12b with SMTP id
 kb23-20020a1709070f9700b008843298012bmr215461ejc.125.1675715871911; 
 Mon, 06 Feb 2023 12:37:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8Dj2u/geeCXDjS5uq/e7Z1hO/WHoOYD+Spp5vEs4erfnxkTtr+G5G4mN7/KUdBvMkVjIxZVugp1wFSBZeeEzI=
X-Received: by 2002:a17:907:f97:b0:884:3298:12b with SMTP id
 kb23-20020a1709070f9700b008843298012bmr215451ejc.125.1675715871748; Mon, 06
 Feb 2023 12:37:51 -0800 (PST)
MIME-Version: 1.0
References: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 7 Feb 2023 00:37:40 +0400
Message-ID: <CAMxuvawH9=Oy+TG6YLrgsV1qtc+7BmK0+o4N1Rrur3kUBY7nhg@mail.gmail.com>
Subject: Re: [PATCH V2] meson: fix dependency on qemu-keymap
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000047c83c05f40e01b2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--00000000000047c83c05f40e01b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2023 at 10:34 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> When qemu-keymap is not available on the host, and enable-xkbcommon
> is specified, parallel make fails with:
>
>   % make clean
>   ...
>   % make -j 32
>   ...
>   FAILED: pc-bios/keymaps/is
>   ./qemu-keymap -f pc-bios/keymaps/is -l is
>   /bin/sh: ./qemu-keymap: No such file or directory
>   ... many similar messages ...
>
> The code always runs find_program, rather than waiting to build
> qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host
> rather than config_host_data.  Making serially succeeds, by soft
> linking files from pc-bios/keymaps, but that is not the desired
> result for enable-xkbcommon.
>
> Examining all occurrences of 'in config_host' for similar bugs shows one
> instance in the docs, which is also fixed here.
>
> Fixes: 4113f4cfee ("meson: move xkbcommon to meson")
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  docs/devel/kconfig.rst      | 2 +-
>  pc-bios/keymaps/meson.build | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
> index 69674d0..cc1a456 100644
> --- a/docs/devel/kconfig.rst
> +++ b/docs/devel/kconfig.rst
> @@ -306,6 +306,6 @@ variable::
>
>      host_kconfig =3D \
>        (have_tpm ? ['CONFIG_TPM=3Dy'] : []) + \
> -      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=3Dy'] : []) + \
> +      ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=3Dy'] : []) + \
>        (have_ivshmem ? ['CONFIG_IVSHMEM=3Dy'] : []) + \
>        ...
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 06c75e6..158a3b4 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -33,7 +33,7 @@ keymaps =3D {
>    'tr': '-l tr',
>  }
>
> -if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
> +if meson.is_cross_build() or not xkbcommon.found()
>    native_qemu_keymap =3D find_program('qemu-keymap', required: false,
> disabler: true)
>  else
>    native_qemu_keymap =3D qemu_keymap
> --
> 1.8.3.1
>
>

--00000000000047c83c05f40e01b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 6, 2023 at 10:34 PM Steve=
 Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@or=
acle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">When qemu-keymap is not available on the host, and enable-xkbcommon=
<br>
is specified, parallel make fails with:<br>
<br>
=C2=A0 % make clean<br>
=C2=A0 ...<br>
=C2=A0 % make -j 32<br>
=C2=A0 ...<br>
=C2=A0 FAILED: pc-bios/keymaps/is<br>
=C2=A0 ./qemu-keymap -f pc-bios/keymaps/is -l is<br>
=C2=A0 /bin/sh: ./qemu-keymap: No such file or directory<br>
=C2=A0 ... many similar messages ...<br>
<br>
The code always runs find_program, rather than waiting to build<br>
qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host<br>
rather than config_host_data.=C2=A0 Making serially succeeds, by soft<br>
linking files from pc-bios/keymaps, but that is not the desired<br>
result for enable-xkbcommon.<br>
<br>
Examining all occurrences of &#39;in config_host&#39; for similar bugs show=
s one<br>
instance in the docs, which is also fixed here.<br>
<br>
Fixes: 4113f4cfee (&quot;meson: move xkbcommon to meson&quot;)<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></blockquote><div=
><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/devel/kconfig.rst=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0pc-bios/keymaps/meson.build | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst<br>
index 69674d0..cc1a456 100644<br>
--- a/docs/devel/kconfig.rst<br>
+++ b/docs/devel/kconfig.rst<br>
@@ -306,6 +306,6 @@ variable::<br>
<br>
=C2=A0 =C2=A0 =C2=A0host_kconfig =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0(have_tpm ? [&#39;CONFIG_TPM=3Dy&#39;] : []) + \=
<br>
-=C2=A0 =C2=A0 =C2=A0 (&#39;CONFIG_SPICE&#39; in config_host ? [&#39;CONFIG=
_SPICE=3Dy&#39;] : []) + \<br>
+=C2=A0 =C2=A0 =C2=A0 (&#39;CONFIG_LINUX&#39; in config_host ? [&#39;CONFIG=
_LINUX=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0(have_ivshmem ? [&#39;CONFIG_IVSHMEM=3Dy&#39;] :=
 []) + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build<br>
index 06c75e6..158a3b4 100644<br>
--- a/pc-bios/keymaps/meson.build<br>
+++ b/pc-bios/keymaps/meson.build<br>
@@ -33,7 +33,7 @@ keymaps =3D {<br>
=C2=A0 =C2=A0&#39;tr&#39;: &#39;-l tr&#39;,<br>
=C2=A0}<br>
<br>
-if meson.is_cross_build() or &#39;CONFIG_XKBCOMMON&#39; not in config_host=
<br>
+if meson.is_cross_build() or not xkbcommon.found()<br>
=C2=A0 =C2=A0native_qemu_keymap =3D find_program(&#39;qemu-keymap&#39;, req=
uired: false, disabler: true)<br>
=C2=A0else<br>
=C2=A0 =C2=A0native_qemu_keymap =3D qemu_keymap<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--00000000000047c83c05f40e01b2--


