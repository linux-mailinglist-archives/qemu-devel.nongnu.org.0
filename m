Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A560D04D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:20:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLfH-0003O0-Hu; Tue, 25 Oct 2022 11:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onLfC-00032v-3h
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:16:24 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onLf9-00045C-U0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:16:21 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r18so11727195pgr.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X54gy/PkOpuQgtaG67Z7k5J+ldYKLWmcBLX8O4IPaQE=;
 b=eoYQD4Gpei3C/2uJoz12AGeIfCGqUGH1GMW8+psalr0x9DgBjBuCVzJc+57T1btzrY
 qTGnZFjOnaUwvpE5js6bbP+y99vEz5D14nuVzlVCsA2DGqBIkOVWP4mt3K5A67f4aBZT
 w9kxVnAaaJgyybPoVFbtfHUoxjUxwHFgDaIFfZIMJNzvCX4dh4rq8W1AVli4tXRFT4lL
 N9T6zahn1cJ11fjY5R5IB3Wq7ql0gggijEBYgpTJQNDN7lkfdBqrQq4c8yM6+NSmJAzs
 KM6GZltrYUaFFx3t50xeBLoUYBgLU7taAEyxN2ju7rDhkMQ7UgqbYT02hEzRXSve3fUw
 CQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X54gy/PkOpuQgtaG67Z7k5J+ldYKLWmcBLX8O4IPaQE=;
 b=5vMkgc5BSiC3FNYwrkU3LKn0NSOSSS6aLfjyNAXIN8m/91RjQSQXjlX5fqv0Ly0mXo
 gzk9gfkNg/G61LUEAN4RjH+SLjCvSEaFze4xS7iwLAlASP6cd+8GrxPOypFAJPM6rVOc
 dDKhUKhrwImGW44/1nDYPlODL1YizVignWjZPEBwalwZHmJ+LKjCeBuVtPIWwaJGsLLi
 2sqH0B+X8NZQjzpB82xxBM70yqs3NbvjtJgN2xPPO/j5YJP52KK3He8rh3tYAeai95Rr
 3JuifMo829YGNYW0fW68Roozhca9l+C54zhDztPS30eq3tAPLN+TTh86mOtJl6gznyDg
 04Gg==
X-Gm-Message-State: ACrzQf2rLZbi4YaDPtst3OGNX0UnFq/7h8QerRTqr/sCjvA2O43Veyc4
 Wwv0Vqu+GcTOI/cjn0DqhMrjtRwAjKJAilAxBe+jmg==
X-Google-Smtp-Source: AMsMyM7Ikg0zoXkkbm8uNsLtFsujnXCmanH2N0U3TpsHEAPfJwzDKYJtmUhS+mO0XowZKY7Zd+S4p0NWR9c4m/EcHWw=
X-Received: by 2002:a05:6a00:b54:b0:566:917:e57e with SMTP id
 p20-20020a056a000b5400b005660917e57emr39096479pfo.26.1666710978077; Tue, 25
 Oct 2022 08:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 16:16:06 +0100
Message-ID: <CAFEAcA9LmEovmfZwt-KMPm4w3BmDLEiz7-VqcNMH_4rxPg18Rg@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 06:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v6:
>   * Fix rebase error wrt xn bit extract.
>
> Changes for v5:
>   * Rebase, including 12 patches.
>   * Add regime_is_stage2, which I should have done ages ago.
>   * Reorg attribute extraction/merging vs descriptor modifications.
>
> Patches lacking review:
>   02-target-arm-Add-ptw_idx-to-S1Translate.patch
>   11-target-arm-Tidy-merging-of-attributes-from-descri.patch
>   13-target-arm-Implement-FEAT_HAFDBS-dirty-bit-portio.patch

Applied to target-arm.next, thanks.

(I know Alex asked for a comment on one of the patches; I think
we can do that as a follow-up patch.)

-- PMM

