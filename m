Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C746631B82
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:34:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2Fs-0000NK-5p; Mon, 21 Nov 2022 03:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ox2Fg-0000HC-Ny
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ox2Ff-0005Jk-As
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669019642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXG8WO6RHBUwYBJ7rpR5fK1omKk45BZtqRKioqxBxPU=;
 b=WAus3hLrr3oVObVfHydTKEbjPHE52S/L0Ylqsfx8YKFWktLwHIN2JpckYPF6dpAxFAy818
 ngPpEESElySWUnNOAUrWbsM5GL9RNCNN78YE2MevasNLGw6xqLEa3AmDxR3gi1QzSa7cUX
 laf43yyF+D/yLbhTajBAEPH3nge1emA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-qK6xpqAmObuHjqI5YIHMEw-1; Mon, 21 Nov 2022 03:34:01 -0500
X-MC-Unique: qK6xpqAmObuHjqI5YIHMEw-1
Received: by mail-io1-f72.google.com with SMTP id
 bf14-20020a056602368e00b006ce86e80414so5065186iob.7
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 00:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DXG8WO6RHBUwYBJ7rpR5fK1omKk45BZtqRKioqxBxPU=;
 b=wEQv2X7+cVIdXe2vmPYc8fm8GkdHpW4Fhdm3ZLJZTM/vlpTIAQg8lXoFuSHYG26fEr
 pAiQCHGIbBDK4Y3OQMTcozoqQs5H7PE5KOil6zDOfZ+w5Wx71OUg84g468ES1hpGBwL0
 mOjIkYYC01vwxrZ6DyozjLSUld9s/FaDPTvIrsdAdT3XXbuFW6CnpTlDIHfAtxyvRxgM
 UQjtOQjX6MDOQMK1c2Vcm/6JmkcnyqJWx7mo/6aUFDBisvyfDoB91qGOKluw93Rp+QI7
 YfTA8RkLztTb7n96r0WCPP2ZZLPlQPrVbKPoXmDIGdrNbD8qWJ0DHSmo4jHxzYpdzrHu
 7vGg==
X-Gm-Message-State: ANoB5pniCeUfj+HgeBRg6eRWdwIgTidlUyflZfXDpBX59CLFxDGj3sBF
 4X382uRiHjGBJx2pedfhgTcQie+4zkHuEr0FlM/tsi/L5LdH2QWS/B4e7B4+FiLSnK1RcEDxDh+
 fU3YJkjx+EVpDVb8Y0TlMxqJEHYwNzXM=
X-Received: by 2002:a92:870f:0:b0:302:501a:a25d with SMTP id
 m15-20020a92870f000000b00302501aa25dmr7417162ild.311.1669019640346; 
 Mon, 21 Nov 2022 00:34:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5L26VUxSwSLPpyirYjk3sCVOvwwKAcpHCk76jygmLqEZx6x5VDnzs6iOlT0PlkNcACBn9pQ/ZNVL1acDhQSL4=
X-Received: by 2002:a92:870f:0:b0:302:501a:a25d with SMTP id
 m15-20020a92870f000000b00302501aa25dmr7417155ild.311.1669019640133; Mon, 21
 Nov 2022 00:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20221120140044.752503-1-kfir@daynix.com>
 <20221120140044.752503-3-kfir@daynix.com>
In-Reply-To: <20221120140044.752503-3-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 21 Nov 2022 10:33:49 +0200
Message-ID: <CAPMcbCorfwnvPxV1Rbz0agNxs27_ZtsNcKkkA45GqObU3EgwTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] qga:/qga-win: skip getting pci info for USB disks
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000c6149905edf6eae5"
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

--000000000000c6149905edf6eae5
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Sun, Nov 20, 2022 at 4:01 PM Kfir Manor <kfir@daynix.com> wrote:

> Skip getting PCI info from disks type USB and give them an empty PCI
> address instead.
>
> Signed-off-by: Kfir Manor <kfir@daynix.com>
> ---
>  qga/commands-win32.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index a645480496..14c43b3de5 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -878,10 +878,14 @@ static void get_single_disk_info(int disk_number,
>       * if that doesn't hold since that suggests some other unexpected
>       * breakage
>       */
> -    disk->pci_controller = get_pci_info(disk_number, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        goto err_close;
> +    if (disk->bus_type == GUEST_DISK_BUS_TYPE_USB) {
> +        disk->pci_controller = get_empty_pci_address();
> +    } else {
> +        disk->pci_controller = get_pci_info(disk_number, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            goto err_close;
> +        }
>      }
>      if (disk->bus_type == GUEST_DISK_BUS_TYPE_SCSI
>              || disk->bus_type == GUEST_DISK_BUS_TYPE_IDE
> --
> 2.38.1
>
>

--000000000000c6149905edf6eae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 2=
0, 2022 at 4:01 PM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@d=
aynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Skip getting PCI info from disks type USB and give them an empty=
 PCI address instead.<br>
<br>
Signed-off-by: Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com" target=3D"=
_blank">kfir@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index a645480496..14c43b3de5 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -878,10 +878,14 @@ static void get_single_disk_info(int disk_number,<br>
=C2=A0 =C2=A0 =C2=A0 * if that doesn&#39;t hold since that suggests some ot=
her unexpected<br>
=C2=A0 =C2=A0 =C2=A0 * breakage<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 disk-&gt;pci_controller =3D get_pci_info(disk_number, &amp;l=
ocal_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_close;<br>
+=C2=A0 =C2=A0 if (disk-&gt;bus_type =3D=3D GUEST_DISK_BUS_TYPE_USB) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;pci_controller =3D get_empty_pci_addr=
ess();<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;pci_controller =3D get_pci_info(disk_=
number, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_close;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (disk-&gt;bus_type =3D=3D GUEST_DISK_BUS_TYPE_SCSI<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| disk-&gt;bus_type =3D=3D=
 GUEST_DISK_BUS_TYPE_IDE<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--000000000000c6149905edf6eae5--


