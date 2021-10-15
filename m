Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5842E65E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 04:07:21 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbCcx-000321-KL
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 22:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1mbCbX-0001n3-Mq; Thu, 14 Oct 2021 22:05:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1mbCbV-0004bm-1G; Thu, 14 Oct 2021 22:05:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so8285278pjb.2; 
 Thu, 14 Oct 2021 19:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=v5Vd1SEi2bLA3WaedN7AwffIaiijRwB0Q+TY4ajXFi8=;
 b=dbTLCf1Be7211eAitOKJ/Le6AJruhvdbpA8BEQtjqg6YKLSZ2I9NLjQQ2klxnSC+tH
 u1sD7i8r8M10NEGksWs6gNe9NcoiUv0+14ikcDdyZrmjyb6G0KbfGovgaP3+JSEoRrSm
 8RSCYXVnL8bimgDcHbx/HfqHfhjYH7WkeCx2Or5jTtoN+wa0vUGuAv9AmTqiu/VKb554
 5lvVJZhYZekVcIO/u03lrnOuxP9l5cPgcwsgK644USgBAkGHS5KE1lCfr/sDf/DISOsw
 hqZpcxxEE1MNRa7X4ea+Kci09A8WifM9POoKfff+Yp4zDZ1tyuN1kS97Oysa2XqBcbt2
 BnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=v5Vd1SEi2bLA3WaedN7AwffIaiijRwB0Q+TY4ajXFi8=;
 b=RfjpgwmCaY8PG/dG3IBz4KqMsOhDHxVxiiC97ppY9nLPKbCw+mGvpv2BD6tMvi7DH3
 4Yvwz6HcMSauazHKtFpSgslYR35KvxLPMv+jUxV4rzHeHKr/BEdUfZC2qSIt33GHrBb1
 RWTE4p9ziwf10OsjVX1zL0TTMvxOEY5KWvqtGMr1RSzMMdvYHo604Xujw6QItCnUAkGf
 fnlPZEmZhqH8KSFhEGyik2FPjK2xhUxn134AOtnIIExu0meTah0AjPcctysbzJE3gMSx
 19SyWrlh3JFXckjHIPURWT9cVky16fKsjyL+WnR38yxtrI1aKtHMpJroNKXH8AdTC6Fn
 g8qw==
X-Gm-Message-State: AOAM533AudaDizVADU5rWVxno7nOA95o6QqQEyeIheVfaC01ahvcJuci
 tK1/fD51GG4qgyQfH0ugc6+2T/BZ8tQ=
X-Google-Smtp-Source: ABdhPJzzVKZki+4ZjzRYeiDwogKZJyMgXWnvjROA/zwTjn1CFHSCwi6rvMDTfGRArJaCGWKqSizdcQ==
X-Received: by 2002:a17:90b:4ac1:: with SMTP id
 mh1mr10102490pjb.144.1634263546432; 
 Thu, 14 Oct 2021 19:05:46 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 n21sm3535137pfv.115.2021.10.14.19.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 19:05:46 -0700 (PDT)
Date: Fri, 15 Oct 2021 12:05:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] ppc: Add QOM interface for machine check injection
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20211013214042.618918-1-clg@kaod.org>
 <20211013214042.618918-2-clg@kaod.org>
In-Reply-To: <20211013214042.618918-2-clg@kaod.org>
MIME-Version: 1.0
Message-Id: <1634261821.ztn2f48uj7.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of October 14, 2021 7:40 am:
> From: Nicholas Piggin <npiggin@gmail.com>
>=20
> This implements a machine check injection framework and defines a
> 'mce' monitor command for ppc.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> [ clg: - moved definition under "hw/ppc/mce.h"
>        - renamed to PPCMceInjection
>        - simplified injection call in hmp_mce
>        - QMP support ]

Nice, thanks for doing this.

> Message-Id: <20200325144147.221875-4-npiggin@gmail.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  qapi/misc-target.json | 26 ++++++++++++++++++++
>  include/hw/ppc/mce.h  | 31 ++++++++++++++++++++++++
>  target/ppc/monitor.c  | 56 +++++++++++++++++++++++++++++++++++++++++++
>  hmp-commands.hx       | 20 +++++++++++++++-
>  4 files changed, 132 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/ppc/mce.h
>=20
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 594fbd1577fa..b1456901893c 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -394,3 +394,29 @@
>  #
>  ##
>  { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARG=
ET_I386' }
> +
> +##
> +# @mce:
> +#
> +# This command injects a machine check exception
> +#
> +# @cpu-index: CPU number on which to inject the machine check exception
> +#
> +# @srr1-mask : possible reasons for the exception

I would say this is implementation specific mask of bits that are=20
inserted in the SRR1 register at interrupt-time (except RI - see=20
@recovered) which indicate the cause of the exception.

These are not architected and may change from CPU to CPU. I.e., the
mask itself may change, not just the reasons.

> +#
> +# @dsisr : more reasons

This is value inserted into DSISR register, and is typically used
to indicate the cause of a "d-side" MCE. If this is 0 then both
DSISR and DAR registers are left unchanged.

> +#
> +# @dar : effective address of next instruction

This is the value inserted into the DAR register (if @dsisr was=20
non-zero). It is implementation specific but is typically used
to indicate the effective address of the target address involved
in the mce for d-side exceptions.

I wonder if we should put an @asdr parameter there too -- I'm not
acutally sure if P10 implements that (getting clarification) but
the architecture at least allows it.

What's the go for updating this API? Can we just break it, or do
we need to version it or call a different name like mce2 etc if
we want to change it?

Thanks,
Nick


