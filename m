Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E7631B83
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2Fp-0000Dj-So; Mon, 21 Nov 2022 03:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ox2FX-0000Br-GC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:33:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ox2FU-0005J6-M3
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669019631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hc8QnFwUIWUcZxtP4D1fEpjZOESSDbi6OGu4QZV2jss=;
 b=bAsolTN8JwAjxyaFMI1uUWdSJvCzWaq489UlSO8Sp6ugpyLHQocdrQDhQLXSTzriyWX0be
 HHjrg1NbtnguRA6cTg7HK1fJiGhoq02uOCCCquHNjHKrIwbsPu8UxmGdSb4nmN0Lidkzmu
 mGGUmQYzuv9I4vlQGqp6KN0c1vq2J40=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-8m5P0IUHMYuwdu5OkL6TZw-1; Mon, 21 Nov 2022 03:33:49 -0500
X-MC-Unique: 8m5P0IUHMYuwdu5OkL6TZw-1
Received: by mail-il1-f199.google.com with SMTP id
 c4-20020a056e020bc400b0030098df879dso8098268ilu.6
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 00:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hc8QnFwUIWUcZxtP4D1fEpjZOESSDbi6OGu4QZV2jss=;
 b=hn1JY8LOnshYcBuif68t+XiYszNotm92PBqeu6IG5tkvXscQsL5A5o8yZBZ9OEIt9V
 0AH0QGHfQVNqwYflFQ8aIB4MigGCYyveyyhlkhULnztmVdqxeXtXTBmsgNNXZ8/cVVpL
 pBY2IGuOS3lrwAtK1d2GFrV4CnM4R7de8Zi52i8n5dE+u2WU6oLzbCIwd5+5ArrQVTnZ
 FYcrPjc0Q/7fO2ucLHgTC1KMSujRtvns/N4Fo5TyUTcalxgPAYAYqBAl9M9FBzFhXs3E
 UMSuHNUXqZLSBMlr9HGE6cWeCFZd+YV+SOPNx2QcN2UmjQ0UqNol70GgIeXBr2cnqxYZ
 eJ2w==
X-Gm-Message-State: ANoB5pnECQIxvzhW9qNLCFobNmJjL12EC3W7PVIIabftclCII2g+BKOS
 c9Kpy3xypP5HNOlrIc5ztQjtPJYJY/RnwqiLIjXpYeBJDaYJ8oEVuSwp3YHw/D5jWP+oOr+hUv4
 vzRF9XTkqdHPy6h7GnYkgqhMrs37R6mk=
X-Received: by 2002:a02:294f:0:b0:383:1cf7:ee31 with SMTP id
 p76-20020a02294f000000b003831cf7ee31mr223780jap.232.1669019628559; 
 Mon, 21 Nov 2022 00:33:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4bpJ5HRZEfUT6X0edw/KRnSXYVgytDK3XeMEWSX9XBIeRdhcXOSxClHkKDwiAoe8a+8PbsoLt8xZtdpKWNoQ8=
X-Received: by 2002:a02:294f:0:b0:383:1cf7:ee31 with SMTP id
 p76-20020a02294f000000b003831cf7ee31mr223752jap.232.1669019627569; Mon, 21
 Nov 2022 00:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20221120140044.752503-1-kfir@daynix.com>
 <20221120140044.752503-2-kfir@daynix.com>
In-Reply-To: <20221120140044.752503-2-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 21 Nov 2022 10:33:36 +0200
Message-ID: <CAPMcbCoqx8ftro5esmTnWCHFKBOvkEkrax7+QOfB_zeuTiQ6Fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga:/qga-win: adding a empty PCI address creation
 function
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="0000000000000658bc05edf6ea45"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--0000000000000658bc05edf6ea45
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Sun, Nov 20, 2022 at 4:09 PM Kfir Manor <kfir@daynix.com> wrote:

