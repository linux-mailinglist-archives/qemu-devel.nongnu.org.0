Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E670142D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 05:29:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxfvb-00062g-Qb; Fri, 12 May 2023 23:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pxfvV-000625-B6; Fri, 12 May 2023 23:28:09 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pxfvT-0004lz-6T; Fri, 12 May 2023 23:28:09 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-51f6461af24so7457428a12.2; 
 Fri, 12 May 2023 20:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683948485; x=1686540485;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zywCEXddpDLcwcHMWBalZ6nO2l24DcAo+KLfG9x+T40=;
 b=lYK0goIqjhQlBikJlGod01XBumdTWrMx5d8DdwEoZ1uOPblw50pM7MqA+gZAcpKePS
 l7LkHWkTLSWxPH2+u9W/USjOfMHwRcd4iuHDaoLjS8bn/8QVh+cPMGtqel53Jl7ZcJ/g
 F7Jz0qjRJFSTObR/mPCYBMB/7SyqUpY2b/SrGaCLFOFjavsaLFJzU2+DzU6v2H16ZBgD
 qEvvE4IVI1ePJYUvQ/X7EuIEwL/4Fs4WNWLe+Z/zSNQxBpeYDmKu0laa9vaPunnoDcTH
 1HVMvSTii1zvlLYLfdxNDK0carvAxfLOC9+FEXg9DA++h/SJh8yclUYCyFOYfWUSH++L
 uU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683948485; x=1686540485;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zywCEXddpDLcwcHMWBalZ6nO2l24DcAo+KLfG9x+T40=;
 b=ArGq+LKppPXKCbWReWTYW9LXZe90INfUhLNyufvIXeHeMqHbAZ+ZeP/Apu5FWib65g
 hl/dN411JuEqcWE4UWLPIYV8/cP/41myBO7HokelfMgbhsXiup8z5n3XvyV8xRE2fx+C
 kfJIwlC7BmUk8uVpt+nac8GLTstfJvP6xU4Bcu/2tHIc30McxxUWrZhhf4xSPK7EQZyx
 dYdxFvEGdzjgR+eC/B/w7zFUxR/55mIbtS6Xva/eim+fdLl7ptVj1LMi8iwTGRgszsPa
 PJHTNJ8QdmbfroQOUM3uuve4KBQ/UT/sRnGum65ZRenGajqIDfF0bE9smSDQkpSLNuCs
 EG7w==
X-Gm-Message-State: AC+VfDzzAdYnrb3p1NHBRTmeLG4bDFM92MtMj6QcP06Hp89bTGXxbEUA
 OchzplpsL6WndIJfSy+FwW6Jc859rFM=
X-Google-Smtp-Source: ACHHUZ4p0b/BuCGhZYdLd8nSlkpfFvL6StIcvzFWfr/YWO4X8mMsRMXk3LM9gfAy78MXSqzwRpeN/g==
X-Received: by 2002:a17:903:41c3:b0:1a9:6b57:f400 with SMTP id
 u3-20020a17090341c300b001a96b57f400mr35192638ple.16.1683948484580; 
 Fri, 12 May 2023 20:28:04 -0700 (PDT)
Received: from localhost ([1.146.114.250]) by smtp.gmail.com with ESMTPSA id
 g12-20020a170902740c00b0019a5aa7eab0sm8699671pll.54.2023.05.12.20.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 20:28:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 May 2023 13:27:58 +1000
Message-Id: <CSKTWZM7SQV2.1RQ5UDVUCVHVU@wheely>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
Cc: <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 2/4] spapr: Add a nested state struct
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230503003954.128188-1-npiggin@gmail.com>
 <20230503003954.128188-3-npiggin@gmail.com>
 <516d30a6-a329-d361-feea-e616e936dd41@linux.ibm.com>
In-Reply-To: <516d30a6-a329-d361-feea-e616e936dd41@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x536.google.com
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

On Fri May 5, 2023 at 8:54 PM AEST, Harsh Prateek Bora wrote:
> <correcting my email in CC>
>
> On 5/3/23 06:09, Nicholas Piggin wrote:
> > @@ -1593,12 +1713,14 @@ static target_ulong h_enter_nested(PowerPCCPU *=
cpu,
> >           return H_PARAMETER;
> >       }
> >  =20
> > -    spapr_cpu->nested_host_state =3D g_try_new(CPUPPCState, 1);
> > +    spapr_cpu->nested_host_state =3D g_try_new(struct nested_ppc_state=
, 1);
> >       if (!spapr_cpu->nested_host_state) {
> >           return H_NO_MEM;
> >       }
> >  =20
> > -    memcpy(spapr_cpu->nested_host_state, env, sizeof(CPUPPCState));
> > +    assert(env->spr[SPR_LPIDR] =3D=3D 0);
> > +    assert(env->spr[SPR_DPDES] =3D=3D 0);
> > +    nested_save_state(spapr_cpu->nested_host_state, cpu);
> >  =20
> Ideally, we may want to save entire env for L1 host, while switching to=
=20
> L2 rather than keeping a subset of it for 2 reasons:
>   - keeping enitre L1 env ensures it remains untouched by L2 during L2=20
> execution (shouldnt allow L2 to modify remaining L1 env bits unexpectedly=
)

It doesn't because you need to restore it, and you can't just restore
all. Making it symmetrical and saving what you restore is better. It's
a pretty nasty layering violation to memcpy the whole CPUPPCState too,
conceptually.

I prefer that we have to think about each bit of state that is changed
and how we deal with it -- I'd not be at all surprised if there are bits
that are wrong as is, e.g., in interrupt handling.

>   - I see some of the registers are retained only for L1 (so, ca, ov32,=
=20
> ca32, etc) but not for L2 (got missed in nested_load_state helper in=20
> this patch), are they not really needed anymore? Previous patch=20
> introduced one of them though.

I'm not sure. those fields aren't registers as such, but mirror in some
values from regisers. I didn't think I got it wrong but I'll double
check.

Thanks,
Nick

