Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E116A8297
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:48:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi9I-0004LH-3J; Thu, 02 Mar 2023 07:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pXi69-0000t4-T3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pXi67-00039m-Vo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/RSO3KXvINmbkEp1hofkT3caPMLhIGX0kzKQM94TINA=;
 b=itrEUH9scNIaYYcXTcU5bRIFMDDiFZeUW67Jw1S2ifwbH5tJvB8vPvg/PkaMk0et2U7ZFa
 4Dkn/j1BYIZ/kzblCEoxKPSDOQKe9kacr87ahd70q/h4bMc3Eo7cSZ/AvztGQAieHfllBk
 3ojtc/eZyOVBc+FTj0svqlG4CWgLrUQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-21QFO8RiNrSdXZyM_NA9vQ-1; Thu, 02 Mar 2023 07:31:46 -0500
X-MC-Unique: 21QFO8RiNrSdXZyM_NA9vQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 l10-20020a17090270ca00b0019caa6e6bd1so8557394plt.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/RSO3KXvINmbkEp1hofkT3caPMLhIGX0kzKQM94TINA=;
 b=4yr5NcEKPFz2CvvBU2fNwyLNaADebA4bglB7ZcLT5GzY1KQ1viKUMgzN3B/0h+Pc9p
 WSaP2X8+N3rO5FTqXrL2gxu0xCFRIV//h60dCfrxwVpNGh1AbGiF1CoFPAkDF1n0uz9b
 ILu3U3Laze6JNdO8BmNcOJShy4QrVYJZLkIeS7TcHgfDD1/HoBZ+vTLpDdQbkmVRN+Bo
 3lu5x4k9ojqkSMTY49OWiqS7Sqnkcn82z+dkatVlWmky0UKJeCIJolNznIfBWReH3dTi
 IctZ98FeBNS96tsIB8IGdiQmnK6zafSvwNVSvS1HeaJdJ+S+QCVNow3GH8MbZUdQyRg9
 8HnA==
X-Gm-Message-State: AO0yUKWrfPtaH08Yay1nuzf8gsAAvWnI96xRKJR+nSaHAcNQSr9OEr31
 ckMossAl00bBkSxNQY/ObcMVzSk/upHMqZe0ygz+9yRe4Baj2z8tLHSh/PG4A0HOrmnQfFGj07W
 0mTCCU2L8Y4w0aRYCIzXpGHW7fPEvNQ2JuFzuhWc=
X-Received: by 2002:a63:8c14:0:b0:4f1:cd3a:3e83 with SMTP id
 m20-20020a638c14000000b004f1cd3a3e83mr724340pgd.3.1677760304928; 
 Thu, 02 Mar 2023 04:31:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8gQB78Cp5+Fik5zbyn5ZBDdQ44NmGcpVAyiKftbPVfltEKrp6zkvCUwULL1ysXOHocx1IGzi3+aqUlCffIwrs=
X-Received: by 2002:a63:8c14:0:b0:4f1:cd3a:3e83 with SMTP id
 m20-20020a638c14000000b004f1cd3a3e83mr724332pgd.3.1677760304613; Thu, 02 Mar
 2023 04:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20230302121719.9390-1-aesteve@redhat.com>
In-Reply-To: <20230302121719.9390-1-aesteve@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 2 Mar 2023 13:31:33 +0100
Message-ID: <CADSE00KE_QAJVTAp2g1C7_Xuyh6e8C5NMU2rwLjD4K3NX8_7fg@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio/vhost-user: avoid using unitialized errp
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f9a69405f5ea028f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
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

--000000000000f9a69405f5ea028f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I found the issue by chance, while working in not-yet-upstreamed virtio
code. I am not sure if there is any QEMU stub currently
upstreamed that does not support an F_CONFIG backend, to be able to trigger
the error. It may as well be that this branch
of the condition is never executed.

Nonetheless, the segfault can be triggered using the
tests/qtest/vhost-user-test, e.g., with the virtio-gpio device.
We can force the QEMU side to go into the else part of
the supports_f_config by applying this patch:
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index fe3da32c74..23634e74ce 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -226,8 +226,8 @@ static int vu_gpio_connect(DeviceState *dev, Error
**errp)
     }
     gpio->connected =3D true;

-    vhost_dev_set_config_notifier(vhost_dev, &gpio_ops);
-    gpio->vhost_user.supports_config =3D true;
+    //vhost_dev_set_config_notifier(vhost_dev, &gpio_ops);
+    gpio->vhost_user.supports_config =3D false;

     ret =3D vhost_dev_init(vhost_dev, &gpio->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);

Without the patch the test would cause the segfault. Otherwise, it prints
the warning and fails afterwards.

I couldn't find a good way to properly cover this in a test, but I can try,
and add it to this patch if anyone has a suggestion.

BR,
Albert Esteve

On Thu, Mar 2, 2023 at 1:17=E2=80=AFPM Albert Esteve <aesteve@redhat.com> w=
rote:

