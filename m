Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E991639FBAD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:05:37 +0200 (CEST)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqeES-0002j0-Fd
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqe75-0007gq-Qu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:57:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqe74-0007kx-5O
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:57:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so2259532wmq.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5IGT/DPCS+WCeffK9mXJxc5AKMmS/XHkDro1GSeB5iQ=;
 b=Lfh/44+IZ8/1bbDuhcLJU91cI0utDqUf47FOQTxMuBLOLCwb3g3JOELgCwXf6C7mh4
 f2+UcPACiEUx0B2713sDmmEK5/m52YNpzBVk+xS87wrkEKUjn60y8ED/NI/CZ3Z1lLbs
 kBvFYirTMpbEBRt9mDa79tRmZxCUbTPP5fw8yzSDi6PYYqpWa370eyZyrQ9Wbibowak+
 5jZgBWuGOX2jUtD0OH3Zm+JMcyUojDQNRIq+qT/TqgBuoLzZmbmCrx/gv0iJfQ/HupYq
 QDVfLyllrT6snj8A5sBKs2LhiaUuu4E0xuWfh3YZa1dQOgMYO766SylOEos8Cig++7g0
 7zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5IGT/DPCS+WCeffK9mXJxc5AKMmS/XHkDro1GSeB5iQ=;
 b=GEOwqpLaN0bOWtAu4XTwNaJ//sXR5E4Pp7Yh2KYelTlasiHFgtwqdqh7cObYeZ9HUS
 /4VWMrAybiHsDmj590UMONIoWSNzT9hpVXsb1CEOqbSfXeouEKCv6dEXFXiRhDcdd539
 0eE7MuT0gm2LdxyhZwUy6QS4ofF2UARQWVESGGSQGYt1MOaq1JmtOk3j68eiWGQ++upM
 shdSrIpEw++T5M2npIxZYBdPn4uApxejNciz7KgSRKvTOyasVs2IutTGhWAJkj3tWHL2
 Aqhc5AGCNkjXri2wguLDrdn17ltwoGWrFWzThTr8RKrMju3h1hhoGEI2sAc0YCRmYO5U
 5rKw==
X-Gm-Message-State: AOAM531g8aN5PNr3i8dr6vF4NF2mfbgAbC1SwVBTj7BFPtr9ZaEhuirz
 +sAPv1+RIaZRM4ydmB6nYHMu83BpSLgxKg==
X-Google-Smtp-Source: ABdhPJwWCLAgTuTL/d3ZGlVOAWMiF1ZFZ3lp1tsKBsg8fChXAp12/g+1gQ/BXDe+xxvneCtxe6Va4g==
X-Received: by 2002:a1c:bb45:: with SMTP id l66mr5059769wmf.29.1623167876557; 
 Tue, 08 Jun 2021 08:57:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l13sm12835979wrz.34.2021.06.08.08.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:57:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09E401FF7E;
 Tue,  8 Jun 2021 16:57:55 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-16-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 15/28] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to
 tcg-target.h
Date: Tue, 08 Jun 2021 16:56:33 +0100
In-reply-to: <20210502231844.1977630-16-richard.henderson@linaro.org>
Message-ID: <874ke8l56k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the ifdef ladder and move each define into the
> appropriate header file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Retain comment about M_C_G_B_S constraint (balaton)
> ---
>  tcg/aarch64/tcg-target.h |  1 +
>  tcg/arm/tcg-target.h     |  1 +
>  tcg/i386/tcg-target.h    |  2 ++
>  tcg/mips/tcg-target.h    |  6 ++++++
>  tcg/ppc/tcg-target.h     |  2 ++
>  tcg/riscv/tcg-target.h   |  1 +
>  tcg/s390/tcg-target.h    |  3 +++
>  tcg/sparc/tcg-target.h   |  1 +
>  tcg/tci/tcg-target.h     |  1 +
>  tcg/region.c             | 35 +++++++++--------------------------
>  10 files changed, 27 insertions(+), 26 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 5ec30dba25..ef55f7c185 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -15,6 +15,7 @@
>=20=20
>  #define TCG_TARGET_INSN_UNIT_SIZE  4
>  #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
> +#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>  #undef TCG_TARGET_STACK_GROWSUP

As it's a TCG_TARGET feature maybe we should be renaming it while we are
at it? TCG_TARGET_MAX_CODE_SIZE?

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

