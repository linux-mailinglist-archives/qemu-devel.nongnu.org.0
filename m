Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963082ED414
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:13:40 +0100 (CET)
Received: from localhost ([::1]:44076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXut-0001PK-M7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrQ-0007CG-I7
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:06 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrO-000224-Ek
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:04 -0500
Received: by mail-ej1-x629.google.com with SMTP id lt17so10459960ejb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=nd7WyuJ+hh7fLk9K/NM0NJ+ju8vWKQPvPqSKcfXB6UFIAIf24sxFS1C3NWkDKDUWEF
 btpXZqVMToyKCF8kfoMY7JPdX6P/+Guac566J8quPPJszDq0Tvty9SO1CfHdwa+LXH7r
 hu2+r7lChjWUefltPoedGKkz534a/nyAm6795AC3hfkLP4Hrk/BCm/U+AhOrEERdyojp
 LBr2lXODjSgoNlUlfgplqlmK9v387ZHHd28xPWD6nk/PpdATrY9i+VFYSra2ilMsRwcm
 UyJtvPB194PRYW7vs+FHHcF/LSigvSeGgsS+C/qxrf9ZizOtUvP3tLxXt3DF97ywirv+
 DPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=eP5zTIoxRKM+ezxry422n+e7uam0u24qw9SZsmRPJVMtE+MPPwk0puG5tgAwfMHthV
 7ZSlzDNxc6hKh1hYt6pn10Jc5C/rIx2uXT3MjtvJk+rt+Lkr5pZzAGbhVcep5zievrFT
 SwvmcmtCWkyhysKTyMJKJHcjlZOQ2LAMBesN5naWJfgKtCNSju5lFA8LXnWGu0asGLCx
 /sPQDSnkwaVoXrAgNrbAmyclclfreOP7i5pZ9Eq744aVxPA9FdW3TjdAePfGMZ6jpzHU
 X0P4cPW1YNFPIwO/fVcpwCSY6R4mOM/nqXlmXgB+qUvas759Y7V5NPkj3oYGRAvbqT7a
 e+Ag==
X-Gm-Message-State: AOAM531Izd9aFFV//5PGgG3ay8IwX1XoXAzBvgh008M1IgE4ICn2NpRA
 gIr+NvPHtvlhqXHzw6UPiSiHTTOeznwXhdRomzG1zQ==
X-Google-Smtp-Source: ABdhPJzzFKw8wW3vEfnm5M7idGQUrsHLOddB9CVnuaq8HCNMBWptuu8TB8aTfxcfpPfDy2EoHmA9BGkhSEkLrptQC9A=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6732761ejf.407.1610035800885; 
 Thu, 07 Jan 2021 08:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-9-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:09:49 +0000
Message-ID: <CAFEAcA-+S8HJqcro3LuD02hHLdNKj1O58q_=1Fhp+7atjtRa3w@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] target/arm: Enforce alignment for
 LDA/LDAH/STL/STLH
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

