Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A439D37C37C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:20:17 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqem-0004Ww-Nw
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqZm-0000fN-Qe
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:15:09 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqZk-0006uL-0O
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:15:06 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v5so16439870edc.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkt+jChPm0N42C1/x6I+vYjeUWnz0xQ05UAjY1oDVIE=;
 b=a3Qap3+Zu4y4BSZ41ofLEgMJRoyy3Wqr70mj0jl8wHYARdRbNInNrduwW5a3OsL2Ri
 bdAxEliOwVpcZ8bsLYEIw8FzLVG/59DuBf6KXl1UOuyqHrCFleq4anDJh6TbDI6ZrGi4
 7yL7TgTkWXq+Z+cqzH+zDvFSc1pqjNuLjXf51QqHt/T9Vbvq/g+wB8pWu/FVbxznXMHQ
 Ia6093YujraXh2beKjo899DET88JJgU4Vq8jG6Xm1nVQhfY4PRtHgaFIzRciNWe0QKSh
 rneXbxCaePMi3O04sunFEirn5MhI1u9XfKcQdw0Kre8DZQrIwIQ8cj5qscH5xBy51ZoF
 eBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkt+jChPm0N42C1/x6I+vYjeUWnz0xQ05UAjY1oDVIE=;
 b=f7ooZnQq0PII3EYsIKajDfuAkFCw1BiLltlRifVbaG8oakRhHF61KD2JHFY7zkEy3g
 kFVWEUgfzXOKs9KOSNa4INeBeChu/yvk0SX6DQ9mpIh5y3ZgUuQ7Ac8wGvKSHTHIS6My
 ul7o+8e/mU3cdEhRj1GkvuOTFH2lS9xiDnNyNf6Ly3O7qHezjD3g70+gAc3qhadNq+fp
 VYXy73DfcZtcsN+10otiZCxV6RcbmqLofEH8KTnhQqMNamgxohac37TiZB7o6cyc+m/r
 /YlAveDhlN02nvkkDOaFaYYb9p5tLuiXBpPhf+du1CEY5AoN0OEdAGMxdCeHukmhObh8
 +0nQ==
X-Gm-Message-State: AOAM531moQaCgptREgpjzFVlj023+yPpwXijSj5ac/eC4SCn4NdGe9/R
 H5hTpsQbeQGocomoLNZ2l50u/jD99rk12dEZAYeWcw==
X-Google-Smtp-Source: ABdhPJxdqJNEeYshTRZlc3YvmH9Lfg3plkeZ7PibcFQL1/jFB8plUa6rbTvf4jrCtW2X7gju8kFUuYq8JEJX7ZsxnBk=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43589924edt.36.1620832501213; 
 Wed, 12 May 2021 08:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-37-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:13:47 +0100
Message-ID: <CAFEAcA-Zb0EpMNZ9S9zyAnipnNQ2J3A7nAESpj0fDf_JMdnJvg@mail.gmail.com>
Subject: Re: [PATCH v6 36/82] target/arm: Implement SVE2 integer multiply-add
 long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Fri, 30 Apr 2021 at 21:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 28 ++++++++++++++
>  target/arm/sve.decode      | 11 ++++++
>  target/arm/sve_helper.c    | 18 +++++++++
>  target/arm/translate-sve.c | 76 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

