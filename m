Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C131423A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:49:42 +0100 (CET)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EPd-0003zG-3k
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99bC-0005tH-Bt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:41:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99b9-0004fv-GD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:41:17 -0500
Received: by mail-ej1-x633.google.com with SMTP id bl23so25884110ejb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKunk7wR904qs1BuzOAma2+/9Q4cCHKYLwunFcaR4+A=;
 b=UCp8qtPjXyUl7ljVb/eMB2LJI7qlTHYEMGaUIFFkZJBP4OLbCcXWJWnM8swq5Qyrhs
 eia3CZEa3YrUoPy9zixNINaMKB88srqT+gLX/8bDg2OJYt2Foe2M8c3qsCl5S8PkOMMU
 d8D1UfHhz2g3yvCZQHFqG5t6TLO8quui6DfOH40x6pR+Oy8elUUvpVD8m89iKtlZOWh5
 8TRaqypuIjgkdHm748Y0NOvvBPmGNMkdyFSdn1r6+PAqK93Z1Pwe68/Kt+dHB3a6cnEB
 EiPTy+AkNg2qILYSzG9wHArSL+Woaa8tIcPtQZqdeOtLnoRmPt3OrI3u7c/MtMpdgCTp
 2NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKunk7wR904qs1BuzOAma2+/9Q4cCHKYLwunFcaR4+A=;
 b=ckjnJ6zlKoqf7d8RcSX9F7yDAgI3FK4A/BHYWVuk2quUp3JhnQct+b+F4PQElN5mms
 7RhyOQ66PbMgyr7/76rygHkiUhQ0LRne5lLN+jqxNLVa/hKzv49SyONcROL7o0K2DhDb
 +//MyKH709dcPvmtYDV4h735M5ubcSZmU7VDFC6+t7v/2vkrkpuBdfCSJfbmJWjNrlrN
 f8yHs9FvC8eoCOhTHuZXZjo5D6rEDZd6qaYum/lpUBCNnB7xbj2lVLxv+vWsp3ITc3I5
 MxS3SPpMx2Tjqjnsl+5qrIK7f0H4q9hN7o8GqpXyUK/HgFW/LClcy/xWvzi/1iBIjNtq
 1dmw==
X-Gm-Message-State: AOAM530AclGK1EGwam2KIQu0S+dNMm9297r40R25XRgfTq5ckCKsO9Ql
 EU5BH2NFPw+mnVJeFXs98zLgu/bLJQNUP5HiRQE/Ew==
X-Google-Smtp-Source: ABdhPJzhc0LIhatlRI5oHckdgoxPpsz9liugI1fTz8X+gC2picnuL93YQL6qve3xnf6OOEuEpmecLwn36ZdV8GlrEl8=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr17869421ejc.482.1612802471303; 
 Mon, 08 Feb 2021 08:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
 <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
In-Reply-To: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:41:00 +0000
Message-ID: <CAFEAcA8n8sLTaMGiW2wDKsxS6zCip-Vw8NQfOAv0di7M1kQk3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Wed, 3 Feb 2021 at 16:56, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
> to 1 only when there is no support for AArch32 at EL1 or above.
>
> The reset value will be 0x30 only if the CPU is AArch64-only; if there
> is support for AArch32 at EL1 or above, it will be reset to 0.
>
> Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
> is supported at EL1 or above.
>
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 16 ++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

