Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97E4869FD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 19:32:55 +0100 (CET)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5XZG-0007ga-Cx
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 13:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5XTz-0001kA-Av
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:27:27 -0500
Received: from [2a00:1450:4864:20::335] (port=54108
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5XTx-0001Qs-PK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:27:26 -0500
Received: by mail-wm1-x335.google.com with SMTP id l4so2426986wmq.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 10:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6BIAfslVCCuxA0GOYR1JatBFelzrqEg6gBdCXC1uEp4=;
 b=TTtNi9GKO60bgOuBPV6w68dLkkDHIfm8cMevthyVUGvmusWrYTCPKYe7WCWvU84Ngl
 hlYgFsnCIZ4lAAEivWBwPLG7Z/j1fvio9wA+aLtUwPVZ03+dmQZhYAUwN4BO1DanF74e
 60sBNyyJwa57kyC8ihHP87gn6L8NyG3HKRmiqg2yCjIoRSSZxoEEh1DCNVBlJPuD32LQ
 OCJACMTAVJeeQbV7f8+dRqYJXm5UAazDVJ23rB48hMIWvrHiRmVY4tpQtDEyIyWYI5j5
 3yDK+Su6nZBDRKSxf/O4YuT9H7Edb0fzSMa/kNkJFA+ihtBCX2xd/QJB5SNWKKBN/XZZ
 EWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6BIAfslVCCuxA0GOYR1JatBFelzrqEg6gBdCXC1uEp4=;
 b=ZFPZitgaZayZWhYWu8+HFnYBWivumxD12JlbLAgnPYM8H/bPvDBg6r9wc5JxsUMLa5
 jrm3t2S9nTJCzp6CdflIeiv3ck/hFqXhosLCwlcTzqeUSqD2t14h/NVYEb+CFQn+42Et
 pxs6MPJAQO/CmeFdQjDTxoa/tMv/rWBsdLWYGRU4BPh8ccwHsRby8Rm0ZZeLDyRJYpHy
 2htElBmcyjQXA9ejjBroavW6SMPhVP7Yg7DiCj4P9yYpRVfLw7BTEs9UELf8jU7JIuTu
 YXDOUFZ9Eu/27k3LaJDKmSdjyL4nIhF6ficn37co8zU5gSc6c6+jW/ggqGQG8SzOQbBX
 ei5w==
X-Gm-Message-State: AOAM530DBlKw8aHjSbkFPLLg7zQET947lO/P/KlFSBe6nYP0I9KmKWRf
 19A0ikz0sIYm7Z1xPwMwHJ4XcPraS5iB1dLkyl6J1g==
X-Google-Smtp-Source: ABdhPJx/nHvbqCVxmCTHrgdCgqGDyFvjKwunIREb9U+IkhGWTZGsMBD34vWrm+M7fdF4D3c9lu59o9RnEkDyfIwRYlY=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr8040354wmh.133.1641493644136; 
 Thu, 06 Jan 2022 10:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-2-richard.henderson@linaro.org>
In-Reply-To: <20211208231154.392029-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 18:27:13 +0000
Message-ID: <CAFEAcA_rUX9pU7mZQviGcxUAnNUib-ZzfKzzLe-3NMfACg-5MQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Fault on invalid TCR_ELx.TxSZ
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Dec 2021 at 23:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Without FEAT_LVA, the behaviour of programming an invalid value
> is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
> minimum value requires a Translation fault.
>
> It is most self-consistent to choose to generate the fault always.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9b317899a6..575723d62c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11129,7 +11129,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>  {
>      uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
>      bool epd, hpd, using16k, using64k;
> -    int select, tsz, tbi, max_tsz;
> +    int select, tsz, tbi;
>
>      if (!regime_has_2_ranges(mmu_idx)) {
>          select = 0;
> @@ -11165,15 +11165,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>          }
>      }
>
> -    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
> -        max_tsz = 48 - using64k;
> -    } else {
> -        max_tsz = 39;
> -    }
> -
> -    tsz = MIN(tsz, max_tsz);
> -    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
> -

These changes are OK in themselves, but we also use the
aa64_va_parameters() calculated tsz value in the
pointer-auth code to work out the bottom bit of the
pointer auth field:

    bot_bit = 64 - param.tsz;
    top_bit = 64 - 8 * param.tbi;

Without the clamping of param.tsz to the valid range,
the guest can now program it to a value that will cause
us to have bot_bit > top_bit (eg tsz = 0). We don't
guard against that and as a result code like
extract64(test, bot_bit, top_bit - bot_bit)
will assert on the bogus length value.

(Section D5.1.5 says what the pauth code is allowed to do
if the TnSZ field is out-of-limits: it can use the value as-is,
or it can clamp it to the limit.)

-- PMM

