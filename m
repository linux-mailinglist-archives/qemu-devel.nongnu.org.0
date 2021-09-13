Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449D4087B7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:03:36 +0200 (CEST)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhsF-00081H-Cz
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhiE-0006lN-0N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:53:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhiC-0000Ju-8y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:53:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so13463140wrb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylyqcIhnATU/ADXsXq0Rtx2pBsN6zhCJ3Lrghm5Xi6Q=;
 b=EOOtverxAWkKFlvT5ju2PT+PdTqW3rYZSsZZg/VzazJ2f7LMWsi7SdO1g5rvKIZn+s
 K2jvBCC1YkCni9okY5sgRmWOC5EXqwSv0GzAjuqKpJDWwLRtcy+oOTqc35Z5loMSPLC2
 uUc1k+QG0BtLtQX9Oi1rrJiX6g4zjQuOOZHQk7evxAECHJDnfPPYvodKVBH415AKP7qh
 2nMhW0J5pZ928SVqwD66J+lHaX0P6S/TBFx/TnZyDpELX/45aWUbil39oZUs9RYFs63R
 j48PCTevPbG4IOE0iMe+FfK7uA5h2HKDIoQNCZrT088X0grm9g/p6D/5PFEAgJhLgjWC
 ckrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylyqcIhnATU/ADXsXq0Rtx2pBsN6zhCJ3Lrghm5Xi6Q=;
 b=Pgk2KchZ54a73r3HNoBEIfQRZUTvB1zrYqajrsc4Dio5GHO2Za1AXQko13UkbBjcJl
 A26Uwlgkeeh8DBsyYW835SK7MS7bDSXeaNzpkOM90V/CtYhdGvoX1UDlcHJ/JOywd93e
 r+CMCS1gaCyQHBEbpxNU1Per0XSgqc92AnrwMQJR6hJnEZHt643vULHpl5BN0o0eE4Up
 xCTp7jbRn7R3d7ebp2CzlCzIVDfGZVC4RFkvqkDWXVhraS+Z4NxFpElO5lAycIYrnN+g
 FU4RRwQcLNB6WB9R6IrRPD8lDB1QQ0JXW6m+K7/2p9FZcccIPGuVhbCtFXDTC9wpZRaN
 VTsg==
X-Gm-Message-State: AOAM532N/TItCamaSuapP0VP2BeLeo8p7Zqu+YuGbPzLxbOYIPXxci+U
 rVyTQajyDoCndMECcT3TWpA2d8Qke3E7kVyBnQGV5A==
X-Google-Smtp-Source: ABdhPJwYvX/S989T7wsuZGWuSxSLpzeCDva5oj7M4O1Si+YaFSAKEwPeHBjVx0nWKxvk6mO6spDS65JM2x5zkbR3s44=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr7184482wrr.275.1631523190752; 
 Mon, 13 Sep 2021 01:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-12-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-12-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:52:20 +0100
Message-ID: <CAFEAcA8x78jKD0EQ0rz_A8YwF4UkBTt8J3khNJ1TMefEP3ejfg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] hvf: arm: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v7 -> v8:
>
>   - fix checkpatch
>
> v8 -> v9:
>
>   - Remove Windows specifics and just comply with SMCCC spec
> ---
>  target/arm/hvf/hvf.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index b62cfa3976..6a7ccfa91e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1177,7 +1177,8 @@ int hvf_vcpu_exec(CPUState *cpu)
>          cpu_synchronize_state(cpu);
>          if (hvf_handle_psci_call(cpu)) {
>              trace_hvf_unknown_hvf(env->xregs[0]);
> -            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +            /* SMCCC 1.3 section 5.2 says every unknown HVC call returns -1 */
> +            env->xregs[0] = -1;
>          }
>          break;
>      case EC_AA64_SMC:
> @@ -1186,7 +1187,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>              advance_pc = true;
>          } else {
>              trace_hvf_unknown_smc(env->xregs[0]);
> -            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +            /* SMCCC 1.3 section 5.2 says every unknown SMC call returns -1 */
> +            env->xregs[0] = -1;
> +            advance_pc = true;
>          }
>          break;
>      default:

This should be squashed into whatever earlier patch added this code.

thanks
-- PMM

