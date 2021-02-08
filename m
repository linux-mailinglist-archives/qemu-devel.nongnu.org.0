Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FF3140A8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:40:30 +0100 (CET)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DKf-0005E1-8m
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l97Fu-0007Jj-Qa
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 09:11:10 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l97FY-0004Q6-TD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 09:11:01 -0500
Received: by mail-ej1-x636.google.com with SMTP id hs11so24963804ejc.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BGMfX5s+eekSCdZSIfStc4cDqIiR0iYU30+c+3poORQ=;
 b=hs8+Ltd8EaEcSU/AFN77+ajrBMcxVlyskN5FAGfSXnKe4x/5oEqWJd79XTSTzZItco
 eS3eWFs+8/DmoQLLEqMJ23apybIaq06EONr1ov6icZYXXj8Edb6/b8pdXyDKdQTOgo9t
 ohshBf1mNyFlRlzDeU5ErpufPVFHrVmdP6Ydo1Qw+St2gyeAeLbC7bY/Zy1nEun2r2IP
 ueb/UMPwX7bc86RJY8u3gI66XcenvAY/DBJLso5sH0NQPOO+w0nv35WCpLJaCzFEnA3c
 T540zaE0qOCetvdAOwysOGvGs5ZDUlzdivk0aLzR3hBbcerxmdg4TwpluOuNi/PdSaJd
 O6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BGMfX5s+eekSCdZSIfStc4cDqIiR0iYU30+c+3poORQ=;
 b=Gr6zGeCK0NZAJ1hQ1182AI6FgPsQl22ciNs50WBIDXrZ77PXwdWbvrimlWLBmrVOY7
 yb9Dx3wRA7z4vgmnwpauZi6zRvBOlpbSrTkTVKFmyepgQr13s1phmKZhqq7YzdPgMPzi
 UUQM4YVZXQKpdRMuE3uHP7C1A7YdowBdgQBs7Sv4CvWza8yhLw6s3VJMqyQpGIvZodm5
 EiuyGRUvTuAmBzTu/Z+Q3quQqsOFt7YAp++1P4VULXLhe/YMq2wr4Glx5FygtWAx2B+R
 /q593XlMYktJqNYQiezL4A13bspFGJRVKyijb/s5CXZxl8DDx5pfLp5RjK75ak6rXPvN
 ncBw==
X-Gm-Message-State: AOAM5331xhgY+hP9mqBWx/g5W+vG+QR4QoyLb4jk0P52RtYz7UyHE1eU
 sipxoH4PqLj/qRA0hWtbHMukwImrjPXiZJKS3u7ZrQ==
X-Google-Smtp-Source: ABdhPJyZ7kNLvGWUVaic5NnZLVCiiUxvSzDqbZfGhb2falVvFNufX4ji7Z9K4Gyhh9LTCC1dbq3rlgKQVZr6XmB8N0o=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr17168073eji.407.1612793440678; 
 Mon, 08 Feb 2021 06:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-14-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 14:10:29 +0000
Message-ID: <CAFEAcA9JC=j4iwr9kuT262s=QonM=y9uTmcJ3Xq3mkM_nrgj2g@mail.gmail.com>
Subject: Re: [PATCH v5 13/31] linux-user: Explicitly untag memory management
 syscalls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We define target_mmap et al as untagged, so that they can be
> used from the binary loaders.  Explicitly call cpu_untagged_addr
> for munmap, mprotect, mremap syscall entry points.
>
> Add a few comments for the syscalls that are exempted by the
> kernel's tagged-address-abi.rst.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 748893904e..4451f8e4f0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -889,6 +889,8 @@ abi_long do_brk(abi_ulong new_brk)
>      abi_long mapped_addr;
>      abi_ulong new_alloc_size;
>
> +    /* brk pointers are always untagged */
> +
>      DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
>
>      if (!new_brk) {

It's not clear to me from
https://www.kernel.org/doc/Documentation/arm64/tagged-address-abi.rst
whether brk() pointers are "always untagged", or only "always untagged
when at stage 1 of relaxation"... Unlike shmat and shmdt pointers,
they aren't listed in the section 3 "must be untagged regardless
of the ABI relaxation" part of the doc. I've asked the kernel folks
for clarification.

Same applies to mmap() and mremap() new_address.

thanks
-- PMM

