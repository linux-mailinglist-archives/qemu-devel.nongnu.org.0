Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3568B5E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 07:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOvQ1-0004Pi-Qh; Mon, 06 Feb 2023 01:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pOvPz-0004PV-SB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:55:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pOvPy-0007UL-1h
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675666555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eea2sRoG64fFnsmckWRvASINPet6xA+UcgPAj2wieIQ=;
 b=AgYygzWEK2xlm6JotzUH3jEQOXAuXxRX8ruMakCFdI+F8dRbXp2ScduGiJ05qsMlEoGHzd
 Z2+6u29U47v7w8WGqL1LeAwwIzAG7PjyMljTva3edRmeivEeZBH5CuhSZmfPDy4wX0ZS+g
 rYG1mcH4uSiIxH+sBIgIT5XNkkCiTw0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-yqckaXZjOcmxQMuXcpF0qg-1; Mon, 06 Feb 2023 01:55:53 -0500
X-MC-Unique: yqckaXZjOcmxQMuXcpF0qg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa8-20020a170906eda800b0087875c99e6bso8045075ejb.22
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 22:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eea2sRoG64fFnsmckWRvASINPet6xA+UcgPAj2wieIQ=;
 b=k7mK3B3o8CEJIC6uMv7d0tZtNmQKFlckCDlRNLh4WPUuBpvT8kdTOtQAmvod+64SSL
 DCbG/pNhJZtSwOUbmqAHH87gnueEKyzGkDpCZYDrLfg6pp7+cduYsVJtHBeiayDFIfEO
 q49kTfgcGEOpDSR0qx2Cat3pVzJVaDMZr1pDCpdxqdA+ldTTkDqnmP2Bnb+M0maGXY9w
 HgVFnJSwUq6bPT9qnYylfIxuFh1M/Ko3B5PXH8pBzdUil7oMuxqbJk3y8r7N62LPhqTA
 SsXtoVbg/xlwdevU4iacmXF7UDUVSo8RgVDLnXeXwzkdN9wS376RJ0nCnB1Bfbxk+B6o
 gWrA==
X-Gm-Message-State: AO0yUKU+Lmv84mwKw98+thMQH+qgVrncPfHA4oH2Ior4zrPLt0qElHMP
 lmvVlJ4PcWLLgrdthK13RvFhrqjLexnBJZD/c6KJSkm/WIWiz4A2IU5RMDqbQnl5Jqr9rt9BT8w
 o2m5ALrGVW+r+ofHG1ltIhDGRtx+Mg7o=
X-Received: by 2002:a17:906:e56:b0:884:3298:12b with SMTP id
 q22-20020a1709060e5600b008843298012bmr5390926eji.125.1675666552428; 
 Sun, 05 Feb 2023 22:55:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8TPMsnAmwdhd8xfVKyTFgcF9QzlOVlunYea3Vt9+9eoV8n5mjCfzxTeBBjiROV/toekTumNSmNIJEX1jvQQo0=
X-Received: by 2002:a17:906:e56:b0:884:3298:12b with SMTP id
 q22-20020a1709060e5600b008843298012bmr5390918eji.125.1675666552218; Sun, 05
 Feb 2023 22:55:52 -0800 (PST)
MIME-Version: 1.0
References: <1674663436-380426-1-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1674663436-380426-1-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Feb 2023 10:55:40 +0400
Message-ID: <CAMxuvayo6rOUUWD5_vbOaOnu+r6p2NUfvRHH1uuYMw9sJYVuww@mail.gmail.com>
Subject: Re: [PATCH V1] meson: fix dependency on qemu-keymap
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009b80fb05f40285b9"
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

--0000000000009b80fb05f40285b9
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, Jan 25, 2023 at 9:28 PM Steve Sistare <steven.sistare@oracle.com>
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
> Fixes: 28742467c9c0.. ("meson: convert pc-bios/keymaps/Makefile")
>

Or rather fixing commit 4113f4cfee ("meson: move xkbcommon to meson").

A lot of CONFIG_ keys were set during configure, loaded in 'config_host'
and now they are set by meson in 'config_host_data'.


> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
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
>      host_kconfig = \
>        (have_tpm ? ['CONFIG_TPM=y'] : []) + \
> -      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
> +      ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
>

ok


>        (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
>        ...
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 06c75e6..a9e5103 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -33,7 +33,7 @@ keymaps = {
>    'tr': '-l tr',
>  }
>
> -if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
> +if meson.is_cross_build() or not config_host_data.get('CONFIG_XKBCOMMON')
>

Can you replace it with not xkbcommon.found() instead?


>    native_qemu_keymap = find_program('qemu-keymap', required: false,
> disabler: true)
>  else
>    native_qemu_keymap = qemu_keymap
> --
> 1.8.3.1
>
>

--0000000000009b80fb05f40285b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 25, 2023 at 9:28 PM Ste=
ve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@=
oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">When qemu-keymap is not available on the host, and enable-xkbcom=
mon<br>
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
Fixes: 28742467c9c0.. (&quot;meson: convert pc-bios/keymaps/Makefile&quot;)=
<br></blockquote><div><br></div><div>Or rather fixing commit 4113f4cfee (&q=
uot;meson: move xkbcommon to meson&quot;).</div><div><br></div><div>A lot o=
f CONFIG_ keys were set during configure, loaded in &#39;config_host&#39; a=
nd now they are set by meson in &#39;config_host_data&#39;.<br></div><div><=
br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
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
_LINUX=3Dy&#39;] : []) + \<br></blockquote><div><br></div><div>ok</div><div=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0(have_ivshmem ? [&#39;CONFIG_IVSHMEM=3Dy&#39;] :=
 []) + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build<br>
index 06c75e6..a9e5103 100644<br>
--- a/pc-bios/keymaps/meson.build<br>
+++ b/pc-bios/keymaps/meson.build<br>
@@ -33,7 +33,7 @@ keymaps =3D {<br>
=C2=A0 =C2=A0&#39;tr&#39;: &#39;-l tr&#39;,<br>
=C2=A0}<br>
<br>
-if meson.is_cross_build() or &#39;CONFIG_XKBCOMMON&#39; not in config_host=
<br>
+if meson.is_cross_build() or not config_host_data.get(&#39;CONFIG_XKBCOMMO=
N&#39;)<br></blockquote><div><br></div><div>Can you replace it with not xkb=
common.found() instead?</div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
=C2=A0 =C2=A0native_qemu_keymap =3D find_program(&#39;qemu-keymap&#39;, req=
uired: false, disabler: true)<br>
=C2=A0else<br>
=C2=A0 =C2=A0native_qemu_keymap =3D qemu_keymap<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--0000000000009b80fb05f40285b9--


