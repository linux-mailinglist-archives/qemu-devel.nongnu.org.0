Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639494CD3B9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:43:37 +0100 (CET)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6LP-0000G6-Fq
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:43:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ6JY-0007ce-Pt
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:41:40 -0500
Received: from [2607:f8b0:4864:20::1135] (port=33337
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ6JX-00024S-2M
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:41:40 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dbd8777564so88528737b3.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eGGb+STvjgStAuGQtggL+bm9RoSxFRgODXPR6r/iyyo=;
 b=y3P8/dELowBeObi8GQL+nTFz1K7eZm1+HWtFgscwM5yoNSjRldTcPYZkl8vuGlMbfZ
 kHUo2dwGChT3K3yazlTNtb6/K+CMJBGyQIid9ie0tqkGf/2xi69ITRTLipCBjukOzO7x
 4jlw6ydAln14GVTYjpaKR0dzyrVEfEpAkek/ICz+QwD3bFji9PGyTUU3kK/Z6dWzs58P
 A0KF7DwMeG3P/cpl02dhTamQ/AWuaIbMaaINhQtWTPuw1fJ5adq7IJSkhPY4YqJKkN17
 nbbX5+hIXUMT/Vo8wYhc+t09StPyO/SnJ+ImYdc9f7uMIgEckMrAup0JDapabfZzBlkj
 erUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGGb+STvjgStAuGQtggL+bm9RoSxFRgODXPR6r/iyyo=;
 b=V0qjxLk9RQ0zy9YquNXPwcoL4LC3lcrtmDxF5G1QySypZifaWr4jIN04K7kTX63vP2
 F1rWQ2eiHp7JDHhl7qZJLM7WnF30AgBfE6dcFKujGFv08+OdI8Cn3KX+vcLZzneentVh
 Lzqpg1M4IREVeHjtQFFaEg0hs86qPGQwxOQBOiPbKeVzwJgjeVJPrGHAi9KqAU8rtem3
 PHvAOFq3el7xrLHska1XLGH5CjqzLf48OUUUWJD81/YFMiOS9vckLPlyvC9OZSo0BH5P
 RZNnhciews1ekAHvN//D3gGPJLJM6fMq4pJnsEQT8nCWAWxEXUtTX3DvHOf8s/ne5k2A
 rQhQ==
X-Gm-Message-State: AOAM533rGxCb4YpNPFmqV4UuIigKoUAih0t56WgNeBw031AIDAWJvN/H
 J6QDrcSwLwrH4RPX3VON2//VpYwh4grsgXSPu5qhww==
X-Google-Smtp-Source: ABdhPJzU5S+CJr2kRQ74eECyOc79tCoVPPnEWT2KLJc4BONsQA8ILkoawP2rrL1HuqxQiKeUlgUMJhvPflClnS/+UJI=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr15854198ywl.455.1646394097873; Fri, 04
 Mar 2022 03:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20220304001440.472085-1-richard.henderson@linaro.org>
In-Reply-To: <20220304001440.472085-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 11:41:26 +0000
Message-ID: <CAFEAcA-Rb0E-FKHs_qx8CM1ZeFxoS113UbYpYzPT7+Y_dHUeeg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve2 ldnt1 (64-bit unscaled offset)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 00:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were mapping this to ld1 (32-bit unpacked unscaled offset),
> which discarded the upper 32 bits of the address coming from
> the vector argument.
>
> Fixed by setting XS=2, which is the existing translator internal
> value for no extension.  Update the comments, which matched the
> incorrect code.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

