Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E084F47B655
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 00:56:06 +0100 (CET)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzSVg-00026y-Ld
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 18:56:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzSUI-0001Pr-BS
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 18:54:38 -0500
Received: from [2607:f8b0:4864:20::434] (port=33768
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzSUG-0000GI-CG
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 18:54:38 -0500
Received: by mail-pf1-x434.google.com with SMTP id 205so5903901pfu.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 15:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5Jg9MMpmm/byfdMZsKjjNHpgHJDAOY0WahXPJDxaVpI=;
 b=mfUyZJMuDU5lGBN6iLZBik0lZCxK9hXiG2dEjioX72OL6M9fQIrX3yPWyqnx8R9PAE
 5UeSgfKTn6/FLC697W8uVggqoEVOuQZHaYnT5h087jwiqCJr7fpLcmf6WbXPaaDgZ6oB
 xjFdk7OOncnlLlVLCs9VWLoUjTcNRhgXGnFcjyaQ1a0O5R5tywK+Xg1vxfVNmpxFfBJV
 HU5GHDgzkcDt39rSsNntfw1FZjxy0P4nfpc+JcoQI3oKVE3FcObX1OUkYkt0+OvQNmWW
 +ZZE1i1cTRCfLhHxXSeWTxs6P1Fk4fSvw0urPoklQ0VPL1KoIsnCuyXAOo0gYEuEXM8S
 X/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Jg9MMpmm/byfdMZsKjjNHpgHJDAOY0WahXPJDxaVpI=;
 b=00UHJDRliNIFeDI5xo8FZzOVA3mhUSRhMDURpgaVe788QT5F020eCPFN4l782jEJ2k
 E7wYWzuE6EyjXHe4AU0j2fUJFLst7T7KM1TgSkmNK/pMnirrLG0pEWEkkQzHIVFp0BBB
 HoD9EBrIatghsU4l1RqNb4qW8x8j++xtRjVPGkFPuLpBLdoZDr4bWl7gZgSDza/YcQi4
 cdpNuFVmr5UUCZ21RyUas0K5h6SKW5P/psF+uKvDSu8H2jNZYAHImEUW7nS5NioDxrS2
 ac67xw5GtY0fhO/g1wBm9n5ROeGhB2t0+H77i1txFnaZw5E5yzENV+odYTdMkbiwECwj
 h9YQ==
X-Gm-Message-State: AOAM530EEOhQrBRMIc0E8IMrx41w+aUd7Js8kNDSoZ30UxeGVyyGHcTx
 aF21qgmFH9WAz4wxpoYoBDaf7TspxIE5KA==
X-Google-Smtp-Source: ABdhPJzkHwK31niw0PQzvDVc+X+mRyXshfbrc6Q7oBe+BQQHu9yd8c00vdZrGn7Wt1pDAXhy1mjcjA==
X-Received: by 2002:a05:6a00:72c:b0:4ba:9a9e:b82b with SMTP id
 12-20020a056a00072c00b004ba9a9eb82bmr422649pfm.13.1640044474394; 
 Mon, 20 Dec 2021 15:54:34 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id m14sm19410815pfh.11.2021.12.20.15.54.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 15:54:33 -0800 (PST)
Subject: Re: [PULL 00/15] *-user: simplify safe signal handling
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211220202500.111897-1-richard.henderson@linaro.org>
Message-ID: <01dcc3fb-4ffd-0889-b6cb-944b1022c19b@linaro.org>
Date: Mon, 20 Dec 2021 15:54:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 12:24 PM, Richard Henderson wrote:
> The following changes since commit 212a33d3b0c65ae2583bb1d06cb140cd0890894c:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-12-19 16:36:10 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-user-20211220
> 
> for you to fetch changes up to 3363615a65af8a09d8adbd19ed3ae6b52f26ca7a:
> 
>    meson: Move bsd_user_ss to bsd-user/ (2021-12-20 10:13:43 -0800)
> 
> ----------------------------------------------------------------
> Move errno processing from safe_syscall() to safe_syscall_base().
> Move safe_syscall() from linux-user to common-user.
> Add FreeBSD support to safe_syscall_base().
> Tidy top-level meson.build wrt {bsd,linux}-user.
> 
> ----------------------------------------------------------------
> Richard Henderson (15):
>        linux-user: Untabify all safe-syscall.inc.S
>        linux-user: Move syscall error detection into safe_syscall_base
>        linux-user/host/mips: Add safe-syscall.inc.S
>        linux-user/host/sparc64: Add safe-syscall.inc.S
>        linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
>        linux-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
>        bsd-user: Rename TARGET_ERESTARTSYS to QEMU_ERESTARTSYS
>        linux-user: Rename TARGET_QEMU_ESIGRETURN to QEMU_ESIGRETURN
>        linux-user: Create special-errno.h
>        bsd-user: Create special-errno.h
>        common-user: Move safe-syscall.* from linux-user
>        common-user: Adjust system call return on FreeBSD
>        linux-user: Move thunk.c from top-level
>        meson: Move linux_user_ss to linux-user/
>        meson: Move bsd_user_ss to bsd-user/
> 
>   meson.build                                        |  23 +++-
>   bsd-user/errno_defs.h                              |   6 +-
>   bsd-user/special-errno.h                           |  24 ++++
>   {linux-user => include/user}/safe-syscall.h        |  37 ++----
>   linux-user/cpu_loop-common.h                       |   1 +
>   linux-user/generic/target_errno_defs.h             |  17 ---
>   linux-user/host/aarch64/hostdep.h                  |  18 ---
>   linux-user/host/arm/hostdep.h                      |  18 ---
>   linux-user/host/i386/hostdep.h                     |  18 ---
>   linux-user/host/ia64/hostdep.h                     |  15 ---
>   linux-user/host/mips/hostdep.h                     |  15 ---
>   linux-user/host/ppc/hostdep.h                      |  15 ---
>   linux-user/host/ppc64/hostdep.h                    |  18 ---
>   linux-user/host/riscv/hostdep.h                    |  14 --
>   linux-user/host/s390/hostdep.h                     |  15 ---
>   linux-user/host/s390x/hostdep.h                    |  18 ---
>   linux-user/host/sparc/hostdep.h                    |  15 ---
>   linux-user/host/sparc64/hostdep.h                  |  15 ---
>   linux-user/host/x32/hostdep.h                      |  15 ---
>   linux-user/host/x86_64/hostdep.h                   |  18 ---
>   linux-user/signal-common.h                         |   4 +-
>   linux-user/special-errno.h                         |  32 +++++
>   linux-user/user-internals.h                        |   1 -
>   common-user/safe-syscall-error.c                   |  25 ++++
>   linux-user/aarch64/cpu_loop.c                      |   4 +-
>   linux-user/aarch64/signal.c                        |   4 +-
>   linux-user/alpha/cpu_loop.c                        |   4 +-
>   linux-user/alpha/signal.c                          |   8 +-
>   linux-user/arm/cpu_loop.c                          |   4 +-
>   linux-user/arm/signal.c                            |   8 +-
>   linux-user/cris/cpu_loop.c                         |   4 +-
>   linux-user/cris/signal.c                           |   4 +-
>   linux-user/hexagon/cpu_loop.c                      |   4 +-
>   linux-user/hexagon/signal.c                        |   2 +-
>   linux-user/hppa/cpu_loop.c                         |   4 +-
>   linux-user/hppa/signal.c                           |   4 +-
>   linux-user/i386/cpu_loop.c                         |  12 +-
>   linux-user/i386/signal.c                           |   8 +-
>   linux-user/m68k/cpu_loop.c                         |   4 +-
>   linux-user/m68k/signal.c                           |   8 +-
>   linux-user/microblaze/cpu_loop.c                   |   4 +-
>   linux-user/microblaze/signal.c                     |   4 +-
>   linux-user/mips/cpu_loop.c                         |   4 +-
>   linux-user/mips/signal.c                           |   8 +-
>   linux-user/openrisc/cpu_loop.c                     |   4 +-
>   linux-user/ppc/cpu_loop.c                          |   4 +-
>   linux-user/ppc/signal.c                            |  10 +-
>   linux-user/riscv/cpu_loop.c                        |   4 +-
>   linux-user/riscv/signal.c                          |   2 +-
>   linux-user/s390x/cpu_loop.c                        |   4 +-
>   linux-user/s390x/signal.c                          |   8 +-
>   linux-user/sh4/cpu_loop.c                          |   4 +-
>   linux-user/sh4/signal.c                            |   8 +-
>   linux-user/signal.c                                |  10 +-
>   linux-user/sparc/cpu_loop.c                        |   2 +-
>   linux-user/sparc/signal.c                          |   8 +-
>   linux-user/syscall.c                               |  21 +--
>   thunk.c => linux-user/thunk.c                      |   0
>   linux-user/xtensa/cpu_loop.c                       |   4 +-
>   linux-user/xtensa/signal.c                         |   4 +-
>   MAINTAINERS                                        |   3 +-
>   bsd-user/meson.build                               |   6 +
>   common-user/host/aarch64/safe-syscall.inc.S        |  88 ++++++++++++
>   common-user/host/arm/safe-syscall.inc.S            | 108 +++++++++++++++
>   common-user/host/i386/safe-syscall.inc.S           | 126 ++++++++++++++++++
>   common-user/host/mips/safe-syscall.inc.S           | 148 +++++++++++++++++++++
>   common-user/host/ppc64/safe-syscall.inc.S          |  94 +++++++++++++
>   common-user/host/riscv/safe-syscall.inc.S          |  79 +++++++++++
>   common-user/host/s390x/safe-syscall.inc.S          |  98 ++++++++++++++
>   common-user/host/sparc64/safe-syscall.inc.S        |  89 +++++++++++++
>   .../host/x86_64/safe-syscall.inc.S                 |  44 +++---
>   common-user/meson.build                            |   6 +
>   {linux-user => common-user}/safe-syscall.S         |   5 +-
>   linux-user/host/aarch64/safe-syscall.inc.S         |  75 -----------
>   linux-user/host/arm/safe-syscall.inc.S             |  90 -------------
>   linux-user/host/i386/safe-syscall.inc.S            | 100 --------------
>   linux-user/host/ppc64/safe-syscall.inc.S           |  96 -------------
>   linux-user/host/riscv/safe-syscall.inc.S           |  77 -----------
>   linux-user/host/s390x/safe-syscall.inc.S           |  90 -------------
>   linux-user/meson.build                             |   9 +-
>   80 files changed, 1099 insertions(+), 932 deletions(-)
>   create mode 100644 bsd-user/special-errno.h
>   rename {linux-user => include/user}/safe-syscall.h (83%)
>   delete mode 100644 linux-user/host/aarch64/hostdep.h
>   delete mode 100644 linux-user/host/arm/hostdep.h
>   delete mode 100644 linux-user/host/i386/hostdep.h
>   delete mode 100644 linux-user/host/ia64/hostdep.h
>   delete mode 100644 linux-user/host/mips/hostdep.h
>   delete mode 100644 linux-user/host/ppc/hostdep.h
>   delete mode 100644 linux-user/host/ppc64/hostdep.h
>   delete mode 100644 linux-user/host/riscv/hostdep.h
>   delete mode 100644 linux-user/host/s390/hostdep.h
>   delete mode 100644 linux-user/host/s390x/hostdep.h
>   delete mode 100644 linux-user/host/sparc/hostdep.h
>   delete mode 100644 linux-user/host/sparc64/hostdep.h
>   delete mode 100644 linux-user/host/x32/hostdep.h
>   delete mode 100644 linux-user/host/x86_64/hostdep.h
>   create mode 100644 linux-user/special-errno.h
>   create mode 100644 common-user/safe-syscall-error.c
>   rename thunk.c => linux-user/thunk.c (100%)
>   create mode 100644 common-user/host/aarch64/safe-syscall.inc.S
>   create mode 100644 common-user/host/arm/safe-syscall.inc.S
>   create mode 100644 common-user/host/i386/safe-syscall.inc.S
>   create mode 100644 common-user/host/mips/safe-syscall.inc.S
>   create mode 100644 common-user/host/ppc64/safe-syscall.inc.S
>   create mode 100644 common-user/host/riscv/safe-syscall.inc.S
>   create mode 100644 common-user/host/s390x/safe-syscall.inc.S
>   create mode 100644 common-user/host/sparc64/safe-syscall.inc.S
>   rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (81%)
>   create mode 100644 common-user/meson.build
>   rename {linux-user => common-user}/safe-syscall.S (91%)
>   delete mode 100644 linux-user/host/aarch64/safe-syscall.inc.S
>   delete mode 100644 linux-user/host/arm/safe-syscall.inc.S
>   delete mode 100644 linux-user/host/i386/safe-syscall.inc.S
>   delete mode 100644 linux-user/host/ppc64/safe-syscall.inc.S
>   delete mode 100644 linux-user/host/riscv/safe-syscall.inc.S
>   delete mode 100644 linux-user/host/s390x/safe-syscall.inc.S

Applied.


r~

