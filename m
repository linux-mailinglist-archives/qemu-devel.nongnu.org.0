Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B76F468A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:59:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrSP-0003I9-4A; Tue, 02 May 2023 10:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ptrSE-0003Hr-Ev
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:58:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ptrSB-00064r-Ok
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:58:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaf706768cso19608035ad.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683039485; x=1685631485; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=zSKpEcd7K6ttvfOpyVIVfC/WgmmewXnDDPeChMVmZ0I=;
 b=lIVezXF70L7dGQbZhMzjLiRdlSqr+NWc8dmnix1pc+3RbJptzyfzbOOLB1Z+DC9iG3
 +NS8voi7AvOZxFzYeiUbvCDhhCAXUrULnlqigZ4xwCxWoMaPKZr5NWnoqpG4AfYlPg3L
 Onz3wSyIb4BjXy0F35NMt/5TT/YfCXPytHRLs5BZLrEC2xR3kx/rzNaZc3ZHdUk9Mggk
 anJYD2lBU9U7RdEeZeMLwwA0T6znwPrJvpwC1l/Spu6JzY330yQqMyB4k2IWAAgSYcnn
 OsFSakJzopbQASdDJJMnEJYnYkBCNL59e1mXznOVWQmI3J1WbZ0IkY7gIBpbZN6gyJnb
 MJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039485; x=1685631485;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSKpEcd7K6ttvfOpyVIVfC/WgmmewXnDDPeChMVmZ0I=;
 b=VPVyd43W4fcqdeJs4Z5W2G9kh3Vf5+iRbeDNGW8dt8pOLOlKEKa/4jqYxWbGm5qLys
 RcijBxM7m+zzngWuvkN6z0/2wAhotCZO72ZyE6kww/NGt7hZ49qMaHEubl0au0bnxSep
 PqjT/tQirs7DN4EdgvTauYqMdBzdpKaTyykEjc3g0tlZXjkCR5oinxfoXYYJiSx6K2qJ
 pOMjuBXB+H9dQ05NQiya7oVh+IqmIxMVIB/y0R3Hm8nLmBOwWM2Q7J5J0QmuaFdxZqUJ
 nw09OyXwII9ahF79grOKkxsaoTq+kwgIu09NTnXM7NBvPQtFbbZq62IP/lE/c0ojzbQ8
 L79Q==
X-Gm-Message-State: AC+VfDw5BOm6oPkUfN9ehPxxAu0BXMbnIMIJ9U54jpzeGMSxVA9Ig7sS
 N+LDwMP3Szxuj/xJse7VSfvf5Q==
X-Google-Smtp-Source: ACHHUZ6HkOVSF5Xziyy0TCYd1VLVJSAkxToVJ0wHFMjyVUupk9lZkZufynbmuLf1yilcGn3wmVn/DQ==
X-Received: by 2002:a17:903:124b:b0:1a2:8c7e:f315 with SMTP id
 u11-20020a170903124b00b001a28c7ef315mr21079626plh.21.1683039484801; 
 Tue, 02 May 2023 07:58:04 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 n4-20020a170902d2c400b001a5260a6e6csm6124777plc.206.2023.05.02.07.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:58:03 -0700 (PDT)
Date: Tue, 02 May 2023 07:58:03 -0700 (PDT)
X-Google-Original-Date: Tue, 02 May 2023 07:57:58 PDT (-0700)
Subject: Re: [PATCH] linux-user: Add /proc/cpuinfo handler for RISC-V
In-Reply-To: <mvm5y9a7srj.fsf@suse.de>
CC: laurent@vivier.eu, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-387c6a65-31c0-4fcd-bf29-bd798c2a47f6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62b.google.com
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

On Tue, 02 May 2023 06:44:00 PDT (-0700), schwab@suse.de wrote:
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98..c72456a34b 100644
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
> @@ -8309,6 +8310,31 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>  }
>  #endif
>
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i, num_cpus;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "hart\t\t: %d\n", i);
> +#if defined(TARGET_RISCV32)
> +        dprintf(fd, "isa\t\t: rv32imafdc\n");
> +        dprintf(fd, "mmu\t\t: sv32\n");
> +#endif
> +#if defined(TARGET_RISCV64)
> +        dprintf(fd, "isa\t\t: rv64imafdc\n");
> +        dprintf(fd, "mmu\t\t: sv57\n");

Unless I'm misunderstanding something, we've got support for both 
non-sv57 system (via sv* CPU properties) and non-GC systems (also via 
CPU properties).  Not sure how much userspace cares about that, but at 
least dropping FD when those instructions aren't emulated by QEMEU seems 
reasonable.

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
> @@ -8333,7 +8359,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>          { "/proc/net/route", open_net_route, is_proc },
>  #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>          { "/proc/cpuinfo", open_cpuinfo, is_proc },
>  #endif
>  #if defined(TARGET_M68K)

Aside from that this looks great.  Thanks for fixing this, it's been a 
headache for folks for a while.

