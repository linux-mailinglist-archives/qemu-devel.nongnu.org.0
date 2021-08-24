Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB13F62B2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:32:18 +0200 (CEST)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZLV-0007dU-FP
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZJO-0005yJ-5w
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:30:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZJK-0007j6-CP
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:30:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ia27so23355588ejc.10
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iS6EuZ9dX7hS5hkKtCAvDqnJhi+ndbr25qX5bJySdB8=;
 b=G/3xpmxycWlJjWpTuLMyh1SnBBCKHBUPoDPyqeDeGsVDRL/8LhOqXpBfAQQRnIqZ26
 IKVhPh32hq0GZJmu85W2fb+mSzOwP0EsuHchrPEKu9v7RgxGxm6kNTta2C3Jt6WVi74g
 rKXYjSsGRAaMf3Ok/EIgNOBjvr1Il84h4Niclsl9UNok5fvs/7RyqZjpXg+ny9ekvhfS
 PoR1bZ8hVW+CKFsIZS81L/gV/PrXV9VW2gutZZhhPKfANTll304uBucoP1VbQtb7leYJ
 uF1Rik2qXzpewOg36BC0VUxY3tCxUFFXlKcme0ejkcMxDPSCToAr5FzoTBXRn0qliwXF
 S+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iS6EuZ9dX7hS5hkKtCAvDqnJhi+ndbr25qX5bJySdB8=;
 b=ueuh6xCNXcXi+FZULmxosigh0qcxaTwrA7WesPMxFz0DnXv1btTcLQy/zyYtxilBwT
 Hc60yOCyNebHVWji7yuipgXCeVfMJzYycsDGIpa/kYsAKh4Djje7nq1n0cTfRmp32R5s
 nHa+gEt7BozcQHNKrEWPvdaK6AD3rVR3EleXyJkJZT4A9yl0vd+w1w1zlV+N5V/jyY0M
 C4fxqU3KJWUwpPBueiYYKTCz6Wjt6QQN5+wNdQW9TDC0e/QmqXNbQx7Xu7EjFbKDNyDo
 LkR6My0ygDuohzNv5qQVP6y3QjUzwskBGni9OXFtjLDqwCmJOklkMfRMqBEkrdIIE/ga
 ZdoQ==
X-Gm-Message-State: AOAM5333onDW6DAApey9Q6K+uO3+1mI072gQu8t4MuF2UjySNcDMSkoy
 2gdZb3zldYqaVKScr++HthB4Xp9+DFlMX/2IX5ECaw==
X-Google-Smtp-Source: ABdhPJxrf0ocjUdXl8k8kV/o+/g1jOUboifFeZsTOYliPQ22aqZZw7t1DHmBK6MDXvtBjlNFCyzxgVoVTSUnfhed5gM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr41505602ejy.407.1629822600865; 
 Tue, 24 Aug 2021 09:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-14-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:29:13 +0100
Message-ID: <CAFEAcA_y_1CVEny_JMuC1TwpFm_uN+JTtBSoPcL3BqtGbDZnhg@mail.gmail.com>
Subject: Re: [PATCH v2 13/30] linux-user/hexagon: Use force_sigsegv_code
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new function instead of setting up a target_siginfo_t
> and calling queue_signal.  Note that we were incorrectly using
> QEMU_SI_KILL instead of QEMU_SI_FAULT for raising SIGSEGV.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hexagon/cpu_loop.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

