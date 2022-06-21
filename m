Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85266553EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 01:34:47 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3nOQ-00028z-3V
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 19:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3nND-0001F6-Me
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 19:33:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3nNB-0007Nj-Ow
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 19:33:31 -0400
Received: by mail-pg1-x533.google.com with SMTP id 23so8342577pgc.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 16:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=B4XrLvJKXtlX3EoNtaqQDfHzUhYMYfePo3BdFVBAh1U=;
 b=dCHJw8b23mvSP7ndkRE+sPRxtS5c1p1yX2i/wjofxMysTDlWsGnqQGnJGkBy88mP1R
 8byG6VdWdbF2x4riHgKUIfpCrvHMbTPodPV1Mu1fqrUVTAB4PLhV3SM72hMHz5DQ/5cR
 qcpavz8E0hCLKMh3g8NiC6733yzLeGrSV5WAIdAISnPgEDDMZbZc2wPAxeoYe8ymiYkG
 5TDTiyN40Z1HkKnQGwQrqfGK3ymuldpCZvtAmeOSAeKIvHreh0tJhpt9MHIrLGyj6beX
 vBHq03h4KuVWimABoLj1e+8Q3M6ppc6uM+9Yuyw8wr+/Cwi19fNeajWbPBJ7iCPlvgw0
 GgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=B4XrLvJKXtlX3EoNtaqQDfHzUhYMYfePo3BdFVBAh1U=;
 b=5juZYE4xpE2PMtMZL12CR1gQzaAXEh4JQN3uYwCU782Xc8PBwBVQhOawIxwOvmbtuW
 hdZ9uoTGCoI+rOc4zLHsJFkhEoT25liZYEKAP03UejQQt0yr5OPka49ePafVVdMjaAHt
 itDBEHqQbBkLFP5XvFo9BiQ2SuIKmPzBdEw7milGyNLb1Ng8Wk7Rx0Q+hQxG7m9XFw1L
 2fQcnfAeBAfYLKDIMzOQpItR9KeAGttRX6E8t6RflEGBag68ILDjq+MDWRi7RlyVXlDD
 +RKOVMZLUxEpB6djwTQzgSZIdY75m3ec+ip9m8aE/01Th5LlIICnK3w8hjzuDPCxbzmL
 4Z/g==
X-Gm-Message-State: AJIora9EbHdniBYwvviyGWDvd4hPxP1AVCer8AJ2QSbjSwh6cIk0az6I
 nvx1YA6NmsbhnOimoRpi558HYmZnhmMP4g==
X-Google-Smtp-Source: AGRyM1u5foAfDddrRvN6MQ9OfiLjN7b/jiLVZTpyhXasezfx/SY6dYHIZ/eGk2crXLdq3CX5JE5YFA==
X-Received: by 2002:a05:6a00:889:b0:510:91e6:6463 with SMTP id
 q9-20020a056a00088900b0051091e66463mr32643814pfj.58.1655854407854; 
 Tue, 21 Jun 2022 16:33:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170903028100b0015e8d4eb24fsm11193355plr.153.2022.06.21.16.33.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 16:33:27 -0700 (PDT)
Message-ID: <71ff39d9-cdcb-a6f5-240f-6dcae924e080@linaro.org>
Date: Tue, 21 Jun 2022 16:33:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/9] tcg patch queue for 2022-06-21
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220621204643.371397-1-richard.henderson@linaro.org>
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/21/22 13:46, Richard Henderson wrote:
> The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:
> 
>    Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220621
> 
> for you to fetch changes up to c79a8e840c435bc26a251e34b043318e8b2081db:
> 
>    util/cacheflush: Optimize flushing when ppc host has coherent icache (2022-06-21 09:28:41 -0700)
> 
> ----------------------------------------------------------------
> Speed empty timer list in qemu_clock_deadline_ns_all.
> Implement remainder for Power3.1 hosts.
> Optimize ppc host icache flushing.
> Cleanups to tcg_accel_ops_init.
> Fix mmio crash accessing unmapped physical memory.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Bin Meng (1):
>        target/avr: Drop avr_cpu_memory_rw_debug()
> 
> Idan Horowitz (1):
>        qemu-timer: Skip empty timer lists before locking in qemu_clock_deadline_ns_all
> 
> Matheus Kowalczuk Ferst (1):
>        tcg/ppc: implement rem[u]_i{32,64} with mod[su][wd]
> 
> Nicholas Piggin (1):
>        util/cacheflush: Optimize flushing when ppc host has coherent icache
> 
> Philippe Mathieu-Daudé (2):
>        accel/tcg: Init TCG cflags in vCPU thread handler
>        accel/tcg: Reorganize tcg_accel_ops_init()
> 
> Richard Henderson (3):
>        softmmu: Always initialize xlat in address_space_translate_for_iotlb
>        util: Merge cacheflush.c and cacheinfo.c
>        util/cacheflush: Merge aarch64 ctr_el0 usage
> 
>   target/avr/cpu.h                |   2 -
>   tcg/ppc/tcg-target.h            |   4 +-
>   accel/tcg/tcg-accel-ops-mttcg.c |   5 +-
>   accel/tcg/tcg-accel-ops-rr.c    |   7 +-
>   accel/tcg/tcg-accel-ops.c       |  15 +--
>   softmmu/physmem.c               |  13 ++-
>   target/avr/cpu.c                |   1 -
>   target/avr/helper.c             |   6 -
>   util/cacheflush.c               | 247 +++++++++++++++++++++++++++++++++++++---
>   util/cacheinfo.c                | 200 --------------------------------
>   util/qemu-timer.c               |   3 +
>   tcg/ppc/tcg-target.c.inc        |  22 ++++
>   util/meson.build                |   2 +-
>   13 files changed, 284 insertions(+), 243 deletions(-)
>   delete mode 100644 util/cacheinfo.c


