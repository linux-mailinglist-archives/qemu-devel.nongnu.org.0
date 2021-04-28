Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B827636DCD6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:19:12 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmu7-0008Nr-Bv
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbmFO-0005VW-UX
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:37:06 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbmFM-0002bt-Nj
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:37:06 -0400
Received: by mail-pg1-x531.google.com with SMTP id s22so23883454pgk.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=euUDfvDN4xAttajQS/jRnlL38j5o0JPrBhhzx8FXrFQ=;
 b=b/FJJR0VqVRUmWg6ERsz6vpuKSd4asxTbCZ3+uV6Gr1ks+4anzhLfYt1+/C4m9aDZh
 vSmgEEuZyo2esmHoqQuTLewM0pHciisLxzfH3dtiPa9d05nHAT52+I7Z/CEqH0mQ69IQ
 wxr7U4Pqv/+IWKqxasM4uLjBzaPrE/NiW9AfnE7fUtsDiFF7q7o+/V70DUg/RnxvH1Op
 QubhkhdGVLU9BwQd3rKYxQS5pUDL9yjZ9OIglYkig/xEcZQwDYEWSSw+n8n7KzoJVx36
 3kjz9PdgkOYfyKqievKZlYkUmR+QMdiW30OBPkhJY/IkURhsXP/QWoYyOm4iwAIUrOpK
 8k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=euUDfvDN4xAttajQS/jRnlL38j5o0JPrBhhzx8FXrFQ=;
 b=nvHj6/2XXn2qUuLmnBqi4xZ/D/T88TCuote+vMsSue6XpqAyhN+bDiZht1o1xZ/buN
 TSo0wvyP3h5JnhXlg85S+H2vdLCl9NWM8FFEWradVVZ64zO51NwfI5I7b2luBHiYjbCD
 dMDEBSJ54oD0pctr2h8msk5HaY8Av/qe3o6RJOIrHXo/cJOK5h1//ZkBF/2HnVu1+dbp
 K5U2P0HibQp8hVyjWrPfnhCSYGDga7fhuUWgKF12ngVDo/33SKXWaibk8nPwAQoghGS1
 FiJEIP8r0MmlY1TIz449JHat5ZZLvB4eal7M7dX2UxBUvu9wPyxwmsMg8k9UqR+tcH6a
 S4CQ==
X-Gm-Message-State: AOAM530TA5SshqvGQht2DFSC73HvwxvWRbGPH+JbMWSB7V6ZX2NsWpnk
 P6QQqoj4ClveDBOlAIeAL7B7AQ==
X-Google-Smtp-Source: ABdhPJyAr8I3IsEOT/V6RZAwCdWlR72Yjt8e4g6PDiRAcqT0wOnEb6xGLuOhxFFm9rnzHKYUFdH/9g==
X-Received: by 2002:aa7:8608:0:b029:258:838a:23bb with SMTP id
 p8-20020aa786080000b0290258838a23bbmr27837644pfn.37.1619624223142; 
 Wed, 28 Apr 2021 08:37:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o9sm111797pfh.217.2021.04.28.08.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 08:37:02 -0700 (PDT)
Subject: Re: [PATCH v2 15/15] target/ppc: Check cpu flags for prefixed insn
 support
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-16-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22338aee-4447-b114-a6a9-927974d1b5a8@linaro.org>
Date: Wed, 28 Apr 2021 08:37:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427171649.364699-16-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 10:16 AM, Luis Pires wrote:
> Prefixed instructions were introduced in Power ISA 3.1
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>   target/ppc/translate.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 7422ea4e13..f4802a4f08 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7837,7 +7837,11 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>   
>   static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
>   {
> -    /* TODO: Check ctx->insns_flags* for whether prefixes are supported. */
> +    if (!(ctx->insns_flags2 & PPC2_ISA310)) {
> +        /* Prefixed instructions are not supported */
> +        return false;
> +    }

Patch 11 introduced REQUIRE_INSNS_FLAGS; this pattern calls for the 
introduction of REQUIRE_INSNS_FLAGS2, as you'll need it later.

Fold this back into patch 8, or move this to be patch 9, so that we don't have 
a range of patches which accept invalid instructions.


r~

