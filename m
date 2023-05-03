Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7996F5B4A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:34:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEUo-0005Zo-6x; Wed, 03 May 2023 11:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1puEUi-0005ZM-F0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:34:16 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1puEUg-000362-9p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:34:16 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-643465067d1so505345b3a.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683128052; x=1685720052; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=XwfLKUDy+krlcGPmkDFryD8WeN5d1ITCTR1TLdHNQDc=;
 b=ImkdeXVZVhWugIAfHraXKAl9xHmVGOA76DuabRPJgmBxI8EJJyud7KL0KFqa64J714
 L/KTiSLP/PnQBS9xkxZ3fqksCbocHFO2tX3JNx5smMRPaVmzZ8dMcWHTwi4OybEE86Zg
 7kToeCLlk3Bc3Fx/8+xSFbo58SURZWyByFebbie5lyly8nwda12O2KudsGJ/Ws0Nc7Yp
 aOjBHZvV7RCNZj9qKhaM3R36ZsBRe49h08fdwOiFfDd98lpqAty+K3zyjm/JIMlb5OnI
 YEwAH5zl8yBr3QT9uRgZADJdbXpsEhCYstXpMtlIWGltS5vuHlZhbKDFjN6ouveTPNXF
 Nrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683128052; x=1685720052;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XwfLKUDy+krlcGPmkDFryD8WeN5d1ITCTR1TLdHNQDc=;
 b=Z1XlciqLUcH7eeemJPuGxBAwsnLdfHEe2txlRpXdvndjC1LyKE4/71bBKkBQSifTVs
 UMZxZNk0IUcLk6TQKpAGGxE2GyTgTz++0v4Jewjj1Z6W/o7CKLBc9Oe2Jz9jpMC1izFQ
 QbOaIlgk2AROywB/t8+xAExla9c0M4pCWm3TtpUjKOHFOVZNkWr4xIjwMDoQ9/5GMIMW
 t1vc/uKGLMBZfQBuGBn87uUd8qSMClvvlkbuItwegHhCvwZumZJCueqwrHyGS7pCa5qh
 ftC+al0feDLoQXTz2sChhTZC5QO9nWVbk1BU/E1vSp00uyG5wSDKmGZ2as5owqQn4hQz
 cGew==
X-Gm-Message-State: AC+VfDxIREtF8TjJGqcjvrHZ29gyGiUvv7/dRfB4F1A/NE3rS0lc5dKS
 6sP2shgjYuMTwu+WtzhzueUj/g==
X-Google-Smtp-Source: ACHHUZ5ylp/pB8aaPQbmK1Yf/nd6prL1xSDjplvdhIMNj7KtdX8Z9g2C+BpeOJ23TCsC+vzNaRdUng==
X-Received: by 2002:a05:6a00:cd0:b0:643:59cd:6caa with SMTP id
 b16-20020a056a000cd000b0064359cd6caamr1651851pfv.7.1683128052103; 
 Wed, 03 May 2023 08:34:12 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 h5-20020a056a00218500b0063b86aff031sm23710334pfi.108.2023.05.03.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:34:11 -0700 (PDT)
Date: Wed, 03 May 2023 08:34:11 -0700 (PDT)
X-Google-Original-Date: Wed, 03 May 2023 08:34:09 PDT (-0700)
Subject: Re: [PATCH v3] linux-user: Add /proc/cpuinfo handler for RISC-V
In-Reply-To: <mvmednx301n.fsf@suse.de>
CC: laurent@vivier.eu, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-9a8e79cd-e48e-4b27-a5d9-af5ef2a5cd6c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 03 May 2023 08:30:12 PDT (-0700), schwab@suse.de wrote:
> From 912af433fa5d93ce81d2054135ed475ab7462d2d Mon Sep 17 00:00:00 2001
> From: Andreas Schwab <schwab@suse.de>
> Date: Tue, 18 Apr 2023 11:54:01 +0200
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
> v3: fix isa order
>
>  linux-user/syscall.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98..5207259b56 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8231,7 +8231,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>  }
>
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
> +    defined(TARGET_RISCV)
>  static int is_proc(const char *filename, const char *entry)
>  {
>      return strcmp(filename, entry) == 0;
> @@ -8309,6 +8310,56 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>  }
>  #endif
>
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i, num_cpus;
> +    char isa[32];
> +
> +#if defined(TARGET_RISCV32)
> +    strcpy (isa, "rv32");
> +#endif
> +#if defined(TARGET_RISCV64)
> +    strcpy (isa, "rv64");
> +#endif
> +    i = strlen (isa);
> +    if (riscv_has_ext (cpu_env, RVI))
> +        isa[i++] = 'i';
> +    if (riscv_has_ext (cpu_env, RVE))
> +        isa[i++] = 'e';
> +    if (riscv_has_ext (cpu_env, RVM))
> +        isa[i++] = 'm';
> +    if (riscv_has_ext (cpu_env, RVA))
> +        isa[i++] = 'a';
> +    if (riscv_has_ext (cpu_env, RVF))
> +        isa[i++] = 'f';
> +    if (riscv_has_ext (cpu_env, RVD))
> +        isa[i++] = 'd';
> +    if (riscv_has_ext (cpu_env, RVC))
> +        isa[i++] = 'c';
> +    if (riscv_has_ext (cpu_env, RVV))
> +        isa[i++] = 'v';
> +    isa[i] = 0;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "hart\t\t: %d\n", i);
> +        dprintf(fd, "isa\t\t: %s\n", isa);
> +#if defined(TARGET_RISCV32)
> +        dprintf(fd, "mmu\t\t: sv32\n");
> +#endif
> +#if defined(TARGET_RISCV64)
> +        dprintf(fd, "mmu\t\t: sv57\n");
> +#endif
> +        dprintf(fd, "mvendorid\t: 0x0\n");
> +        dprintf(fd, "marchid\t\t: 0x0\n");
> +        dprintf(fd, "mimpid\t\t: 0x0\n\n");
> +    }
> +    return 0;
> +}
> +#endif
> +
>  #if defined(TARGET_M68K)
>  static int open_hardware(CPUArchState *cpu_env, int fd)
>  {
> @@ -8333,7 +8384,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>          { "/proc/net/route", open_net_route, is_proc },
>  #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>          { "/proc/cpuinfo", open_cpuinfo, is_proc },
>  #endif
>  #if defined(TARGET_M68K)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

