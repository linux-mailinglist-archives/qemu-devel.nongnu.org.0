Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D2425E4B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:57:30 +0200 (CEST)
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaSH-0007Bc-G6
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaE5-0006HJ-AT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:49 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaE1-0006Xp-Ox
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:49 -0400
Received: by mail-lf1-x12d.google.com with SMTP id j21so12141245lfe.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d00jZrTsVgfiEO8V5WNA/3B70+o4GfZVlLc+D3Tnb4s=;
 b=BMbQcaoczyIA/nDrbDOftChsiOw6HkmJdqfv8FiQaTlVldo7ve4/C7iTykP4BM0ABd
 eau+tFr+iIDc/5wsOPBn68RBu+didaFEpCftqWw7oGCzj2G8KKQgD9sQVq7OVT5tZkGI
 G3ugFZJuve7zSf81siu+2nrtLYJUHsd/dFxn1uLSGQMt4yKeS0nxrXOPqzB2JoiKBAOw
 DjnSYhmrYPMsfC2GBV5CLke66i5tzsZ83RRZFVTBI/+0bc4OA9Bg8mLO8NacjyscWCaZ
 Ew+KGCO5zmMYkMbVcQ27miR2o9V5kuqpd2zN1YsualFDw3LZ3YZjF8lwQBoduw5bnj6c
 +BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d00jZrTsVgfiEO8V5WNA/3B70+o4GfZVlLc+D3Tnb4s=;
 b=Nhoo3io14/Ghja3frHFwayrqDf317zUlpEpXDbixX/wdbZMOZuN54z+xIxOVpNpE8y
 t84xTm3Z5DcizoqfxLwimFdrZ8+evkHdX2hmk67L2S+Xt2Kv6bVZIhkI2182R4XNbt8a
 /oMd1vcIdKgjQcZpB9cyE6Bjq24Uwa4qSOu1/CxZ9ZJnprBYTVICaOVQCDUVykotX/ww
 660I6xGlFIhAUzpMzov5z4a7uA4gNkh2gze8QvACJEhUCK47tLKy6gM3ACleJQk+c+i5
 mWcWZMk34pzGrfO3y67AGM7tvo5q7/bijUebTs03ckcO/Ss4d0ls+mpHZKalnG8Ppt04
 FPIg==
X-Gm-Message-State: AOAM532mXp9PQp/Pz2gwY4Gn4RtZFiec48SeA2MENCgq/M8i/JnTS9DA
 qMV7bgf12c45wIiC1bZC4hbdJiz62xDt5tSSHOI=
X-Google-Smtp-Source: ABdhPJz1rk5LLvBcSIqBALyo2BGqC3Up+945SdijrFv7o8kCs68ouf0AMlanRMFE3Szab2ism810QHTCx/nvB+bJECo=
X-Received: by 2002:a05:651c:a0f:: with SMTP id
 k15mr106734ljq.461.1633639363850; 
 Thu, 07 Oct 2021 13:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-1-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:42:06 +0400
