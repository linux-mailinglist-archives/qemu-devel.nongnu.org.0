Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186063DD71D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:31:45 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAY2i-0002QP-4a
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mAY1f-0001ek-O8
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:30:39 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mAY1d-0005Ug-LZ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:30:39 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 r1-20020a0568304181b02904cf73f54f4bso234582otu.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EP7gEtysuBIIk7R1ngVWS1J0iYkOY0LpdVfGb4aD9IA=;
 b=BwJXWv9b2KmVPezJnfoz5v1SmIIFBZmOz/EYTfX6pWPeHon1tUIGXDWDnLaK26V9vl
 BQtwt9z1oZry549UeLSoX3JH468xXchozGkpedwXRKbrteFGpSBs756N+iurPU4FmOtZ
 yyApEvKcddTBClrAy8hjWVJC+mHZs1erNh3qOANjAngar5HddBLoDMGDTFAzdK+B9MaF
 rNJYWXTujbJys6cciD+AyZBnT5RHEDcAKMhiISclWE3VwdmvcT0Z3/ZgWSUtyU6yQ2Ln
 xZBzgNqCKIbHJXozw5uUb614txs1hNj8RCRsyWlK57qivs40MXjm9Pdv0cTuEl35x+CF
 SzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EP7gEtysuBIIk7R1ngVWS1J0iYkOY0LpdVfGb4aD9IA=;
 b=KPas8eO10WSUaG+uLg2WIvOQk2SE75zWngIlxJ9xO2JA94othDsoh/Qr+pg83fkwyg
 n9otdM6mz5eZnuk+XEjwzwt0Rtvgy9OJCVFxwxhs9vRWV4jowAqanqa6NluoR+LZV4US
 I7Lh8ahiP5ZMVvnNQAE1XwycG8id7ngRyiXrB6iZPUqGFc7fOXojKQL1ZYUxtt+gjRVU
 n3q61J1IoS0bXLNM8rBtN2LUupxB/tKcOlhc0CYrwjizgxaIaabBSHLdCJnqW7jQf9GH
 07o5ZXjljeQgC7g7YJRrMXBX7W2a5FJR4+zDnankA19y/OJ3blRyaSLRVlcm+oNvin/7
 O4nw==
X-Gm-Message-State: AOAM531OJXPvXIQYB+7F8M+QGGAV3AhQlounEBVlespruYdB0I/elKaO
 7EGwNeFZWSh9Jmw2Dmi9ybCE9M73nVEMdSw6aks=
X-Google-Smtp-Source: ABdhPJyiLFe+n3ky0Ze0EkAvqsu93jYc46F2T1zet09O287gON9FbE+cVRkM3DiTub8mJ2zeToneB5Icn34o6QAN3k4=
X-Received: by 2002:a9d:7f94:: with SMTP id t20mr11212704otp.44.1627911036323; 
 Mon, 02 Aug 2021 06:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210802090057.1709775-1-marcel@redhat.com>
 <YQe1RDEajaz7FYJw@redhat.com>
In-Reply-To: <YQe1RDEajaz7FYJw@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 2 Aug 2021 16:30:25 +0300
Message-ID: <CAC_L=vV3s1aXV+sNf047aOWiHFJGfjGOBPSmHxwc0o9AgV06EQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000bcb5505c893937e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x32e.google.com
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
Cc: Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000bcb5505c893937e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Aug 2, 2021 at 12:05 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Aug 02, 2021 at 12:00:57PM +0300, Marcel Apfelbaum wrote:
> > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > As opposed to native PCIe hotplug, guests like Fedora 34
> > will not assign IO range to pcie-root-ports not supporting
> > native hotplug, resulting into a regression.
>
> Presumably this means this patch should have 'for 6.1' tagged
> in subject, as we don't want 6.1 to regress ?
>

I agree I should have added the tag, however Michael is aware as
he proposed this patch.
I can re-spin if necessary.

Thanks,
Marcel


