Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57F6573E4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 09:25:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pARjO-0005If-Py; Wed, 28 Dec 2022 03:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pARjK-0005IN-Mb
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pARjI-00013c-JJ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672215843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rucWSQ2W5YosR9GHsFYwdD2t/NK9kmgIR+zndIWV+RI=;
 b=SULOzrUJdxiN1YtRZBsXMHmJFJVqotQaHP9PY2gKwyTIdhgy4+xZkVXmnP13p+QWD9X6Ks
 Da7F+B7fneKFYIO1jOSqOi/uVMytbKcxSzMipspOYolo+5f98VdQRckboJAZUwq8Pxz9yw
 FQhax0TYhQflD+k6TP64Mg154TXrYf4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-MF0dD8LKPK-q6lxKRwWotA-1; Wed, 28 Dec 2022 03:24:01 -0500
X-MC-Unique: MF0dD8LKPK-q6lxKRwWotA-1
Received: by mail-vs1-f69.google.com with SMTP id
 s8-20020a056102108800b003b0b1fdbb0eso4007255vsr.23
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 00:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rucWSQ2W5YosR9GHsFYwdD2t/NK9kmgIR+zndIWV+RI=;
 b=v6DZPC2w6loG44xAq30VjnpIsi816gM96jxf+bw1LwmN/adegPh5dMRwhJLItJNzor
 kfaco6t7gpGcB3ezCRHowjF71moX9R5ytuqxYQIuzp0VdXONk/cXh/wHUCHqQ2zvAs9v
 vSkfDsN0dTENM1yg18E9Ppj75RNBklfkAAeWO2BXDkcDhjhY2YOh7eVmOztYspP7qrSN
 Nm7NHLG1tjZK5kHaB5+NCSXAPUSLRWiwjb84u3aM7frt1eO54qtRltNGd+Bq1pzR3nDi
 bjWv/9E6sd0DxvyLYwZcR0gVrxWtmuRK+4lgdH/5DhciNnccslpR7NFcAoFZY5e3vObh
 JfBA==
X-Gm-Message-State: AFqh2krctpYIECayOvmxDdOFA5b3LdYm6K3tvCE7avXlPfZ6hw97+1+S
 Dm1wJKEEGrhJ6vkHh9gOwrbb1dRZ+UhdFt6QC68Zu82l1GoO27iA5T3N3cEuhYA7TTRRW9lYdgm
 6Ne+99c14lCbDNSYWUUyvaSTkliV6XoQ=
X-Received: by 2002:a67:c782:0:b0:3b3:10b1:8e64 with SMTP id
 t2-20020a67c782000000b003b310b18e64mr2915626vsk.42.1672215840965; 
 Wed, 28 Dec 2022 00:24:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu5SwOw77i5C40Sk8Gpiyjn7rkVSP4hpTaWuBjrWzzGOEOJXvOIcbSayCHQfoij2eGTuuvesjc25V1frfFhkRo=
X-Received: by 2002:a67:c782:0:b0:3b3:10b1:8e64 with SMTP id
 t2-20020a67c782000000b003b310b18e64mr2915624vsk.42.1672215840678; Wed, 28 Dec
 2022 00:24:00 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40908952D28C7C0CDD4D469E87139@DM6PR11MB4090.namprd11.prod.outlook.com>
 <CABgObfYvxB-sBy00YhNoRR4bmT8Gz5pNbCpKg5H1Y=4fYCQwgg@mail.gmail.com>
 <DM6PR11MB4090FEDABC2174414D7AE1C987F29@DM6PR11MB4090.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4090FEDABC2174414D7AE1C987F29@DM6PR11MB4090.namprd11.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Dec 2022 09:23:48 +0100
Message-ID: <CABgObfYg7HTwqt0HPMo=TMpkpNrEGLShxKjtts5ntGVv_a2nUQ@mail.gmail.com>
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
To: "Wang, Wenchao" <wenchao.wang@intel.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, haxm-team <haxm-team@intel.com>
Content-Type: multipart/alternative; boundary="0000000000002c04c105f0df1727"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--0000000000002c04c105f0df1727
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does it make sense to just allocate 4k of memory or so?

