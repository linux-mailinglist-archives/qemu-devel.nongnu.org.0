Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2132FB9D4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:54:14 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sOb-0002ZB-W4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sND-0001lG-Tu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:52:48 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sNB-0006hS-2n
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:52:47 -0500
Received: by mail-ej1-x631.google.com with SMTP id r12so17521996ejb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQ4zQ/zF1iD9xywROBHe9+ZBKJBAn6RAHKDckQd39GE=;
 b=Im2se5B5hhkN9Er1z1pANw/L8+Qb5RrnVypN4yRLafD4jWcVSXrn78St5tFbqJehhU
 b+y9hsyLePNKpKlGXajTZXl8lyNTmaZLFJ4vG1IJpYCPdt729kEqdIx6uUzcrSmqJR54
 od+YdVmZ5bD16XhckCDQ2t0sXuyWqABNE1uEoMZO3Fp2suqUUCl19akOFtf6mQHSx6Th
 tOUBd/lOxTNQmYR8Ijveq7yrNhIlblAPcWQ4Yo47YZPUx7HHvL00VAXAuxiF9TnBl6Pu
 vnKYJHEyiDokRVWwz5O/Qn421eNLgP7dGXrdmR5DW/qsuUCjCR0Idzw17q4cpdqh/EXH
 C5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQ4zQ/zF1iD9xywROBHe9+ZBKJBAn6RAHKDckQd39GE=;
 b=byCpFIFP8QBiVxS2KC+fINYUpIDx1BV+e8SgMr/ni6pKUHMydGihSYFwtW7lSZ2PIr
 3PGv4Tyh5yfNjU/MQaPmOybS3QEea0w8Z4udkyEaHb976ED+3PnbnGDVZgdTmfLDVdqw
 zU/Nnr06sC/53f/b2AnlMs+OwkOmDg3zDFdOAstJT8AGG3G3uKziCXZRcwWTdjRldIl5
 Lu/05xKYr2hRJmZKZEn03fAnj/+0JbKmJto/q/fpcoF2dJViZi6AOUMyVmX3R4/FPE6S
 rtl1yjmy3ArYFAyckJSoTPmKJwe+EVHgD9G4wQrSeuyDnqcIxL4Rmvt5J943VMtzXCgj
 Cdlw==
X-Gm-Message-State: AOAM531IaECKqNhwMwkMih+ioEjVmcZ6XfwGEQ+KPvBhHqncEDKEaWHJ
 AW4Cr4DFtpVbhMa/ofq9WBG62TEMNWzrrRYT37p7TA==
X-Google-Smtp-Source: ABdhPJyc9thSt9m+tIfDlJCGQZrt+ZCV1TIZcQ/1mZ86wMMTGCkGYh38HQp5CLxwRRUz3l6AzPC7+dbByIAc55c/Rys=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3162751ejv.4.1611067963153; 
 Tue, 19 Jan 2021 06:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-10-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:52:32 +0000
Message-ID: <CAFEAcA_7BG-4U3iWCNCjbpvSNQy861+Nkq94JO3WPE61-ojaKA@mail.gmail.com>
Subject: Re: [PATCH v2 09/22] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target-con-str.h | 21 ++++++++++++++
>  tcg/riscv/tcg-target.h         |  1 +
>  tcg/riscv/tcg-target.c.inc     | 50 ++++++++--------------------------
>  3 files changed, 33 insertions(+), 39 deletions(-)
>  create mode 100644 tcg/riscv/tcg-target-con-str.h
>
> +#define ALL_GENERAL_REGS  0xffffffffu
> +#ifdef CONFIG_SOFTMMU
> +#define ALL_QLDST_REGS \
> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
> +                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
> +                          (1 << TCG_REG_A5)))
> +#else
> +#define ALL_QLDST_REGS   ALL_GENERAL_REGS
> +#endif

Other than the typo Alistair points out here,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

