Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890A37F955
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:02:29 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBv1-0001Qb-TN
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBs0-0000M5-UO
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:59:20 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:47061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBrw-0001KX-Q6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:59:20 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u21so39956785ejo.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/3kmRDsJ4Ld1DIFxHM8TIbe8hbI0FMQYQAid4j+WdQ=;
 b=VLfZ0/+teGofvd0XUyAK1Mbd1iL1uFtKVRZmb4jZ2U62wic4MLZXARK2T/cjcEEjOk
 8L679AL8yZnGuvEZMKBLOHEei+eIfFdjD7cxLxYI4mJGskcZmoPcEmueAvrKJEuIPSQC
 vUdi4lQglkoDx5IT6bmJj2/rm9+RVByg0DAhJxjj/9QyYUOz5R8Il6iMzHIb6sKzl0uN
 tXokH9zhAiuuvfk1dziqaOtmaAyP+P46kE+pJGcjKwf1P5X73b7PXWFTwtV5kZT4dq72
 amHMIiZntoIxzhSi7wg1uuwsDEjR0lxMDr4znT20vxGMXQ7b+PXm5F7AdWIT4DK+xxgd
 4YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/3kmRDsJ4Ld1DIFxHM8TIbe8hbI0FMQYQAid4j+WdQ=;
 b=geKuIyhJqkqgCkBC1oPLkqTlvX3CZdPBpv2U4IsGSblGRutgJiuwKW2VsT4OyK4tjx
 gkrNez/Q9jmH6RBS0J16S+5vz5r/xu49VwG+ujDNZtVJSIl+Jo7GiA6gTK9ZP0dJlf38
 ohW8XvEWhpRFDDWaFVn0vulsRsOWNnNGG8PvzA4WmjgmtmPjL7ENyD3XcomZ5vdLvuxO
 ToSz7WUt4/+NcAkQdswdtyic8H066Pkyo6akLin+D96bTsKjs5I/Nu9oyek+cQdVGxjY
 459jEGYfUxOkOOXrisqTwPV355C1CQGz0klrO8ARfSKhhd+83Eq3FmpYAh0u6yxBozgs
 AxZA==
X-Gm-Message-State: AOAM532MLID4j4MmI/h3bJimFBTjiTcOLfyR3bD9dyo5IPeFyWdWwRWY
 isv6k2vjX890wOWMs03iEMeVfhapVixXVWLIFnsaOQ==
X-Google-Smtp-Source: ABdhPJw2Q9/M2zOWbiOAfvh9zl9srCWUSLpbap4Rb5AdGOKl0Zzdury2/5ppD983WArGhKfO8ULi+Cjrn5mJ00zLxW0=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr44912335ejb.250.1620914354765; 
 Thu, 13 May 2021 06:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-65-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:59:03 +0100
Message-ID: <CAFEAcA9PTpkrjahY-cj1wyU_LTzdKsd=KLy3+7aJT5qDK=i7uQ@mail.gmail.com>
Subject: Re: [PATCH v6 64/82] target/arm: Implement SVE2 TBL, TBX
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200428144352.9275-1-steplong@quicinc.com>
> [rth: rearrange the macros a little and rebase]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 10 +++++
>  target/arm/sve.decode      |  5 +++
>  target/arm/sve_helper.c    | 90 ++++++++++++++++++++++++++++++--------
>  target/arm/translate-sve.c | 33 ++++++++++++++
>  4 files changed, 119 insertions(+), 19 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

