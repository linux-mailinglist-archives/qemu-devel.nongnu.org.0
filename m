Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E886A0E40
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEr7-0007kQ-90; Thu, 23 Feb 2023 11:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEr4-0007jZ-Mn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:54:02 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEr3-0006MW-9T
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:54:02 -0500
Received: by mail-pf1-x42e.google.com with SMTP id n2so524825pfo.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2juJJqmlf5ooe6Mkgg0ysrobkoIHUgWbjPnYQomFRo4=;
 b=kz6R8wvmhn/cPUgO9ABpfR991AOK83TOB5d2mj8x3FPrriNjU7UK67M7KjkC5MkRjO
 rRfciQdPLnwI/x9RvpTd4PrDNqjNRsLtzywoHGOZTl2//szB/9olDrLccKcOiwziBhGO
 s7AEGzWtbV61vn8yMGKd3M4+xag66tjFDLmsMuj3rayL2KesV1ipq+MuddkPk8T8QJiM
 9HVF/4YSD75JWCvmqZceYeKmy+vIFdnFux60mvIqegxtMAl5hxvp1TdBxi6n0HW+7nL1
 YaBFs2HLSUTz/Z7RsWFjOZnF9faXqXWIsdKJZU6/EOb8XrL9fyKaPpVeBqyxn6rTrSNp
 hVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2juJJqmlf5ooe6Mkgg0ysrobkoIHUgWbjPnYQomFRo4=;
 b=aWmWhcbNt1xXMFq9avTqA3tLmDqyU3lDHzzpx6lGIXatn7jrZIPSmu3+JnPv/UjbJV
 JUHFYrFSQ/pG5r8C6poDmStU1a/yBpskuKqIuOCBByEcI3RjM73QI/D7iAL1GEKa6dQo
 TgheyG8nSscNWBf31W1kpHqdwZoXOt4QbmSY+iVz3J6XSlZzPpBjHu5wZVXFUNZl4u+9
 N0sIvAp8R82I/Zzz3vjbOvJ72eKfsGBZSE6EfUb+UGwDlqdvg5nPhaTXQH1iz16qAtul
 721/ENxNYp1ZkWlkZbntQZFkdFDEOYf9A7FsojFf3/htqqiDJaej6IbKObQNDzPMXH+9
 WpSw==
X-Gm-Message-State: AO0yUKUpu0NZ2A/kqhTaeE1Xi+1s3J8JBzaczKwzMY4apylQO2eOrS4+
 za/q4T5oyEjg6ot4zwt5JeELJ7jCEQBq+dUid0sjBi2R7xB6Hw==
X-Google-Smtp-Source: AK7set8eHxdwS2818ac5rrfoohrMMzb4h7FpUbteHM5gZC9o8DxUpRaFb5/H03yED0iXpzveYu0gUqi+S51ZiDIhva4=
X-Received: by 2002:aa7:8a0e:0:b0:592:41a:1054 with SMTP id
 m14-20020aa78a0e000000b00592041a1054mr1976498pfa.5.1677171239723; Thu, 23 Feb
 2023 08:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-5-richard.henderson@linaro.org>
 <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
 <d08b115f-ecf3-c71f-ab10-d7b221a262e2@linaro.org>
In-Reply-To: <d08b115f-ecf3-c71f-ab10-d7b221a262e2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:53:48 +0000
Message-ID: <CAFEAcA_D4+Z_6TZyC7goXKuqkLP30jvzwjFtAKs83TcSJthytA@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG,
 STZ2G
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 16:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/23/23 05:24, Peter Maydell wrote:
> > On Thu, 16 Feb 2023 at 03:10, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This fixes a bug in that these two insns should have been using atomic
> >> 16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >> diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
> >> index a981de62d4..04974f9ebb 100644
> >> --- a/tests/tcg/aarch64/mte-7.c
> >> +++ b/tests/tcg/aarch64/mte-7.c
> >> @@ -19,8 +19,7 @@ int main(int ac, char **av)
> >>       p = (void *)((unsigned long)p | (1ul << 56));
> >>
> >>       /* Store tag in sequential granules. */
> >> -    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
> >> -    asm("stg %0, [%0]" : : "r"(p + 0x1000));
> >> +    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
> >
> > Why did we need to change the test program ?
>
> It gives us a test of the stz2g insn.  We still have other instances of stg in the testsuite.

Ah, right. That should probably be a separate commit.

thanks
-- PMM

