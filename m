Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB49D2AF98A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:09:56 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwRH-0002EC-SI
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcwMi-00060j-HA
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:05:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcwMg-0000Zy-EQ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605125109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F0+qFZ766NjA8E3qdHBXnLN9d2nVuPkJMJcrvQu9PhY=;
 b=Vt7TZwn7CZ7CSDrDKKocB9YTxvi6ydBsqFFMY1FByF8NhW4wZnzCkoScHhVP3LJaTruahw
 eEoYrYFvv58o5t9P+hv/FFK6JKMBM+ykIo/HUz7jZBxKOaPIkbRft/Cs1WeaWu9DxC6oOi
 zMsuP+0h7w1+AXvUpRuCtdZEJsPriq0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-T-9P_eeSPVW6rwWvxsJ1Iw-1; Wed, 11 Nov 2020 15:05:07 -0500
X-MC-Unique: T-9P_eeSPVW6rwWvxsJ1Iw-1
Received: by mail-pg1-f199.google.com with SMTP id z130so1901261pgz.19
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F0+qFZ766NjA8E3qdHBXnLN9d2nVuPkJMJcrvQu9PhY=;
 b=J6DOzPNAsfnPn+4sANoc6Ey33nz5J4rydMmGysWQyyq//awLmMza/O7BMEZdqt149d
 +OZ6jPTrOu+1z69ZUkrQvUtF47c1m/TTPJDBj+dP/LXAe2MXmwF3/5qKmQpXSLe2HyGl
 6fXIM66/7TbGlXpyvuFMCIlkJ7EVoZyhW9oLYOGVFSMCWSFvq6KBobTKwGtkM+/FOhNo
 C00BnGnrkK8ozI7Uj5iqIFoGWsLTDzlUxjUaPDjXKYE9hhCB/42B7+P3hknG37kkHmPb
 E4eJ0Vep0nQVusGPCzZQdfWc3fq+APrWECplQMxZ7IPWWAj9QG67f7nusgeM4UhuSltu
 N43A==
X-Gm-Message-State: AOAM533mllW8OaPVdRqm9XYAtazCFeWF4muWjImCEMm4LZtBV5bVuk9M
 ddC5qihhHd8JlHEI9JWwjkil9Fplg+G1uoLZPxLi+hMdWc0w9Tb2EP2KshPKcxJHnt/m0AHnQyj
 LiyBYqCrw+sFRoT4Ywi2lcRZi2JA/Ps4=
X-Received: by 2002:a65:6086:: with SMTP id t6mr23063019pgu.146.1605125105976; 
 Wed, 11 Nov 2020 12:05:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwInKVXdJDoB2fvbU+XJ88B1bRLqo62eGRWJOVA4S5q9XmoiGyAQYE86/WS1lNYRMZKNs4a8IAi8AoDbTTeffY=
X-Received: by 2002:a65:6086:: with SMTP id t6mr23063002pgu.146.1605125105673; 
 Wed, 11 Nov 2020 12:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-12-pbonzini@redhat.com>
 <20201111205715.2058792e@redhat.com>
In-Reply-To: <20201111205715.2058792e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Nov 2020 21:04:53 +0100
Message-ID: <CABgObfajgDhspSzbuuwhKT=2UZ-SsJS5Py0qrwQvagTKbZoHFw@mail.gmail.com>
Subject: Re: [PATCH 11/29] vl: extract various command line desugaring
 snippets to a new function
To: Igor Mammedov <imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000be87e505b3da4f26"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000be87e505b3da4f26
Content-Type: text/plain; charset="UTF-8"

Il mer 11 nov 2020, 20:57 Igor Mammedov <imammedo@redhat.com> ha scritto:

> On Tue, 27 Oct 2020 14:21:26 -0400
> Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  softmmu/vl.c | 40 ++++++++++++++++++++++------------------
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index c2a5ee61f9..6749109b29 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -126,6 +126,7 @@ static const char *boot_once;
> >  static const char *incoming;
> >  static const char *loadvm;
> >  enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
>
> > +int mem_prealloc; /* force preallocation of physical target memory */
> Is there a reason for it not being static?
>