> Refactoring code to avoid duplication of creating an empty PCI address
> code.
>
> Signed-off-by: Kfir Manor <kfir@daynix.com>
> ---
>  qga/commands-win32.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index ec9f55b453..a645480496 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -599,6 +599,18 @@ static void
> get_pci_address_for_device(GuestPCIAddress *pci,
>      }
>  }
>
> +static GuestPCIAddress *get_empty_pci_address(void)
> +{
> +    GuestPCIAddress *pci = NULL;
> +
> +    pci = g_malloc0(sizeof(*pci));
> +    pci->domain = -1;
> +    pci->slot = -1;
> +    pci->function = -1;
> +    pci->bus = -1;
> +    return pci;
> +}
> +
>  static GuestPCIAddress *get_pci_info(int number, Error **errp)
>  {
>      HDEVINFO dev_info = INVALID_HANDLE_VALUE;
> @@ -608,13 +620,7 @@ static GuestPCIAddress *get_pci_info(int number,
> Error **errp)
>      SP_DEVICE_INTERFACE_DATA dev_iface_data;
>      HANDLE dev_file;
>      int i;
> -    GuestPCIAddress *pci = NULL;
> -
> -    pci = g_malloc0(sizeof(*pci));
> -    pci->domain = -1;
> -    pci->slot = -1;
> -    pci->function = -1;
> -    pci->bus = -1;
> +    GuestPCIAddress *pci = get_empty_pci_address();
>
>      dev_info = SetupDiGetClassDevs(&GUID_DEVINTERFACE_DISK, 0, 0,
>                                     DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
> --
> 2.38.1
>
>

--0000000000000658bc05edf6ea45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 2=
0, 2022 at 4:09 PM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@d=
aynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Refactoring code to avoid duplication of creating an empty PCI a=
ddress code.<br>
<br>
Signed-off-by: Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com" target=3D"=
_blank">kfir@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 20 +++++++++++++-------<br>
=C2=A01 file changed, 13 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index ec9f55b453..a645480496 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -599,6 +599,18 @@ static void get_pci_address_for_device(GuestPCIAddress=
 *pci,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static GuestPCIAddress *get_empty_pci_address(void)<br>
+{<br>
+=C2=A0 =C2=A0 GuestPCIAddress *pci =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 pci =3D g_malloc0(sizeof(*pci));<br>
+=C2=A0 =C2=A0 pci-&gt;domain =3D -1;<br>
+=C2=A0 =C2=A0 pci-&gt;slot =3D -1;<br>
+=C2=A0 =C2=A0 pci-&gt;function =3D -1;<br>
+=C2=A0 =C2=A0 pci-&gt;bus =3D -1;<br>
+=C2=A0 =C2=A0 return pci;<br>
+}<br>
+<br>
=C2=A0static GuestPCIAddress *get_pci_info(int number, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;<br>
@@ -608,13 +620,7 @@ static GuestPCIAddress *get_pci_info(int number, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0SP_DEVICE_INTERFACE_DATA dev_iface_data;<br>
=C2=A0 =C2=A0 =C2=A0HANDLE dev_file;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 GuestPCIAddress *pci =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 pci =3D g_malloc0(sizeof(*pci));<br>
-=C2=A0 =C2=A0 pci-&gt;domain =3D -1;<br>
-=C2=A0 =C2=A0 pci-&gt;slot =3D -1;<br>
-=C2=A0 =C2=A0 pci-&gt;function =3D -1;<br>
-=C2=A0 =C2=A0 pci-&gt;bus =3D -1;<br>
+=C2=A0 =C2=A0 GuestPCIAddress *pci =3D get_empty_pci_address();<br>
<br>
=C2=A0 =C2=A0 =C2=A0dev_info =3D SetupDiGetClassDevs(&amp;GUID_DEVINTERFACE=
_DISK, 0, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIGCF_PRESENT | DIGCF_=
DEVICEINTERFACE);<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--0000000000000658bc05edf6ea45--


