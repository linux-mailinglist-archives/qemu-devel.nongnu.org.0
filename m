Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFFD53E500
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:14:45 +0200 (CEST)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDVD-0006ie-OU
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyD0I-0000XY-NB
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:42:46 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyD0H-0005zO-84
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:42:46 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f34so25750718ybj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIjK04nCBmY09P6J6lluvziMpkoYq9WyiLZ58TThnV4=;
 b=O6tfn8J2eo/2A63WuxZNmNxUzD2XPHs64oL1w+QjfmTchUh2/BkP4P6vfgPBtY8Xue
 fhEjaH6RAzYcccjWdb4S7wNH+2a7MrrvN08Rr6E09Mv/flriw44EbnHqddv92WGCpxAd
 hEsCFoamdhh/poWNx91S8U6uvH2obBVYhpu+P5U7FDjAGBgpxTlYhjmWlIl5ZVJIUHnz
 hYN2KEFPUtBMTzaYyXYK/S5Dz7TJYaCL1JGXDA6nG1yWxgLVqLIOoO7tSidlHo4jfUsF
 qx5Em8b1tF1tJs13wfnitunRi/e+jel5ZBYL+98oW2pjtD+DfnT9kXP5I/DRoJ8cpCiX
 dSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIjK04nCBmY09P6J6lluvziMpkoYq9WyiLZ58TThnV4=;
 b=B8T4E9WKDdGORKPj5ZfocarcX6h+0ZZoXp10cUX3s0ZKTjoLMUd7NJd008Bz8gt8kx
 7qLlOEH+tbqlLwtenLh5dBsIHJ2rV3ST4NbtX+GLF101d0rL5sn0JsfdzOxdE00/gwpE
 HzRzLK3dcRzFQUz8lm++ZJcCk3aXMhs+wj+i4/BpLWPpjQT0G56241hpmlml62L8DMeR
 RsKLi3QLXZa4UAWEXnpVgIKqzI5J8fkMFRScqQEBGr1YyJXulGqyv4HACBOsRdOi0nTt
 50SQC7JnP8p1pDl9Bu6YPj2ZOjfbToHTPgDwsTOYDWD12YE9HvsdCR1NjH79USnAbcHo
 sG+w==
X-Gm-Message-State: AOAM530EpQ3WzQIAV9+2MlkbaVmnpJWQZV/PxAiuFF1LqiQ2cGJ3fTes
 0lf+vE7CNQnJAYapNapy2GiuOQpAPYKXMXNMUBYyTA==
X-Google-Smtp-Source: ABdhPJzp0xzeVvaXlEgdNm7QmJ1TesuKNmn0bkyY/HrxkxZW8aqaOXVoxqQUJppZqo4P+D3Nu75WakyRaHOT2h6USXU=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr10144713ybt.288.1654522964328; Mon, 06
 Jun 2022 06:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-27-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:42:34 +0100
Message-ID: <CAFEAcA9DugkyRQ96qGTLdxirCxCqJGgh79RvksARbKW-cKW4og@mail.gmail.com>
Subject: Re: [PATCH 26/71] target/arm: Add SMCR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These cpregs control the streaming vector length and whether the
> full a64 instruction set is allowed while in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  8 ++++++--
>  target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 2 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

