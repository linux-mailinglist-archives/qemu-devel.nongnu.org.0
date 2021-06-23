Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE93B18AE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:15:11 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0qb-0007Mg-OF
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0pX-0006Oh-Eu
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:14:03 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:33321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0pU-00056P-So
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:14:02 -0400
Received: by mail-oi1-x232.google.com with SMTP id s17so2981021oij.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxN4AilJ6fMpO6BDzvIKWDBl3QjYFr055bALHsXhvWQ=;
 b=ATPeS+VorGr3C+fOwgos3VLcX7BMec+XP8pbyl2rmR6nEWyMf4jGfMyUgIJX0Xm+Cu
 jnYyIU4tPvWwSAQelkZfYfAOa9JHEXSMP8Szox3nAisLyqfE/9DuJ/QDUFhV+wo81evm
 Tmiew6ZtaFWrHuo922lXdISBhBBllBhM6jkeCwzNX2TDs2+LyNYcI52jkN4gRrlWyc9x
 1VhPHtIcj4yc+JbRYdOe5JcHOkBJhqkg6Fi7hJjaa/0swjyf1KCEhvo9Sj9yYIFHv7ZF
 NwGQc25MSVEsgCTFAhW2pN55sFZlzooOaV8ub3UhdE3SSzSzLoZg2UxKEzbIxgXst+HV
 0IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxN4AilJ6fMpO6BDzvIKWDBl3QjYFr055bALHsXhvWQ=;
 b=XUVswmfls6YyPfi2mfwGkjIAUMNF52rdAJM9e6AU4r4Z+S8hKKmCdcJjWZZWdTDZFL
 deanfS62xbzoEaMd52+bPu4+WHebpM0hp0X7ygnE1yqY9Erbvy9mRG6kju8QWTz+KBAY
 /f9Nkocp9DWEHpXfd+K9+nSD8jSJ60X3848CjdgcznAuLJaKsJKe2x8hs4LnJvt3Mqfv
 WW9+5Op5UR0cuKcFVpYQHtFyeb5qaaIWZq7qRWcp0n64A5XfuVQPdtPFk55l5bTawrdK
 a8rE7BCUOzyXwQrKjZvt7YUPx23aqY9JnkwTKCHLmxW3yDkEVYmr+cvOXPslI2imdk8T
 JHwQ==
X-Gm-Message-State: AOAM5305S1BHe+QXrvNeDXlshKiRas8h9qM6Wxz85HasYX7AVNObHfFV
 8CTa+ezpmQoRpbO2lCib1M0pX0g+KR2VK8XB+is=
X-Google-Smtp-Source: ABdhPJyD3uTo4ih+SFvTX0OYH7qZynS1jzOlDtbHhZZWvuB815ZeHVS159Qbb8D0zrqege/KvPlSodC59wTBHGgWcqk=
X-Received: by 2002:aca:c453:: with SMTP id u80mr2646863oif.93.1624446839711; 
 Wed, 23 Jun 2021 04:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-7-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-7-jusual@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Wed, 23 Jun 2021 14:13:48 +0300
Message-ID: <CAC_L=vU8LnpWrvmvectS0Lp4XioWU4vXDqF-hyFiKNt5ikEwHg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
To: Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d66b4705c56d005a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x232.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d66b4705c56d005a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 10:08 PM Julia Suvorova <jusual@redhat.com> wrote:

> Q35 has three different types of PCI devices hot-plug: PCIe Native,
> SHPC Native and ACPI hot-plug. This patch changes the default choice
> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> ability to use SHPC and PCIe Native for hot-plugged bridges.
>
>
I personally think the best of all worlds is to have as default:
 - Native PCIe hotplug for pcie-root-ports
 - ACPI hotplug for devices behind PCI bridges (pcie-pci bridge or pci-pci
bridge).

Having ACPI hotplug *as default* for pcie-root-ports seems weird even
if it solves existing bugs (we should solve them...).

I am not against having a property to force ACPI hotplug even for pcie
root-ports,
just not being the default. It doesn't have to  be part of this series, it
can be a patch on
top.

I would leave APCI hotplug as an option and not as the default, giving us
time to test it,
come up with a fix for the pcie-hotplug race and a patch for allowing ACPI
hotplug
only for the bridges.

Thanks,
Marcel



> This is a list of the PCIe Native hot-plug issues that led to this
> change:
>     * no racy behavior during boot (see 110c477c2ed)
>     * no delay during deleting - after the actual power off software
>       must wait at least 1 second before indicating about it. This case
>       is quite important for users, it even has its own bug:
>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>     * no timer-based behavior - in addition to the previous example,
>       the attention button has a 5-second waiting period, during which
>       the operation can be canceled with a second press. While this
>       looks fine for manual button control, automation will result in
>       the need to queue or drop events, and the software receiving
>       events in all sort of unspecified combinations of attention/power
>       indicator states, which is racy and uppredictable.
>     * fixes:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
>
> To return to PCIe Native hot-plug:
>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/ich9.c | 2 +-
>  hw/i386/pc.c   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index bcbd567cb0..daa3cd44b1 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -424,7 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs
> *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> -    pm->use_acpi_hotplug_bridge = false;
> +    pm->use_acpi_hotplug_bridge = true;
>
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c6d8d0d84d..cc10589552 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
>  };
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>
> --
> 2.30.2
>
>

