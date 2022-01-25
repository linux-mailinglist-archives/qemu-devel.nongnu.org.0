Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1E49B95F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:57:41 +0100 (CET)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCP8W-000369-FO
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:57:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nCOeJ-0003q3-V5
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:26:30 -0500
Received: from [2607:f8b0:4864:20::92d] (port=41824
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nCOeG-0004ip-Dl
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:26:27 -0500
Received: by mail-ua1-x92d.google.com with SMTP id l1so36481296uap.8
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+wNAUYcY7wuRmIdEDLVXwmMUNZl+f2JW5d6TiWA/lw=;
 b=Rxc4sQccQS+0REENVScLVloW5h+9KuDF9MzBcBJ1JtxIAanDwIADWTg0Gt8EvmKqnp
 uddgIfQ9e2+pTEvytem9fcOuTOYtZurGlbRB0JjCb5qWpzfcBrcfrXsuAjpLosLEcZZW
 n3q293wrCda5iDLiMo6+Yg3YFtoMhju85yd86zRc+m9m5mOo9Pxvmxyb85BIFyhCbfx3
 ZTfIRDmtQ9ZjGlpI7hhQ63X/lrTRFpdTf74AfB8APkeyfSCx5Eyvs/xQ8QN07yw6Ea2u
 r8p4KrQjWhaLUaxT+SQZiyP7Y2AftelgWtc1POBESFvvtcfIbjdWcMNvXqIn9Cq+My/1
 hFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+wNAUYcY7wuRmIdEDLVXwmMUNZl+f2JW5d6TiWA/lw=;
 b=EsoJhCZJe1qL4LrFuoFP1o5Ypg+qfzYwT7Y8gCotpiydRUp+RRkeegpYEhJ5PZSp+P
 dz5VC4+gP74ybrD/Fdh1R5ZeSMoAlfh4/ezlj5cf4Uq2hM6qECUmS+e49XWVJMJ740lE
 B65PlJNo2U3ck0YlJ3Pjm87UAAKExyRBOXSNQH9JZmg0gWYF6nbcAOF1KhV4VCQLtnc2
 sshYf7qtV/pQ5xwdlX7d+RP1Jb6q4/V8/GYzg7n5/btDy/n2YPgXk50431MpvRk824PP
 GCOTNaZHPOvRHaQrnuPfy/hVJiYvmypQkNy9c0KrDIxsOuUzN+vaE+kDw7A1bTD7EPxT
 tzJA==
X-Gm-Message-State: AOAM530qpdCssvzi93+qlPYPr2GDGuUXSsQkPsWg5x/E52XjmRiOpsVb
 bJnu6oDbbFzCLKR+BU3fNu05k7A35DQ5sAI4l1oZDQ==
X-Google-Smtp-Source: ABdhPJwhqFedQJnxRYYrUpoC3q0X4qP1StqNl/8mRv33Sv1RAqo5uGSuV+/kPLR8y/id5IJK72//8Z9ctF499Vb5Rm8=
X-Received: by 2002:a05:6102:11f4:: with SMTP id
 e20mr2763923vsg.21.1643127981502; 
 Tue, 25 Jan 2022 08:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20220124201151.833769-1-venture@google.com>
 <20220125143533.5d8e2848@redhat.com>
In-Reply-To: <20220125143533.5d8e2848@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 25 Jan 2022 08:26:10 -0800
Message-ID: <CAO=notwvSBphK-bz+iF_o0afY=JBxOwx266TatBA=zp0AqmJ4Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/smbios: Add table 4 parameter, "processor-id"
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, ani@anisinha.ca, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Foley <pefoley@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="000000000000a8defb05d66a8bc7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=venture@google.com; helo=mail-ua1-x92d.google.com
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

--000000000000a8defb05d66a8bc7
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 5:35 AM Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 24 Jan 2022 12:11:51 -0800
> Patrick Venture <venture@google.com> wrote:
>
> > This parameter is to be used in the processor_id lower 32-bit entry in
> > the type 4 table.  The upper 32-bits represent the features for the CPU.
> > This patch leaves those as 0 when the lower 32-bits are set.
>
> Did you forget to update commit message ^^^^ ?
>

I did. Oops :)  I will send a quick v3 with that fix.


