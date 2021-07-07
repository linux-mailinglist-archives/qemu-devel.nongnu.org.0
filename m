Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBE3BE6E2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:07:53 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15PE-0007op-CM
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m15ML-00043z-7S
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:04:53 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m15MJ-0003bG-Ad
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:04:52 -0400
Received: by mail-ed1-x52e.google.com with SMTP id v1so2852372edt.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5KGhxAX01eQjneCeghj2EwXAHdYK0UNK+mGZO88tqd4=;
 b=VjQ46jQNp42Db5uJuoUthA3loWUo8STPRc16mMTU8H0tj4bDi3TIuUxq7fFnUtZc2N
 2wueouvZYbOsVTMNMvIG6QGRxG3VlBYeuvyKB2gGOSAYNcX12dSGZo3fnpFDaOB1EoZZ
 PNM/9JH3AC0NeDBft8UgoOEqwq07dJ5qOPxtytDTQoVKXsX1NSEgYERNt+DPxLlq6yjs
 5fgY5FJIE3j5BpToafgVA+GATj2GHvUS0ZMQd37uTfkp1NPbcPSWPFCjAKzzIw2KwS9n
 VOsnv89KKGGGBhdQvrGekxV4cDDjyUzZCEpuRiYzwf5JUumT7TvQJLyynTh48pwq7vZT
 BVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5KGhxAX01eQjneCeghj2EwXAHdYK0UNK+mGZO88tqd4=;
 b=nxaonqv1lRz/OJ4GZ2/T5dgD+e0M52v0J7ZuZaCuHLKmNGmte7YabBgBb4KQuUw8Ic
 TNuQhTOxZtFtlmtpoxdekViTMuT1GFA5O98vBlX7usG4/C7/DtTs1xfe8znCXmTZRsh9
 nCtfZpluiFWREqe7HqPFQ96PzhkdwY6T5kinr/ZHAvTA1xvBeOPUK8+T0AZYn0hS0DCr
 a0fVEDEN91F6FNfa4rkwPWy9zS6/FvhrHWtkygnP2a5A7fqxemb7zhBnnlE0WOufyAKx
 GNF8WG+W28o6aulp4cTmMpOTRpvNqBpSXioMpZTOZv+6SedOlUE3slc9ckpBWli5gnbV
 jciA==
X-Gm-Message-State: AOAM530ydX7B9upYQ0BWopNzbBYPTwd8Ui4AdEVunafgD2ER0GJGPfQB
 jdmxBecapW5NQGj6doOzTRkzinn+YjBzDSXF2iM=
X-Google-Smtp-Source: ABdhPJz/yVK0397WxyPnwBzas6pDnWyHjC756oHY5J2ZrWuL5z/e9YoYXz7UbTW8H12f6vuUAceybnnCaYr6FW81knQ=
X-Received: by 2002:aa7:c808:: with SMTP id a8mr8330943edt.245.1625655889204; 
 Wed, 07 Jul 2021 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210531101928.1662732-1-philmd@redhat.com>
In-Reply-To: <20210531101928.1662732-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 7 Jul 2021 15:04:37 +0400
Message-ID: <CAJ+F1C+1=GoYwQKHbeYYGJcTVLTzM2WMRhyDThfThtsn0QoOgw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/display/virtio-gpu: Fix memory leak (CID 1453811)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Content-Type: multipart/alternative; boundary="000000000000cd9b4905c686816a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cd9b4905c686816a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 31, 2021 at 2:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> To avoid leaking memory on the error path, reorder the
> code as:
> - check the parameters first
> - check resource already existing
> - finally allocate memory
>
> Reported-by: Coverity (CID 1453811: RESOURCE_LEAK)
> Fixes: e0933d91b1c ("virtio-gpu: Add virtio_gpu_resource_create_blob")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> RFC because the s->iov check is dubious.
>

Yes, that looks wrong. Before the patch, the condition is always false /
dead code.

Furthermore, the init_udmabuf seems to really make sense when iov !=3D NULL
and remapping takes place.

Vivek, please review

thanks

