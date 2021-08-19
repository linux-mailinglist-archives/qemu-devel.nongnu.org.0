Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843173F1124
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 05:05:12 +0200 (CEST)
Received: from localhost ([::1]:56086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGYMh-00024Y-Jy
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 23:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGYL5-0000bX-GF; Wed, 18 Aug 2021 23:03:31 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGYL3-0005WY-QN; Wed, 18 Aug 2021 23:03:31 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id a93so9520112ybi.1;
 Wed, 18 Aug 2021 20:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O99VjHvdWXsJq3z4mjcE46HZx2L1iFBvNaMYyMFlH3s=;
 b=cn7oFfL5HTqTA5pFfNjuLsHFy0SdT0aWC8T1YYVmSrOmuiTuY3mika+Styj/2BWXrQ
 r2CUdOleTTBeruRs41ATUaE7hveq4VOjFqyYfNjuZmQHEGwaeSZrCwtzsCyOpog1zlTt
 67JbWWoLHZ6DIROZY3PGQXBw9LZRh7PsZmJRDmeQsUzKLNt9vLFn7r7q8M5LHlqKbnWf
 13jYx1g1XC/ZiJRaJihhIwR6F38MCZv+h4CB7ifPnyI6s9p9KANoTFIofFc8sEdHAKTp
 p3GdVODBOkTCLjiQct2VMTyWRPGhUbucgDyn/c8MeT43jkU0z12QtMPcUGGXmQxMlHZg
 lHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O99VjHvdWXsJq3z4mjcE46HZx2L1iFBvNaMYyMFlH3s=;
 b=Gfl3Csm+4M3B6oJu8NhFvzQAPjhOrcjAJ5cqEe25cgsEa9jbt+HfDdsk45LLMbcysi
 211SqSE0pNC0sMZoQYutEAaBk0RggS979XCzwIFUMXXwnqhZ5iIIDq4nb2ZzQAFU6SQ8
 YkZpgUdpJTyS4DjlUqXX0ZuJ/Scyy5x8JrrOPKWabCBK/OlLn4506hQagFhJyMQbJh8r
 3UBwdiGdcJTFtwQ1NMbtnJKnVOGRYJb/Bx4wXLdlaC7y9aclKmDo8Ap+tn4AQ6utS7mK
 ppV45nEs0GN9/S5MZJL+1gzWyUmA5D1p7lz5tWW+AWPebCy07G2XxFG2JxvlsucZbL8V
 C9Lw==
X-Gm-Message-State: AOAM5324sA4Ds9K0Fx3q+ys72BhNMpcDfctLnA/SluMToCIvM94RL6D3
 gXX6OTlqPXdOgcpdSGYfaEQ15/4SjkCeVhOMbtY=
X-Google-Smtp-Source: ABdhPJwmxD3M3aNvkgjcRvYEmufD5zqfhqaHk7ZM2uJS3UEVm+AhYMsmuQnF3ZiOTsZuhaY1ozvjYLK454eb2LVsnyk=
X-Received: by 2002:a25:cf8a:: with SMTP id
 f132mr16414066ybg.387.1629342208594; 
 Wed, 18 Aug 2021 20:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-10-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-10-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 11:03:17 +0800
Message-ID: <CAEUhbmWzJi0Ok5_3BT5uFCGmkr3WsiMXvz_3Hrs4dYWdrZEDQA@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] target/riscv: Move gen_* helpers for RVB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 liuzhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 5:21 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move these helpers near their use by the trans_*
> functions within insn_trans/trans_rvb.c.inc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 233 -----------------------
>  target/riscv/insn_trans/trans_rvb.c.inc | 234 ++++++++++++++++++++++++
>  2 files changed, 234 insertions(+), 233 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

