Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D53BF9F0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:17:29 +0200 (CEST)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sy8-0000Bj-C0
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sw4-0006j4-Ke
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:15:20 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sw1-0006JF-Cd
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:15:20 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bu12so9308320ejb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nT497qzfEj2kvN1C+SQTe5QMIPJjPkAgPNTToeqNSc=;
 b=hsS9xhBp2IqmIUGd3VkUcpQPzPzPXqMGuRXKdZQmiSJ/g9Ji9n4SKudaVESnso69yi
 kvxI6tRKKGjtCaWgkhPwXlDTXOoWCJOUQfJfGkKfINTzJKSMnoEtPQSeUk65SC8T+6sB
 bwoQqKYlERak8Zo6Q4+d/2HMM3gWj0b4tth6SKsovx/Cf3SIE99n1I+CehZ9QUsSWGU0
 HovVDV9oJlH29jaPzEk/t07LpACdhbv3cf0kDghdBTeMnmfPSg0PzZx1ug9ovza8JQtO
 zgIwWEBcEhpOG3gM5GKCXNGgSD6nbsFkb7EOS983OZiQo9tx0alGMbYGkFMaLuAjYZlL
 UV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nT497qzfEj2kvN1C+SQTe5QMIPJjPkAgPNTToeqNSc=;
 b=TT9cifBzxHf7NCj97xKeY5gi94gVQvSEmpCQ1e0TA7SmabU1Nzitn100Gz0tlebsI2
 N0y1v5Lz04Xx9mageWTxaqnlmyN06yiuapSG0VN60EamKZSFCldAax1pxbin4EiyW4/G
 qKRzq67ERi7a/SQRAouahOFpaeJ5JfE4EraEDrH8L9DsINz3a/QDOipv8HN2yp4A6+UY
 dH9zbmRuLvT9B9P6prjyNPU+muiFEAsVWv20IXE+1t1j8XpIFwfRK0GStgdUnZOgQHKQ
 8r7k4Xw+fDr7j63RCmsrg8hrfcwrJdmyTRcDJxIP1Q68AEzevJqtcfnrBFTPcYvkA3rn
 kx3w==
X-Gm-Message-State: AOAM531LzRMzq1VOztP7fAgDCXIqJMfOoQYPp//tDwyB3WHj5qroysUD
 vvp+Joo19h0+D39XrJgDHZww0YgEGxpQZyAuT1b2SA==
X-Google-Smtp-Source: ABdhPJzV1r+0xuqsBVmxnli3uBiHw7Nwoe3H1ZVbxxN40cyC1hHf7/3SZ/CvfvMvfk0yCMmSO73hwCgv2sxTpxEiwxs=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr9834181ejd.250.1625746515384; 
 Thu, 08 Jul 2021 05:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-8-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:14:36 +0100
Message-ID: <CAFEAcA_27x2nrTCDzXj8Xv640x+0M50gM8a8wrgGYn9M3CxokA@mail.gmail.com>
Subject: Re: [PATCH v2 07/28] target/arm: Use translator_use_goto_tb for
 aarch32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Wed, 30 Jun 2021 at 19:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

Now we end up checking for the single-stepping case twice: once in
gen_jmp_tb() etc, and then again indirectly in gen_goto_tb(), because
all the callsites to gen_goto_tb() carefully avoid calling it for
the is-singlestepping case. That suggests there's more cleanup
possible here.

For this patch, I guess
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

