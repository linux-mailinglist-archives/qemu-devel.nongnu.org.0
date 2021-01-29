Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C69309083
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:18:19 +0100 (CET)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5d1u-0003xI-Gc
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d0l-00036c-Fk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:17:07 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d0k-0000fz-0B
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:17:07 -0500
Received: by mail-ej1-x634.google.com with SMTP id w1so15244211ejf.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AMWIopadlyzkAVtRQfKbqIerKo2zTfauOuFCmNwFdIE=;
 b=tw91gG9pPRsnVPsUg0mVFt+RJBxXBAjyykSIUFH0XQHpu2J+zwD6oTLDEyLPSlQWy0
 6aW+X4iLjWAE0I0tYpk0Ottaj+o/3PHYuFfy3sM8yKv1zGw3bZBC7y016lJiW/7FqEtw
 uFrjJiIpuEwV2LRnb1Xh5xe4tFfGAWtwdS5nhlN7+IBix7XM1fSLohMCobkL+Qy6bK27
 TJNmtjUumVF7SHLQVbB1BG1nJ6LSx5ySoRkKr/r7xFh4iV55fh++SsgDdHcaYJ3aeyaW
 3kmYh3vyJaZJYXAXG9u/zGAJIZtofm0sE3kUmboBFVxi3ZH0FBZCEvVG3eXqoyuiLpEu
 RwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMWIopadlyzkAVtRQfKbqIerKo2zTfauOuFCmNwFdIE=;
 b=Z0srmbPPti8loPLy7res+ZS3xasZlm9TVFodmvAR7HfrMVzlZKbTjRMRUqzELVe2Y5
 8IP9mDiEhYTeELxuKrg/4iG9I7Jc3RSeghw8xrSWx8DcnwwhW5X89hutiYjrK8zXWFxD
 FMB8v7EMr0S6UzmW6kbmm0pqq5r/0dOcqppv/pbbPhIjBpp1EMGenY+Kv6CAWqQH48x3
 Rc1nGP7LzV29GdreG/W94mkUDekWlbd5XYeSb25p2POqPJ/s7zlHsYqY/kRlaGjPCHv+
 WGsOgPl0opc6wEE5FrO8wxnbM+Zg+etXwv1ALsFgWLCMiUb3foWoBUU+KT0ozJZBruNC
 CCLw==
X-Gm-Message-State: AOAM5332F6v6HAUkE7XtYKKuM3rEZtH50hBTvhJySD9EgdcpFVmQKGhZ
 iO1RjfVSmRbROCLXzB2qNyIj1JMAfNGf6dFWI2qy/w==
X-Google-Smtp-Source: ABdhPJyQeM3M0MlKPjilRryetyywq1qBUAPGZY5t5mmpl/We8HAalPyJFHZBAECO2Hs59TU04DiVY+eaugcd3Kw489s=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr6856349ejt.56.1611962224677; 
 Fri, 29 Jan 2021 15:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-4-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:16:53 +0000
Message-ID: <CAFEAcA8CQzWs3B=JFQDQ5Nt3oENa1ppVwH11AOb7aBg=RBtS_g@mail.gmail.com>
Subject: Re: [PATCH v3 03/24] tcg/i386: Move constraint type check to
 tcg_target_const_match
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Fri, 29 Jan 2021 at 20:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rather than check the type when filling in the constraint,
> check it when matching the constant.  This removes the only
> use of the type argument to target_parse_constraint.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 28 +++++++++++++++++-----------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

