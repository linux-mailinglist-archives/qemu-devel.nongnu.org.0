Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881A6C9C2F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 09:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pghMh-0004aB-Pz; Mon, 27 Mar 2023 03:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1pghMe-0004Zk-V5
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:34:00 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1pghMc-0005xJ-TJ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:34:00 -0400
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5F06C3F2D3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1679902433;
 bh=Gri4w/lbHPuJxHAYl7Xanm5+EexhtGCGvZPxVG9idcQ=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=iHBC+93Pt9rI+d7Ds8p+YrCKqrUYdBDzh+6daD/+XjOyNgtGdM3+9akuS3ZEAKpCF
 ZHmZSyuj6Ie9lgir3RnxZ1KCSY+RV4bN7+abLWvH+Tv0EzMSuSF5AcDb2dTs+xzcLP
 4nUhEKbgdZdp0Iu9QtBO2Z/uIGUn0/9IkEkzkuLIX4ydd3RRRxQYQHFrWPIUKDpl2w
 48mw0QkPjLeLjuUx/b/Md3Odt5BAYXO11fp7HNY3FWDf05X3P4oG4hxSNNs1zqcxf1
 FnrcUrasi6DDYLKwimJPrb6/mCLM40GbibLPa1QB+pUtt9gIdcemlwKTQl31jZwWc0
 8R/sFpyyIjcZg==
Received: by mail-pf1-f199.google.com with SMTP id
 m12-20020a62f20c000000b0062612a76a08so3893907pfh.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 00:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902432; x=1682494432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gri4w/lbHPuJxHAYl7Xanm5+EexhtGCGvZPxVG9idcQ=;
 b=3S5ewpOj/1Bpj+7k9naNlCtaZSri/rbV7HzW8ONk7xuivZxhju8ZUpGTduqjUsh6/6
 Hgg7oEv3N5eolDvG78vd+I7N6HoSJJrfkM0w90I7TlpkpOcJKN1GuFp+r6KpGiwzNNp/
 vrUyAaw2EL9D0VoPQ5wW4Rrn3zG/T9H3Rv7dQKSQoVU26+g87nIOzPN/gun0T5l8SGQ7
 pm4D6QmH+VHdMxbrlUWkgUCI95uo4tUoPqhQHOLShJ4vUeNyPoNiFkPSxrkWCmnVhMtJ
 9ZXc/XHrTJtgdUjrTtDuiEn5bTceWXRf8lET5daBCWTkpwqsDGUagrkZ88FCWA5r2A0y
 9MZg==
X-Gm-Message-State: AAQBX9f0FnuY2qjd/mkeLZCp0sllPGL1huch+ff0b3bPsZ1e/1LO+TJe
 cTzTvH4/xwlS0ZkiJi30OMZEFre5PaPAG4pXAc6eEKklud3gBVQWQnfjwgv4psv88mqC0fA6c7Z
 L3Ic6E0YNUNozYkrGonL18o4J5v2YI5fK0lEd7YmtvNIXaHpE
X-Received: by 2002:a05:6a00:ace:b0:625:5949:6dc0 with SMTP id
 c14-20020a056a000ace00b0062559496dc0mr5462217pfl.4.1679902431794; 
 Mon, 27 Mar 2023 00:33:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YfK2XbG+vJxHARAmYDy/enVYjSwoV43/t15HLbnd286IlRiMCqQcCiwhZw0amMRszH/hFYqx8NMSlImlSwbYc=
X-Received: by 2002:a05:6a00:ace:b0:625:5949:6dc0 with SMTP id
 c14-20020a056a000ace00b0062559496dc0mr5462207pfl.4.1679902431460; Mon, 27 Mar
 2023 00:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221026115745.528314-1-yang.zhong@intel.com>
 <253335ef-5e63-0182-f92b-a576b2459cff@intel.com>
In-Reply-To: <253335ef-5e63-0182-f92b-a576b2459cff@intel.com>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Mon, 27 Mar 2023 09:33:25 +0200
Message-ID: <CAATJJ0JLFA3b=KYP-OKXzritJGY1GuuRh+E4D6XZ3RLa6zKn_g@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] target/i386: Switch back XFRM value
To: "Yang, Weijiang" <weijiang.yang@intel.com>
Cc: "Zhong, Yang" <yang.zhong@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "yang.zhong@linux.intel.com" <yang.zhong@linux.intel.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 2:36=E2=80=AFAM Yang, Weijiang <weijiang.yang@intel=
.com> wrote:
>
>
> On 10/26/2022 7:57 PM, Zhong, Yang wrote:
> > The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
> > FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=3D12,ECX=3D1):{ECX,EDX}, which made
> > SGX enclave only supported SSE and x87 feature(xfrm=3D0x3).
> >
> > Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based feat=
ures")
> >
> > Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
> > ---
> >   target/i386/cpu.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index ad623d91e4..19aaed877b 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t ind=
ex, uint32_t count,
> >           } else {
> >               *eax &=3D env->features[FEAT_SGX_12_1_EAX];
> >               *ebx &=3D 0; /* ebx reserve */
> > -            *ecx &=3D env->features[FEAT_XSAVE_XSS_LO];
> > -            *edx &=3D env->features[FEAT_XSAVE_XSS_HI];
> > +            *ecx &=3D env->features[FEAT_XSAVE_XCR0_LO];
> > +            *edx &=3D env->features[FEAT_XSAVE_XCR0_HI];
>
> Oops, that's my fault to replace with wrong definitions, thanks for the f=
ix!
>
> Reviewed-by:  Yang Weijiang <weijiang.yang@intel.com>

Hi,
I do not have any background on this but stumbled over this and wondered,
is there any particular reason why this wasn't applied yet?

It seemed to fix a former mistake, was acked and then ... silence

> >
> >               /* FP and SSE are always allowed regardless of XSAVE/XCR0=
. */
> >               *ecx |=3D XSTATE_FP_MASK | XSTATE_SSE_MASK;
>


--=20
Christian Ehrhardt
Senior Staff Engineer, Ubuntu Server
Canonical Ltd

