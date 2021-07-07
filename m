Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350B3BE34D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 08:53:41 +0200 (CEST)
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m11RD-0007oj-Tp
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 02:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m11PC-0006LL-ED
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 02:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m11P5-000503-9G
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 02:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625640685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z20pr/U4w6MYwDWONggAoyvnBbT7G67mrH7WwnYAhc0=;
 b=Gbqq7adzTPLDT2EPTD/Gmy1w4xJKV8Nvr/6X2qrnbu0Azy51DL3cvYZUPRzzVwN7iDDdBn
 qd+2PPz1pXdzXJQjmJOxTBUp6MQM4Qfgr5RJseTCBvwrXTvVFLQb5SQ2KTveA55LkmLeEE
 zhpKWaoJEZS1Lg2C4aUTg93xzBtCba8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-LrHfEJbBMsKucHbcVWCfNg-1; Wed, 07 Jul 2021 02:51:21 -0400
X-MC-Unique: LrHfEJbBMsKucHbcVWCfNg-1
Received: by mail-pl1-f197.google.com with SMTP id
 a6-20020a1709027d86b02901019f88b046so505906plm.21
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 23:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z20pr/U4w6MYwDWONggAoyvnBbT7G67mrH7WwnYAhc0=;
 b=g+Pe9MzPLGd1TrzSvTWDWmRdoXTlS5y5io3AGIhIVjjyvhYIy0WMxNjVBKc9DKqyVh
 8PnsJtZ/eMJ2rjVfn79cs7cq1zPsmmAQnTrH7we81A0TouUFi5RmthUK2tRZ9IxiRI0Z
 Ak3QXdQ9verlZ7dZki1e6KKqheUdE21zp3u7SQ+9kUY9ldRTsvRLSXI6HoiDgki9c5rx
 PyrAwBGA9w0wkswQ1ST5kqM1hDmUfJmyFNO+7UypNatMS8JgipVHw/elNU0X5ye7lt6w
 aR5HQm+cZQU9WlUtWHOVVDQz4D1s/jYL86h92q9njrJDX63Ec4pRtS/Mp8EUCb2WH64v
 2Pfg==
X-Gm-Message-State: AOAM530DBsg7LuUvTq/IeAJsviYR0O9as7kJKhMojCgalnMDCpBT3O1p
 5wLxLzqFCkPKHILyFfy37pAsVHX1rZyKIorTLN59tPill/iuU7r5hIcF+nqh6+cyyIggcopSw0S
 B9Ngjs/JX4qnSi60cb29fbBcCLVjPbWU=
X-Received: by 2002:a63:5cb:: with SMTP id 194mr24442341pgf.146.1625640680568; 
 Tue, 06 Jul 2021 23:51:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgV7TX7itrkYhqGwIWfl1vnL5M6DN6Gx0AFjquD2Vr1z4BRlG5LuBcckSdl8OV3e+cdt0ktarMAuZk2C/EWMI=
X-Received: by 2002:a63:5cb:: with SMTP id 194mr24442331pgf.146.1625640680370; 
 Tue, 06 Jul 2021 23:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
 <20210705104632.2902400-9-david.edmondson@oracle.com>
 <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org>
In-Reply-To: <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 7 Jul 2021 08:51:08 +0200
Message-ID: <CABgObfZ4aczr5HVEAOUgjrWWfT3m-NzLyXG2mX-86kf1Gd_Gqw@mail.gmail.com>
Subject: Re: [RFC PATCH 8/8] target/i386: Move X86XSaveArea into TCG
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004940f005c682f785"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 David Edmondson <david.edmondson@oracle.com>, Babu Moger <babu.moger@amd.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004940f005c682f785
Content-Type: text/plain; charset="UTF-8"

Migration from KVM to TCG is broken anyway. The changing offsets do break
migration of a KVM guest from Intel to AMD or vice versa, because of the
difference in CPUID. That however is not changed by this patch.

Paolo

