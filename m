Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8D678889
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:43:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK3e5-0005aG-3c; Mon, 23 Jan 2023 15:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pK3e2-0005Yk-Kf
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:42:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pK3e0-00035n-QU
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674506539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3rcCjNBQHx6TpgKBoWs+Tp4Qt4tkC7LQabfhhJkbn8=;
 b=OKhmzzeZrf4gsU7a4YWIAk918o/RlHM/lHEgYM7lsYk6GhiLJ921egGwk+xcSpKdu+cH16
 y2nTF0jDfi0hNkvvr5+ETofl6Q2pBMTwORLw6GRODS71SGeznJ66OI+nIgnsjXsIJIkz17
 8qDqcLxHiceUHAX0qV7mco/ZWm1e94Q=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-L3sQ0J14NUyiBGOnlC1KZA-1; Mon, 23 Jan 2023 15:42:17 -0500
X-MC-Unique: L3sQ0J14NUyiBGOnlC1KZA-1
Received: by mail-vk1-f198.google.com with SMTP id
 b77-20020a1f1b50000000b003bbf35b919bso5285167vkb.11
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 12:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j3rcCjNBQHx6TpgKBoWs+Tp4Qt4tkC7LQabfhhJkbn8=;
 b=ouAuecRKsiqr48rrAXHXdHgTu58NRKYG3CClIM9rMM617M6JO3p04C4PngSxBY4MoF
 kQriiTee7808WYWdlpdYkEJaqC4awVkChPTS2T4u3Wm2+C2JT2/R7KWv29heEhdJEovp
 4Xjs9n/8vA+vsGb28TCEBGOg3zHPG16jo6wF1kap9L3DtgzGHbOHAgC5fp14Y1xFXr/D
 iefarlU0xjuHcBrE00Cc5+ygKHHgXtSt0jnexjDTBZI9UXTLHrQ8XwvdYWGSXyIdtIW1
 9Fz83CNJmZcTqs9QVkgU3jjNheNK/hbb2oz/kWOqNY6PrvrwYcUNocuhq40EXU+n4f6q
 hE+g==
X-Gm-Message-State: AFqh2kq238Vqt5UBmFCO55Q5XHbIncIGly+qO4zxaNQACqJv5j7eNYhY
 WbR8jG2PTjUVNHFBzV8QkbMJownC7y6ZOKZfIeQDUdg0ykAf58EgzcprWQ96M0uTs4OV1UHv5XL
 63zjuyM+XEePftkw5pOICmKw3qyKuMyo=
X-Received: by 2002:a9f:310a:0:b0:5d0:2417:bf60 with SMTP id
 m10-20020a9f310a000000b005d02417bf60mr3010201uab.27.1674506537449; 
 Mon, 23 Jan 2023 12:42:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcolioDZ+2rOVIyQc8T8OIndFAJcrm8wP3T4osLpmXCTb6zw+jNNHL8+UAJ6xAcwdv5ufBZdJC2aMbaziEESE=
X-Received: by 2002:a9f:310a:0:b0:5d0:2417:bf60 with SMTP id
 m10-20020a9f310a000000b005d02417bf60mr3010195uab.27.1674506537242; Mon, 23
 Jan 2023 12:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20230123133049.1053505-1-kfir@daynix.com>
In-Reply-To: <20230123133049.1053505-1-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 23 Jan 2023 22:42:06 +0200
Message-ID: <CAPMcbCosAhA5=rOgaMbkK9zAMuWQFXhb3_vVWy_WNPZ7s=Pqew@mail.gmail.com>
Subject: Re: [PATCH v2] qga/linux: add usb support to guest-get-fsinfo
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="00000000000053b10705f2f46ffb"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--00000000000053b10705f2f46ffb
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Mon, Jan 23, 2023 at 3:31 PM Kfir Manor <kfir@daynix.com> wrote:

> Signed-off-by: Kfir Manor <kfir@daynix.com>
> ---
>  qga/commands-posix.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index ebd33a643c..aab9d3bd50 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -880,7 +880,9 @@ static bool build_guest_fsinfo_for_pci_dev(char const
> *syspath,
>                         g_str_equal(driver, "sym53c8xx") ||
>                         g_str_equal(driver, "virtio-pci") ||
>                         g_str_equal(driver, "ahci") ||
> -                       g_str_equal(driver, "nvme"))) {
> +                       g_str_equal(driver, "nvme") ||
> +                       g_str_equal(driver, "xhci_hcd") ||
> +                       g_str_equal(driver, "ehci-pci"))) {
>              break;
>          }
>
> @@ -977,6 +979,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const
> *syspath,
>          }
>      } else if (strcmp(driver, "nvme") == 0) {
>          disk->bus_type = GUEST_DISK_BUS_TYPE_NVME;
> +    } else if (strcmp(driver, "ehci-pci") == 0 || strcmp(driver,
> "xhci_hcd") == 0) {
> +        disk->bus_type = GUEST_DISK_BUS_TYPE_USB;
>      } else {
>          g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath);
>          goto cleanup;
> --
> 2.38.1
>
>

--00000000000053b10705f2f46ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 2=
3, 2023 at 3:31 PM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@d=
aynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com"=
 target=3D"_blank">kfir@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index ebd33a643c..aab9d3bd50 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -880,7 +880,9 @@ static bool build_guest_fsinfo_for_pci_dev(char const *=
syspath,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_str_equal(driver, &quot;sym53c8xx&quot;) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_str_equal(driver, &quot;virtio-pci&quot;) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_str_equal(driver, &quot;ahci&quot;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;nvme&quot;))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;nvme&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;xhci_hcd&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;ehci-pci&quot;))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -977,6 +979,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *=
syspath,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (strcmp(driver, &quot;nvme&quot;) =3D=3D 0) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE=
_NVME;<br>
+=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;ehci-pci&quot;) =3D=3D 0 || =
strcmp(driver, &quot;xhci_hcd&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_USB;=
<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;unknown driver &#39;%s&#39;=
 (sysfs path &#39;%s&#39;)&quot;, driver, syspath);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--00000000000053b10705f2f46ffb--


