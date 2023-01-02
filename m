Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4E65B3BE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 16:05:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCMMI-0005Wr-4o; Mon, 02 Jan 2023 10:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1pCMME-0005Wa-5W
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 10:04:10 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1pCMMB-0004lk-Ds
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 10:04:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C53BB80D86
 for <qemu-devel@nongnu.org>; Mon,  2 Jan 2023 15:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D3CC433F2
 for <qemu-devel@nongnu.org>; Mon,  2 Jan 2023 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672671842;
 bh=IG1cdiy1CkS1pPFordbJMkK1hhJGEd8r4QDsZMxFoG8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g5JhoYBCKO0AQ39xgQU5vDJzDvfaoBJj2MtmB8jks02J8FJM19Z+mpO8OjzpNwdFj
 Bavo56S9AYVExdjFjkpPOZXzuNGsfEPlHQLpK7+5ZO1HbT5YQ3uQJrIpmRKgRTG096
 k9dYw+5Lg0+YSB/KYRO4Vs4NUkvpu3WZKcqRpn0oo6gMX9ut62288Nz8BM9p50vKpR
 4KR5ADLzRcueX5dU1YV/cwo4lUQO3Fvuto1VZHfn38ZHAolJcCE1gga3K/bBlmDh+N
 h9Ap+cgELDJYoe2obgZDoOxUyUsQwpRYLF9xmBRL+PZH9Xb9iXAqWrAqfiHNG8+EMj
 cHH9xrCFB3ebA==
Received: by mail-lj1-f181.google.com with SMTP id u12so25547106ljj.11
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 07:04:02 -0800 (PST)
X-Gm-Message-State: AFqh2kpR/StL4Tr2iXU0/wZlM2cp+YK+Fj/dkFGyS9VyWHtJabWS9W+Y
 j48VGeP33HMtDfVzc1Ow6VXauFdyoPCVMlQqzbg=
X-Google-Smtp-Source: AMrXdXu3X9iDdXOxHCK7qO6O1hOORBeIqnyBxt7XCC0oVIzyoA1v8mtAqqmRjSm8ZfowbDlKHSITW8JZL2Y1CTVCVTU=
X-Received: by 2002:a2e:bd0c:0:b0:27f:bc58:3924 with SMTP id
 n12-20020a2ebd0c000000b0027fbc583924mr2090552ljq.352.1672671840869; Mon, 02
 Jan 2023 07:04:00 -0800 (PST)
MIME-Version: 1.0
References: <Y7A9nBud6UeH+wYd@zn.tnic> <Y7A+YELM7m5E2PUQ@zx2c4.com>
 <Y7BGIAL4z6o6FEI5@zn.tnic> <Y7B993P1+jYB/etX@zx2c4.com>
 <Y7CGzde+qPB7YJP4@zn.tnic>
 <60566f8b-c90f-12e7-c13e-94e9829eee2d@zytor.com>
 <8f072588-7d66-0932-7486-ed9159ae93ae@zytor.com>
 <Y7JzTh8JnMXM6ZPS@zn.tnic> <Y7J3B50kn1kWrxlk@zn.tnic>
 <CAMj1kXHDw5p5yX25TnKiQ7sgqVbhEjB+=fu=7Oz67shQD-fL6Q@mail.gmail.com>
 <Y7Ld9MVZC3/fsj9Y@zn.tnic>
In-Reply-To: <Y7Ld9MVZC3/fsj9Y@zn.tnic>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 2 Jan 2023 16:03:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG3fsBwRL8+_4jsb=040o6NzR_0RrmtGFnJ3u1YETY60w@mail.gmail.com>
Message-ID: <CAMj1kXG3fsBwRL8+_4jsb=040o6NzR_0RrmtGFnJ3u1YETY60w@mail.gmail.com>
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 pbonzini@redhat.com, 
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
 qemu-devel@nongnu.org, kraxel@redhat.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ardb@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 2 Jan 2023 at 14:37, Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Jan 02, 2023 at 10:32:03AM +0100, Ard Biesheuvel wrote:
> > So instead of appending data to the compressed image and assuming that
> > it will stay in place, create or extend a memory reservation
> > elsewhere, and refer to its absolute address in setup_data.
>
> From my limited experience with all those boot protocols, I'd say hardcoding
> stuff is always a bad idea. But, we already more or less hardcode, or rather
> codify through the setup header contract how stuff needs to get accessed.
>
> And yeah, maybe specifying an absolute address and size for a blob of data and
> putting that address and size in the setup header so that all the parties
> involved are where what is, is probably better.
>

Exactly. In the EFI case, this was problematic because we would need
to introduce a new way to pass memory reservations between QEMU and
the firmware. But I don't think that issue should affect legacy BIOS
boot, and we could just reserve the memory in the E820 table AFAIK.

