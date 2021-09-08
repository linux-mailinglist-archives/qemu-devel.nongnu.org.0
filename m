Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F54033B8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:24:41 +0200 (CEST)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq4f-0000pL-01
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq2O-0006x3-Ns
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:22:22 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq2N-0001VI-7j
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:22:20 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id c206so1741817ybb.12
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSgapu0H/WS0gq0RYEBnVyzMcJ3SMNNaA/8cyAYroLA=;
 b=gVJ1st1kBdqbXv71DCFtrN8OCQDh/TCCR8BnB2Vsl2QJ5Y8z59rmlIeJ0TdJnogwa1
 zo/+t3snsxB8LdcwnVbuqxNWz//oiEnMhT+xXHRCAoM4KQh4rUEjNAOgjF4Gt85E20kR
 qQdclCIQDxJ9pLbsWj6MjDb4n/UExYnn6CPd+7WL8Xd8cAFNjzHrqHwCBuN8WnSiZAwK
 hrA5Sal6oeIikhE3XcunYh+eYj97duDwkZIqYMcmQBtVtm16lzst6k3qVQN6J9XDSnOU
 SrWYlJtLc50rwQYc7VXRXyCDKWKqY079FVB8uLAIjr6dqlOfc+u+bx8G8aBZuJ/iEqyg
 A1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSgapu0H/WS0gq0RYEBnVyzMcJ3SMNNaA/8cyAYroLA=;
 b=dt5e068TTA/GCY5kAXJ1HesKuwAbHKLtVg86ndqpsC9rTFHz0kyhAskPZH0D9oO2ou
 4YrUDTU5SirQUSbx2EEWctOL6UgkTpRG0rcbGcPdS1LOIpV5N6TYZS/qsGcTcNXCXzzY
 x4a6wO9VIgStXWy+NUXjG+nQOZ3UIRUIRbO1XfmfvccdDmZnX7YZ++50uqLx9+9UOAL4
 8QAgerG9Y8r+mpcjWIofQSXLtrVVxe5VfUHpwETv2tirHDm435F3m/Rc75YyE0jvnjvl
 WxvZ5Qm8EPRlwFBB9m6Mltc3PDEHNsdDiojUlFYdzD2clzKhP/aWa4doUOKrGyEeB7V7
 r31Q==
X-Gm-Message-State: AOAM530Lkpg06H1rnf9yjlUFw5hQOhIUbUlvYC93EeFDoWVwf+GP1fWg
 vIblFk+aAqq4Ox/wt4J0lDl2yYBbRTr/gt5rT0o=
X-Google-Smtp-Source: ABdhPJw1qHpNwp+ppJj+WTyL4ix6/hzDU9wo9gsY6Lkp0s1mX8Edte9SIa7RW5SYQwyEipwxZ9oo601/vZKQIQhkZts=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr2756155ybc.467.1631078538266; 
 Tue, 07 Sep 2021 22:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-6-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-6-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:22:08 +0800
Message-ID: <CAEUhbmX2KhWU3PNOeEWXdT4-RqpzS7-bd4PMeWrP9YAi44vh2Q@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] target/riscv: Reassign instructions to the
 Zba-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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

On Sun, Sep 5, 2021 at 4:38 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> The following instructions are part of Zba:
>  - add.uw (RV64 only)
>  - sh[123]add (RV32 and RV64)
>  - sh[123]add.uw (RV64-only)
>  - slli.uw (RV64-only)
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> Changes in v10:
> - Split off gen_add_uw() fix into a separate patch, as requested.
>
> Changes in v9:
> - Rebased to 8880cc4362.
> - Update gen_add_uw() to use a temporary instead of messing with
>   arg1 (fixes a regression after rebase on CF3 and SPEC2017).
>
> Changes in v3:
> - The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
>   and its use for qualifying the Zba instructions) are moved into
>   a separate commit.
>
>  target/riscv/insn32.decode              | 20 ++++++++++++--------
>  target/riscv/insn_trans/trans_rvb.c.inc | 16 +++++++++++-----
>  2 files changed, 23 insertions(+), 13 deletions(-)
>

Acked-by: Bin Meng <bmeng.cn@gmail.com>

