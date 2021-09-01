Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EB3FE24E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 20:20:00 +0200 (CEST)
Received: from localhost ([::1]:46542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLUq6-0002oA-RS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 14:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLUp9-0001sp-3s
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 14:18:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLUp4-00020j-Cd
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 14:18:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso88094wms.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CAd6Dxfcm6PBoIbTTBcYUUQyR63fgAPRdyDPESpVCBY=;
 b=NYBcg/r5mFx1zm2JI7/DGm4v8lU1oRL7txEV9g2/axU+HJfU2vbqZL5UkUKUDVEnq8
 wlL1rK+eH83hDI4mL51A0O/tadX37jJ16PbGDQGRsJsQ1ugSSp9YxGqphvJpRyodWAAx
 SlALdVX1km3cLsco6nL0mtkykMzKrayId3dmcjcc6HLtMbG2WxovEuUPuOq1MlmurJuK
 JZjnwMPMLRNqUagh8ucwSNnip0SqqcHypoFNMfVuJGXPG/ZRG2B7C3PBE9c+KXQDq1IW
 2OA0NFVGib+DgXCGyBrBx7EOqqutxo9Rewyyb1xzGV/eDrP/dmCZIiy8SbBUPBPO64Ff
 wQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CAd6Dxfcm6PBoIbTTBcYUUQyR63fgAPRdyDPESpVCBY=;
 b=b8k2YvjrfQbUOeDRJLbyGe88yEqxt23wVnwHnjd/jEX+E9nHz4sKJmXmzUVEA9F6xW
 e1dsVcdyKjZoUra+3+avkgxQCVTp7ONmizP7PCTnQ2yZWc/f8bo1uku75uT3uyNA2eXK
 EM9UQlrrTBhDM6LhPYiM5NwJ585tUpKcnWpYDY2qHzFCGUL3zE6vXB4LFwF5HShmsImy
 dLz70Vm/jEgwn5cpT4Yvh0SeT2pyRMd7yE9rt/i0LFDevv9kSCusn6sGQDoY1XFi8wzu
 De0oFZ9RhMcdY0svOxp2zf0h7DepS7Xq9WYKOOfMwZW/WayiO1nilsdd5PPbLlUk8d51
 6Aew==
X-Gm-Message-State: AOAM531S3JPN1doRcgAaJX+3/O60MkpLaSb7yi/k6a+G/1lvAV3JO0SY
 o2Wuy9stYAK9AsgFovVIeg4x/w7h2BmvwYD57voJRg==
X-Google-Smtp-Source: ABdhPJyEgexN/cFRJMELR047bEj62oVxzeE920qQmSRrvkJ+pu3HqEC4Mrplwo5FZOXafP3FvI2nroVgyXl0p3x9uRc=
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr819086wmq.91.1630520332695;
 Wed, 01 Sep 2021 11:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
In-Reply-To: <20210901164446.2722007-2-rjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 19:18:03 +0100
Message-ID: <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 18:01, Richard W.M. Jones <rjones@redhat.com> wrote:
>
> This avoids the following assertion when the kernel initializes X.509
> certificates:
>
> [    7.315373] Loading compiled-in X.509 certificates
> qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.
>
> Fixes: commit c1c091948ae
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1999878
> Cc: qemu-stable@nongnu.org
> Tested-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  tcg/arm/tcg-target.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index d113b7f8db..09df3b39a1 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -115,7 +115,7 @@ extern bool use_neon_instructions;
>  #endif
>
>  /* used for function call generation */
> -#define TCG_TARGET_STACK_ALIGN         8
> +#define TCG_TARGET_STACK_ALIGN          16
>  #define TCG_TARGET_CALL_ALIGN_ARGS     1
>  #define TCG_TARGET_CALL_STACK_OFFSET   0

The 32-bit Arm procedure call standard only guarantees 8-alignment
of SP, not 16-alignment, so I suspect this is not the correct fix.

-- PMM

