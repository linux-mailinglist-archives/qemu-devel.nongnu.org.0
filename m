Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35446508B56
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:58:30 +0200 (CEST)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBmn-0006BX-9K
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhAyJ-0004Ww-75; Wed, 20 Apr 2022 10:06:21 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:38035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhAyF-0002tm-T3; Wed, 20 Apr 2022 10:06:18 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ec0bb4b715so19244987b3.5; 
 Wed, 20 Apr 2022 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4BhVLAEAtwm+jBxF2sW4DB1Nw+1df4zhJQ8+oYO3Ls=;
 b=OjKrylQ5oqwxKwXx/qxjaLo80vUoYbbH05oey6Ki9odNMvIjIjLJZROXWUg0nvkKP3
 4ZJoeV0J5KAcZDZjx1S5lOhePu0LQa/pdlpp0WBJwjNAT3QE5oalr8t3HWOzBYcI0Aj1
 bCkXGmSoUk45x+2rx7yzoXjH11ZljddSJnc6xH919qzlJBJXuXo+YkWgX3+jj/Ba9Tlb
 W6cpPH9k2hxpFSAr9eCpVXl5m0B45SXSA9HL4o1/vfNkp8sSBnaPwUD+IS5igAUuTczO
 srebrj5TdBpGfgYEWT94uS0+tm9qQ3WI1M8L9LYF4MkeO/DPWWyybb/5n1qbMtB5X9Cr
 +3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4BhVLAEAtwm+jBxF2sW4DB1Nw+1df4zhJQ8+oYO3Ls=;
 b=u1wrIoEOg0GUh0yXk7h2Hk8XVlo8/ikNsHmdq/rhXMwKwk3AbkwRagRDoexHUwnvga
 VoNBOVeFeO14ITRlykSNBwOeKxGVHui7plDW3vp1pCGSAYvzenH6iijtMdENIeVNn9Fc
 wGLpMR4LCfy8wMc3BvatkFo0ojS33YgiVyEUoLMaJBVBBT2EV9aCrsOJEXHi5RcQiMJM
 A+A6T9Z/k5XMisq1hTvgywna+tobiseAgig8JLKVwqTnhcb2ijYgFpJtkYgNbsa8nKUI
 O4+5bKXrgC/CH2nZsksR+9sSWsdupR6gWZjZ9YB5mEKZZSYOgD69BlxUatUioxKLeX3Z
 PWLg==
X-Gm-Message-State: AOAM530Ops7VZDck8ET+6eox1whNu1Bw7IdCUk0ZfxP+4utwlHLjjqX5
 hbL9XD9UMe+6/SH/wCXSo9a5T6EswGF+1jXo4yQ=
X-Google-Smtp-Source: ABdhPJzyWKqOM2n2J+ChI6PG3g8llgzd7OHERnGrQE36Vt3syYXkwXskTFfrIFNNC0dSyghkXnfwDwr67UfnXcmD11o=
X-Received: by 2002:a0d:f103:0:b0:2eb:488:f0e1 with SMTP id
 a3-20020a0df103000000b002eb0488f0e1mr20910092ywf.487.1650463574411; Wed, 20
 Apr 2022 07:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220420082006.1096031-1-bmeng.cn@gmail.com>
 <87mtgf27e7.fsf@linux.ibm.com>
In-Reply-To: <87mtgf27e7.fsf@linux.ibm.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Apr 2022 22:06:03 +0800
Message-ID: <CAEUhbmWUkZc4v+rJvKK=D9Kv+v061+5TbpyUAkd+7es=8ca6zw@mail.gmail.com>
Subject: Re: [PATCH] target/ppc: Fix BookE debug interrupt generation
To: Fabiano Rosas <farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1132.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 9:50 PM Fabiano Rosas <farosas@linux.ibm.com> wrote:
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per PowerISA v2.07 [1], Book III-E, chapter 7.6 "Interrupt definitions"
>
> Which BookE board are you concerned about? I don't think we have any
> BookE ISA v2.07 in QEMU currently.

It's actually a PPC E500 core, but I am too lazy to dig out the E500
manual from Freescale/NXP :(

Let me know if I need to replace the link to an E500 manual.

>
> > "When in Internal Debug Mode with MSR.DE=0, then Instruction Complete
> > and Branch Taken debug events cannot occur, and no DBSR status bits
> > are set and no subsequent imprecise Debug interrupt will occur."
> >
> > Current codes do not check MSR.DE bit before setting HFLAGS_SE and
> > HFLAGS_BE flag, which would cause the immediate debug interrupt to
> > be generated, e.g.: when DBCR0.ICMP bit is set by guest software
> > and MSR.DE is not set.
> >
>
> The rationale and the change itself look ok.
>
> > [1] https://ibm.ent.box.com/s/jd5w15gz301s5b5dt375mshpq9c3lh4u
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  target/ppc/helper_regs.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >

Regards,
Bin