>
> >
> > Reproduce by:
> >     qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
> >     device_add e1000,bus=3Dp1
> > In the Guest OS the respective pcie-root-port will have the IO range
> > disabled.
> >
> > Fix it by setting the "reserve-io" hint capability of the
> > pcie-root-ports so the firmware will allocate the IO range instead.
> >
> > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > ---
> > v2:
> >    - improve commit message (Igor)
> >
> >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/pci-bridge/gen_pcie_root_port.c
> b/hw/pci-bridge/gen_pcie_root_port.c
> > index ec9907917e..20099a8ae3 100644
> > --- a/hw/pci-bridge/gen_pcie_root_port.c
> > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> > @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort,
> GEN_PCIE_ROOT_PORT)
> >          (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
> >
> >  #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
> > +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
> >
> >  struct GenPCIERootPort {
> >      /*< private >*/
> > @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, in=
t
> version_id)
> >  static void gen_rp_realize(DeviceState *dev, Error **errp)
> >  {
> >      PCIDevice *d =3D PCI_DEVICE(dev);
> > +    PCIESlot *s =3D PCIE_SLOT(d);
> >      GenPCIERootPort *grp =3D GEN_PCIE_ROOT_PORT(d);
> >      PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLASS(d);
> >      Error *local_err =3D NULL;
> > @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error
> **errp)
> >          return;
> >      }
> >
> > +    if (grp->res_reserve.io =3D=3D -1 && s->hotplug && !s->native_hotp=
lug)
> {
> > +        grp->res_reserve.io =3D GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> > +    }
> >      int rc =3D pci_bridge_qemu_reserve_cap_init(d, 0,
> >                                                grp->res_reserve, errp);
> >
> > --
> > 2.31.1
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000000bcb5505c893937e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 12:05 PM=
 Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrang=
e@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, Aug 02, 2021 at 12:00:57PM +0300, Marcel Apfelbaum wrot=
e:<br>
&gt; Q35 has now ACPI hotplug enabled by default for PCI(e) devices.<br>
&gt; As opposed to native PCIe hotplug, guests like Fedora 34<br>
&gt; will not assign IO range to pcie-root-ports not supporting<br>
&gt; native hotplug, resulting into a regression.<br>
<br>
Presumably this means this patch should have &#39;for 6.1&#39; tagged<br>
in subject, as we don&#39;t want 6.1 to regress ?<br></blockquote><div><br>=
</div><div>I agree I should have added the tag, however=C2=A0Michael is awa=
re as</div><div>he proposed this patch.</div><div>I can re-spin if necessar=
y.</div><div><br></div><div>Thanks,</div><div>Marcel</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Reproduce by:<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -mon=
itor stdio<br>
&gt;=C2=A0 =C2=A0 =C2=A0device_add e1000,bus=3Dp1<br>
&gt; In the Guest OS the respective pcie-root-port will have the IO range<b=
r>
&gt; disabled.<br>
&gt; <br>
&gt; Fix it by setting the &quot;reserve-io&quot; hint capability of the<br=
>
&gt; pcie-root-ports so the firmware will allocate the IO range instead.<br=
>
&gt; <br>
&gt; Acked-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redhat.co=
m" target=3D"_blank">marcel@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt;=C2=A0 =C2=A0 - improve commit message (Igor)<br>
&gt; <br>
&gt;=C2=A0 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pc=
ie_root_port.c<br>
&gt; index ec9907917e..20099a8ae3 100644<br>
&gt; --- a/hw/pci-bridge/gen_pcie_root_port.c<br>
&gt; +++ b/hw/pci-bridge/gen_pcie_root_port.c<br>
&gt; @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE=
_ROOT_PORT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI=
_ERR_SIZEOF)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR=C2=A0 =C2=A0 =C2=A0 =
=C2=A01<br>
&gt; +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 4096<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct GenPCIERootPort {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, i=
nt version_id)<br>
&gt;=C2=A0 static void gen_rp_realize(DeviceState *dev, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PCIDevice *d =3D PCI_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 PCIESlot *s =3D PCIE_SLOT(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GenPCIERootPort *grp =3D GEN_PCIE_ROOT_PORT(d);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLAS=
S(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt; @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (grp-&gt;<a href=3D"http://res_reserve.io" rel=3D"no=
referrer" target=3D"_blank">res_reserve.io</a> =3D=3D -1 &amp;&amp; s-&gt;h=
otplug &amp;&amp; !s-&gt;native_hotplug) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grp-&gt;<a href=3D"http://res_reserve.io"=
 rel=3D"noreferrer" target=3D"_blank">res_reserve.io</a> =3D GEN_PCIE_ROOT_=
DEFAULT_IO_RANGE;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int rc =3D pci_bridge_qemu_reserve_cap_init(d, 0,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 grp-&gt;res_reserve, errp);<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.31.1<br>
&gt; <br>
&gt; <br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000000bcb5505c893937e--