Il mer 7 lug 2021, 03:09 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 7/5/21 3:46 AM, David Edmondson wrote:
> > Given that TCG is now the only consumer of X86XSaveArea, move the
> > structure definition and associated offset declarations and checks to a
> > TCG specific header.
> >
> > Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> > ---
> >   target/i386/cpu.h            | 57 ------------------------------------
> >   target/i386/tcg/fpu_helper.c |  1 +
> >   target/i386/tcg/tcg-cpu.h    | 57 ++++++++++++++++++++++++++++++++++++
> >   3 files changed, 58 insertions(+), 57 deletions(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 96b672f8bd..0f7ddbfeae 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1305,48 +1305,6 @@ typedef struct XSavePKRU {
> >       uint32_t padding;
> >   } XSavePKRU;
> >
> > -#define XSAVE_FCW_FSW_OFFSET    0x000
> > -#define XSAVE_FTW_FOP_OFFSET    0x004
> > -#define XSAVE_CWD_RIP_OFFSET    0x008
> > -#define XSAVE_CWD_RDP_OFFSET    0x010
> > -#define XSAVE_MXCSR_OFFSET      0x018
> > -#define XSAVE_ST_SPACE_OFFSET   0x020
> > -#define XSAVE_XMM_SPACE_OFFSET  0x0a0
> > -#define XSAVE_XSTATE_BV_OFFSET  0x200
> > -#define XSAVE_AVX_OFFSET        0x240
> > -#define XSAVE_BNDREG_OFFSET     0x3c0
> > -#define XSAVE_BNDCSR_OFFSET     0x400
> > -#define XSAVE_OPMASK_OFFSET     0x440
> > -#define XSAVE_ZMM_HI256_OFFSET  0x480
> > -#define XSAVE_HI16_ZMM_OFFSET   0x680
> > -#define XSAVE_PKRU_OFFSET       0xa80
> > -
> > -typedef struct X86XSaveArea {
> > -    X86LegacyXSaveArea legacy;
> > -    X86XSaveHeader header;
> > -
> > -    /* Extended save areas: */
> > -
> > -    /* AVX State: */
> > -    XSaveAVX avx_state;
> > -
> > -    /* Ensure that XSaveBNDREG is properly aligned. */
> > -    uint8_t padding[XSAVE_BNDREG_OFFSET
> > -                    - sizeof(X86LegacyXSaveArea)
> > -                    - sizeof(X86XSaveHeader)
> > -                    - sizeof(XSaveAVX)];
> > -
> > -    /* MPX State: */
> > -    XSaveBNDREG bndreg_state;
> > -    XSaveBNDCSR bndcsr_state;
> > -    /* AVX-512 State: */
> > -    XSaveOpmask opmask_state;
> > -    XSaveZMM_Hi256 zmm_hi256_state;
> > -    XSaveHi16_ZMM hi16_zmm_state;
> > -    /* PKRU State: */
> > -    XSavePKRU pkru_state;
> > -} X86XSaveArea;
> > -
> >   QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
> >   QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
> >   QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
> > @@ -1355,21 +1313,6 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) !=
> 0x200);
> >   QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
> >   QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
> >
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) !=
> XSAVE_FCW_FSW_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) !=
> XSAVE_FTW_FOP_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) !=
> XSAVE_CWD_RIP_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) !=
> XSAVE_CWD_RDP_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) !=
> XSAVE_MXCSR_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) !=
> XSAVE_ST_SPACE_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) !=
> XSAVE_XMM_SPACE_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) !=
> XSAVE_AVX_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) !=
> XSAVE_BNDREG_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) !=
> XSAVE_BNDCSR_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) !=
> XSAVE_OPMASK_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) !=
> XSAVE_ZMM_HI256_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) !=
> XSAVE_HI16_ZMM_OFFSET);
> > -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) !=
> XSAVE_PKRU_OFFSET);
> > -
> >   typedef struct ExtSaveArea {
> >       uint32_t feature, bits;
> >       uint32_t offset, size;
> > diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> > index 4e11965067..74bbe94b80 100644
> > --- a/target/i386/tcg/fpu_helper.c
> > +++ b/target/i386/tcg/fpu_helper.c
> > @@ -20,6 +20,7 @@
> >   #include "qemu/osdep.h"
> >   #include <math.h>
> >   #include "cpu.h"
> > +#include "tcg-cpu.h"
> >   #include "exec/helper-proto.h"
> >   #include "fpu/softfloat.h"
> >   #include "fpu/softfloat-macros.h"
> > diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
> > index 36bd300af0..53a8494455 100644
> > --- a/target/i386/tcg/tcg-cpu.h
> > +++ b/target/i386/tcg/tcg-cpu.h
> > @@ -19,6 +19,63 @@
> >   #ifndef TCG_CPU_H
> >   #define TCG_CPU_H
> >
> > +#define XSAVE_FCW_FSW_OFFSET    0x000
> > +#define XSAVE_FTW_FOP_OFFSET    0x004
> > +#define XSAVE_CWD_RIP_OFFSET    0x008
> > +#define XSAVE_CWD_RDP_OFFSET    0x010
> > +#define XSAVE_MXCSR_OFFSET      0x018
> > +#define XSAVE_ST_SPACE_OFFSET   0x020
> > +#define XSAVE_XMM_SPACE_OFFSET  0x0a0
> > +#define XSAVE_XSTATE_BV_OFFSET  0x200
> > +#define XSAVE_AVX_OFFSET        0x240
> > +#define XSAVE_BNDREG_OFFSET     0x3c0
> > +#define XSAVE_BNDCSR_OFFSET     0x400
> > +#define XSAVE_OPMASK_OFFSET     0x440
> > +#define XSAVE_ZMM_HI256_OFFSET  0x480
> > +#define XSAVE_HI16_ZMM_OFFSET   0x680
> > +#define XSAVE_PKRU_OFFSET       0xa80
> > +
> > +typedef struct X86XSaveArea {
> > +    X86LegacyXSaveArea legacy;
> > +    X86XSaveHeader header;
> > +
> > +    /* Extended save areas: */
> > +
> > +    /* AVX State: */
> > +    XSaveAVX avx_state;
> > +
> > +    /* Ensure that XSaveBNDREG is properly aligned. */
> > +    uint8_t padding[XSAVE_BNDREG_OFFSET
> > +                    - sizeof(X86LegacyXSaveArea)
> > +                    - sizeof(X86XSaveHeader)
> > +                    - sizeof(XSaveAVX)];
> > +
> > +    /* MPX State: */
> > +    XSaveBNDREG bndreg_state;
> > +    XSaveBNDCSR bndcsr_state;
> > +    /* AVX-512 State: */
> > +    XSaveOpmask opmask_state;
> > +    XSaveZMM_Hi256 zmm_hi256_state;
> > +    XSaveHi16_ZMM hi16_zmm_state;
> > +    /* PKRU State: */
> > +    XSavePKRU pkru_state;
> > +} X86XSaveArea;
> > +
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) !=
> XSAVE_FCW_FSW_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) !=
> XSAVE_FTW_FOP_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) !=
> XSAVE_CWD_RIP_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) !=
> XSAVE_CWD_RDP_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) !=
> XSAVE_MXCSR_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) !=
> XSAVE_ST_SPACE_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) !=
> XSAVE_XMM_SPACE_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) !=
> XSAVE_AVX_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) !=
> XSAVE_BNDREG_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) !=
> XSAVE_BNDCSR_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) !=
> XSAVE_OPMASK_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) !=
> XSAVE_ZMM_HI256_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) !=
> XSAVE_HI16_ZMM_OFFSET);
> > +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) !=
> XSAVE_PKRU_OFFSET);
>
> My only quibble is that these offsets are otherwise unused.  This just
> becomes validation
> of compiler layout.
>
> I presume that XSAVE_BNDREG_OFFSET is not merely
> ROUND_UP(offsetof(avx_state) +
> sizeof(avx_state), some_pow2)?
>
> Do these offsets need to be migrated?  Otherwise, how can one start a vm
> with kvm and then
> migrate to tcg?  I presume the offsets above are constant for a given cpu,
> and that
> whatever cpu provides different offsets is not supported by tcg?  Given
> the lack of avx,
> that's trivial these days...
>
>
> r~
>
>