Paolo

Il mer 28 dic 2022, 03:55 Wang, Wenchao <wenchao.wang@intel.com> ha scritto=
:

> Hi, Paolo,
>
>
>
> Thanks for your reply.
>
>
>
> The reason why the variable xcr0 must be added to the header file of QEMU
> is because HAXM needs QEMU to allocate memory from user space and pass it
> to the kernel. This patch is only used to expand the buffer size of the
> structure, and HAXM will use and maintain this variable.
>
> Without this patch, HAXM v7.8.0 will break support for QEMU and the HAXM
> versions older than 7.8.0 cannot support QEMU with this patch, either. It
> will work on any version since HAXM v7.8.0. I know QEMU treats the
> structure as a black box, but HAXM never supported xcr0 before and the
> structure size is not enough if it has been supported. We have verified t=
he
> patched QEMU and it can launch all guest OSes. Thanks.
>
>
>
>
>
> Best Regards,
>
> Wenchao
>
>
>
> *From:* Paolo Bonzini <pbonzini@redhat.com>
> *Sent:* Tuesday, December 27, 2022 23:13
> *To:* Wang, Wenchao <wenchao.wang@intel.com>
> *Cc:* Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>; qemu-devel <
> qemu-devel@nongnu.org>; haxm-team <haxm-team@intel.com>
> *Subject:* Re: [PATCH] target/i386/hax: Add XCR0 support
>
>
>
>
>
> Il lun 28 nov 2022, 09:12 Wang, Wenchao <wenchao.wang@intel.com> ha
> scritto:
>
> Hi, Philippe,
>
> It is just the full patch. Currently, the implementation of HAXM is
> simple, we did not synchronize the vCPU register for xcr0 from QEMU. HAXM
> will handle the xcr0 state within the kernel space, including
> initialization, update, etc. This patch adds the xcr0 variable for
> allocating extra 8-byte buffer occupation, which will be passed between
> QEMU and HAXM when hax_sync_vcpu_state() is invoked. We have verified the
> patched QEMU and it can launch all guest OSes. Thanks for your comments.
>
>
>
> I don't understand the patch very well, and I am on the phone so it's har=
d
> to check QEMU's HAXM support sources right now. Did HAXM 7.8.0 break
> support for QEMU without this patch, and likewise will QEMU with this pat=
ch
> will HAXM versions older than 7.8.0?
>
>
>
> Or does this work on any version because QEMU treats the struct as a blac=
k
> box?
>
>
>
> Paolo
>
>
>
>
>
>
>
> Best Regards,
> Wenchao
>
> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Sent: Friday, November 25, 2022 21:37
> To: Wang, Wenchao <wenchao.wang@intel.com>; qemu-devel@nongnu.org
> Cc: haxm-team <haxm-team@intel.com>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
>
> Hi,
>
> On 25/11/22 13:18, Wang, Wenchao wrote:
> > Hi, maintainers,
> >
> > As HAXM v7.8.0 is released and it added XCR0 support, could you help
> > to merge this patch to add corresponding support into HAX user space
> > of QEMU? The patch has been included in the attachment. Thanks.
>
> See
>
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting=
-your-patches
> on how to send patches to a mailing list.
>
> >
> > Best Regards,
> >
> > Wenchao
> >
> >  From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:00
> > 2001
> >
> > From: Wenchao Wang <wenchao.wang@intel.com>
> >
> > Date: Fri, 25 Nov 2022 18:37:34 +0800
> >
> > Subject: [PATCH] target/i386/hax: Add XCR0 support
> >
> > Introduce extended control register XCR0 to support XSAVE feature set.
> >
> > Note: This change requires at least HAXM v7.8.0 to support.
> >
> > Reviewed-by: Hang Yuan <hang.yuan@intel.com>
> >
> > Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
> >
> > ---
> >
> > target/i386/hax/hax-interface.h | 2 ++
> >
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/target/i386/hax/hax-interface.h
> > b/target/i386/hax/hax-interface.h
> >
> > index 537ae084e9..1d13bb2380 100644
> >
> > --- a/target/i386/hax/hax-interface.h
> >
> > +++ b/target/i386/hax/hax-interface.h
> >
> > @@ -201,6 +201,8 @@ struct vcpu_state_t {
> >
> >       uint64_t _cr3;
> >
> >       uint64_t _cr4;
> >
> > +    uint64_t _xcr0;
> >
> > +
> >
> >       uint64_t _dr0;
> >
> >       uint64_t _dr1;
> >
> >       uint64_t _dr2;
> >
> > --
> >
> > 2.17.1
> >
>
> Is that the full patch? It is missing the register use in
> hax_sync_vcpu_register()...
>
> Regards,
>
> Phil.
>
>

--0000000000002c04c105f0df1727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Does it make sense to just allocate 4k of memory or so?<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 28 dic 2022, =
03:55 Wang, Wenchao &lt;<a href=3D"mailto:wenchao.wang@intel.com">wenchao.w=
ang@intel.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<div class=3D"m_-8854807677774210165WordSection1">
<p class=3D"MsoNormal">Hi, Paolo,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks for your reply.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">The reason why the variable xcr0 must be added to th=
e header file of QEMU is because HAXM needs QEMU to allocate memory from us=
er space and pass it to the kernel. This patch is only used to expand the b=
uffer size of the structure, and HAXM
 will use and maintain this variable.<u></u><u></u></p>
<p class=3D"MsoNormal">Without this patch, HAXM v7.8.0 will break support f=
or QEMU and the HAXM versions older than 7.8.0 cannot support QEMU with thi=
s patch, either. It will work on any version since HAXM v7.8.0. I know QEMU=
 treats the structure as a black box,
 but HAXM never supported xcr0 before and the structure size is not enough =
if it has been supported. We have verified the patched QEMU and it can laun=
ch all guest OSes. Thanks.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Best Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Wenchao<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Paolo Bonzini &lt;<a href=3D"mailto:pbo=
nzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com<=
/a>&gt; <br>
<b>Sent:</b> Tuesday, December 27, 2022 23:13<br>
<b>To:</b> Wang, Wenchao &lt;<a href=3D"mailto:wenchao.wang@intel.com" targ=
et=3D"_blank" rel=3D"noreferrer">wenchao.wang@intel.com</a>&gt;<br>
<b>Cc:</b> Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;; qemu-d=
evel &lt;<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"=
noreferrer">qemu-devel@nongnu.org</a>&gt;; haxm-team &lt;<a href=3D"mailto:=
haxm-team@intel.com" target=3D"_blank" rel=3D"noreferrer">haxm-team@intel.c=
om</a>&gt;<br>
<b>Subject:</b> Re: [PATCH] target/i386/hax: Add XCR0 support<u></u><u></u>=
</p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><u></u>=C2=A0<u></u><=
/p>
<div>
<div>
<p class=3D"MsoNormal">Il lun 28 nov 2022, 09:12 Wang, Wenchao &lt;<a href=
=3D"mailto:wenchao.wang@intel.com" target=3D"_blank" rel=3D"noreferrer">wen=
chao.wang@intel.com</a>&gt; ha scritto:<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Hi, Philippe,<br>
<br>
It is just the full patch. Currently, the implementation of HAXM is simple,=
 we did not synchronize the vCPU register for xcr0 from QEMU. HAXM will han=
dle the xcr0 state within the kernel space, including initialization, updat=
e, etc. This patch adds the xcr0
 variable for allocating extra 8-byte buffer occupation, which will be pass=
ed between QEMU and HAXM when hax_sync_vcpu_state() is invoked. We have ver=
ified the patched QEMU and it can launch all guest OSes. Thanks for your co=
mments.<u></u><u></u></p>
</blockquote>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I don&#39;t understand the patch very well, and I am=
 on the phone so it&#39;s hard to check QEMU&#39;s HAXM support sources rig=
ht now. Did HAXM 7.8.0 break support for QEMU without this patch, and likew=
ise will QEMU with this patch will HAXM versions
 older than 7.8.0?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Or does this work on any version because QEMU treats=
 the struct as a black box?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Paolo<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal"><br>
<br>
Best Regards,<br>
Wenchao<br>
<br>
-----Original Message-----<br>
From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" =
target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;
<br>
Sent: Friday, November 25, 2022 21:37<br>
To: Wang, Wenchao &lt;<a href=3D"mailto:wenchao.wang@intel.com" target=3D"_=
blank" rel=3D"noreferrer">wenchao.wang@intel.com</a>&gt;;
<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noreferre=
r">qemu-devel@nongnu.org</a><br>
Cc: haxm-team &lt;<a href=3D"mailto:haxm-team@intel.com" target=3D"_blank" =
rel=3D"noreferrer">haxm-team@intel.com</a>&gt;; Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzi=
ni@redhat.com</a>&gt;<br>
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support<br>
<br>
Hi,<br>
<br>
On 25/11/22 13:18, Wang, Wenchao wrote:<br>
&gt; Hi, maintainers,<br>
&gt; <br>
&gt; As HAXM v7.8.0 is released and it added XCR0 support, could you help <=
br>
&gt; to merge this patch to add corresponding support into HAX user space <=
br>
&gt; of QEMU? The patch has been included in the attachment. Thanks.<br>
<br>
See<br>
<a href=3D"https://www.qemu.org/docs/master/devel/submitting-a-patch.html#s=
ubmitting-your-patches" target=3D"_blank" rel=3D"noreferrer">https://www.qe=
mu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches</a=
><br>
on how to send patches to a mailing list.<br>
<br>
&gt; <br>
&gt; Best Regards,<br>
&gt; <br>
&gt; Wenchao<br>
&gt; <br>
&gt;=C2=A0 From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:0=
0 <br>
&gt; 2001<br>
&gt; <br>
&gt; From: Wenchao Wang &lt;<a href=3D"mailto:wenchao.wang@intel.com" targe=
t=3D"_blank" rel=3D"noreferrer">wenchao.wang@intel.com</a>&gt;<br>
&gt; <br>
&gt; Date: Fri, 25 Nov 2022 18:37:34 +0800<br>
&gt; <br>
&gt; Subject: [PATCH] target/i386/hax: Add XCR0 support<br>
&gt; <br>
&gt; Introduce extended control register XCR0 to support XSAVE feature set.=
<br>
&gt; <br>
&gt; Note: This change requires at least HAXM v7.8.0 to support.<br>
&gt; <br>
&gt; Reviewed-by: Hang Yuan &lt;<a href=3D"mailto:hang.yuan@intel.com" targ=
et=3D"_blank" rel=3D"noreferrer">hang.yuan@intel.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Wenchao Wang &lt;<a href=3D"mailto:wenchao.wang@intel.c=
om" target=3D"_blank" rel=3D"noreferrer">wenchao.wang@intel.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; target/i386/hax/hax-interface.h | 2 ++<br>
&gt; <br>
&gt; 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/target/i386/hax/hax-interface.h <br>
&gt; b/target/i386/hax/hax-interface.h<br>
&gt; <br>
&gt; index 537ae084e9..1d13bb2380 100644<br>
&gt; <br>
&gt; --- a/target/i386/hax/hax-interface.h<br>
&gt; <br>
&gt; +++ b/target/i386/hax/hax-interface.h<br>
&gt; <br>
&gt; @@ -201,6 +201,8 @@ struct vcpu_state_t {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t _cr3;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t _cr4;<br>
&gt; <br>
&gt; +=C2=A0=C2=A0=C2=A0 uint64_t _xcr0;<br>
&gt; <br>
&gt; +<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t _dr0;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t _dr1;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t _dr2;<br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
Is that the full patch? It is missing the register use in hax_sync_vcpu_reg=
ister()...<br>
<br>
Regards,<br>
<br>
Phil.<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000002c04c105f0df1727--


