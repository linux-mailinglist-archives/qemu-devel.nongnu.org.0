Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217EA656C5B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 16:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pABe2-0007BR-9A; Tue, 27 Dec 2022 10:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pABdt-0007B3-8L
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 10:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pABdr-0000T2-Ab
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 10:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672154002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+IPZt0VEHfucAgJlA/F+W+UfNUYNQFPXvPgG9/roTc=;
 b=aDbe1MCx5IIHgbSAOOZZZ2up4hOqwKH4K6aMFFExviDvvf9gCQsD9XMZPRVCQox8IgpU/L
 OlJ2uSbUFx5HdzMxTNy4EdV9JMQob4Da4vMJnyzbHrLSqtOUtRUcjYI7+k7bzDEZGsfFF2
 7tfJP6sTArE4NjdqT4/zMCMC/RKSWVQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-y2qoMMfzMOSSPXuDcTjzUA-1; Tue, 27 Dec 2022 10:13:20 -0500
X-MC-Unique: y2qoMMfzMOSSPXuDcTjzUA-1
Received: by mail-vk1-f197.google.com with SMTP id
 20-20020a1f1714000000b003bc77fdf3c9so3394160vkx.14
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 07:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M+IPZt0VEHfucAgJlA/F+W+UfNUYNQFPXvPgG9/roTc=;
 b=1U2Zcm5hoHVyeyQCKfvscG5rlCshWDhbOM75nYYLUKB9zxBYt+RS2CYbn3SQciXRSx
 n02LWwfpZTk3t7INFLYK9z6GT5Vi+pK4sAnxwiH8O5lhMlgjavBZCq2AJHkdSaiqEyOB
 Qc5d1RLtwsY3xfzpAGWtPsobzWfuXuucoVJaKuZvB07y7pMtc8ipL7VqRBnQx/b3uJbo
 sYkQQt5ilmnzc79lm7/Qe0/vjO8X18lFnkjEwuJRUj84q/t9tZfNuZ1ih8WXW6m00f/6
 i8C7BftMEaoAn8E4DklkVrdowMAWlGuRCXPpbgg+VHBOoB9q/JQheVFT+hvMqNdTAOfp
 ZUOg==
X-Gm-Message-State: AFqh2kqPtxGWQaiDn9vv63zeO1YagIPRx1vUnhAxX31/IlVj+XC3DJim
 RzgU6AlFyVKjq9aSsqp/2Zx05TnFt9s8SBzhUKSsRWCKDycrgDqpP/0fJsgHUDKDSlHZzwjc3E4
 bbDWJMU47ROpLrqCSxU0cFtTBu/JrnsU=
X-Received: by 2002:a67:ff85:0:b0:3a6:aae4:cab6 with SMTP id
 v5-20020a67ff85000000b003a6aae4cab6mr2699107vsq.27.1672153999745; 
 Tue, 27 Dec 2022 07:13:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2Y1OE+ZkeCB70OGX0ZJyS22ANTrRWkF6dEHE2ZU0eb02i7kHoxJNFIew7AVGuiINehZZNEj8kaNQzUVJZQqQ=
X-Received: by 2002:a67:ff85:0:b0:3a6:aae4:cab6 with SMTP id
 v5-20020a67ff85000000b003a6aae4cab6mr2699103vsq.27.1672153999415; Tue, 27 Dec
 2022 07:13:19 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40908952D28C7C0CDD4D469E87139@DM6PR11MB4090.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB40908952D28C7C0CDD4D469E87139@DM6PR11MB4090.namprd11.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 27 Dec 2022 16:13:07 +0100
Message-ID: <CABgObfYvxB-sBy00YhNoRR4bmT8Gz5pNbCpKg5H1Y=4fYCQwgg@mail.gmail.com>
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
To: "Wang, Wenchao" <wenchao.wang@intel.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, haxm-team <haxm-team@intel.com>
Content-Type: multipart/alternative; boundary="00000000000025338c05f0d0b1b4"
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

--00000000000025338c05f0d0b1b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 28 nov 2022, 09:12 Wang, Wenchao <wenchao.wang@intel.com> ha scritto=
:

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

I don't understand the patch very well, and I am on the phone so it's hard
to check QEMU's HAXM support sources right now. Did HAXM 7.8.0 break
support for QEMU without this patch, and likewise will QEMU with this patch
will HAXM versions older than 7.8.0?

Or does this work on any version because QEMU treats the struct as a black
box?

Paolo



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

--00000000000025338c05f0d0b1b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 28 nov 2022, 09:12 Wang, Wenchao &lt;<a href=3D=
"mailto:wenchao.wang@intel.com">wenchao.wang@intel.com</a>&gt; ha scritto:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi, Philippe,<br>
<br>
It is just the full patch. Currently, the implementation of HAXM is simple,=
 we did not synchronize the vCPU register for xcr0 from QEMU. HAXM will han=
dle the xcr0 state within the kernel space, including initialization, updat=
e, etc. This patch adds the xcr0 variable for allocating extra 8-byte buffe=
r occupation, which will be passed between QEMU and HAXM when hax_sync_vcpu=
_state() is invoked. We have verified the patched QEMU and it can launch al=
l guest OSes. Thanks for your comments.<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I don&#39;t understand the patch ver=
y well, and I am on the phone so it&#39;s hard to check QEMU&#39;s HAXM sup=
port sources right now. Did HAXM 7.8.0 break support for QEMU without this =
patch, and likewise will QEMU with this patch will HAXM versions older than=
 7.8.0?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Or does this wor=
k on any version because QEMU treats the struct as a black box?</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
<br>
Best Regards,<br>
Wenchao<br>
<br>
-----Original Message-----<br>
From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" =
target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt; <br>
Sent: Friday, November 25, 2022 21:37<br>
To: Wang, Wenchao &lt;<a href=3D"mailto:wenchao.wang@intel.com" target=3D"_=
blank" rel=3D"noreferrer">wenchao.wang@intel.com</a>&gt;; <a href=3D"mailto=
:qemu-devel@nongnu.org" target=3D"_blank" rel=3D"noreferrer">qemu-devel@non=
gnu.org</a><br>
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
ubmitting-your-patches" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your=
-patches</a><br>
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
Phil.<br>
</blockquote></div></div></div>

--00000000000025338c05f0d0b1b4--


