Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762E4033AF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:16:03 +0200 (CEST)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpwH-0000Pq-EA
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpu3-00081u-QW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:13:43 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:33646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNpu2-0002rY-D0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:13:43 -0400
Received: by mail-yb1-xb29.google.com with SMTP id s16so836739ybe.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=An4DCiS/bnSwfkze8InKHXVZeUPiqBnJkxzuyor7ix0=;
 b=ZYSg9HK27rV2BFsfAKK2GVkLo9eRHAdyiQZU5MvlSdYIruqAm/bR5GHsdSPUPxC8AO
 WskNYbCyvvNT463ZRgY+DLdK96OjPf5Z2ES2ibaxvkIQlnmdxx9w9/Ql+pvD1MWs5ZdH
 ZXiloFVCVkQRBh+KrZt4AQMlNVw1tE10kmM+1DXuWsbQoe+xAf+Jjm1OGNr/SRfxYzZt
 MMZmZmi4FhHgJLEAFYNrjwGm2an7fDa9w3u1FHkU/X6MxAEluEYO108ZYyNl0sKvu58H
 H5Y6oNYoNJ/skEYqjHKwHeUbb5gV6pLlPG9tajeKHDLWOk/bNl/HIXXaGC5uaY3Qvbwl
 75Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=An4DCiS/bnSwfkze8InKHXVZeUPiqBnJkxzuyor7ix0=;
 b=RdjyZYAj6bXAs4UtqcYdQWiA7cpu1htUyDK2kRi7w1jb3aZvvwUQHiACspjxV23j9G
 8XYUXQHon55PTyBFMkRwzCy7M4GlPvdwIpZJsW3ee8bRyM44AX/TuWSH2//ASIzKFuy6
 74xrb9TxQjXIc07NUzOdW+lNqUKg1gyobRG61D1ets8ZMWfIPHwMP0AzdSWRzjvAUhdN
 36NmK4VunxXXG75AtshsrYg96p2qz9Q+uP6eeUCWaqj3AoS0OIWotIyvr/v8DvamDwqD
 w+HSOYh3T113KfkNCmGMxI4VYh235lER3+kYr6vAUMIe0IRsO3xVEYKKml4YSrbCFU44
 Ftyg==
X-Gm-Message-State: AOAM530hiRYrp9Tn4cODwOpa6EQNTqiEcWE8u5iNLSjsxOeauEqG6PyM
 JN+mhjuLhl1UxgReuC33pIBAuLQW2scO7KzplEM=
X-Google-Smtp-Source: ABdhPJwrV/hmRb4ZoqaGe/EswoPPB6CpMcCFgwS4jOEEbGszbKmX5EZML1fz6yP6tRtlAmXKk5ifXBTcIiwiGdhHqrA=
X-Received: by 2002:a25:2e42:: with SMTP id b2mr2513308ybn.313.1631078021427; 
 Tue, 07 Sep 2021 22:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:13:31 +0800
Message-ID: <CAEUhbmXOKBxO3gTfG5r9zJf0RK0-8KhL0US2mxfbZRV0Jj-i7g@mail.gmail.com>
Subject: Re: [PATCH v10 01/16] target/riscv: Introduce temporary in
 gen_add_uw()
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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

On Sun, Sep 5, 2021 at 4:40 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> Following the recent changes in translate.c, gen_add_uw() causes
> failures on CF3 and SPEC2017 due to the reuse of arg1.  Fix these
> regressions by introducing a temporary.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>
> Changes in v10:
> - new patch
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

