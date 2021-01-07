Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9592EE790
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:19:42 +0100 (CET)
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxch3-0002OP-3M
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcgB-0001xK-Gc
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:18:47 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcg9-0006gW-Sh
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:18:47 -0500
Received: by mail-ej1-x636.google.com with SMTP id d17so11655649ejy.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFSg2lUH/Pp3ItikXun28EABwkMOlsoO4AZQbJViC4M=;
 b=SvSZLbWqFgxNLVmRHhB1twGnGa3o6dk6HuRvzrGe6dEt7/dBRFuh054BLbsHHfP6wa
 Vky9sR45TSDft3hTaHqBTGFnvoAInIBb0j/skEvjyGimoGN95JuWj/hIrd77ZekSTzwO
 ZIMCQ5lCqS9gNlKd27eTHLwX1mbYrvmzPkcNuX1iAVoNH1FoaEzhe73pJTKb03fd/2PC
 pLDw21FzsvqitWZeIf/WndnrWyvwl9eRFRwc51xgk1N/OpOxyDQ5OXoiYp2domVG6une
 OJrSBn6v5a+MtzPL3l1q3eXP4IJxWbJ8dvBw4qEr9SJn4tCoLZuGNNiaLB80zk6lM8uO
 5xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFSg2lUH/Pp3ItikXun28EABwkMOlsoO4AZQbJViC4M=;
 b=hgZBtI2Qk/0qHnFjuOUxWGnuNKXIv6PMbzUnPuw7i5SvDFo4kDbSVtxiwCg4dJZIBO
 7fZrKEp+dWB624LDqHeXPKL5whb1CL954pn20TnKYL4h70DGoPKOQNbtBGvHh9Zq1eer
 PyqwvbwF/RBxoAx/pNyafcFNPA6U8ifuGNcD0ASkNGNNqHPBfIazdmX2CIr73K5PEiUU
 XYjFjuSAIFxLPDLNuVDzQvJ/fZSj0ZiQhUi4EJKxaI/QihTqZJ0Zt/SiiemrIavbDiCw
 CN24FhO1tQ+ljZ93FUApDirlXnrF6V2PBx28RzAiUO7E1MdqM5gHdAxokcI2pOhQ1jSe
 fLzg==
X-Gm-Message-State: AOAM533D45uEy+4tiNLgr20sRBY+BHft5d22lggohVYNaqv4/APmy2hT
 S8uFadMFWluBDXUXkQVOTwCsXs3AZWfC67lsfk9F3qP1/HI=
X-Google-Smtp-Source: ABdhPJwpBgxracdxnKnhTSo8Cw/yjehz4D6FoUAERBuKnn7GgDkFseaWKxe784UisiLABMJLN4zleSjVKSru3mYwLHM=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr576662ejb.56.1610054324148; 
 Thu, 07 Jan 2021 13:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20201215154107.3255-1-peter.maydell@linaro.org>
In-Reply-To: <20201215154107.3255-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 21:18:33 +0000
Message-ID: <CAFEAcA_zbdz405MV0S8Eb6Q4a0FBT7GtRyP1sgCvTBWm3ahW6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] qemu-timer: Make timer_free() imply timer_del()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently timer_free() is a simple wrapper for g_free().  This means
> that the timer being freed must not be currently active, as otherwise
> QEMU might crash later when the active list is processed and still
> has a pointer to freed memory on it.  As a result almost all calls to
> timer_free() are preceded by a timer_del() call, as can be seen in
> the output of
>   git grep -B1 '\<timer_free\>'
>
> This is unfortunate API design as it makes it easy to accidentally
> misuse (by forgetting the timer_del()), and the correct use is
> annoyingly verbose.

I'll take this via the target-arm queue. Thanks to all for the review.

-- PMM

