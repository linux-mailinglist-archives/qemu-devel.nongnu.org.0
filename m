Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E63B740C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:15:19 +0200 (CEST)
Received: from localhost ([::1]:52548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEWD-0005GN-RL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEUc-0004JJ-9T
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:13:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEUa-0007s1-Q6
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:13:38 -0400
Received: by mail-ed1-x52f.google.com with SMTP id i24so31498579edx.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U23s4Uw9PlUsV5e98fwkaGZ6va+z9IaOkmeGXZIadXU=;
 b=xZ1lps7RKcUCR0dFVThMH/0y6XbtH1y/AIV6tGI6Q9D3gRxNEIlVlUCF1hIKc3olH1
 E5M8wTQjU9pXEhsPS0KOJeZJUOB9xqUIKpvO7AtlpBNOvGxceJ1nzUqmn64quOigTgCM
 9H1ZriWHyvl0z5+lTdncdEcdor6XkZ6kD2ZAgHRXrc2pkrXW/E1iq/QltoDIYG8NvGzv
 rFSQqcA/oTnJoZdDtnFn06kya2QvhtvcMesDA553ejwNQ2sEROJZi9UjVy/RGk+sMzgb
 guwiWGRde48LVgxqN3On3n8anUluVxSEE89Kc8iirZK/zEzXfkkCjyMIh9K5DTkXC8g4
 xe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U23s4Uw9PlUsV5e98fwkaGZ6va+z9IaOkmeGXZIadXU=;
 b=E7miFz843YdfTfay8qB9qW0EsDG356Z8sz2Z/E1aYr7t+1DjFinscYkcJZdjgkBpuU
 67n08oFhdoM7rMZ7nVTpmfPKfCzAVPMZnvShaK1v+VJ9V6upc9I7D34XxCKbyMluH2q0
 xSuSRoV6WHHyu5OR/8U8gb1r4bDOTYdokgnIXgf7ttlS4Nj5ZiOmzxsaSg40SgP9PwDo
 UMSd9Z3QwjBkf0VMaKF0Uzr9RP6i07e4RiQvLYBCb2+XKfrX/0/JqLmwwL9Ie1xzb+UB
 zXMlPGq9+jMAUJXVbAIaNaBjN4CMEbW/5JHJnBTVT2A8HVRrM9gYlsLdHZh5CjN8Tt2Q
 ajGQ==
X-Gm-Message-State: AOAM530PKf44HF2KV/8/olegRriwd7dmnDmMOOAIX342w1WzIsYl4UzQ
 raWwFUOGNeUwOqDYopKICyeP2n04LqDMtKPh7i2anA==
X-Google-Smtp-Source: ABdhPJwn3f3Y9qCPUf30c1syoPQn2whi7phGMcKiYitaXuxlLJjcpYVvpxaFhDsgDRaElt0DjQTqCCScaZlXDA0zPLs=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr40217647eds.251.1624976015249; 
 Tue, 29 Jun 2021 07:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210629081551.14133-1-hnick@vmware.com>
In-Reply-To: <20210629081551.14133-1-hnick@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 15:12:58 +0100
Message-ID: <CAFEAcA_E3p=jKU6xBDoRCez_Uau9dGAgekuUpawcLh98hU1N=Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 14:03, Nick Hudson <hnick@vmware.com> wrote:
>
> Signed-off-by: Nick Hudson <hnick@vmware.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a66c1f0b9e..7267af7924 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>       * We don't implement the configurable EL0 access.
>       */
>      { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
>        .access = PL1_R, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
> --
> 2.31.1

Is this just a repost of the same version you sent previously, or am
I missing something ?

thanks
-- PMM

