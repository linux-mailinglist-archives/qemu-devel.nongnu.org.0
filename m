Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787646541D1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 14:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8LWN-00039e-C7; Thu, 22 Dec 2022 08:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minglei.liu@smartx.com>)
 id 1p8LW9-00038j-PX
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 08:21:50 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minglei.liu@smartx.com>)
 id 1p8LW6-00026c-PD
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 08:21:49 -0500
Received: by mail-ed1-x533.google.com with SMTP id s5so2856088edc.12
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wPFhIVSlonoYFbU9g6wy4OEsXEW9yD92wDaaS9qjvSc=;
 b=euq7Ox0YInL4NjofhmCqHb49gXmTUJSzmWi2V3rHybgeSojpb+UCwgtoKgRaipjx5Z
 MB93a+Qjc1wWdniqapl+3BGjRQQVeBtyqsfG/rJWl7zxYZAQp9WZBli/l4yMtmVoL5id
 Y4D6KNJIZRJNV22Sz02Qt2qPE2EZE2p5/jazsbkX4FlVADCpVuaakLrNg04k/c2+3hdl
 4d1W0kROyesgeXh3b2BRAS98njKerI1cbSxhl55cC7Ms5KoQGEmwHjyPDuXHaMIQjk1B
 sLMrQo22+PQ1bCdSlMoc6TB9clamSvOgkTbOWMGyvbfSu2sBrZNrslcDy6D9UvJcF2Df
 +Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPFhIVSlonoYFbU9g6wy4OEsXEW9yD92wDaaS9qjvSc=;
 b=q2tbqbnEoKSR6Sr1ScBdldZgBRwCUPgZdeva6VN2Dd0mQU0r7VJmK7dPwry3RdSwft
 QJydHQVJNiZtY7PAK33Yv9+hChAJ/H+MLQ0ARGuvg0YExq815yREqDlg0QQflcIdhwGR
 8la93kctZL/b9+NJAoYllSaR11a1Sso/hkwWA/A6w+hQcY2IuvfBhzey4jdJAiFRsIdE
 oxyd0KZn9iTKsgMIHuFq22Q6uGXIRChptxRjb7A4YhKd62o8V/thmlJcvMTP89zv2YlH
 bop1ikjgJUQ9A6aqebak41VVczo2iMdHHThT7s59gTxlBtsJoOgE9It3GXz5aptuXiz5
 9MZw==
X-Gm-Message-State: AFqh2krOkrmeu6RYYRu25kTkjwqiidt+yMVph4RCloK+WCULE8JB+smf
 bSbznO3XepgZY67ijQUes1kW3OSG7ZAOJHwXhRbgpACxbVmKk7FzD64hCA==
X-Google-Smtp-Source: AMrXdXtWFzeGpRBduJd7C/tdiLLa5PtYTg9e3VyKPgyLUHB8Rs4mHcjcgCpmnklogZAxhj9sn2IQ45Ee8DFLVeT8Sq4=
X-Received: by 2002:a05:6402:5002:b0:46b:51e5:832a with SMTP id
 p2-20020a056402500200b0046b51e5832amr733003eda.331.1671715296285; Thu, 22 Dec
 2022 05:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20221109115619.696826-1-minglei.liu@smartx.com>
In-Reply-To: <20221109115619.696826-1-minglei.liu@smartx.com>
From: Minglei Liu <minglei.liu@smartx.com>
Date: Thu, 22 Dec 2022 21:21:25 +0800
Message-ID: <CAP-5UDvpgzQ32fdvTk5t95L+KZh84DonUeRygbAobmjUh8JwVg@mail.gmail.com>
Subject: Re: [PATCH] usbredir: Do not detach usb if backend chardev disconnect
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com
Content-Type: multipart/alternative; boundary="00000000000066ae8d05f06a8cb3"
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=minglei.liu@smartx.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000066ae8d05f06a8cb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping !
please review this patch : [PATCH] usbredir: Do not detach usb if backend
chardev disconnect - minglei.liu (kernel.org)
<https://lore.kernel.org/qemu-devel/20221109115619.696826-1-minglei.liu@sma=
rtx.com/>

minglei.liu <minglei.liu@smartx.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=889=E6=
=97=A5=E5=91=A8=E4=B8=89 19:56=E5=86=99=E9=81=93=EF=BC=9A

