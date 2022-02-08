Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD144AD585
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:33:51 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNok-000748-8a
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNa3-0005Xj-5l
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:18:39 -0500
Received: from [2a00:1450:4864:20::336] (port=35555
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNa1-0004Kq-AH
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:18:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so1043981wml.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IH6yAsLMVdRFXjPY8pvbfzsfwX92nWnxV4aGxqiPQKA=;
 b=kkyvBGnJMrKW2ByfoH5Z7lN73QM8V8tD+J7rC8pgb98EiSt5I03CFrgo/TCjaIpVIE
 JJHqX5y8BnhrdKO3nQG/ElCzBfru0rF8SPIxHoYBH51j30VdOu2j5sXYduG9wy/6oY3L
 zJTY0uUFjOtKzvemm/XQ06F/cOxFY7g3wSoXv1cXBisMGIDhGX/uA5WB/HJq9H3Y72A8
 yg4zfJ2JdEpJHcB6br3rdsflRXTShkkR0YIgu1mCtWvZeTOY3SUU7NNDDgj2tnNyHj1X
 GJd7lLdKP8P8AJ0tLK2p6fLZNYR664iIFRYrVOcybmx5iBOfAzrvhH6HocLXZ2C7KXfv
 s9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IH6yAsLMVdRFXjPY8pvbfzsfwX92nWnxV4aGxqiPQKA=;
 b=xtVSE0smUaoeqEviFtjG5PTGESKQ586i9wn6tH0jq2W8iopqwlmAIBhMmMxf2gn668
 d1X4fpZ2gPfYUkva/2+SlT+UAndD8MxE1fjP9M19BTEL1IEXPGxVQijc7VwAXTbw0mpn
 fkQsKMYkubAAJ2QTiaMzzq/izrPXHrmljZFiuQIDb8jMPAQfPymLULdXe6MVNrKw0bKE
 bgAw46bnLUyRphz5/U0OJXthb7D9EDME0vy3FMmcINGr/JVg2nagt/a25IefxDHoOTT2
 WuI1DQZsgF4guo9ul3pm9vBiVSOEQYIGUHJ8hrlsn4r2CJ+MZe4WB/IAep9s5+rvDVTg
 fiug==
X-Gm-Message-State: AOAM532ai/1RHyPqjoSTypkZhz1rL4X8VV5bbstnF2YQ4kK8Xj4kYML+
 fQoRSIU114yXSxwYQwdt9IkywyhgCclzhVY72IFuNg==
X-Google-Smtp-Source: ABdhPJwYeMoZOEG1iNzViXJbwgH/Q7EQzfoHQHd7cOubRE7wmFMvaIPJGKItasMWZnvWbFckPmZE8axKo6C2zRjta3U=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr499980wmq.21.1644315515345; 
 Tue, 08 Feb 2022 02:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20220207225211.15281-1-agraf@csgraf.de>
In-Reply-To: <20220207225211.15281-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:18:24 +0000
Message-ID: <CAFEAcA8g5c2=ueHvxQ706_Q2ggJeMtkh-Wd0w-MG5+2E=kizxA@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Handle ID_AA64ISAR2_EL1 reads
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 22:52, Alexander Graf <agraf@csgraf.de> wrote:
>
> Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
> those reads trap into QEMU which handles them as faults.
>
> However, according to the ARMv8 spec (issue D17783), reads on this
> register in older ARMv8 revisions should be RES0. So let's treat it
> as such instead.
>
> Reported-by: Ivan Babrou <ivan@cloudflare.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 92ad0d29c4..045ec69c7c 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -54,6 +54,7 @@
>  #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
>  #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
>  #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
> +#define SYSREG_ID_AA64ISAR2_EL1 SYSREG(3, 0, 0, 6, 2)
>
>  #define WFX_IS_WFE (1 << 0)
>
> @@ -780,6 +781,10 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
>      case SYSREG_OSDLR_EL1:
>          /* Dummy register */
>          break;
> +    case SYSREG_ID_AA64ISAR2_EL1:
> +        /* We do not support any of the ISAR2 features yet */
> +        val = 0;
> +        break;
>      default:

We should handle all the architected "this should RAZ/WI"
ID register space, if hvf doesn't do the right thing internally.

thanks
-- PMM

