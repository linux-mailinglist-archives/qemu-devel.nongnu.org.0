Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2663F1D1C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:43:11 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkCE-0005fO-UD
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkBO-0004k8-3L
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:42:18 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkBK-00019k-EX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:42:17 -0400
Received: by mail-ej1-x636.google.com with SMTP id bt14so13854069ejb.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GxAzuNJJVFQv8B3lafn0iF9Vv598tSK4E6gUxUbxOe0=;
 b=o2+HHP9BWfknscjKB7CPhdirstkSu2dL4MGw02wmIIE3+Eeubw+Jcck2NxKu0gthzv
 fqBgpOXrdE1BaAwOS524uyuwHUEIqWP8wHUDqNUvqtEYroBP9QLrO74ucgJFA8curv9u
 SoZ0DYka098kJXHAdjRYjwC0P9LrPJHsLWtUGmjPMjBBEvd+ha8mBYs9NVNmJsEWnVN2
 w8YpuafAwKnz/RIug5M9CKTTZ++lEXqHCSieiJETX9Q+uYxgUpVJndkJ/rlKmjwzk6vF
 EKsP4q7NKWwGTVGRTsHuiNXATd20/WB6Bkoyoq5F0lT1ANmsFbrfrvxqpxE7JoqQdOqV
 957w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GxAzuNJJVFQv8B3lafn0iF9Vv598tSK4E6gUxUbxOe0=;
 b=ghqsVPe50Byo86lWZCCXiUzEdNllzxrOpV2CdBfsE5Mcw+JBrANLUrk6elnIRQX2XT
 E2jNu+6EmZjC0c8M1hVhMHYZwsA057H21Bf8mwfuroBAHtZ8nxjKOsWorg69KBZVrdGa
 F5uTBjde1OVxEvMA/e9vqMfNiASgpgiXZZsNF/XnT6Bbf5aPwN4W1qI3dgn0a0Eihz45
 MQs0pQBU6Vl7hvoDSYVD72BOHBPRwjXayjODEp8a0TSZ/dWg8xIMTVl+tPQ4ooQWsVBj
 1C5/6jvJQbMSHTbvpPgrjlM8ZMh5S3C7wCF5B/c9wBaJtcTU2Cy7wQnlchfeUlPQy/QD
 wD2w==
X-Gm-Message-State: AOAM53315wzzmV6kqUpa9W8SDVRVPl5bVbtzF1zwJAUuWn513CG/AtdW
 eICYvJj3W7Wg9PqcTbGhej/XmdL5WF5tE1czNkhBRaHB7Pg=
X-Google-Smtp-Source: ABdhPJyWKfniBL4bqaeQN/ke9pnoYCle9Z+7IJRfKBHwEuHYU/BCV0OLznKtLQjbhfBzNdte+ddO2tWnlSuUKxuDmQ0=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr16405181ejb.4.1629387733002; 
 Thu, 19 Aug 2021 08:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-11-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:41:26 +0100
Message-ID: <CAFEAcA-H=QhzZjqypT5fWCyoMY_UY6CSv+10_qdHJZ+sKVudjw@mail.gmail.com>
Subject: Re: [PATCH v3 10/66] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We ought to have been recording the virtual address for reporting
> to the guest trap handler.
>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/excp_helper.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 0df358f93f..d7743704ac 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1504,6 +1504,20 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>  {
>      CPUPPCState *env = cs->env_ptr;
>
> +    switch (env->mmu_model) {
> +    case POWERPC_MMU_SOFT_4xx:
> +    case POWERPC_MMU_SOFT_4xx_Z:
> +        env->spr[SPR_40x_DEAR] = vaddr;
> +        break;
> +    case POWERPC_MMU_BOOKE:
> +    case POWERPC_MMU_BOOKE206:
> +        env->spr[SPR_BOOKE_DEAR] = vaddr;
> +        break;
> +    default:
> +        env->spr[SPR_DAR] = vaddr;
> +        break;
> +    }
> +
>      cs->exception_index = POWERPC_EXCP_ALIGN;
>      env->error_code = 0;
>      cpu_loop_exit_restore(cs, retaddr);
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

