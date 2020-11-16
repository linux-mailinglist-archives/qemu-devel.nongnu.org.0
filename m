Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928792B4DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:48:47 +0100 (CET)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keicQ-0006jR-ML
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1keiYx-0004Rp-AM
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:45:11 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1keiYu-0007Ww-5Q
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:45:11 -0500
Received: by mail-wm1-x341.google.com with SMTP id d142so55590wmd.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 09:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i6Q6QWAjax6WG2+kJetUpx/n10KXp78fVhooa1DT98g=;
 b=xZt2/f4yc5QoGyNZMGq+MomSskquHwgbnXtTZzXUoxMJL86YlP04kSMZynYllPdNdd
 yRfoSSa35veRuUsd1IovkJYYjueLKOvuL9N3KzLXqRREx/2vRGD/ozkGGzJt2eCWaU5E
 5iHPGAoUTaiMsVLte7KR/CevlPDl2EFI4CWSA0IE+9xZE/vFC2kbotOdxiVtkALg4HQL
 TBVbZYfN+IUrePdTsmCd4DzJNGGzeMMfdXckbDnqM7M8G0a1TAFvAvmE4XOdapb8yv/l
 WQVe2ybRVoplRDXp4ag76g6rEgSWOyrIPEhT7wvKqUl+DNoGrzS+7BpKESCu7y4gBE9m
 iAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i6Q6QWAjax6WG2+kJetUpx/n10KXp78fVhooa1DT98g=;
 b=mmvFljyq9m8PfgMnSAMbuIe4hf8nSFgAIIPHA3VKZH9w/kXDclu0KypA05xhEIgCpj
 Ziv0BDNmUgqHTY3uJe1EavtTOAmfOmZNDW9upcKzHxm4FkgN9FfOGRh4IyeiiLKAofse
 8ihlGTUgLMSzD9riG4e3kDCIey0joBmTLrB2h9C5r0PtgmtQCY0pX5whqCY6vsxv8bpA
 RkVTy72sG3Ah2qsuG+linid/Re3nrAI3egpQGlghgWoXWZaiNMdLYE8PZKKze8j1/3Zi
 LTD4TKz8M6zBYdR8a9ZE7uJs+Q9hYzuqQvYgCqsZEHPXx9GJT+Z2mOP5tCr21blo6quh
 02ng==
X-Gm-Message-State: AOAM531kaj9l308DyB/fU1mkWHnUy/FQWaMcKqhHaPZG41j5fRPgsQq0
 1/NdM0oLUJ4SfxrQGiHqRSevq3TngLtQe5oqV7L2zQ==
X-Google-Smtp-Source: ABdhPJx9/BIvm1uRARldUI1CUQ6uqhVVMXGW+xMIZx567uBap29BGoq2po1jr6lkV7BEaGyUIJreM0WAD8qa2njP57k=
X-Received: by 2002:a1c:9c56:: with SMTP id f83mr14952wme.49.1605548705405;
 Mon, 16 Nov 2020 09:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20201115220740.488850-1-mst@redhat.com>
 <20201115220740.488850-6-mst@redhat.com>
In-Reply-To: <20201115220740.488850-6-mst@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 16 Nov 2020 23:14:54 +0530
Message-ID: <CAARzgwzVqPC5jwx9DERjW8cy+OsZ5cgkQceX=DOzZT5-0U09Yw@mail.gmail.com>
Subject: Re: [PULL 05/17] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041738005b43cf067"
Received-SPF: none client-ip=2a00:1450:4864:20::341;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000041738005b43cf067
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 03:57 Michael S. Tsirkin <mst@redhat.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
> is already in the "if (bsel || pcihp_bridge_en)" block statement,
> but it isn't smart enough to figure it out.
>
> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
> block statement to fix (on Ubuntu):
>
>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialize=
d
>   in this function [-Werror=3Dmaybe-uninitialized]
>     496 |         aml_append(parent_scope, method);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is of=
f
> globally")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20201107194045.438027-1-philmd@redhat.com>
> Acked-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Is there any reason why my ack was removed from the patch that was
ultimately merged?

https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c74fb657db0559274a710e=
50ef0096a1915a3




> ---
>  hw/i386/acpi-build.c | 45 +++++++++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 24 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f66642d88..1f5c211245 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -465,34 +465,31 @@ static void build_append_pci_bus_devices(Aml
> *parent_scope, PCIBus *bus,
>       */
>      if (bsel || pcihp_bridge_en) {
>          method =3D aml_method("PCNT", 0, AML_NOTSERIALIZED);
> -    }
> -    /* If bus supports hotplug select it and notify about local events *=
/
> -    if (bsel) {
> -        uint64_t bsel_val =3D qnum_get_uint(qobject_to(QNum, bsel));
>
> -        aml_append(method, aml_store(aml_int(bsel_val),
> aml_name("BNUM")));
> -        aml_append(method,
> -            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device
> Check */)
> -        );
> -        aml_append(method,
> -            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject
> Request */)
> -        );
> -    }
> +        /* If bus supports hotplug select it and notify about local
> events */
> +        if (bsel) {
> +            uint64_t bsel_val =3D qnum_get_uint(qobject_to(QNum, bsel));
>
> -    /* Notify about child bus events in any case */
> -    if (pcihp_bridge_en) {
> -        QLIST_FOREACH(sec, &bus->child, sibling) {
> -            int32_t devfn =3D sec->parent_dev->devfn;
> -
> -            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> -                continue;
> -            }
> -
> -            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +            aml_append(method, aml_store(aml_int(bsel_val),
> aml_name("BNUM")));
> +            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
> +                                         aml_int(1))); /* Device Check *=
/
> +            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
> +                                         aml_int(3))); /* Eject Request =
*/
> +        }
> +
> +        /* Notify about child bus events in any case */
> +        if (pcihp_bridge_en) {
> +            QLIST_FOREACH(sec, &bus->child, sibling) {
> +                int32_t devfn =3D sec->parent_dev->devfn;
> +
> +                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
> +                    continue;
> +                }
> +
> +                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +            }
>          }
> -    }
>
> -    if (bsel || pcihp_bridge_en) {
>          aml_append(parent_scope, method);
>      }
>      qobject_unref(bsel);
> --
> MST
>
>

