Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF8387755
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:19:05 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixke-000078-41
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixLr-0005sN-Hm
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:53:27 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixLp-0000UA-2P
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:53:27 -0400
Received: by mail-ej1-x635.google.com with SMTP id lg14so13841647ejb.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUb08Nbh7NGRiwKPFr9sRb2tkEp3Gl8xaSMWG9/AZlI=;
 b=TumZ5O3MKQ8BWUvckcNXsFeWLBGVhDR1NHFeV2SO/KuWjs6IeFHQ5npWRUBb4O8OU5
 8WZ3prxiwHZuZ4/gq/5sMnpzjBny5cs058WLJHFrlQC0V1P3gJe1Fw/20zBeg8eUF9zE
 mjJLpeNMihu9UXVTe56/jRY0DamnXpDem2LdOCS3maHa9eCwjPtDRfjQJ0AigHezVjF0
 2qhEO5NkRenTrV7Wlu1PNKpHG/uN9T6mK6a9++/fC16+ZnhfRWUg7gFl/vj2u43kfeZL
 eWdAsuKJBHF4jCE0cWZeRWo+RdYQzmxiN+KYO6aQgpfQ3enZmKt4H6AudA/NIID7XN1Z
 QAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUb08Nbh7NGRiwKPFr9sRb2tkEp3Gl8xaSMWG9/AZlI=;
 b=UClSR04sUj2Gf6+dOKFJJE4gb105YsGySGLnX/UW3e1tAY9eA1HomjXH6QCZ1cmelC
 cGI5ryA68fFXWu8jSIToYboiYw8kEakMudjpW/DGO5vMp+Xw5TU/sv3VUOMKACC/gZcf
 6rDtvoYQqkFh1bbNnAQWu1nObgyftosadCs6iN674mOQ++ee6sVuKg+Gp4mAZnz7SHCs
 t1nbbYQbklTuQ4+0QshWQdjxJZoQMb0RA+pgBBKXYgSDaxee99QgVM4mwUdhuc/RgsHQ
 eje31vfBuethr3pGjoeifux3JVK25lp5NBiN9Z+XoBeK5SidajYPHP0od5HfiHLsX10l
 ZMIw==
X-Gm-Message-State: AOAM530WDW9qAqarizZM2/bx8c0zc4aYPzeGiVtaQmtQvjWW5wZuz8qZ
 yaU8BmxMsVyjCBhX48lAiNUm4P4TO2y7flOAhXtvoA==
X-Google-Smtp-Source: ABdhPJyPFEJUy9kPKfJ1wKMaF5wc+tLtKn4KvrpGZ1XzUlcdmzxTAzuxY73gYP9fBjABnaeebTs/+59iP61HVw7TLNA=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr5294254ejb.407.1621335203428; 
 Tue, 18 May 2021 03:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-4-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:53:07 +0100
Message-ID: <CAFEAcA9sdSrc3Z_229fb7R-PA71am8HZkudhB1fEtbU+JEzxCA@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] target/arm: Implement scalar float32 to bfloat16
 conversion
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 17 Apr 2021 at 00:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