> If the network between qemu and usbredirserver is temporarily disconnecte=
d,
> the USB device in the VM will be unplugged. If the reconnect parameter is
> configured for the backend chardev, the device will be reconnected later.
> But from the inside of the VM, this USB device has experienced unplug and
> re-plug, if the USB storage device has been mounted in the VM before,
> the drive letter will change after the device is re-plugged.
>
> So in this case, we no longer unplug the device, and operations to the US=
B
> is returned immediately at this point.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1305
> Signed-off-by: minglei.liu <minglei.liu@smartx.com>
> ---
>  hw/usb/redirect.c | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 1bd30efc3e..73731bcab5 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -379,6 +379,11 @@ static void usbredir_cancel_packet(USBDevice *udev,
> USBPacket *p)
>      USBRedirDevice *dev =3D USB_REDIRECT(udev);
>      int i =3D USBEP2I(p->ep);
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return;
> +    }
> +
>      if (p->combined) {
>          usb_combined_packet_cancel(udev, p);
>          return;
> @@ -519,6 +524,11 @@ static void usbredir_handle_reset(USBDevice *udev)
>  {
>      USBRedirDevice *dev =3D USB_REDIRECT(udev);
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return;
> +    }
> +
>      DPRINTF("reset device\n");
>      usbredirparser_send_reset(dev->parser);
>      usbredirparser_do_write(dev->parser);
> @@ -959,6 +969,11 @@ static void usbredir_handle_data(USBDevice *udev,
> USBPacket *p)
>      USBRedirDevice *dev =3D USB_REDIRECT(udev);
>      uint8_t ep;
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return;
> +    }
> +
>      ep =3D p->ep->nr;
>      if (p->pid =3D=3D USB_TOKEN_IN) {
>          ep |=3D USB_DIR_IN;
> @@ -1027,6 +1042,11 @@ static void usbredir_ep_stopped(USBDevice *udev,
> USBEndpoint *uep)
>  {
>      USBRedirDevice *dev =3D USB_REDIRECT(udev);
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return;
> +    }
> +
>      usbredir_stop_ep(dev, USBEP2I(uep));
>      usbredirparser_do_write(dev->parser);
>  }
> @@ -1098,6 +1118,11 @@ static void usbredir_handle_control(USBDevice
> *udev, USBPacket *p,
>      USBRedirDevice *dev =3D USB_REDIRECT(udev);
>      struct usb_redir_control_packet_header control_packet;
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return;
> +    }
> +
>      if (usbredir_already_in_flight(dev, p->id)) {
>          p->status =3D USB_RET_ASYNC;
>          return;
> @@ -1155,6 +1180,11 @@ static int usbredir_alloc_streams(USBDevice *udev,
> USBEndpoint **eps,
>      struct usb_redir_alloc_bulk_streams_header alloc_streams;
>      int i;
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return -1;
> +    }
> +
>      if (!usbredirparser_peer_has_cap(dev->parser,
>                                       usb_redir_cap_bulk_streams)) {
>          ERROR("peer does not support streams\n");
> @@ -1193,6 +1223,11 @@ static void usbredir_free_streams(USBDevice *udev,
> USBEndpoint **eps,
>      struct usb_redir_free_bulk_streams_header free_streams;
>      int i;
>
> +    if(!dev->parser) {
> +        ERROR("usbredir parser is not available, need reconnect.\n");
> +        return;
> +    }
> +
>      if (!usbredirparser_peer_has_cap(dev->parser,
>                                       usb_redir_cap_bulk_streams)) {
>          return;
> @@ -1219,8 +1254,6 @@ static void usbredir_chardev_close_bh(void *opaque)
>      USBRedirDevice *dev =3D opaque;
>
>      qemu_bh_cancel(dev->device_reject_bh);
> -    usbredir_device_disconnect(dev);
> -
>      if (dev->parser) {
>          DPRINTF("destroying usbredirparser\n");
>          usbredirparser_destroy(dev->parser);
> --
> 2.27.0
>
>

--=20
=E5=88=98=E6=98=8E=E7=A3=8A Smartx =E8=BD=AF=E4=BB=B6=E5=B7=A5=E7=A8=8B=E5=
=B8=88

--00000000000066ae8d05f06a8cb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping !<div>please review this patch :=C2=A0<a href=3D"http=
s://lore.kernel.org/qemu-devel/20221109115619.696826-1-minglei.liu@smartx.c=
om/">[PATCH] usbredir: Do not detach usb if backend chardev disconnect - mi=
nglei.liu (kernel.org)</a></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">minglei.liu &lt;<a href=3D"mailto:minglei.l=
iu@smartx.com">minglei.liu@smartx.com</a>&gt; =E4=BA=8E2022=E5=B9=B411=E6=
=9C=889=E6=97=A5=E5=91=A8=E4=B8=89 19:56=E5=86=99=E9=81=93=EF=BC=9A<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">If the network between =
qemu and usbredirserver is temporarily disconnected,<br>
the USB device in the VM will be unplugged. If the reconnect parameter is<b=
r>
configured for the backend chardev, the device will be reconnected later.<b=
r>
But from the inside of the VM, this USB device has experienced unplug and<b=
r>
re-plug, if the USB storage device has been mounted in the VM before,<br>
the drive letter will change after the device is re-plugged.<br>
<br>
So in this case, we no longer unplug the device, and operations to the USB<=
br>
is returned immediately at this point.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1305" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/1305</a><br>
Signed-off-by: minglei.liu &lt;<a href=3D"mailto:minglei.liu@smartx.com" ta=
rget=3D"_blank">minglei.liu@smartx.com</a>&gt;<br>
---<br>
=C2=A0hw/usb/redirect.c | 37 +++++++++++++++++++++++++++++++++++--<br>
=C2=A01 file changed, 35 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c<br>
index 1bd30efc3e..73731bcab5 100644<br>
--- a/hw/usb/redirect.c<br>
+++ b/hw/usb/redirect.c<br>
@@ -379,6 +379,11 @@ static void usbredir_cancel_packet(USBDevice *udev, US=
BPacket *p)<br>
=C2=A0 =C2=A0 =C2=A0USBRedirDevice *dev =3D USB_REDIRECT(udev);<br>
=C2=A0 =C2=A0 =C2=A0int i =3D USBEP2I(p-&gt;ep);<br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (p-&gt;combined) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_combined_packet_cancel(udev, p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -519,6 +524,11 @@ static void usbredir_handle_reset(USBDevice *udev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0USBRedirDevice *dev =3D USB_REDIRECT(udev);<br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;reset device\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0usbredirparser_send_reset(dev-&gt;parser);<br>
=C2=A0 =C2=A0 =C2=A0usbredirparser_do_write(dev-&gt;parser);<br>
@@ -959,6 +969,11 @@ static void usbredir_handle_data(USBDevice *udev, USBP=
acket *p)<br>
=C2=A0 =C2=A0 =C2=A0USBRedirDevice *dev =3D USB_REDIRECT(udev);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t ep;<br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ep =3D p-&gt;ep-&gt;nr;<br>
=C2=A0 =C2=A0 =C2=A0if (p-&gt;pid =3D=3D USB_TOKEN_IN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ep |=3D USB_DIR_IN;<br>
@@ -1027,6 +1042,11 @@ static void usbredir_ep_stopped(USBDevice *udev, USB=
Endpoint *uep)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0USBRedirDevice *dev =3D USB_REDIRECT(udev);<br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0usbredir_stop_ep(dev, USBEP2I(uep));<br>
=C2=A0 =C2=A0 =C2=A0usbredirparser_do_write(dev-&gt;parser);<br>
=C2=A0}<br>
@@ -1098,6 +1118,11 @@ static void usbredir_handle_control(USBDevice *udev,=
 USBPacket *p,<br>
=C2=A0 =C2=A0 =C2=A0USBRedirDevice *dev =3D USB_REDIRECT(udev);<br>
=C2=A0 =C2=A0 =C2=A0struct usb_redir_control_packet_header control_packet;<=
br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (usbredir_already_in_flight(dev, p-&gt;id)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;status =3D USB_RET_ASYNC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -1155,6 +1180,11 @@ static int usbredir_alloc_streams(USBDevice *udev, U=
SBEndpoint **eps,<br>
=C2=A0 =C2=A0 =C2=A0struct usb_redir_alloc_bulk_streams_header alloc_stream=
s;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (!usbredirparser_peer_has_cap(dev-&gt;parser,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_redir_cap_b=
ulk_streams)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR(&quot;peer does not support streams=
\n&quot;);<br>
@@ -1193,6 +1223,11 @@ static void usbredir_free_streams(USBDevice *udev, U=
SBEndpoint **eps,<br>
=C2=A0 =C2=A0 =C2=A0struct usb_redir_free_bulk_streams_header free_streams;=
<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
+=C2=A0 =C2=A0 if(!dev-&gt;parser) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&quot;usbredir parser is not available, =
need reconnect.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (!usbredirparser_peer_has_cap(dev-&gt;parser,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_redir_cap_b=
ulk_streams)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -1219,8 +1254,6 @@ static void usbredir_chardev_close_bh(void *opaque)<b=
r>
=C2=A0 =C2=A0 =C2=A0USBRedirDevice *dev =3D opaque;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_bh_cancel(dev-&gt;device_reject_bh);<br>
-=C2=A0 =C2=A0 usbredir_device_disconnect(dev);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if (dev-&gt;parser) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTF(&quot;destroying usbredirparser\n=
&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usbredirparser_destroy(dev-&gt;parser);<b=
r>
-- <br>
2.27.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><font size=3D"4" style=3D"font-family:&quot;comic sans =
ms&quot;,sans-serif">=E5=88=98=E6=98=8E=E7=A3=8A</font><span style=3D"font-=
family:&quot;comic sans ms&quot;,sans-serif"> Smartx =E8=BD=AF=E4=BB=B6=E5=
=B7=A5=E7=A8=8B=E5=B8=88</span></div></div></div></div></div>

--00000000000066ae8d05f06a8cb3--