--00000000000041738005b43cf067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 16, 2020 at 03:57 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mai=
lto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
<br>
GCC 9.3.0 thinks that &#39;method&#39; can be left uninitialized. This code=
<br>
is already in the &quot;if (bsel || pcihp_bridge_en)&quot; block statement,=
<br>
but it isn&#39;t smart enough to figure it out.<br>
<br>
Restrict the code to be used only in the &quot;if (bsel || pcihp_bridge_en)=
&quot;<br>
block statement to fix (on Ubuntu):<br>
<br>
=C2=A0 ../hw/i386/acpi-build.c: In function &#39;build_append_pci_bus_devic=
es&#39;:<br>
=C2=A0 ../hw/i386/acpi-build.c:496:9: error: &#39;method&#39; may be used u=
ninitialized<br>
=C2=A0 in this function [-Werror=3Dmaybe-uninitialized]<br>
=C2=A0 =C2=A0 496 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(parent_scop=
e, method);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 cc1: all warnings being treated as errors<br>
<br>
Fixes: df4008c9c59 (&quot;piix4: don&#39;t reserve hw resources when hotplu=
g is off globally&quot;)<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20201107194045.438027-1-philmd@redhat.com=
" target=3D"_blank">20201107194045.438027-1-philmd@redhat.com</a>&gt;<br>
Acked-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank=
">ani@anisinha.ca</a>&gt;<br>
Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targe=
t=3D"_blank">mst@redhat.com</a>&gt;<br>
Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank">mst@redhat.com</a>&gt;</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Is there any reason why my ack was removed from the pa=
tch that was ultimately merged?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div><a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D811c74fb657db0559274a710e50ef0096a1915a3">https://git.qemu.org/?p=3Dqemu=
.git;a=3Dcommit;h=3D811c74fb657db0559274a710e50ef0096a1915a3</a></div><br><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex" dir=3D"auto"><br>
---<br>
=C2=A0hw/i386/acpi-build.c | 45 +++++++++++++++++++++----------------------=
-<br>
=C2=A01 file changed, 21 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
index 4f66642d88..1f5c211245 100644<br>
--- a/hw/i386/acpi-build.c<br>
+++ b/hw/i386/acpi-build.c<br>
@@ -465,34 +465,31 @@ static void build_append_pci_bus_devices(Aml *parent_=
scope, PCIBus *bus,<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (bsel || pcihp_bridge_en) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D aml_method(&quot;PCNT&quot;, 0=
, AML_NOTSERIALIZED);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 /* If bus supports hotplug select it and notify about local =
events */<br>
-=C2=A0 =C2=A0 if (bsel) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t bsel_val =3D qnum_get_uint(qobject_to=
(QNum, bsel));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method, aml_store(aml_int(bsel_val)=
, aml_name(&quot;BNUM&quot;)));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_call2(&quot;DVNT&quot;, aml_=
name(&quot;PCIU&quot;), aml_int(1) /* Device Check */)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_call2(&quot;DVNT&quot;, aml_=
name(&quot;PCID&quot;), aml_int(3)/* Eject Request */)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If bus supports hotplug select it and notif=
y about local events */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsel) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t bsel_val =3D qnum_get_u=
int(qobject_to(QNum, bsel));<br>
<br>
-=C2=A0 =C2=A0 /* Notify about child bus events in any case */<br>
-=C2=A0 =C2=A0 if (pcihp_bridge_en) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_FOREACH(sec, &amp;bus-&gt;child, sibling=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int32_t devfn =3D sec-&gt;parent=
_dev-&gt;devfn;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci_bus_is_root(sec) || pci_=
bus_is_express(sec)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method, aml_name(&quo=
t;^S%.02X.PCNT&quot;, devfn));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method, aml_store(aml=
_int(bsel_val), aml_name(&quot;BNUM&quot;)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method, aml_call2(&qu=
ot;DVNT&quot;, aml_name(&quot;PCIU&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0am=
l_int(1))); /* Device Check */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method, aml_call2(&qu=
ot;DVNT&quot;, aml_name(&quot;PCID&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0am=
l_int(3))); /* Eject Request */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Notify about child bus events in any case *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pcihp_bridge_en) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QLIST_FOREACH(sec, &amp;bus-&gt;=
child, sibling) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int32_t devfn =3D =
sec-&gt;parent_dev-&gt;devfn;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pci_bus_is_roo=
t(sec) || pci_bus_is_express(sec)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_append(method,=
 aml_name(&quot;^S%.02X.PCNT&quot;, devfn));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 if (bsel || pcihp_bridge_en) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(parent_scope, method);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(bsel);<br>
-- <br>
MST<br>
<br>
</blockquote></div></div>

--00000000000041738005b43cf067--