--000000000000d66b4705c56d005a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 17, 2021 at 10:08 PM Juli=
a Suvorova &lt;<a href=3D"mailto:jusual@redhat.com">jusual@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Q35 ha=
s three different types of PCI devices hot-plug: PCIe Native,<br>
SHPC Native and ACPI hot-plug. This patch changes the default choice<br>
for cold-plugged bridges from PCIe Native to ACPI Hot-plug with<br>
ability to use SHPC and PCIe Native for hot-plugged bridges.<br>
<br></blockquote><div><br></div><div>I personally=C2=A0think the best of al=
l worlds is to have as default:</div><div>=C2=A0- Native PCIe hotplug for p=
cie-root-ports</div><div>=C2=A0- ACPI hotplug for devices behind PCI bridge=
s (pcie-pci bridge or pci-pci bridge).</div><div><br></div><div>Having ACPI=
 hotplug *as default* for=C2=A0pcie-root-ports seems weird even</div><div>i=
f it solves existing=C2=A0bugs (we should solve them...).</div><div><br></d=
iv><div>I am not against having a property to force ACPI hotplug even for p=
cie root-ports,</div><div>just not being the default. It doesn&#39;t have t=
o=C2=A0 be part of this series, it can be a patch on</div><div>top.</div><d=
iv><br></div><div>I would leave APCI hotplug as an option and not as the de=
fault, giving us time to test it,</div><div>come up with a fix for the pcie=
-hotplug race and a patch for allowing ACPI hotplug</div><div>only for the =
bridges.</div><div><br></div><div>Thanks,</div><div>Marcel</div><div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
This is a list of the PCIe Native hot-plug issues that led to this<br>
change:<br>
=C2=A0 =C2=A0 * no racy behavior during boot (see 110c477c2ed)<br>
=C2=A0 =C2=A0 * no delay during deleting - after the actual power off softw=
are<br>
=C2=A0 =C2=A0 =C2=A0 must wait at least 1 second before indicating about it=
. This case<br>
=C2=A0 =C2=A0 =C2=A0 is quite important for users, it even has its own bug:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://bugzilla.redhat.com/s=
how_bug.cgi?id=3D1594168" rel=3D"noreferrer" target=3D"_blank">https://bugz=
illa.redhat.com/show_bug.cgi?id=3D1594168</a><br>
=C2=A0 =C2=A0 * no timer-based behavior - in addition to the previous examp=
le,<br>
=C2=A0 =C2=A0 =C2=A0 the attention button has a 5-second waiting period, du=
ring which<br>
=C2=A0 =C2=A0 =C2=A0 the operation can be canceled with a second press. Whi=
le this<br>
=C2=A0 =C2=A0 =C2=A0 looks fine for manual button control, automation will =
result in<br>
=C2=A0 =C2=A0 =C2=A0 the need to queue or drop events, and the software rec=
eiving<br>
=C2=A0 =C2=A0 =C2=A0 events in all sort of unspecified combinations of atte=
ntion/power<br>
=C2=A0 =C2=A0 =C2=A0 indicator states, which is racy and uppredictable.<br>
=C2=A0 =C2=A0 * fixes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * <a href=3D"https://bugzilla.redhat.com/show_b=
ug.cgi?id=3D1752465" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.=
redhat.com/show_bug.cgi?id=3D1752465</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * <a href=3D"https://bugzilla.redhat.com/show_b=
ug.cgi?id=3D1690256" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.=
redhat.com/show_bug.cgi?id=3D1690256</a><br>
<br>
To return to PCIe Native hot-plug:<br>
=C2=A0 =C2=A0 -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=3Doff<b=
r>
<br>
Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" targe=
t=3D"_blank">imammedo@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/acpi/ich9.c | 2 +-<br>
=C2=A0hw/i386/pc.c=C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c<br>
index bcbd567cb0..daa3cd44b1 100644<br>
--- a/hw/acpi/ich9.c<br>
+++ b/hw/acpi/ich9.c<br>
@@ -424,7 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs =
*pm)<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;disable_s3 =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;disable_s4 =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0pm-&gt;s4_val =3D 2;<br>
-=C2=A0 =C2=A0 pm-&gt;use_acpi_hotplug_bridge =3D false;<br>
+=C2=A0 =C2=A0 pm-&gt;use_acpi_hotplug_bridge =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_=
BASE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pm-&gt;pm_io_base=
, OBJ_PROP_FLAG_READ);<br>
diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
index c6d8d0d84d..cc10589552 100644<br>
--- a/hw/i386/pc.c<br>
+++ b/hw/i386/pc.c<br>
@@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;qemu64&quot; &quot;-&quot; TYPE_X86_CPU, &quot;=
family&quot;, &quot;6&quot; },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;qemu64&quot; &quot;-&quot; TYPE_X86_CPU, &quot;=
model&quot;, &quot;6&quot; },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;qemu64&quot; &quot;-&quot; TYPE_X86_CPU, &quot;=
stepping&quot;, &quot;3&quot; },<br>
+=C2=A0 =C2=A0 { &quot;ICH9-LPC&quot;, &quot;acpi-pci-hotplug-with-bridge-s=
upport&quot;, &quot;off&quot; },<br>
=C2=A0};<br>
=C2=A0const size_t pc_compat_6_0_len =3D G_N_ELEMENTS(pc_compat_6_0);<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000d66b4705c56d005a--

