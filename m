Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC3638794E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:57:01 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizHQ-0001z3-HZ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz7I-0008VH-Of
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:46:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz7H-0006oz-1m
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:46:32 -0400
Received: by mail-ej1-x629.google.com with SMTP id z12so12910178ejw.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/wZC5mZ7Y5Pdn9iqj3Gzlkf8WZzuqx8i97sO3dKKbI=;
 b=gzY8xoy72y7goimfdzZFfrxWbPYUaAdcij10QlbQoGeLbajgXHAlYwXEz45yN4rLh6
 nnW++bSJaOylRJsOHA0ZvxDrtzYT1b2eguGqY1L/XpIPSf+UDAMyIgMt8Sjg5HsLC17f
 XK7EF7hgFQSph48v3CUvfm0IydQqJii2Z/c2/UJQGq3Lx0/inpmA/gLB6YgshIxgzzB+
 f2xhOwz7Uqkk4C2FVuewRqfJcEC2nFlCiEr6DhXad0IqUbARdpZggQ+J8g6lJI4FTW9o
 /fhv0JqGuaupzVhWuBQZXmn2iBerp1cL+2u2wLjwDKE1g5KnINaMe023R6QHeYBo9BnZ
 7fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/wZC5mZ7Y5Pdn9iqj3Gzlkf8WZzuqx8i97sO3dKKbI=;
 b=rir3DYxDB79e+5on8SY9Ku9FinTgMokRNbz03q2b6IHh9gtWxMsvviyhVVcMcSjDQJ
 dyqPD22HYZyfTELonKFXq+tankOZMZaN7cDRoCFyId7cLG+x7a75ABgpfiTiM6/wMWE1
 krxp8eHMbjN1wT9ImOWWOd1WPzVbDq+IgX+oLgK07gGR3Yqg2RTDEIiiNdw8NWehqh6s
 CzacBAQi/qv/gwwE2oszNVJiBfZQXwg1dZxbd28ExMir4EgG3/Uz6oxjWMN7a0dcrjdc
 ZYfgoRonS8MSaZc03MGWcYITZCNTo6joqan3e0RerZqitSw+4Wk8xva+oqbzhf5aIQ6v
 Ek7A==
X-Gm-Message-State: AOAM533ZjHJyukbV4zhfpcPDD2A1J0PJ49Wlo+HNxUfiLNSVdBFTFB7x
 VnBbbeR29CKtx1TKaHzFFoe76ljnnhw7vh0O5cgGMw==
X-Google-Smtp-Source: ABdhPJxnH2SVf4I1HPDzqthAkA/FyCVmtB98C6Lvc2ZwX2JPMtkvdvehaQ8iPYuEuUr/UzbxGsrU9n1wHbxSFAWzIco=
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr5790668ejd.4.1621341989096; 
 Tue, 18 May 2021 05:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-11-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:46:12 +0100
Message-ID: <CAFEAcA8fF8NiW7dD2cc9kmtiBa8koxMa1o=RBMjMTJEjSMhYpQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] target/arm: Implement bfloat widening fma
 (indexed)
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

On Sat, 17 Apr 2021 at 01:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
> and VFMA{B,T}.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