I will check if I am using it later in the series, but I don't think so.


> >  int display_opengl;
> >  const char* keyboard_layout = NULL;
> >  ram_addr_t ram_size;
> > @@ -159,7 +160,7 @@ int fd_bootchk = 1;
> >  static int no_reboot;
> >  int no_shutdown = 0;
> >  int graphic_rotate = 0;
> > -const char *watchdog;
> > +static const char *watchdog;
> >  QEMUOptionRom option_rom[MAX_OPTION_ROMS];
> >  int nb_option_roms;
> >  int old_param = 0;
> > @@ -2910,6 +2911,25 @@ static void qemu_validate_options(void)
> >  #endif
> >  }
> >
> > +static void qemu_process_sugar_options(void)
> > +{
> > +    if (mem_prealloc) {
> > +        char *val;
> > +
> > +        val = g_strdup_printf("%d",
> > +                 (uint32_t)
> qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> if -smp isn't present it value used here was mc->default_cpus,
> which in most cases is 1 modulo some ARM boards and riscv.
>

Yes, I remember noticing that but decided I would not care. I should have
added it to the commit message, though.

Paolo

--000000000000be87e505b3da4f26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 11 nov 2020, 20:57 Igor Mammedov &lt;<a href=3D=
"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Tue, 27 Oct 2020 14:21:26 -0400<br>
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 softmmu/vl.c | 40 ++++++++++++++++++++++------------------<br>
&gt;=C2=A0 1 file changed, 22 insertions(+), 18 deletions(-)<br>
&gt; <br>
&gt; diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
&gt; index c2a5ee61f9..6749109b29 100644<br>
&gt; --- a/softmmu/vl.c<br>
&gt; +++ b/softmmu/vl.c<br>
&gt; @@ -126,6 +126,7 @@ static const char *boot_once;<br>
&gt;=C2=A0 static const char *incoming;<br>
&gt;=C2=A0 static const char *loadvm;<br>
&gt;=C2=A0 enum vga_retrace_method vga_retrace_method =3D VGA_RETRACE_DUMB;=
<br>
<br>
&gt; +int mem_prealloc; /* force preallocation of physical target memory */=
<br>
Is there a reason for it not being static?<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I will check if I am using it lat=
er in the series, but I don&#39;t think so.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
&gt;=C2=A0 int display_opengl;<br>
&gt;=C2=A0 const char* keyboard_layout =3D NULL;<br>
&gt;=C2=A0 ram_addr_t ram_size;<br>
&gt; @@ -159,7 +160,7 @@ int fd_bootchk =3D 1;<br>
&gt;=C2=A0 static int no_reboot;<br>
&gt;=C2=A0 int no_shutdown =3D 0;<br>
&gt;=C2=A0 int graphic_rotate =3D 0;<br>
&gt; -const char *watchdog;<br>
&gt; +static const char *watchdog;<br>
&gt;=C2=A0 QEMUOptionRom option_rom[MAX_OPTION_ROMS];<br>
&gt;=C2=A0 int nb_option_roms;<br>
&gt;=C2=A0 int old_param =3D 0;<br>
&gt; @@ -2910,6 +2911,25 @@ static void qemu_validate_options(void)<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void qemu_process_sugar_options(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (mem_prealloc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D g_strdup_printf(&quot;%d&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint32=
_t) qemu_opt_get_number(qemu_find_opts_singleton(&quot;smp-opts&quot;), &qu=
ot;cpus&quot;, 1));<br>
if -smp isn&#39;t present it value used here was mc-&gt;default_cpus,<br>
which in most cases is 1 modulo some ARM boards and riscv.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, I remember n=
oticing that but decided I would not care. I should have added it to the co=
mmit message, though.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pa=
olo</div></div>

--000000000000be87e505b3da4f26--


