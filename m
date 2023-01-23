Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8E677AED
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:29:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvvn-00034A-QZ; Mon, 23 Jan 2023 07:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pJvvl-000329-IY
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pJvvj-0006gV-QS
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674476887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SpfZrDSUPw9DKK82uZkBmYQNa9aSvZ1G1JiM85/PhnQ=;
 b=Ug/uPrVh+KuwD37OTd330AM5U/xsFWXyA7VYYB9ARIIWiGzf0kP9lvNgymqUo0wxscWwSd
 4sxVwBY9A1Y/IKg26lI/1q44QEh9n6wNOm31JypzEj224BcsgwRJf6F4/Fp4xaEu4WOZzW
 5rhiWNWUoRyMqKAV1tZyANK9SBnyp54=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-P_CCLVSLORiJBF7RQ3XQeg-1; Mon, 23 Jan 2023 07:28:05 -0500
X-MC-Unique: P_CCLVSLORiJBF7RQ3XQeg-1
Received: by mail-vs1-f72.google.com with SMTP id
 68-20020a670347000000b003bf750cb86eso2792214vsd.8
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpfZrDSUPw9DKK82uZkBmYQNa9aSvZ1G1JiM85/PhnQ=;
 b=mV+shfv0m3KOGDo3dqTHILc/eIxAaf/qqD0KFdcwS8h5BS6N2qdP8JJwhHNS2yoR6z
 UAoXjrqFG2zbg2SMjTpk4EkHY2EGrMZTs8a/FZQYtTivxRDlq6sxtdrOJz6Iul/mgrPb
 yDAodB7kBvfvMr3U39XZAnWktvNbEIQZiQ0tTMuFGcFZoGjhnIMzSONNfIOSLKx4bfL2
 j44/suWLqesWwAmmGnHV08hghLDxDZ0Ts46H2BJQoCRB20rAP04A40huUchP9FYMQVSt
 XUtYouq17/VOY9fdkZDENBbt8fV/YxGOYFvp11uX0qCYIpW2In3DnW9cuY5eaYGTtEYe
 Aeqw==
X-Gm-Message-State: AFqh2kqomU+7puweY6o1vqLFgVg4PIDWp4TEE6dzDrQpbv6+WRYe069e
 8uSAMHVnu4+yT+L0LCxJfk6T5ll9cmPgx/07jCHwf9SAmpnM2Zv975bRd+LfT1pfnNts/7DsG7r
 lBEvdW+2HadJH0AE0LCIy0TM7tTmouyI=
X-Received: by 2002:a67:ff81:0:b0:3d3:f129:2031 with SMTP id
 v1-20020a67ff81000000b003d3f1292031mr3008352vsq.74.1674476884952; 
 Mon, 23 Jan 2023 04:28:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrLRu9qSd/fBZiV0wHNnE+IIodmOwvkrY0Ph0uFVzGLTcRhkjrAApzzCZAIkf/7NWh0wALfQZjppfYmp/l4cE=
X-Received: by 2002:a67:ff81:0:b0:3d3:f129:2031 with SMTP id
 v1-20020a67ff81000000b003d3f1292031mr3008351vsq.74.1674476884734; Mon, 23 Jan
 2023 04:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20230122153307.1050593-1-kfir@daynix.com>
In-Reply-To: <20230122153307.1050593-1-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 23 Jan 2023 14:27:53 +0200
Message-ID: <CAPMcbCqNRA+7_00BhQZSjiAEvoWRK6dbprwUdkuc3P-qZaj-GQ@mail.gmail.com>
Subject: Re: [PATCH] qga/linux: add usb support to guest-get-fsinfo
To: Kfir Manor <kfir@daynix.com>
Cc: qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000e64c2105f2ed87f7"
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

--000000000000e64c2105f2ed87f7
Content-Type: text/plain; charset="UTF-8"

Hi Kfir,

You missed adding the Signed-off-by line to the patch.
Please resend.

Best Regards,
Konstantin Kostiuk.


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

--000000000000e64c2105f2ed87f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kfir,</div><div><br></div><div>You missed adding t=
he Signed-off-by line to the patch. <br></div><div>Please resend.<br></div>=
<div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sm=
artmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>K=
onstantin Kostiuk.</div></div></div></div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 22, 2023 at=
 5:33 PM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.com">kfir@daynix.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">-=
--<br>
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

--000000000000e64c2105f2ed87f7--


