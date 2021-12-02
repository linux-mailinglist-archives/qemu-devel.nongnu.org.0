Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD26466797
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:08:37 +0100 (CET)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msodO-0000by-O7
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1msoXP-0003Bc-NT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:02:23 -0500
Received: from [2a00:1450:4864:20::42a] (port=38433
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1msoXN-0001F9-8J
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:02:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q3so37782540wru.5
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rrVFXWWVV90dimzWgwCYZZZb78gNhqoRSf3F98IZnVM=;
 b=R3xpOTRGkJ/iR3wKE2SmXNEmTK+1o4Bx3Zo9jwxGUJHKwClWfPAR6+zVsL/YtxffvX
 1YRY2LIOHs/kf2CLyNf2TS4GZ5uhOqZeKsbPe0Yf6JJooV2FuB3a2EqfzgPE86v/bbgi
 6f6JZdxWI09L7ZiuHqcBcZBm7VURDKIAMtYWfdrGVh+1eHRgk5AnlBve+76WelCf9+wc
 20tlNpYtd5NlUCprkOJ0Q1IbYUO9q3CHVKRxRv2cc0cvOHIyupjcSe1E/L+VTnjLyYVF
 KH7RRGB6WNTd+jqAVonF0C7Tw72VseUdDr1ZtvMbw4zm7P+oa3YJdoopYHW9dQEo6bYG
 mCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rrVFXWWVV90dimzWgwCYZZZb78gNhqoRSf3F98IZnVM=;
 b=QRISlfE5UriC06Y1cHHbdJkerpAR9Fy+3q5Yly8AbhorRmxc4R/2is8lE0JzQCkw8K
 NVeDeaGUNhgjKF5lsZMeHv6K/FeZzCz+FVY7r/NtIxZe1uJ+qPuyLw62mCuSr8020nF5
 EsKfypRczWcIPDFQrjRVW60axfy7HweCEu9QYlAIRgJTbHQ/NiXcDsECa5A5F8VKtnoV
 2/xLKT9c/WHqBEwt7CA9mjKGPtiAUuGV9HUCBp4HynSWNqQp47gASdEFJRHKodW4O5R9
 kCQZVTBKr3a/nKY7+K7feoZ/uc4dbxwB6W9nIA7bcpH49y1XMbzvqONJ1lbQArz9rky4
 6IJg==
X-Gm-Message-State: AOAM530PglqejCZby46LEtS5vBnnE7qdFqJbSRkTBWtjkfrFBZmTzfaW
 zxqzU5/gn070GJXk7VHIqicWGA==
X-Google-Smtp-Source: ABdhPJxZKMBdw0dYN3aoDRrHPJU/+tiM5fsjY7USRuvDCQsoKZO2QjnCl+/uW3z6YcskP+c1Lm3VBw==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr15507367wrq.139.1638460938555; 
 Thu, 02 Dec 2021 08:02:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm2656828wms.10.2021.12.02.08.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:02:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 343AB1FF96;
 Thu,  2 Dec 2021 16:02:17 +0000 (GMT)
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Subject: Re: Suggestions for TCG performance improvements
Date: Thu, 02 Dec 2021 15:31:38 +0000
In-reply-to: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
Message-ID: <87bl1zxaeu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Konobeev Vladimir <konobeev.vladimir@huawei.com>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "Emilio G. Cota" <cota@braap.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "Chengen \(William, FixNet\)" <chengen@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vasilev Oleg <vasilev.oleg@huawei.com> writes:

> Hi everyone,
>
> I've recently been tasked with improving QEMU performance and would like
> to discuss several possible optimizations which we could implement and
> later upstream.

Excellent - it's always good to see others that want to improve our
emulation performance ;-)

> We ran the sysbench[1] tool in threads mode on a linux installed as
> an aarch64 guest on x86_64 host. The QEMU profile flamegraph is attached
> to this message. One of the conclusions is that refilling TLB takes
> a substantial amount of time, and we are thinking of some solutions to
> abstain from refilling TLB so often.

Refilling the TLB is always going to be an expensive operation as
besides the complexity of the slow-path we also need to walk the guest
page tables to come up with the new contents.

> I've discovered some MMU-related suggestions in the 2018 letter[2], and
> those seem to be still not implemented (flush still uses memset[3]).
> Do you think we should go forward with implementing those?

I doubt you can do better than memset which should be the most optimised
memory clear for the platform. We could consider a separate thread to
proactively allocate and clear new TLBs so we don't have to do it at
flush time. However we wouldn't have complete information about what
size we want the new table to be.

When a TLB flush is performed it could be that the majority of the old
table is still perfectly valid. However we would need a reliable
mechanism to work out which entries in the table could be kept. I did
ponder a debug mode which would keep the last N tables dropped by
tlb_mmu_resize_locked and then measure the differences in the entries
before submitting the free to an rcu tasks.

> The mentioned paper[4] also describes other possible improvements.
> Some of those are already implemented (such as victim TLB and dynamic
> size for TLB), but others are not (e.g. TLB lookup uninlining and
> set-associative TLB layer). Do you think those improvements
> worth trying?

Anything is worth trying but you would need hard numbers. Also its all
too easy to target micro benchmarks which might not show much difference
in real world use. The best thing you can do at the moment is give the
guest plenty of RAM so page updates are limited because the guest OS
doesn't have to swap RAM around.

Another optimisation would be looking at bigger page sizes. For example
the kernel (in a Linux setup) usually has a contiguous flat map for
kernel space. If we could represent that at a larger granularity then
not only could we make the page lookup tighter for kernel mode we could
also achieve things like cross-page TB chaining for kernel functions.

> Another idea for decreasing occurence of TLB refills is to make TBs key
> in htable independent of physical address. I assume it is only needed
> to distinguish different processes where VAs can be the same.
> Is that assumption correct?
>
> Do you have any other ideas which parts of TCG could require our
> attention w.r.t the flamegraph I attached?

It's been done before but not via upstream patches but improving code
generation for hot loops would be a potential performance win. That
would require some changes to the translation model to allow for
multiple exit points and probably introducing a new code generator
(gccjit or llvm) to generate highly optimised code.

> I am also CCing my teammates. We are eager to improve the QEMU TCG
> performance for our needs and to contribute our patches to upstream.

Do you have any particular goal in mind or just "better"? The current
MTTCG scaling tends to drop off as we go above 10-12 vCPUs due to the
cost of synchronous flushing across all those vCPUs.

>
> [1]: https://github.com/akopytov/sysbench
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg562103.html
> [3]:=20
> https://github.com/qemu/qemu/blob/14d02cfbe4adaeebe7cb833a8cc71191352cf03=
b/accel/tcg/cputlb.c#L239
> [4]: https://dl.acm.org/doi/pdf/10.1145/2686034
>
> [2. flamegraph.svg --- image/svg+xml; flamegraph.svg]...
>
> [3. callgraph.svg --- image/svg+xml; callgraph.svg]...


--=20
Alex Benn=C3=A9e

