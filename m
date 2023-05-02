Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78426F3DAC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 08:42:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptjhX-0007vU-He; Tue, 02 May 2023 02:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptjhJ-0007uw-Iz; Tue, 02 May 2023 02:41:15 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptjhF-0002qf-Vz; Tue, 02 May 2023 02:41:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64115eef620so32264830b3a.1; 
 Mon, 01 May 2023 23:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683009667; x=1685601667;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPWU1Pf2IHz74p/+gIxa8B3x2pqc4Nbm1eyslx5kDBw=;
 b=kxj33EaLxLLZIDriZkR20XUCEPLbiJRXp4S/Ncp025ntgesVYI1MiTaX2E+a9vf99z
 ugMV1LvTfZFLoPKuXh2bU368IIswIIhaVr04lQpvuurnGR52YI6oIYDUBQmX8GiSuQjE
 VKdo00k9xQzIXaGYHoCqTBvHq3J9a1EDfC1SCP9aNHmkkqtaGr/Eso3rMm+Nu5LWw/el
 pbJnxIRDQSAdqpAnHM6gkKX2qQNPTVpW9DTbBXVHpMsCdTSwohTU0uO7zX7A2YmH66d+
 o6cJdMEduNYblYWBjiCTZadlSF648jhSHvDGHdhoa2a0ohnjBKX/SXbgIl+banbDq56x
 vbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683009667; x=1685601667;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IPWU1Pf2IHz74p/+gIxa8B3x2pqc4Nbm1eyslx5kDBw=;
 b=hax3Ew8N55HYKnRh/pd1UUYiS4YNCCvZY05vg2DBLcMS2yg+V4XVkvoZCoDf2o61qT
 w030iVLdEdLhgrUblq8QV9fhYZqIJHCTS25BOWZol3ArPDYhEUe+4uQaoIvRLomPSfLv
 vtot2qWIsWgnfZGU+cP7SpDx/N3uX2qYbs55WpfLt0NRFAI9PpaWsK1Zz5LK/MxVaYA8
 tbRt4+JJxi9bpjCahJDv488pyFyxyVM31VqePZb7k+afLje0XugfqwWl9Sc+El0fv6dl
 WoRjHDHra14DZh8yMfMK9xp6IQyuWsYQXzdvPSp8HhRn51n0h1waspZSjc47y4WWULwc
 xFdQ==
X-Gm-Message-State: AC+VfDyOtub6Ub/yiYStMVztTSD/NQGOzDuLbkSa8F8Fr9CVwbF9RTWz
 B/HNe97kKe1a9YaShjIPoDY=
X-Google-Smtp-Source: ACHHUZ4GOwzlSMDGbqGDWSCIhzI0cS2s1qZ9dJvDAuIWmZ5QmbJCct8JZckRGb8xKeclzI0hwUhByQ==
X-Received: by 2002:a05:6a20:918f:b0:f0:3fc4:744f with SMTP id
 v15-20020a056a20918f00b000f03fc4744fmr19364035pzd.8.1683009667358; 
 Mon, 01 May 2023 23:41:07 -0700 (PDT)
Received: from localhost ([1.146.121.210]) by smtp.gmail.com with ESMTPSA id
 y189-20020a62cec6000000b00640defda6d2sm14313398pfg.207.2023.05.01.23.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 23:41:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 May 2023 16:41:01 +1000
Message-Id: <CSBL4SMP6M1W.SF2HQGVUNSBA@wheely>
Cc: <qemu-devel@nongnu.org>, <farosas@suse.de>, <danielhb413@gmail.com>,
 "Michael Neuling" <mikey@neuling.org>
Subject: Re: [PATCH v2 2/4] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-3-harshpb@linux.ibm.com>
 <CSBIRIKYBL78.3GGM8KZ1ERZUC@wheely>
 <a00bf0ea-94ce-e20b-f199-4ec3c776f458@linux.ibm.com>
In-Reply-To: <a00bf0ea-94ce-e20b-f199-4ec3c776f458@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue May 2, 2023 at 4:13 PM AEST, Harsh Prateek Bora wrote:
> On 5/2/23 10:19, Nicholas Piggin wrote:
> > On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
> >> @@ -1607,49 +1680,15 @@ static target_ulong h_enter_nested(PowerPCCPU =
*cpu,
> >>           return H_P2;
> >>       }
> >>  =20
> >> -    len =3D sizeof(env->gpr);
> >> -    assert(len =3D=3D sizeof(regs->gpr));
> >> -    memcpy(env->gpr, regs->gpr, len);
> >> -
> >> -    env->lr =3D regs->link;
> >> -    env->ctr =3D regs->ctr;
> >> -    cpu_write_xer(env, regs->xer);
> >> -    ppc_store_cr(env, regs->ccr);
> >> -
> >> -    env->msr =3D regs->msr;
> >> -    env->nip =3D regs->nip;
> >> +    /* restore L2 env from hv_state and ptregs */
> >> +    restore_l2_env(cpu, &hv_state, regs, now);
> >>  =20
> >>       address_space_unmap(CPU(cpu)->as, regs, len, len, false);
> >=20
> > I don't agree this improves readability. It also does more with the
> > guest address space mapped, which may not be a big deal is strictly
> > not an improvement.
> >=20
> > The comment needn't just repeat what the function says, and it does
> > not actually restore the l2 environment. It sets some registers to
> > L2 values, but it also leaves other state.
> >=20
> > I would like to see this in a larger series if it's going somewhere,
> > but at the moment I'd rather leave it as is.
> >=20
> While I agree the routine could be named restore_l2_hvstate_ptregs() as=
=20
> more appropriate, I think it still makes sense to have the body of=20
> enter/exit routines with as minimum LOC as possible, with the help of=20
> minimum helper routines possible.

I don't think that's a good goal. The entirity of entering and exiting
from a nested guest is 279 lines including comments and no more than
one level of control flow. It's tricky code and has worts, but not
because the number of lines.

> Giving semantics to the set of=20
> operations related to ptregs/hvstate register load/store is the first=20
> step towards it.

Those structures are entirely the domain of the hcall API though, so
if anything belongs in the handler functions it is the handling of
those IMO.

> As you have guessed, this is certainly a precursor to another API=20
> version that we have been working on (still a WIP), and helps isolating=
=20
> the code flows for backward compatibiility. Having such changes early=20
> upstream helps stablising changes which are not a really a API/design=20
> change.

Right. Some more abstracting could certainly make sense here, I just
think at this point we need to see the bigger picture.

Thanks,
Nick