---
>  hw/display/virtio-gpu.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 4d549377cbc..8d047007bbb 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -340,8 +340,15 @@ static void virtio_gpu_resource_create_blob(VirtIOGP=
U
> *g,
>          return;
>      }
>
> -    res =3D virtio_gpu_find_resource(g, cblob.resource_id);
> -    if (res) {
> +    if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_GUEST &&
> +        cblob.blob_flags !=3D VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
> +                      __func__);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> +        return;
> +    }
> +
> +    if (virtio_gpu_find_resource(g, cblob.resource_id)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n=
",
>                        __func__, cblob.resource_id);
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> @@ -352,25 +359,12 @@ static void
> virtio_gpu_resource_create_blob(VirtIOGPU *g,
>      res->resource_id =3D cblob.resource_id;
>      res->blob_size =3D cblob.size;
>
> -    if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_GUEST &&
> -        cblob.blob_flags !=3D VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
> -                      __func__);
> -        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> -        g_free(res);
> -        return;
> -    }
> -
> -    if (res->iov) {
> -        cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> -        return;
> -    }
> -
>      ret =3D virtio_gpu_create_mapping_iov(g, cblob.nr_entries,
> sizeof(cblob),
>                                          cmd, &res->addrs, &res->iov,
>                                          &res->iov_cnt);
> -    if (ret !=3D 0) {
> +    if (ret !=3D 0 || res->iov) {
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
> +        g_free(res);
>          return;
>      }
>
> --
> 2.26.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cd9b4905c686816a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 31, 2021 at 2:20 PM Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">To avoid leaking memory on the error path, reorder the<br>
code as:<br>
- check the parameters first<br>
- check resource already existing<br>
- finally allocate memory<br>
<br>
Reported-by: Coverity (CID 1453811: RESOURCE_LEAK)<br>
Fixes: e0933d91b1c (&quot;virtio-gpu: Add virtio_gpu_resource_create_blob&q=
uot;)<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
RFC because the s-&gt;iov check is dubious.<br></blockquote><div><br></div>=
<div>Yes, that looks wrong. Before the patch, the condition is always false=
 / dead code.</div><div><br></div><div>Furthermore, the init_udmabuf seems =
to really make sense when iov !=3D NULL and remapping takes place.<br></div=
><div><br></div><div>Vivek, please review</div><div><br></div><div>thanks<b=
r></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/virtio-gpu.c | 28 +++++++++++-----------------<br>
=C2=A01 file changed, 11 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 4d549377cbc..8d047007bbb 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -340,8 +340,15 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU =
*g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 res =3D virtio_gpu_find_resource(g, cblob.resource_id);<br>
-=C2=A0 =C2=A0 if (res) {<br>
+=C2=A0 =C2=A0 if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_GUEST &amp;&amp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cblob.blob_flags !=3D VIRTIO_GPU_BLOB_FLAG_USE=
_SHAREABLE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: inval=
id memory type\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
PARAMETER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (virtio_gpu_find_resource(g, cblob.resource_id)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
resource already exists %d\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__func__, cblob.resource_id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INV=
ALID_RESOURCE_ID;<br>
@@ -352,25 +359,12 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU=
 *g,<br>
=C2=A0 =C2=A0 =C2=A0res-&gt;resource_id =3D cblob.resource_id;<br>
=C2=A0 =C2=A0 =C2=A0res-&gt;blob_size =3D cblob.size;<br>
<br>
-=C2=A0 =C2=A0 if (cblob.blob_mem !=3D VIRTIO_GPU_BLOB_MEM_GUEST &amp;&amp;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cblob.blob_flags !=3D VIRTIO_GPU_BLOB_FLAG_USE=
_SHAREABLE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: inval=
id memory type\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_=
PARAMETER;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(res);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 if (res-&gt;iov) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0ret =3D virtio_gpu_create_mapping_iov(g, cblob.nr_entri=
es, sizeof(cblob),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cm=
d, &amp;res-&gt;addrs, &amp;res-&gt;iov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;res-&gt;iov_cnt);<br>
-=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 if (ret !=3D 0 || res-&gt;iov) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_UNS=
PEC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(res);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cd9b4905c686816a--

