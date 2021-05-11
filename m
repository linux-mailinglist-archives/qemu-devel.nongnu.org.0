Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAB37ABCA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:22:38 +0200 (CEST)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgV9Y-0007tw-Vo
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUyL-00047B-Rh
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:11:01 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUyK-0000EP-68
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:11:01 -0400
Received: by mail-ej1-x62c.google.com with SMTP id zg3so30615729ejb.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQDIQEIF71Ng6srpZTv9mLqX5s/ul/zEa4vmGZUU95M=;
 b=x4XdrGO51RfkyqzrmHK8U1XoxObwh4Slck6C1zBeP9r9kprsRHCp4+ROpCP9RC3tqj
 okD7aYW1R3qzpG1yuE17dxliiT/KnJMvZSNj3csqiGvB9c0AXX53hzihQdkiQcsuYS7m
 yOpUmz/I0+NBKUUFl9QNkGG5rvn82qJOKJ55iFd+2sj+2LjTXZZ0kKzMNc60+jtBGKrl
 fClxq8izllzaQEsac2aTlF1h9W9rQjryhTKBcU/m9X8aUGX/3nTYKxWV44ZVFR1vzOMJ
 DEaYvBwIFIcDyAoz/eugSHlLnQgxVhBwePnqrPU2BXkk8Bi+hHl+p+d3hiNrIz0MqR18
 7HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQDIQEIF71Ng6srpZTv9mLqX5s/ul/zEa4vmGZUU95M=;
 b=dyw12GFi1x+3Yhr3ZCNxIJ8RJPy0k1EsHTodzf6zV6cWKsAnKKQ1e++WlYyYiECtz3
 MxVqWsl3CEZCjIZblbrY6OMDCQvHcoon4th5tm4RzQb1+ZLgZq0A+dPLi8+PxC2Rmuse
 JNF7j10iUZX1XnHKaGz/Lkq0zJWY9BRESeA+qXmwW7x6kWd0FugQDLhMUqEa4hl+RvoF
 NCOYml14/4XYMOopSGEqYGWhABTktqwstSkmvoiJm2GOn6/FGqJLyeRLp5LeyiT1x6W9
 zfSnlZzQjBa5zNHfVKZojM+/GAxFkrpAgvj+ps4OfHCjV958NPtHHjZ71XUPl7njeI+S
 fO2w==
X-Gm-Message-State: AOAM531CkbZq2m9t/3sxk/a60/4X4KLMbiijPem2gPSLSKkHwKUmBLeH
 40iTcq12Hnpnh7RgKNOVTaQBz0z9RME6lXiiSJulsy7cZgE=
X-Google-Smtp-Source: ABdhPJxxr60HicCGWAS0Sg1g6v/w/sfWy8o0YyLNJuhdoJq3aF/4jUUXueSAMcvQWuSwQmh7YLUfmmuWMVDs+0A3ZZU=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr3161919ejb.482.1620749458586; 
 Tue, 11 May 2021 09:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-26-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 17:09:46 +0100
Message-ID: <CAFEAcA9EKrNAFuPcnKg1oXMo27OfyJ6y1Lg=EMpas_D2VLsu0w@mail.gmail.com>
Subject: Re: [PATCH v6 25/82] target/arm: Implement SVE2 floating-point
 pairwise
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 30 Apr 2021 at 21:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Load all inputs before writing any output (laurent desnogues)
> ---
>  target/arm/helper-sve.h    | 35 +++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  8 +++++++
>  target/arm/sve_helper.c    | 46 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 25 +++++++++++++++++++++
>  4 files changed, 114 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