Message-ID: <CAJ+F1CKC8stxVZByde38hq-OLDWTu6FD0T68kzbeibGs5cPP7g@mail.gmail.com>
Subject: Re: [PATCH 06/24] kconfig: split CONFIG_SPARSE_MEM from fuzzing
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f936cd05cdc94d06"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Oleinik <alxndr@bu.edu>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f936cd05cdc94d06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:20 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Pass CONFIG_FUZZ via host_kconfig, and use it to select the
> sparse-mem device.
>
> Cc: Alexander Oleinik <alxndr@bu.edu>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  Kconfig.host       | 4 ++++
>  hw/mem/Kconfig     | 3 +++
>  hw/mem/meson.build | 2 +-
>  meson.build        | 1 +
>  4 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Kconfig.host b/Kconfig.host
> index 24255ef441..60b9c07b5e 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -41,3 +41,7 @@ config PVRDMA
>  config MULTIPROCESS_ALLOWED
>      bool
>      imply MULTIPROCESS
> +
> +config FUZZ
> +    bool
> +    select SPARSE_MEM
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index 8b19fdc49f..03dbb3c7df 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -8,3 +8,6 @@ config MEM_DEVICE
>  config NVDIMM
>      bool
>      select MEM_DEVICE
> +
> +config SPARSE_MEM
> +    bool
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 3c8fdef9f9..82f86d117e 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -6,4 +6,4 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true:
> files('nvdimm.c'))
>
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>
> -softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
> +softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c')=
)
> diff --git a/meson.build b/meson.build
> index 0e9733a833..f03bfff7a1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1602,6 +1602,7 @@ endif
>
>  have_ivshmem =3D config_host_data.get('CONFIG_EVENTFD')
>  host_kconfig =3D \
> +  ('CONFIG_FUZZ' in config_host ? ['CONFIG_FUZZ=3Dy'] : []) + \
>    ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=3Dy'] : []) + \
>    ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=3Dy'] : []) + \
>    (have_ivshmem ? ['CONFIG_IVSHMEM=3Dy'] : []) + \
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f936cd05cdc94d06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:20 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Pass CONFIG_FUZZ via host_kconfig, and use it to select the<br=
>
sparse-mem device.<br>
<br>
Cc: Alexander Oleinik &lt;<a href=3D"mailto:alxndr@bu.edu" target=3D"_blank=
">alxndr@bu.edu</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
---<br>
=C2=A0Kconfig.host=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0hw/mem/Kconfig=C2=A0 =C2=A0 =C2=A0| 3 +++<br>
=C2=A0hw/mem/meson.build | 2 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A04 files changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/Kconfig.host b/Kconfig.host<br>
index 24255ef441..60b9c07b5e 100644<br>
--- a/Kconfig.host<br>
+++ b/Kconfig.host<br>
@@ -41,3 +41,7 @@ config PVRDMA<br>
=C2=A0config MULTIPROCESS_ALLOWED<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0imply MULTIPROCESS<br>
+<br>
+config FUZZ<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select SPARSE_MEM<br>
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig<br>
index 8b19fdc49f..03dbb3c7df 100644<br>
--- a/hw/mem/Kconfig<br>
+++ b/hw/mem/Kconfig<br>
@@ -8,3 +8,6 @@ config MEM_DEVICE<br>
=C2=A0config NVDIMM<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select MEM_DEVICE<br>
+<br>
+config SPARSE_MEM<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/hw/mem/meson.build b/hw/mem/meson.build<br>
index 3c8fdef9f9..82f86d117e 100644<br>
--- a/hw/mem/meson.build<br>
+++ b/hw/mem/meson.build<br>
@@ -6,4 +6,4 @@ mem_ss.add(when: &#39;CONFIG_NVDIMM&#39;, if_true: files(&#=
39;nvdimm.c&#39;))<br>
<br>
=C2=A0softmmu_ss.add_all(when: &#39;CONFIG_MEM_DEVICE&#39;, if_true: mem_ss=
)<br>
<br>
-softmmu_ss.add(when: &#39;CONFIG_FUZZ&#39;, if_true: files(&#39;sparse-mem=
.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_SPARSE_MEM&#39;, if_true: files(&#39;spar=
se-mem.c&#39;))<br>
diff --git a/meson.build b/meson.build<br>
index 0e9733a833..f03bfff7a1 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1602,6 +1602,7 @@ endif<br>
<br>
=C2=A0have_ivshmem =3D config_host_data.get(&#39;CONFIG_EVENTFD&#39;)<br>
=C2=A0host_kconfig =3D \<br>
+=C2=A0 (&#39;CONFIG_FUZZ&#39; in config_host ? [&#39;CONFIG_FUZZ=3Dy&#39;]=
 : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_TPM&#39; in config_host ? [&#39;CONFIG_TPM=3Dy&#3=
9;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_SPICE&#39; in config_host ? [&#39;CONFIG_SPICE=3D=
y&#39;] : []) + \<br>
=C2=A0 =C2=A0(have_ivshmem ? [&#39;CONFIG_IVSHMEM=3Dy&#39;] : []) + \<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000f936cd05cdc94d06--