>
> Other than that patch looks good to me,
> so with commit message fixed:
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
> > This parameter is set as optional and if left will use the values from
> > the CPU model.
> >
> > This enables hiding the host information from the guest and allowing AMD
> > VMs to run pretending to be Intel for some userspace software concerns.
> >
> > Reviewed-by: Peter Foley <pefoley@google.com>
> > Reviewed-by: Titus Rwantare <titusr@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> > v2: Added to SRST options list, upgraded to full 64-bit value.
> > ---
> >  hw/smbios/smbios.c | 19 ++++++++++++++++---
> >  qemu-options.hx    |  3 ++-
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 7397e56737..385b69b0c9 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -104,9 +104,11 @@ static struct {
> >      const char *sock_pfx, *manufacturer, *version, *serial, *asset,
> *part;
> >      uint64_t max_speed;
> >      uint64_t current_speed;
> > +    uint64_t processor_id;
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
> > +        t->processor_id[0] = cpu_to_le32((uint32_t)type4.processor_id);
> > +        t->processor_id[1] = cpu_to_le32(type4.processor_id >> 32);
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
> > index ec90505d84..6256417935 100644
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
> > @@ -2552,7 +2553,7 @@ SRST
> >  ``-smbios
> type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
> >      Specify SMBIOS type 3 fields
> >
> > -``-smbios
> type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]``
> > +``-smbios
> type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
> >      Specify SMBIOS type 4 fields
> >
> >  ``-smbios type=11[,value=str][,path=filename]``
>
>

--000000000000a8defb05d66a8bc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 25, 2022 at 5:35 AM Igor =
Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On M=
on, 24 Jan 2022 12:11:51 -0800<br>
Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank"=
>venture@google.com</a>&gt; wrote:<br>
<br>
&gt; This parameter is to be used in the processor_id lower 32-bit entry in=
<br>
&gt; the type 4 table.=C2=A0 The upper 32-bits represent the features for t=
he CPU.<br>
&gt; This patch leaves those as 0 when the lower 32-bits are set.<br>
<br>
Did you forget to update commit message ^^^^ ?<br></blockquote><div><br></d=
iv><div>I did. Oops :)=C2=A0 I will send a quick v3 with that fix.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Other than that patch looks good to me,<br>
so with commit message fixed:<br>
<br>
Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" targe=
t=3D"_blank">imammedo@redhat.com</a>&gt;<br>
<br>
&gt; This parameter is set as optional and if left will use the values from=
<br>
&gt; the CPU model.<br>
&gt; <br>
&gt; This enables hiding the host information from the guest and allowing A=
MD<br>
&gt; VMs to run pretending to be Intel for some userspace software concerns=
.<br>
&gt; <br>
&gt; Reviewed-by: Peter Foley &lt;<a href=3D"mailto:pefoley@google.com" tar=
get=3D"_blank">pefoley@google.com</a>&gt;<br>
&gt; Reviewed-by: Titus Rwantare &lt;<a href=3D"mailto:titusr@google.com" t=
arget=3D"_blank">titusr@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Added to SRST options list, upgraded to full 64-bit value.<br>
&gt; ---<br>
&gt;=C2=A0 hw/smbios/smbios.c | 19 ++++++++++++++++---<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt;=C2=A0 2 files changed, 18 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c<br>
&gt; index 7397e56737..385b69b0c9 100644<br>
&gt; --- a/hw/smbios/smbios.c<br>
&gt; +++ b/hw/smbios/smbios.c<br>
&gt; @@ -104,9 +104,11 @@ static struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *sock_pfx, *manufacturer, *version, *se=
rial, *asset, *part;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t max_speed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t current_speed;<br>
&gt; +=C2=A0 =C2=A0 uint64_t processor_id;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;processor_id[0] =3D cpu_to_le32((ui=
nt32_t)type4.processor_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;processor_id[1] =3D cpu_to_le32(typ=
e4.processor_id &gt;&gt; 32);<br>
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
&gt; index ec90505d84..6256417935 100644<br>
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
&gt; @@ -2552,7 +2553,7 @@ SRST<br>
&gt;=C2=A0 ``-smbios type=3D3[,manufacturer=3Dstr][,version=3Dstr][,serial=
=3Dstr][,asset=3Dstr][,sku=3Dstr]``<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Specify SMBIOS type 3 fields<br>
&gt;=C2=A0 <br>
&gt; -``-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Ds=
tr][,serial=3Dstr][,asset=3Dstr][,part=3Dstr]``<br>
&gt; +``-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Ds=
tr][,serial=3Dstr][,asset=3Dstr][,part=3Dstr][,processor-id=3D%d]``<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Specify SMBIOS type 4 fields<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ``-smbios type=3D11[,value=3Dstr][,path=3Dfilename]``<br>
<br>
</blockquote></div></div>

--000000000000a8defb05d66a8bc7--

