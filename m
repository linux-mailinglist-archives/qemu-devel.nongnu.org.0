Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6C677AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:21:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvoj-00011m-3K; Mon, 23 Jan 2023 07:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pJvoX-00011B-QK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pJvoW-0005AX-5h
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674476438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wPK6OqZaZjA+b4U81gVhyHQEzqleg0bm+wvkm123L1M=;
 b=FG380GrhkQYgUlKwYIGwCMoljR+QqcidFjfnxQi6930NCgeI7t6nfegt0Ho0UDkWF9xnxw
 VZ1dHR3WelIlJcdgVXj2KL0MQwwfkhkBsLWEGsUfVS+M01tedN6/XKuwJv802WJc1p/Krf
 H/xFeIHVyksHRsSZCDmetj9OKoSfoxY=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-4m5VX3K5OFKrncn8eTTBAQ-1; Mon, 23 Jan 2023 07:20:37 -0500
X-MC-Unique: 4m5VX3K5OFKrncn8eTTBAQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 a62-20020a671a41000000b003c08f2a8d7bso2827424vsa.14
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPK6OqZaZjA+b4U81gVhyHQEzqleg0bm+wvkm123L1M=;
 b=dRvJjckm8fnWlMqKQkSm6tsE8GuHw7bkEiw0F61i9YhOdqeW3L0ENgp9HFV0Z3pKXp
 dUwt4bydGiCIh0Da+l4WurVIhOHVXJFzgQhjqmhMB4f1lpyXhUjTIIAqiNuUPiYPZ11r
 tGAjx3RmH/nrO+YphjUpeJ75yGnevBKN5wIusEZPEQA8Moo396kq1OJnSixcEv1L+1s/
 1AZyjjddCeHF6ud+u4BDiePwtU8hbzP+I2q1iQSBeBhAEgHClhZs8rY0ZjWQ21+FbqSH
 WV6xUqrkMR6DJvozgXu/ALh6eFVRDeM6vEIB+HVk1dlQS2nK3eAft1dBnnKCythF0qwq
 aNJw==
X-Gm-Message-State: AFqh2krwJBQ06qL/eX7aYQx4c0aT4dkSTYnTuuesp2fnYZagHqBrvY3b
 I0cDdNM2yv++lhRdLEKVBe+GqSZsVHJ+Qb+duG+6oE6oBLF3PMpdFH2RbriWVX8p2VSpDvVuVzI
 MOMieE6FQOAjivf3BIkH2IVGNIuOQUx8=
X-Received: by 2002:a67:de19:0:b0:3d2:3590:e690 with SMTP id
 q25-20020a67de19000000b003d23590e690mr3336645vsk.1.1674476436599; 
 Mon, 23 Jan 2023 04:20:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCpzOr1SPN+0hECsypfLpZiwWsU6pT692JmJtTj/RuWtnUYevSg17Diw0xosk4sShvHU4+3rkaJh2YWBHvHtA=
X-Received: by 2002:a67:de19:0:b0:3d2:3590:e690 with SMTP id
 q25-20020a67de19000000b003d23590e690mr3336640vsk.1.1674476436383; Mon, 23 Jan
 2023 04:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20230122153307.1050593-1-kfir@daynix.com>
In-Reply-To: <20230122153307.1050593-1-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 23 Jan 2023 14:20:25 +0200
Message-ID: <CAPMcbCr5zGsTFW0vsqjSkSNBYiutLgGKYVkzt_67yLWANDOKwg@mail.gmail.com>
Subject: Re: [PATCH] qga/linux: add usb support to guest-get-fsinfo
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="0000000000002cfb1205f2ed6d53"
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

--0000000000002cfb1205f2ed6d53
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Sun, Jan 22, 2023 at 5:33 PM Kfir Manor <kfir@daynix.com> wrote:

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

--0000000000002cfb1205f2ed6d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 2=
2, 2023 at 5:33 PM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@d=
aynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">---<br>
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

--0000000000002cfb1205f2ed6d53--


