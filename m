Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FA2DAC2F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:42:13 +0100 (CET)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8ia-00029J-OQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8ft-00005w-Tk
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:39:25 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:34949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8fs-00069u-9S
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:39:25 -0500
Received: by mail-ed1-x544.google.com with SMTP id u19so20677782edx.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/pbFSbWEDbuEM69Np3osh3nE7jUSuY7WXuc+P3jBEi0=;
 b=ZSJdXHpvlTQDb1vQYr5Qk0WLSBTcV51VXxwtyiV/0yv0ftk9eZBjjx/x9ioIkvzI7l
 amopflAL3usASTna1W8lyf/Y2iYYbdji1ZhJHQPmGB9+/GtXiHZsgjGesmNwCmxzJuX3
 HyKDozBv21FrNv12houKic+JudFXSMWZapOiGsryyR3HuCEUT1sAZaFwkyJDu0TfaRqd
 DvXewg5xkpO5sW6Uh5Yl3ZWGTnkT+Fu91muuweRUpyYeeqH9HgQBMDUXW87YHwYgkSOe
 tUpnuLhQWsrZWieT7kxU8EHmeJ0HO25NN+UFbkNKUWstqAe5ug+Z06g0GtobUval3Iho
 9P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/pbFSbWEDbuEM69Np3osh3nE7jUSuY7WXuc+P3jBEi0=;
 b=TCkBMFfu9bJ8XNpAyeyJNAqCjVXLVT9IRHLFMj4en2hdHfpWC7lQP5CLAvrXghTep+
 5qEwxo+gV+2K7+vhjzQvzLq2dRttldtUAep2SCohKvqc6T/iE8nivr9GpO7IhzMkpca0
 fEk2XsWn8frC0RJGJt5Z9TpwEhOgyCB9QlrpIhYWkYIJbVosa43YNAqNGumMbV0VyfCN
 PM5zQnhppn8bk7AnvzruQqO1ozKUTu8vgwf+lsbbObiDb48elfIqkaobshO9AJIJ67Gt
 Ut06q2zNCr0iyKzfRPyM8xuQ+V4qv14ZQvCxs8ho56lkQ4gWfQ51uS9PbwWYHzuLZJyj
 2ubw==
X-Gm-Message-State: AOAM531IuEwnEhhxYqL14LSPsa27eWxwTgRg9wUyE5rJCEOMweeT5RDD
 C43FAyjAvfmzCRcj99nFXaapWIObxcdUP8VyBCL2Fx7IPsE=
X-Google-Smtp-Source: ABdhPJwsyDuGfZjJ7trNOGi0IQb2MR8769T1ZbsIG82iSzONgt9VldTSUr2saC6wG43W8luNTfsFa/Jmd7NUy6tMjuE=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr28709940edr.251.1608032362726; 
 Tue, 15 Dec 2020 03:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20201214203050.6993-1-peter.maydell@linaro.org>
 <444e7d74-e487-0811-4856-baf39c41af0e@redhat.com>
In-Reply-To: <444e7d74-e487-0811-4856-baf39c41af0e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 11:39:11 +0000
Message-ID: <CAFEAcA_G4-f4nPfuGthm0euN5+HCcCQU6fL9-1fG+A-=rHYU2g@mail.gmail.com>
Subject: Re: [PATCH 0/3] qemu-timer: Make timer_free() imply timer_del()
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 10:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 14/12/20 21:30, Peter Maydell wrote:
> > Currently timer_free() is a simple wrapper for g_free().  This means
> > that the timer being freed must not be currently active, as otherwise
> > QEMU might crash later when the active list is processed and still
> > has a pointer to freed memory on it.  As a result almost all calls to
> > timer_free() are preceded by a timer_del() call, as can be seen in
> > the output of
> >    git grep -B1 '\<timer_free\>'
> >
> > This is unfortunate API design as it makes it easy to accidentally
> > misuse (by forgetting the timer_del()), and the correct use is
> > annoyingly verbose.
> >
> > Patch 1 makes timer_free() call timer_del() if the timer is active.
> > Patch 2 is a Coccinelle script to remove any timer_del() calls
> > that are immediately before the timer_free().
> > Patch 3 is the result of running the Coccinelle script on the
> > whole tree.
> >
> > I could split up patch 3, but for 58 deleted lines over 42 files
> > created entirely automatedly, it seemed to me to be simpler as one
> > patch.
>
> Looks good.  Even better would be to make timers embedded in structs
> rather than heap-allocated

We do support that -- you use timer_init*() instead of timer_new*(),
and maybe timer_deinit(). It's just that the existing style is very
heavily towards heap-allocation because there's a lot of older
code that was written that way. I'm not sure whether changing
a heap-allocated timer to an embedded timer is a migration
break; if it isn't we could in theory convert some existing code.

>, but this patch makes things a little bit
> better in that respect since we have a 1:1 correspondence
> (timer_{new->init} and timer_{free->del}) between the APIs.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

thanks
-- PMM