> During protocol negotiation, when we the QEMU
> stub does not support a backend with F_CONFIG,
> it throws a warning and supresses the
> VHOST_USER_PROTOCOL_F_CONFIG bit.
>
> However, the warning uses warn_reportf_err macro
> and passes an unitialized errp pointer. However,
> the macro tries to edit the 'msg' member of the
> unitialized Error and segfaults.
>
> Instead, just use warn_report, which prints a
> warning message directly to the output.
>
> Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when
> supported")
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e68daa35d4..34c331b3ba 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2031,8 +2031,8 @@ static int vhost_user_backend_init(struct vhost_dev
> *dev, void *opaque,
>          } else {
>              if (virtio_has_feature(protocol_features,
>                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                warn_reportf_err(*errp, "vhost-user backend supports "
> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU
> does not.");
> +                warn_report("vhost-user backend supports "
> +                            "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does
> not.");
>                  protocol_features &=3D ~(1ULL <<
> VHOST_USER_PROTOCOL_F_CONFIG);
>              }
>          }
> --
> 2.39.1
>
>

--000000000000f9a69405f5ea028f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I found the issue by chance, while =
working in not-yet-upstreamed virtio code. I am not sure if there is any QE=
MU stub currently</div><div>upstreamed that does not support an F_CONFIG ba=
ckend, to be able to trigger the error. It may as well be that this branch<=
/div><div>of the condition is never executed.</div><div><br></div><div>None=
theless, the segfault can be triggered using the tests/qtest/vhost-user-tes=
t, e.g., with the virtio-gpio device.=C2=A0</div><div>We can force the QEMU=
 side to go into the else part of the=C2=A0supports_f_config by applying th=
is patch:</div><div>diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vh=
ost-user-gpio.c<br>index fe3da32c74..23634e74ce 100644<br>--- a/hw/virtio/v=
host-user-gpio.c<br>+++ b/hw/virtio/vhost-user-gpio.c<br>@@ -226,8 +226,8 @=
@ static int vu_gpio_connect(DeviceState *dev, Error **errp)<br>=C2=A0 =C2=
=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0gpio-&gt;connected =3D true;<br>=C2=A0<b=
r>- =C2=A0 =C2=A0vhost_dev_set_config_notifier(vhost_dev, &amp;gpio_ops);<b=
r>- =C2=A0 =C2=A0gpio-&gt;vhost_user.supports_config =3D true;<br>+ =C2=A0 =
=C2=A0//vhost_dev_set_config_notifier(vhost_dev, &amp;gpio_ops);<br>+ =C2=
=A0 =C2=A0gpio-&gt;vhost_user.supports_config =3D false;<br>=C2=A0<br>=C2=
=A0 =C2=A0 =C2=A0ret =3D vhost_dev_init(vhost_dev, &amp;gpio-&gt;vhost_user=
,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 VHOST_BACKEND_TYPE_USER, 0, errp);<br></div><div><br><=
/div><div>Without the patch the test would cause the segfault. Otherwise, i=
t prints the warning and fails afterwards.</div><div><br></div><div>I could=
n&#39;t find a good way to properly cover this in a test, but I can try, an=
d add it to this patch if anyone has a suggestion.</div><div><br></div><div=
>BR,</div><div>Albert Esteve</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 2, 2023 at 1:17=E2=80=AFPM Al=
bert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dur=
ing protocol negotiation, when we the QEMU<br>
stub does not support a backend with F_CONFIG,<br>
it throws a warning and supresses the<br>
VHOST_USER_PROTOCOL_F_CONFIG bit.<br>
<br>
However, the warning uses warn_reportf_err macro<br>
and passes an unitialized errp pointer. However,<br>
the macro tries to edit the &#39;msg&#39; member of the<br>
unitialized Error and segfaults.<br>
<br>
Instead, just use warn_report, which prints a<br>
warning message directly to the output.<br>
<br>
Fixes: 5653493 (&quot;hw/virtio/vhost-user: don&#39;t suppress F_CONFIG whe=
n supported&quot;)<br>
Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" targ=
et=3D"_blank">aesteve@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/virtio/vhost-user.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c<br>
index e68daa35d4..34c331b3ba 100644<br>
--- a/hw/virtio/vhost-user.c<br>
+++ b/hw/virtio/vhost-user.c<br>
@@ -2031,8 +2031,8 @@ static int vhost_user_backend_init(struct vhost_dev *=
dev, void *opaque,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (virtio_has_feature(prot=
ocol_features,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VHOST_USER_PROTOCOL_F_=
CONFIG)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_reportf_err(*=
errp, &quot;vhost-user backend supports &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;VHOST_USER_PROTOCOL_F_CO=
NFIG but QEMU does not.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;=
vhost-user backend supports &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;VHOST_USER_PROTOCOL_F_CONFIG but QEMU does n=
ot.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0protocol_feat=
ures &amp;=3D ~(1ULL &lt;&lt; VHOST_USER_PROTOCOL_F_CONFIG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.39.1<br>
<br>
</blockquote></div>

--000000000000f9a69405f5ea028f--