--0000000000004940f005c682f785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Migration from KVM to TCG is broken anyway. The changing =
offsets do break migration of a KVM guest from Intel to AMD or vice versa, =
because of the difference in CPUID. That however is not changed by this pat=
ch.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 7 lug 20=
21, 03:09 Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org">richard.henderson@linaro.org</a>&gt; ha scritto:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On 7/5/21 3:46 AM, David Edmondson wrote:<br>
&gt; Given that TCG is now the only consumer of X86XSaveArea, move the<br>
&gt; structure definition and associated offset declarations and checks to =
a<br>
&gt; TCG specific header.<br>
&gt; <br>
&gt; Signed-off-by: David Edmondson &lt;<a href=3D"mailto:david.edmondson@o=
racle.com" target=3D"_blank" rel=3D"noreferrer">david.edmondson@oracle.com<=
/a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/i386/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 57 ------------------------------------<br>
&gt;=C2=A0 =C2=A0target/i386/tcg/fpu_helper.c |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0target/i386/tcg/tcg-cpu.h=C2=A0 =C2=A0 | 57 ++++++++++++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 58 insertions(+), 57 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/i386/cpu.h b/target/i386/cpu.h<br>
&gt; index 96b672f8bd..0f7ddbfeae 100644<br>
&gt; --- a/target/i386/cpu.h<br>
&gt; +++ b/target/i386/cpu.h<br>
&gt; @@ -1305,48 +1305,6 @@ typedef struct XSavePKRU {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t padding;<br>
&gt;=C2=A0 =C2=A0} XSavePKRU;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define XSAVE_FCW_FSW_OFFSET=C2=A0 =C2=A0 0x000<br>
&gt; -#define XSAVE_FTW_FOP_OFFSET=C2=A0 =C2=A0 0x004<br>
&gt; -#define XSAVE_CWD_RIP_OFFSET=C2=A0 =C2=A0 0x008<br>
&gt; -#define XSAVE_CWD_RDP_OFFSET=C2=A0 =C2=A0 0x010<br>
&gt; -#define XSAVE_MXCSR_OFFSET=C2=A0 =C2=A0 =C2=A0 0x018<br>
&gt; -#define XSAVE_ST_SPACE_OFFSET=C2=A0 =C2=A00x020<br>
&gt; -#define XSAVE_XMM_SPACE_OFFSET=C2=A0 0x0a0<br>
&gt; -#define XSAVE_XSTATE_BV_OFFSET=C2=A0 0x200<br>
&gt; -#define XSAVE_AVX_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x240<br>
&gt; -#define XSAVE_BNDREG_OFFSET=C2=A0 =C2=A0 =C2=A00x3c0<br>
&gt; -#define XSAVE_BNDCSR_OFFSET=C2=A0 =C2=A0 =C2=A00x400<br>
&gt; -#define XSAVE_OPMASK_OFFSET=C2=A0 =C2=A0 =C2=A00x440<br>
&gt; -#define XSAVE_ZMM_HI256_OFFSET=C2=A0 0x480<br>
&gt; -#define XSAVE_HI16_ZMM_OFFSET=C2=A0 =C2=A00x680<br>
&gt; -#define XSAVE_PKRU_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A00xa80<br>
&gt; -<br>
&gt; -typedef struct X86XSaveArea {<br>
&gt; -=C2=A0 =C2=A0 X86LegacyXSaveArea legacy;<br>
&gt; -=C2=A0 =C2=A0 X86XSaveHeader header;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Extended save areas: */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* AVX State: */<br>
&gt; -=C2=A0 =C2=A0 XSaveAVX avx_state;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Ensure that XSaveBNDREG is properly aligned. */<br>
&gt; -=C2=A0 =C2=A0 uint8_t padding[XSAVE_BNDREG_OFFSET<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - sizeof(X86LegacyXSaveArea)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - sizeof(X86XSaveHeader)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - sizeof(XSaveAVX)];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* MPX State: */<br>
&gt; -=C2=A0 =C2=A0 XSaveBNDREG bndreg_state;<br>
&gt; -=C2=A0 =C2=A0 XSaveBNDCSR bndcsr_state;<br>
&gt; -=C2=A0 =C2=A0 /* AVX-512 State: */<br>
&gt; -=C2=A0 =C2=A0 XSaveOpmask opmask_state;<br>
&gt; -=C2=A0 =C2=A0 XSaveZMM_Hi256 zmm_hi256_state;<br>
&gt; -=C2=A0 =C2=A0 XSaveHi16_ZMM hi16_zmm_state;<br>
&gt; -=C2=A0 =C2=A0 /* PKRU State: */<br>
&gt; -=C2=A0 =C2=A0 XSavePKRU pkru_state;<br>
&gt; -} X86XSaveArea;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) !=3D 0x100);<br>
&gt;=C2=A0 =C2=A0QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) !=3D 0x40);<br>
&gt;=C2=A0 =C2=A0QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) !=3D 0x40);<br>
&gt; @@ -1355,21 +1313,6 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) !=3D 0=
x200);<br>
&gt;=C2=A0 =C2=A0QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) !=3D 0x400);<br>
&gt;=C2=A0 =C2=A0QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) !=3D 0x8);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) !=3D XSAVE_FCW_F=
SW_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) !=3D XSAVE_FTW_F=
OP_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) !=3D XSAVE_CWD_=
RIP_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) !=3D XSAVE_CWD_=
RDP_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) !=3D XSAVE_MXC=
SR_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) !=3D XSAVE_ST=
_SPACE_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) !=3D XSAVE_=
XMM_SPACE_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) !=3D XSAVE_AVX_OF=
FSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) !=3D XSAVE_BND=
REG_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) !=3D XSAVE_BND=
CSR_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) !=3D XSAVE_OPM=
ASK_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) !=3D XSAVE_=
ZMM_HI256_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) !=3D XSAVE_H=
I16_ZMM_OFFSET);<br>
&gt; -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) !=3D XSAVE_PKRU_=
OFFSET);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0typedef struct ExtSaveArea {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t feature, bits;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t offset, size;<br>
&gt; diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper=
.c<br>
&gt; index 4e11965067..74bbe94b80 100644<br>
&gt; --- a/target/i386/tcg/fpu_helper.c<br>
&gt; +++ b/target/i386/tcg/fpu_helper.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &lt;math.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt; +#include &quot;tcg-cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/helper-proto.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;fpu/softfloat.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;fpu/softfloat-macros.h&quot;<br>
&gt; diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h<br>
&gt; index 36bd300af0..53a8494455 100644<br>
&gt; --- a/target/i386/tcg/tcg-cpu.h<br>
&gt; +++ b/target/i386/tcg/tcg-cpu.h<br>
&gt; @@ -19,6 +19,63 @@<br>
&gt;=C2=A0 =C2=A0#ifndef TCG_CPU_H<br>
&gt;=C2=A0 =C2=A0#define TCG_CPU_H<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#define XSAVE_FCW_FSW_OFFSET=C2=A0 =C2=A0 0x000<br>
&gt; +#define XSAVE_FTW_FOP_OFFSET=C2=A0 =C2=A0 0x004<br>
&gt; +#define XSAVE_CWD_RIP_OFFSET=C2=A0 =C2=A0 0x008<br>
&gt; +#define XSAVE_CWD_RDP_OFFSET=C2=A0 =C2=A0 0x010<br>
&gt; +#define XSAVE_MXCSR_OFFSET=C2=A0 =C2=A0 =C2=A0 0x018<br>
&gt; +#define XSAVE_ST_SPACE_OFFSET=C2=A0 =C2=A00x020<br>
&gt; +#define XSAVE_XMM_SPACE_OFFSET=C2=A0 0x0a0<br>
&gt; +#define XSAVE_XSTATE_BV_OFFSET=C2=A0 0x200<br>
&gt; +#define XSAVE_AVX_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x240<br>
&gt; +#define XSAVE_BNDREG_OFFSET=C2=A0 =C2=A0 =C2=A00x3c0<br>
&gt; +#define XSAVE_BNDCSR_OFFSET=C2=A0 =C2=A0 =C2=A00x400<br>
&gt; +#define XSAVE_OPMASK_OFFSET=C2=A0 =C2=A0 =C2=A00x440<br>
&gt; +#define XSAVE_ZMM_HI256_OFFSET=C2=A0 0x480<br>
&gt; +#define XSAVE_HI16_ZMM_OFFSET=C2=A0 =C2=A00x680<br>
&gt; +#define XSAVE_PKRU_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A00xa80<br>
&gt; +<br>
&gt; +typedef struct X86XSaveArea {<br>
&gt; +=C2=A0 =C2=A0 X86LegacyXSaveArea legacy;<br>
&gt; +=C2=A0 =C2=A0 X86XSaveHeader header;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Extended save areas: */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* AVX State: */<br>
&gt; +=C2=A0 =C2=A0 XSaveAVX avx_state;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Ensure that XSaveBNDREG is properly aligned. */<br>
&gt; +=C2=A0 =C2=A0 uint8_t padding[XSAVE_BNDREG_OFFSET<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - sizeof(X86LegacyXSaveArea)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - sizeof(X86XSaveHeader)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - sizeof(XSaveAVX)];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* MPX State: */<br>
&gt; +=C2=A0 =C2=A0 XSaveBNDREG bndreg_state;<br>
&gt; +=C2=A0 =C2=A0 XSaveBNDCSR bndcsr_state;<br>
&gt; +=C2=A0 =C2=A0 /* AVX-512 State: */<br>
&gt; +=C2=A0 =C2=A0 XSaveOpmask opmask_state;<br>
&gt; +=C2=A0 =C2=A0 XSaveZMM_Hi256 zmm_hi256_state;<br>
&gt; +=C2=A0 =C2=A0 XSaveHi16_ZMM hi16_zmm_state;<br>
&gt; +=C2=A0 =C2=A0 /* PKRU State: */<br>
&gt; +=C2=A0 =C2=A0 XSavePKRU pkru_state;<br>
&gt; +} X86XSaveArea;<br>
&gt; +<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) !=3D XSAVE_FCW_F=
SW_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) !=3D XSAVE_FTW_F=
OP_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) !=3D XSAVE_CWD_=
RIP_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) !=3D XSAVE_CWD_=
RDP_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) !=3D XSAVE_MXC=
SR_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) !=3D XSAVE_ST=
_SPACE_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) !=3D XSAVE_=
XMM_SPACE_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) !=3D XSAVE_AVX_OF=
FSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) !=3D XSAVE_BND=
REG_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) !=3D XSAVE_BND=
CSR_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) !=3D XSAVE_OPM=
ASK_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) !=3D XSAVE_=
ZMM_HI256_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) !=3D XSAVE_H=
I16_ZMM_OFFSET);<br>
&gt; +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) !=3D XSAVE_PKRU_=
OFFSET);<br>
<br>
My only quibble is that these offsets are otherwise unused.=C2=A0 This just=
 becomes validation <br>
of compiler layout.<br>
<br>
I presume that XSAVE_BNDREG_OFFSET is not merely ROUND_UP(offsetof(avx_stat=
e) + <br>
sizeof(avx_state), some_pow2)?<br>
<br>
Do these offsets need to be migrated?=C2=A0 Otherwise, how can one start a =
vm with kvm and then <br>
migrate to tcg?=C2=A0 I presume the offsets above are constant for a given =
cpu, and that <br>
whatever cpu provides different offsets is not supported by tcg?=C2=A0 Give=
n the lack of avx, <br>
that&#39;s trivial these days...<br>
<br>
<br>
r~<br>
<br>
</blockquote></div>

--0000000000004940f005c682f785--


