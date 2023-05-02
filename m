Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63A6F4A74
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:40:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvqf-0008SY-2b; Tue, 02 May 2023 15:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ptvqV-0008SE-8X
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ptvqT-0004EM-JK
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683056368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myDctQ8+wci50EjzBi/ifVAvY7J7ATZ7U50MIjie44A=;
 b=copTpFcHaxpRnHvhFf1Z/8IZuUf2ZZn9NtiiEIad/e3hLc6vqAXTI9v1fUqLT0EYHGX/ST
 IOsxVVVQMbWG/eyDHAWk8RHfGKttLOJixaUK5rbDCvVDUwWyXXO4yZuytmRf2OnctiYlr2
 7YZk4heHEg2e4fAOqUKTREQ3v3kFF3M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-9zV9swhuNOqBSCW5x3dxqw-1; Tue, 02 May 2023 15:39:27 -0400
X-MC-Unique: 9zV9swhuNOqBSCW5x3dxqw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94e86d83676so530046466b.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 12:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683056366; x=1685648366;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myDctQ8+wci50EjzBi/ifVAvY7J7ATZ7U50MIjie44A=;
 b=PbWm3+HkE8F7t2xyrGPHLl2sRudHLR0ViUUqaYtpQl79g1w29W+vK5lDe9k5ysO2m/
 ad2aG6gfBALqJ2GIh5E+WUf5uesPKgAx0681s8jcNRbdbSLLdvUsQEWzYSnKetcBLlbU
 VhuabdztVriAT1casXrqvHPd3GkcLzs0MAFJzDXxLSaHOfyl1bfp32sygBn1/LusogBB
 eGZ/pZuMUDRZHHvU4X+qAFXg52xvTKB1b3xc6F/E6tmPyx4Roe4VFUxWxyOYTqmekGFC
 MPhUyRorDDe/z/yFmcmRchUltEX5iMf7InKB+Ho9xDHppuJsGzMX/MqW8fHOYz7gArEs
 /bEQ==
X-Gm-Message-State: AC+VfDwX4BEWQtBRqWKMUyE0Ivc2PWyrC1I+XxcUU6EFuvwUr9q+T99r
 J8TPumAhSZj5q5whr6sLo0+Pk7AHjA1XgwwkKdNPidL7MBB3tYF6Vbdr8M4UkQx+F3/elLNVytp
 2KByLFBCmVxKZvDxRHoIbM3bgEQn23Q8=
X-Received: by 2002:a17:907:9415:b0:960:ddba:e5c5 with SMTP id
 dk21-20020a170907941500b00960ddbae5c5mr881589ejc.11.1683056366122; 
 Tue, 02 May 2023 12:39:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71IrUviabXw3flD2ixYh6aqYIid8Z4+ODuCfEmyHp3EoDH4rdPaEmq8cLr4L0fg+dlZUrcWbPzDWIrrFvbd0g=
X-Received: by 2002:a17:907:9415:b0:960:ddba:e5c5 with SMTP id
 dk21-20020a170907941500b00960ddbae5c5mr881575ejc.11.1683056365839; Tue, 02
 May 2023 12:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230502105721.1661930-1-thuth@redhat.com>
In-Reply-To: <20230502105721.1661930-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 2 May 2023 23:39:14 +0400
Message-ID: <CAMxuvaxKJLvWqjxOtokkTizoaT+F9gT_4jhXtHrj4+g11ZM80Q@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado/virtio-gpu: Fix the URLs of the
 test_virtio_vga_virgl test
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d2c30c05fabb18c0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000d2c30c05fabb18c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 2:57=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrote=
:

> The URLs here are not valid anymore - looks like the assets got moved
> into the pub/archive/ subfolder instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/avocado/virtio-gpu.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/avocado/virtio-gpu.py b/tests/avocado/virtio-gpu.py
> index 2a249a3a2c..e3b58fe799 100644
> --- a/tests/avocado/virtio-gpu.py
> +++ b/tests/avocado/virtio-gpu.py
> @@ -36,13 +36,13 @@ class VirtioGPUx86(QemuSystemTest):
>
>      KERNEL_COMMAND_LINE =3D "printk.time=3D0 console=3DttyS0 rdinit=3D/b=
in/bash"
>      KERNEL_URL =3D (
> -        "https://archives.fedoraproject.org/pub/fedora"
> +        "https://archives.fedoraproject.org/pub/archive/fedora"
>          "/linux/releases/33/Everything/x86_64/os/images"
>          "/pxeboot/vmlinuz"
>      )
>      KERNEL_HASH =3D '1433cfe3f2ffaa44de4ecfb57ec25dc2399cdecf'
>      INITRD_URL =3D (
> -        "https://archives.fedoraproject.org/pub/fedora"
> +        "https://archives.fedoraproject.org/pub/archive/fedora"
>          "/linux/releases/33/Everything/x86_64/os/images"
>          "/pxeboot/initrd.img"
>      )
> --
> 2.31.1
>
>

--000000000000d2c30c05fabb18c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 2, 2023 at 2:57=E2=80=AFP=
M Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The U=
RLs here are not valid anymore - looks like the assets got moved<br>
into the pub/archive/ subfolder instead.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div><d=
iv>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/avocado/virtio-gpu.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/avocado/virtio-gpu.py b/tests/avocado/virtio-gpu.py<br>
index 2a249a3a2c..e3b58fe799 100644<br>
--- a/tests/avocado/virtio-gpu.py<br>
+++ b/tests/avocado/virtio-gpu.py<br>
@@ -36,13 +36,13 @@ class VirtioGPUx86(QemuSystemTest):<br>
<br>
=C2=A0 =C2=A0 =C2=A0KERNEL_COMMAND_LINE =3D &quot;printk.time=3D0 console=
=3DttyS0 rdinit=3D/bin/bash&quot;<br>
=C2=A0 =C2=A0 =C2=A0KERNEL_URL =3D (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://archives.fedoraprojec=
t.org/pub/fedora" rel=3D"noreferrer" target=3D"_blank">https://archives.fed=
oraproject.org/pub/fedora</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://archives.fedoraprojec=
t.org/pub/archive/fedora" rel=3D"noreferrer" target=3D"_blank">https://arch=
ives.fedoraproject.org/pub/archive/fedora</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/linux/releases/33/Everything/x86_6=
4/os/images&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/pxeboot/vmlinuz&quot;<br>
=C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0KERNEL_HASH =3D &#39;1433cfe3f2ffaa44de4ecfb57ec25dc239=
9cdecf&#39;<br>
=C2=A0 =C2=A0 =C2=A0INITRD_URL =3D (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://archives.fedoraprojec=
t.org/pub/fedora" rel=3D"noreferrer" target=3D"_blank">https://archives.fed=
oraproject.org/pub/fedora</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://archives.fedoraprojec=
t.org/pub/archive/fedora" rel=3D"noreferrer" target=3D"_blank">https://arch=
ives.fedoraproject.org/pub/archive/fedora</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/linux/releases/33/Everything/x86_6=
4/os/images&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/pxeboot/initrd.img&quot;<br>
=C2=A0 =C2=A0 =C2=A0)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000d2c30c05fabb18c0--


