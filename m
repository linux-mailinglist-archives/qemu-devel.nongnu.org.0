Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD24033B0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:16:46 +0200 (CEST)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpwz-0001fg-CV
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpuy-00008j-Nn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:14:40 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpux-0003Zw-6f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:14:40 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z18so1735315ybg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+EU68D20EgNjfbgAHu9oylLvj3ufJCmtItm3OBQQWuw=;
 b=pC1CYyc1i0sGAyUXFMh46HQyRIYrUJCe0WtRwerYCHeO9jxwKp757/b07Ao62QUb9g
 jYFlUWTB9FkIgZDcggi97RnnpE0HQwZGl/YmE7IY66ohsYVMg2q9A7Ps7pV/chH+r9NI
 pvEV2fxJ+XJ7jHa0Uax3d6YkaaWvMSc8ECtXyzkhlUuXh6En2BuoZ1ydx13Xu5AoNWhK
 M9eAccU9jlCd0N6yJsBZiecw4j02lkI02DNkrbRzth6KBDciFh0TxpZ/haze6PS00On9
 COUc9qZv0BeIbsXE1gEbzeRk3HaFiAdWb3cxEtoI6d3XlxrjKn//cfZfy3KEQlksG2aA
 XS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+EU68D20EgNjfbgAHu9oylLvj3ufJCmtItm3OBQQWuw=;
 b=WBCAw8lHrh2HPTdvf3Cz3Jy83O6QjOSvab04IkztxNqiOOrdnLrDQaL0aTkF4LOPyf
 O4nOREPXqg1Jt68oxvi4M/pyX4dM7vHrkwejQkULD9cGNA/OIvPRysqsLPLGtE533a9/
 JAmoJcv6UQi0gWrZeAEeeB16spnZo8891oRrznJscIMXBd52+l8E14hGKOVk9nH2T/Uu
 gEJ4repaggLSCXlb5MhwUhjvztaqdI3j0XHT913fWR1UeWig02RgpAKO8c8lbS9iyqoH
 mrWi+wS0YO2aqCghMQB21Z4vPSYArNy4Svt3LVxCEN0QjAk6VDu4nCYhcBmsKHuKRxIu
 2SNA==
X-Gm-Message-State: AOAM530jtfe/MPQu63WJ0vgkrdBRgTJkY/t2ZcH4ApM6IcCQxjHGDuQ8
 rmw64FAcLhqXT66CpgsPvzriBglGmvnLsKRJ3gc=
X-Google-Smtp-Source: ABdhPJyghupd5Nm2iKAcgh2EgK9Kdk/8bsaJE5/l+MgmzG09oQqwLLDqK9eFZAC7Xl8TKWngT4iLJQokJ8XZ3hw9G/c=
X-Received: by 2002:a25:1b89:: with SMTP id b131mr2761401ybb.40.1631078078231; 
 Tue, 07 Sep 2021 22:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:14:28 +0800
Message-ID: <CAEUhbmUrY3VkNa8qrvOaP5aY9bciQp=5zQ4=g45JkJFUzarOPA@mail.gmail.com>
Subject: Re: [PATCH v10 02/16] target/riscv: fix clzw implementation to
 operate on arg1
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:35 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> The refactored gen_clzw() uses ret as its argument, instead of arg1.
> Fix it.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>
> Changes in v10:
> - New patch, fixing regressions discovered with x264_r.
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

