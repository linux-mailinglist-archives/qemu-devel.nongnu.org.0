Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF542492CA5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:47:30 +0100 (CET)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sZt-0004ga-N9
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n9sAu-0008VJ-24
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:21:41 -0500
Received: from [2607:f8b0:4864:20::f32] (port=34567
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n9sAr-00052s-U8
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:21:39 -0500
Received: by mail-qv1-xf32.google.com with SMTP id a7so1282248qvl.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QsZR5PfDF80bQGKHPsOox2He4BhWYL7ZMfy42yvVm2E=;
 b=OcxbW9SJ6QwtxJ7LetgHR639Ej3iS8QtCDpByJvJxbdnLiE3OHLZrVy37tVTAXex81
 hY3kUkc5j8PllJws4R7gjGdk4ahLdHiVTxlPVmNDzaMY9nCqvgDovd02pM0HMssKBVPY
 JMe+egbpKI1/fElmCsFev5CeGVwu6m7D7uGZGH+RtI0u4Q1V2UaLnxyRW7RCIGQrkNUP
 rScTE46eOzOjb+nqC4JnS4M9NgqrwUBifpYh32pUvBwD2K9rhD4ptEjURn0gRiHU0cWj
 Uz4FpVJ4jX5kPjaONtiDQX6x/nMcQDn3uHNOkhBullax8M2LWWXQJGbZC7quXlcenIJO
 0Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsZR5PfDF80bQGKHPsOox2He4BhWYL7ZMfy42yvVm2E=;
 b=o3zTHGWWg16he1bW+OpEK5y7wm+BsD33rBKxHai6Qx9+cGbrudq7L9nGaHQGPyNPJO
 LJUPpR9Sr4VDEAnWu56W4LXzxnsoGL3OPouocfZpTUdSQ5Byk5dT3gf4Y/3I/x3LMcit
 nflZJhcvE0nXcF795MnbE0qKF2d2JIFxgKQ2rNGBkAFz5NEd4sIWKbRfnj9UpYw7VRYV
 ZV5Yi2pkA7Pk1+CJ/JNKnKdSn0DpcvTy8XbrTLj4Uq+wp3bNcCu7jj4SJhWr28F1IPhF
 PcWyZjCylFAkIKVxh5KbU9loZDLS348JPsW9xT7OWNpdABTw1X3OL+1FE+smgaGQV6Hp
 A6tA==
X-Gm-Message-State: AOAM533f8EHlUux0X1TIWj8WwhtD2p2YuyO5/ZAwEgawh3GYr+NRthcE
 iUWE4K9RmBbFPhbNApu1xI4flJpGJ1WoJPy9bUSNL3MS+lA=
X-Google-Smtp-Source: ABdhPJy3zp2XnT3ItjGdb1rlGOVTwzuItvS2DrjuRINhbBC1SIMqVhSVui8H/xujo631AGTZT7s/xK5fdW+ahkXWMVw=
X-Received: by 2002:a05:6122:209f:: with SMTP id
 i31mr8405832vkd.28.1642526153488; 
 Tue, 18 Jan 2022 09:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20220106223316.3661625-1-venture@google.com>
 <20220111141332.4e0de6af@redhat.com>
In-Reply-To: <20220111141332.4e0de6af@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 18 Jan 2022 09:15:42 -0800
Message-ID: <CAO=notxVi7-pGoJS9kXuEcC8nBdhEbW=+Wu6V5qP7UVvzubcNQ@mail.gmail.com>
Subject: Re: [PATCH] hw/smbios: Add table 4 parameter, "processor-id"
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, ani@anisinha.ca, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Foley <pefoley@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="000000000000ea44a105d5de6bc5"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=venture@google.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea44a105d5de6bc5
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 11, 2022 at 5:13 AM Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu,  6 Jan 2022 14:33:16 -0800
> Patrick Venture <venture@google.com> wrote:
>
> > This parameter is to be used in the processor_id lower 32-bit entry in
>
> I'd call it processor_id_lo throughout the patch
> or if you prefer to keep current name, then make it support full QWORD
> as spec says.
>

Ack


>
> > the type 4 table.  The upper 32-bits represent the features for the CPU.
> > This patch leaves those as 0 when the lower 32-bits are set.
>
> why 0 it out instead of using smbios_cpuid_features value?
>

Because presumably the cpuid_feature value would not match whatever
override was chosen here.  But I like your idea of just making it a
quadword.


>
>
> > This parameter is set as optional and if left will use the values from
> > the CPU model.
> >
> > This enables hiding the host information from the guest and allowing AMD
> > VMs to run pretending to be Intel for some userspace software concerns.
>
> > Reviewed-by: Peter Foley <pefoley@google.com>
> > Reviewed-by: Titus Rwantare <titusr@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  hw/smbios/smbios.c | 19 ++++++++++++++++---
> >  qemu-options.hx    |  1 +
> >  2 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 7397e56737..0553ee0b17 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -104,9 +104,11 @@ static struct {
> >      const char *sock_pfx, *manufacturer, *version, *serial, *asset,
> *part;
> >      uint64_t max_speed;
> >      uint64_t current_speed;
> > +    uint32_t processor_id;
>
>
>
> >  } type4 = {
> >      .max_speed = DEFAULT_CPU_SPEED,
> > -    .current_speed = DEFAULT_CPU_SPEED
> > +    .current_speed = DEFAULT_CPU_SPEED,
> > +    .processor_id = 0,
> >  };
> >
> >  static struct {
> > @@ -327,6 +329,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] =
> {
> >          .name = "part",
> >          .type = QEMU_OPT_STRING,
> >          .help = "part number",
> > +    }, {
> > +        .name = "processor-id",
> > +        .type = QEMU_OPT_NUMBER,
> > +        .help = "processor id",
> >      },
> >      { /* end of list */ }
> >  };
> > @@ -669,8 +675,13 @@ static void smbios_build_type_4_table(MachineState
> *ms, unsigned instance)
> >      t->processor_type = 0x03; /* CPU */
> >      t->processor_family = 0x01; /* Other */
> >      SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str,
> type4.manufacturer);
> > -    t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> > -    t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
> > +    if (type4.processor_id == 0) {
> > +        t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> > +        t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
> > +    } else {
> > +        t->processor_id[0] = cpu_to_le32(type4.processor_id);
> > +        t->processor_id[1] = 0;
> > +    }
> >      SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
> >      t->voltage = 0;
> >      t->external_clock = cpu_to_le16(0); /* Unknown */
> > @@ -1292,6 +1303,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
> >              save_opt(&type4.serial, opts, "serial");
> >              save_opt(&type4.asset, opts, "asset");
> >              save_opt(&type4.part, opts, "part");
> > +            /* If the value is 0, it will take the value from the CPU
> model. */
> > +            type4.processor_id = qemu_opt_get_number(opts,
> "processor-id", 0);
> >              type4.max_speed = qemu_opt_get_number(opts, "max-speed",
> >                                                    DEFAULT_CPU_SPEED);
> >              type4.current_speed = qemu_opt_get_number(opts,
> "current-speed",
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index ec90505d84..3c51b6cf8f 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> >      "                specify SMBIOS type 3 fields\n"
> >      "-smbios
> type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
> >      "
> [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
> > +    "              [,processor-id=%d]\n"
> >      "                specify SMBIOS type 4 fields\n"
> >      "-smbios type=11[,value=str][,path=filename]\n"
> >      "                specify SMBIOS type 11 fields\n"
>
> missing update of SRST part
>

I grepped for SRST, where is this that I need to update also?

Thanks!

--000000000000ea44a105d5de6bc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 11, 2022 at 5:13 AM Igor =
Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu,=C2=A0 6 Jan 2022 14:33:16 -0800<br>
Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank"=
>venture@google.com</a>&gt; wrote:<br>
<br>
&gt; This parameter is to be used in the processor_id lower 32-bit entry in=
<br>
<br>
I&#39;d call it processor_id_lo throughout the patch<br>
or if you prefer to keep current name, then make it support full QWORD<br>
as spec says.<br></blockquote><div><br></div><div>Ack</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; the type 4 table.=C2=A0 The upper 32-bits represent the features for t=
he CPU.<br>
&gt; This patch leaves those as 0 when the lower 32-bits are set.<br>
<br>
why 0 it out instead of using smbios_cpuid_features value?<br></blockquote>=
<div><br></div><div>Because presumably the cpuid_feature value would not ma=
tch whatever override was chosen here.=C2=A0 But I like your idea of just m=
aking it a quadword.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
<br>
&gt; This parameter is set as optional and if left will use the values from=
<br>
&gt; the CPU model.<br>
&gt; <br>
&gt; This enables hiding the host information from the guest and allowing A=
MD<br>
&gt; VMs to run pretending to be Intel for some userspace software concerns=
.<br>
<br>
&gt; Reviewed-by: Peter Foley &lt;<a href=3D"mailto:pefoley@google.com" tar=
get=3D"_blank">pefoley@google.com</a>&gt;<br>
&gt; Reviewed-by: Titus Rwantare &lt;<a href=3D"mailto:titusr@google.com" t=
arget=3D"_blank">titusr@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/smbios/smbios.c | 19 ++++++++++++++++---<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 17 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c<br>
&gt; index 7397e56737..0553ee0b17 100644<br>
&gt; --- a/hw/smbios/smbios.c<br>
&gt; +++ b/hw/smbios/smbios.c<br>
&gt; @@ -104,9 +104,11 @@ static struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *sock_pfx, *manufacturer, *version, *se=
rial, *asset, *part;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t max_speed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t current_speed;<br>
&gt; +=C2=A0 =C2=A0 uint32_t processor_id;<br>
<br>
<br>
<br>
&gt;=C2=A0 } type4 =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .max_speed =3D DEFAULT_CPU_SPEED,<br>
&gt; -=C2=A0 =C2=A0 .current_speed =3D DEFAULT_CPU_SPEED<br>
&gt; +=C2=A0 =C2=A0 .current_speed =3D DEFAULT_CPU_SPEED,<br>
&gt; +=C2=A0 =C2=A0 .processor_id =3D 0,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static struct {<br>
&gt; @@ -327,6 +329,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[]=
 =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;part&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_STRING,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .help =3D &quot;part number&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 }, {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;processor-id&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_NUMBER,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .help =3D &quot;processor id&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { /* end of list */ }<br>
&gt;=C2=A0 };<br>
&gt; @@ -669,8 +675,13 @@ static void smbios_build_type_4_table(MachineStat=
e *ms, unsigned instance)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 t-&gt;processor_type =3D 0x03; /* CPU */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 t-&gt;processor_family =3D 0x01; /* Other */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str=
, type4.manufacturer);<br>
&gt; -=C2=A0 =C2=A0 t-&gt;processor_id[0] =3D cpu_to_le32(smbios_cpuid_vers=
ion);<br>
&gt; -=C2=A0 =C2=A0 t-&gt;processor_id[1] =3D cpu_to_le32(smbios_cpuid_feat=
ures);<br>
&gt; +=C2=A0 =C2=A0 if (type4.processor_id =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;processor_id[0] =3D cpu_to_le32(smb=
ios_cpuid_version);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;processor_id[1] =3D cpu_to_le32(smb=
ios_cpuid_features);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;processor_id[0] =3D cpu_to_le32(typ=
e4.processor_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;processor_id[1] =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SMBIOS_TABLE_SET_STR(4, processor_version_str, typ=
e4.version);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 t-&gt;voltage =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 t-&gt;external_clock =3D cpu_to_le16(0); /* Unknow=
n */<br>
&gt; @@ -1292,6 +1303,8 @@ void smbios_entry_add(QemuOpts *opts, Error **er=
rp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 save_opt(&amp;type4.se=
rial, opts, &quot;serial&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 save_opt(&amp;type4.as=
set, opts, &quot;asset&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 save_opt(&amp;type4.pa=
rt, opts, &quot;part&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the value is 0, it wi=
ll take the value from the CPU model. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type4.processor_id =3D qemu=
_opt_get_number(opts, &quot;processor-id&quot;, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type4.max_speed =3D qe=
mu_opt_get_number(opts, &quot;max-speed&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEFAULT_CPU_SPEED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type4.current_speed =
=3D qemu_opt_get_number(opts, &quot;current-speed&quot;,<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index ec90505d84..3c51b6cf8f 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -2527,6 +2527,7 @@ DEF(&quot;smbios&quot;, HAS_ARG, QEMU_OPTION_smb=
ios,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 specify SMBIOS type 3 fields\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-smbios type=3D4[,sock_pfx=3Dstr][,manufactu=
rer=3Dstr][,version=3Dstr][,serial=3Dstr]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 [,asset=3Dstr][,part=3Dstr][,max-speed=3D%d][,current-speed=3D%d]\n&=
quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[,processor-id=3D%d]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 specify SMBIOS type 4 fields\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-smbios type=3D11[,value=3Dstr][,path=3Dfile=
name]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 specify SMBIOS type 11 fields\n&quot;<br>
<br>
missing update of SRST part<br></blockquote><div><br></div><div>I grepped f=
or SRST, where is this that I need to update also?</div><div><br></div><div=
>Thanks!=C2=A0</div></div></div>

--000000000000ea44a105d5de6bc5--

