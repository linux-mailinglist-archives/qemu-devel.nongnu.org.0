Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B083B1C3C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:18:28 +0200 (CEST)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3hy-0006dX-Ub
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lw3h0-0005t0-No
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:17:26 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:36740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lw3gy-0003YS-7r
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:17:26 -0400
Received: by mail-lf1-x12c.google.com with SMTP id d16so4411514lfn.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rdRrrlP6Aaxka4s9Rq9K5df1jzh9m7PZu7kWaQf2rUw=;
 b=n7xqgIOi2kp/9+XK+ZpcDoc2kwNPzfm3t96z1iuIBoi2uBIQLBdCr58uzBTn+p5HMu
 1zjZsZ8SscjfsD+xQO6Mw6mE57F53nVysvBdMUkyD+IdIzj6QvzYmRqLXFPF9rqiuUHT
 qkGuNRp9XZj3Ub5jz2UviWdjhiNCKskUujpklRQ4JLhrzeNgzwrg5jzNK8ioybAV/kx/
 vjQcnCDcrjW2Nhlc5bWkSopFEXa44aEi14poJa+dbHFqzNlzTH2xDy4ZT20ymPrvOFO4
 9fXxBNKACjk1hzYDYjgeOthRdbApm2Y5oa3qN2LKNAqCrW2Dc/yhHqHH0xFglabTufX7
 uCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rdRrrlP6Aaxka4s9Rq9K5df1jzh9m7PZu7kWaQf2rUw=;
 b=bMf+XcYlZojOiF8bLkQPulN/xVtS/BCBgyCURYZlndAQ6JvZPWX/GqE0x7OYmg6hqM
 FRSu/zLpKbblFeBHwiiMkqqeKMgutZs5iHJ13CweOBzsy4MLbiCyXe7PzbBViKC1/dU2
 y/mXQgPuuAI4J+C5bHyLCV3jHBFpOBOj9ZcVPTQJBOqvpHSKWn2dYCrLjFKF031hr+VR
 liad3ZtRerYaUBZXIdqXEBceRb+KO+7m1KeRT2s5m6f4hhwTab8IFxzqzPQYAC+Tw2KV
 n9BpQJ7ZJr/mggXS2/ktL9c7hVT8Bt/nAiPi5GWv09cGVtyh5qBT4nzL+x8Fgdq2CCga
 z1CA==
X-Gm-Message-State: AOAM530N9u9kLb+5HfwBbcs/XwAWlUtRzXlyANdGuCMal80cSAKU6Amm
 DdrPe1gIZC3RVKSl3Q7BAiE=
X-Google-Smtp-Source: ABdhPJz/VKZ4qZtSlK/G8k/e0EestvfWkdLoK4N7KWjnrGGaMwQ611Sj86BxKqN/89+ZEIXNppp8Yw==
X-Received: by 2002:a19:770e:: with SMTP id s14mr7294323lfc.194.1624457842101; 
 Wed, 23 Jun 2021 07:17:22 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h22sm337499ljk.133.2021.06.23.07.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 07:17:21 -0700 (PDT)
Date: Wed, 23 Jun 2021 16:17:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/15] target/cris: Add DISAS_DBRANCH
Message-ID: <20210623141721.GC3586016@toto>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
 <20210622154820.1978982-12-richard.henderson@linaro.org>
 <20210623134318.GB3586016@toto>
 <685fd02d-b92d-e038-e19d-bf2c870f83f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <685fd02d-b92d-e038-e19d-bf2c870f83f8@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 06:55:49AM -0700, Richard Henderson wrote:
> On 6/23/21 6:43 AM, Edgar E. Iglesias wrote:
> > On Tue, Jun 22, 2021 at 08:48:16AM -0700, Richard Henderson wrote:
> > > Move delayed branch handling to tb_stop, where we can re-use other
> > > end-of-tb code, e.g. the evaluation of flags.  Honor single stepping.
> > > Validate that we aren't losing state by overwriting is_jmp.
> > 
> > Hi Richard,
> > 
> > This patch breaks my kernel boot test:
> > 
> > edgar@zapote:cris-axisdev88$ ./qemu-run.sh
> > + MACH=-M axis-dev88
> > + QEMU_BUILD_PATH=/home/edgar/src/c/qemu/build-qemu/
> > + QEMU=/home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris
> > + KERNEL=-kernel kimage
> > + NIC0=-netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0
> > + /home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris -M axis-dev88 -netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0 -serial stdio -display none -kernel kimage
> > Linux version 2.6.33 (edgar@edde) (gcc version 4.3.1 20080521 (prerelease) [gcc-4_3-branch revision 135713] (GCC 4.3.1 Axis release R93/1.93) ) #4 Thu Jan 13 15:11:20 CET 2011
> > bootconsole [early0] enabled
> > ROM fs in RAM, size 6946816 bytes
> > Setting up paging and the MMU.
> > Linux/CRISv32 port on ETRAX FS (C) 2003, 2004 Axis Communications AB
> > Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 4080
> > Kernel command line: root=/dev/mtdblock3 init=/linuxrc rootfstype=jffs2 mmc_core.use_spi_crc=0 mmc_spi.spi_mode=3
> > PID hash table entries: 128 (order: -4, 512 bytes)
> > Dentry cache hash table entries: 4096 (order: 1, 16384 bytes)
> > Inode-cache hash table entries: 2048 (order: 0, 8192 bytes)
> > Memory: 22864k/32768k available (2260k kernel code, 9904k reserved, 504k data, 80k init)
> > Hierarchical RCU implementation.
> > NR_IRQS:80
> > Enabling watchdog...
> > Calibrating delay loop... qemu-system-cris: ../qemu/target/cris/translate.c:3236: cris_tr_translate_insn: Assertion `dc->base.is_jmp == DISAS_NEXT || dc->cpustate_changed' failed.
> > Aborted (core dumped)
> 
> Ach, I see it -- rfe and rfn set DISAS_UPDATE without cpustate_changed.
> Could you try adding dc->cpustate_changed = 1 in dec_rfe_etc, please.
>

Great, that fixes it! This now passes all my tests.

With that fix, on the full series:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar

