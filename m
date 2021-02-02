Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02C30C28D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:54:57 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x4x-0007rm-Um
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wm2-00026B-00
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:35:22 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wm0-0006ZP-3p
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:35:21 -0500
Received: by mail-ej1-x632.google.com with SMTP id p20so10965285ejb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCvT9PT5gANLXNFaZP0DGyCahnPHCryuaQ+I3fqEIoY=;
 b=MBWTdgeeMb97LrObv589wM7w53FlA+uihCORjrgyzSLVMKVLZRkPjO7OJoJ+tUOsuw
 89b4JoghnUGQh2vRrNXJifpbI/NgGZw/a2SScItnVoj9eehEH+ugKZG+PM3HYaGOKWEO
 NYRaiOXNUcgOrQNwF75MGzjf8LS+ypU+gXLEQ2/lRfU+xJ64CdG94uHmsbbTebUQWgAx
 SmFnSZLnlovVEwJv0Rp9PK1koPxfIfL3bbnrLH8sKT3870efWd6DtwjSn2ivwAhLT9t9
 nICfuh/KXCX7Sp32dM+0+cLZwVp/5YqDwmFIv0TrQgAJRa13DTpe14GI+AAZWvBg3xPM
 B9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCvT9PT5gANLXNFaZP0DGyCahnPHCryuaQ+I3fqEIoY=;
 b=BzVYDDKuDxUIr+rFL+7WamxS1qGU7MmbV/YnCiW9Lq0R12c7c40gI6YmRb9lh0SyiD
 P1wU6Htqs9cuvtpEMQMsXaaaat2WJnYHjekaGu4IobYZjaJH0u7ozhUT3sAPMAgLBhfT
 QfxOsEQGKajakq1QZBf7VV+qVMw557NyxMvCDbzYK9uXGS1YBrGzN98phv//Tr4MEtL6
 arOqgPCIq7u4cfCMQLB+OaEwliwT/v4I1zqHgVL1ROg3P4FCNebMq5RcYaC6c+SKpRbe
 x0sjXaWIEigTp1tQORSq/4ZDhaTRVr7StTcaClRRrCmBsFjS25Asl8GL/extnaGcB6hC
 o4uw==
X-Gm-Message-State: AOAM53066lrEW/6+bFlLuzku4abfQDlkL/94fIEholRTeWpBu+i/4vLh
 5FX6+ajskV7nHtInNUjsCUJol4IwUBFkYmm70Yw+tQ==
X-Google-Smtp-Source: ABdhPJyfzy6B8rW97fO7Z5o+Bj1RPQyjnzpVNj+09K9YkGcEWPfv1r5ZIN60t0P+H4hxs6Okth5OdYv15GFkCsk2iH8=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr22942796ejt.56.1612276517399; 
 Tue, 02 Feb 2021 06:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-11-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:35:06 +0000
Message-ID: <CAFEAcA_wX1kv+2V3emHG7LL7bcS9dgYTfK8ghT1pgMpOT=BWNQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/23] linux-user: Fix guest_addr_valid vs reserved_va
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
> use -R <reserved_va> to restrict the memory address of the guest.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 4e6ef3d542..e62f4fba00 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
>  /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
>  #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
>
> -#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
> -#define guest_addr_valid(x) (1)
> -#else
> -#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
> -#endif
> +static inline bool guest_addr_valid(abi_ulong x)
> +{
> +    return x <= GUEST_ADDR_MAX;
> +}
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

