Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5275E73B1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 08:10:33 +0200 (CEST)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obbtP-0003r8-I2
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 02:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obbkc-0000kL-FH
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obbkY-0007XC-7r
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663912881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yCkznym/nyEvF39G73yPqSebR3JLDsOfXIYgyVMJobQ=;
 b=dVcnRJ8CLYJbq92nrhvY0gsdKk/oz1hGry2mYsARNhmY0+vi6oPP/3OM85/b1lLj6h7KF/
 m2yEhQWQmc7/RGxHnT9wDrKHdMcPwt2yslnFwt7J5c2sCqJUp+5mWr9/Qcx9y3N4G5fOb1
 VEISBZPIiHhm6gblJyYU5UMYsbfaows=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-kd3Tnnx1MfaY6zdPU-_Sog-1; Fri, 23 Sep 2022 02:01:18 -0400
X-MC-Unique: kd3Tnnx1MfaY6zdPU-_Sog-1
Received: by mail-qk1-f199.google.com with SMTP id
 w10-20020a05620a444a00b006ce9917ea1fso8139146qkp.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 23:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yCkznym/nyEvF39G73yPqSebR3JLDsOfXIYgyVMJobQ=;
 b=QRSocrdOujVAL9f+fkOJH1Ae88CPhuQFDT15T2ajVmNdzUlFusBN33OI25sce3MLjh
 q1vwT0agzFUMograVg9tOvx5SIvdTP0ka7kSu2g0R1VdfRvOa8BUBB6/XPldrqCqSPj/
 rVP6Z0mS+2hgBrc5bDJNldRKk/RbefwvpuYtEtEBe1G6hcufkYLJmbdqeun2EKIk1apx
 31CWks4B5MHMGvZJYKbBkGsRUzd/nyHKjJjh7ETyJKueWGQ8HViabdgj6ghDgISMkPkx
 JMA8yJ23/xRzLmr5SIGyFUmCvsWSuZaO1mo/ce+kPBDXnOl9xkkkV4MfCz0Tz3xbGHFU
 WFZw==
X-Gm-Message-State: ACrzQf0h6VrIUoLUviLirwJszWbYIxeWcwXkAvthnssRTu5zBGnm9jq/
 Lt64ejqfn3j4MhLGDFGeku0en1qsTPISXHqEVATAT+4M/RNc5Fr2UiBjSqbrzrj1nnUL/2ERbY/
 zIHlDoHEuPy7PWgF5QTitFOiaXiOwQoA=
X-Received: by 2002:a05:622a:174b:b0:35d:1be5:c65e with SMTP id
 l11-20020a05622a174b00b0035d1be5c65emr3159420qtk.422.1663912878044; 
 Thu, 22 Sep 2022 23:01:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fNlqJUer44AIzxad3X4/rC6qV4PGXUR05dBSD36Ot91yhOFqJcZgk5+8WDQCfeNwk3dbbhCEyUdqwAaNl/Ls=
X-Received: by 2002:a05:622a:174b:b0:35d:1be5:c65e with SMTP id
 l11-20020a05622a174b00b0035d1be5c65emr3159400qtk.422.1663912877817; Thu, 22
 Sep 2022 23:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
 <20220922203345.3r7jteg7l75vcysv@sirius.home.kraxel.org>
In-Reply-To: <20220922203345.3r7jteg7l75vcysv@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 23 Sep 2022 08:00:00 +0200
Message-ID: <CABgObfZS+xW9dTKNy34d0ew1VbxzH8EKtEZO3MwGsX+DUPzWqw@mail.gmail.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, kvm <kvm@vger.kernel.org>, 
 Marcelo Tosatti <mtosatti@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005174c05e951e80f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000005174c05e951e80f
Content-Type: text/plain; charset="UTF-8"

Il gio 22 set 2022, 22:33 Gerd Hoffmann <kraxel@redhat.com> ha scritto:

> On Thu, Sep 22, 2022 at 02:38:02PM +0200, Paolo Bonzini wrote:
> > On Thu, Sep 22, 2022 at 2:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > No.  This will basically inform the guest that host-phys-bits has been
> > > enabled (and pass the number of bits).  So the firmware can make use of
> > > the available address space instead of trying to be as conservative as
> > > possible to avoid going beyond the (unknown) limit.
> >
> > Intel processors that are not extremely old have host-phys-bits equal
> > to 39, 46 or 52. Older processors that had 36, in all likelihood,
> > didn't have IOMMUs (so no big 64-bit BARs).
> >
> > AMD processors have had 48 for a while, though older consumer processors
> had 40.
>
> How reliable is the vendorid?
>

Pretty reliable. In principle it can be changed, but there's no good reason
to do it (especially in a long lived VM) and it requires manual command
line intervention.


> Given newer processors have more than 40 and for older ones we know
> the possible values for the two relevant x86 vendors we could do
> something along the lines of:
>
>    phys-bits >= 41                   -> valid
>    phys-bits == 40    + AuthenticAMD -> valid
>    phys-bits == 36,39 + GenuineIntel -> valid
>    everything else                   -> invalid
>
> Does that look sensible to you?
>

Yes, it does! Is phys-bits == 36 the same as invalid? If so that's even one
fewer special case to handle.

Paolo


> take care,
>   Gerd
>
>

--00000000000005174c05e951e80f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 22 set 2022, 22:33 Gerd Hoffmann &lt;<a href=3D=
"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; ha scritto:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Thu, Sep 22, 2022 at 02:38:02PM +0200, Pao=
lo Bonzini wrote:<br>
&gt; On Thu, Sep 22, 2022 at 2:21 PM Gerd Hoffmann &lt;<a href=3D"mailto:kr=
axel@redhat.com" target=3D"_blank" rel=3D"noreferrer">kraxel@redhat.com</a>=
&gt; wrote:<br>
&gt; &gt; No.=C2=A0 This will basically inform the guest that host-phys-bit=
s has been<br>
&gt; &gt; enabled (and pass the number of bits).=C2=A0 So the firmware can =
make use of<br>
&gt; &gt; the available address space instead of trying to be as conservati=
ve as<br>
&gt; &gt; possible to avoid going beyond the (unknown) limit.<br>
&gt; <br>
&gt; Intel processors that are not extremely old have host-phys-bits equal<=
br>
&gt; to 39, 46 or 52. Older processors that had 36, in all likelihood,<br>
&gt; didn&#39;t have IOMMUs (so no big 64-bit BARs).<br>
&gt; <br>
&gt; AMD processors have had 48 for a while, though older consumer processo=
rs had 40.<br>
<br>
How reliable is the vendorid?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Pretty reliable. In principle it can be change=
d, but there&#39;s no good reason to do it (especially in a long lived VM) =
and it requires manual command line intervention.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Given newer processors have more than 40 and for older ones we know<br>
the possible values for the two relevant x86 vendors we could do<br>
something along the lines of:<br>
<br>
=C2=A0 =C2=A0phys-bits &gt;=3D 41=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; valid<br>
=C2=A0 =C2=A0phys-bits =3D=3D 40=C2=A0 =C2=A0 + AuthenticAMD -&gt; valid<br=
>
=C2=A0 =C2=A0phys-bits =3D=3D 36,39 + GenuineIntel -&gt; valid<br>
=C2=A0 =C2=A0everything else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-&gt; invalid<br>
<br>
Does that look sensible to you?<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Yes, it does! Is phys-bits =3D=3D 36 the sam=
e as invalid? If so that&#39;s even one fewer special case to handle.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div></div>

--00000000000005174c05e951e80f--


