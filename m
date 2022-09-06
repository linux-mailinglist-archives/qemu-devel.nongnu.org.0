Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156995AE516
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:13:02 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVZk-0006We-Ro
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUso-0004i1-2D
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:28:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUsm-0005Ct-1j
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:28:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id t7so9469476wrm.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pnc1iP2jbkqTG9Jsv6J9XcD+MbzorUa2MTo8C00nhsI=;
 b=uZXQg4gkXq8OhY7oehBHpSHqq7j3o47nWmPm4hMXF0oeQn2rVolTDbg7Fr8JSCKx5x
 eTx4i4sUcZEwqHobEJpvhF7BVXsFY+G5eId9i2pFX6PdDv5j/35D2zhqvg18WMQ5J/jD
 5+Q50R9h6NjAcm++jenkS012mdXouvg1TCsJ8ktanzaKsLOsUZ45jzezOfBmxg015khx
 qE9x2PwXdsoS7B/qEZjfA2qNzb6vSGO3FxRfM+ptb81IKH8LkOl9d5uyXnaby3R+yAik
 tdzsAZMwtj0grMOjXO6j784ad2cbZoCSCa2TJPntoOVqmt+GCfDRSRla1MUTFoHANkXx
 JSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pnc1iP2jbkqTG9Jsv6J9XcD+MbzorUa2MTo8C00nhsI=;
 b=BoBnGY5KMh+qqeqfOicDcn7qQomtyWaUnxbwEtntTPDhCAnWaCfPpfFlQeRWDGxvb2
 ed+78OOhmpNfvMFjf0WUiGyZ8iFbLn0d8PR2jtO+mBuBnYK6mjcoPE11W55S+kCW/S5B
 HtJWbGE6oRbmltlrvWdbrsLCyyKW+AVvpDSSorUX6kIJVRk0TsfFTHniNgQ6XmpA0peg
 0tVbJQybY+00qbr1yrSlxoRw4oa+RNiXQNzqF64TPTwwDfZlNR613q/Cw2Rv96MLdWbk
 7kUoqm2j3l2lNCX1ct7DYCpxkcRGp8Q9ZLbSx5D33wKb8691/I94HIlu5idburC9f0JR
 lZag==
X-Gm-Message-State: ACgBeo1mnDrS5SDBn1zMNa6lcqMf7vAwT1s0T0+clSV0r8//2vg+l+w7
 o1gW9l0YqtOgMYgbmNwi3HF4z76eQPbqZl/p
X-Google-Smtp-Source: AA6agR4yFXw1LfDTWhU/md5r3WEju2BJLDhhZ3Bv275bxarUsIpWkOQ0bghvH8Z0h6QRopwoB6brtw==
X-Received: by 2002:a5d:598c:0:b0:228:4628:f7a8 with SMTP id
 n12-20020a5d598c000000b002284628f7a8mr10941600wri.258.1662456514276; 
 Tue, 06 Sep 2022 02:28:34 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d528b000000b0021e42e7c7dbsm11189566wrv.83.2022.09.06.02.28.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 02:28:33 -0700 (PDT)
Message-ID: <d0b82889-952f-f3f2-788a-fc21bd1e5c14@linaro.org>
Date: Tue, 6 Sep 2022 10:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/7] tcg: pc-relative translation blocks
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220906091126.298041-1-richard.henderson@linaro.org>
In-Reply-To: <20220906091126.298041-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/6/22 10:11, Richard Henderson wrote:
> The goal here is to reduce the amount of code generation when the
> guest kernel enables address space randomization.  This requires
> extensive changes to each target, so opt-in with TARGET_TB_PCREL.
> 
> This is split out of v3, which also contained target/arm changes,
> as I now have patches for x86 and s390x as well.
> 
> 
> r~
> 
> 
> Based-on: 20220905202259.189852-1-richard.henderson@linaro.org
> ("[PATCH v3 0/6] tcg: Introduce CPUTLBEntryFull")
> 
> v2: https://lore.kernel.org/qemu-devel/20220816203400.161187-1-richard.henderson@linaro.org/
> v3: https://lore.kernel.org/qemu-devel/20220822232338.1727934-1-richard.henderson@linaro.org/
> 
> branch: https://gitlab.com/rth7680/qemu/-/tree/tcg-pcrel

Arg.  Accidentally dropped a patch from v3:


> 
> 
> Richard Henderson (7):
>    accel/tcg: Use bool for page_find_alloc
>    accel/tcg: Use DisasContextBase in plugin_gen_tb_start
>    accel/tcg: Do not align tb->page_addr[0]
>    include/hw/core: Create struct CPUJumpCache
>    accel/tcg: Introduce tb_pc and tb_pc_log
>    accel/tcg: Introduce TARGET_TB_PCREL
>    accel/tcg: Split log_cpu_exec into inline and slow path
> 
>   include/exec/cpu-defs.h                 |   3 +
>   include/exec/exec-all.h                 |  51 ++++++++++-
>   include/exec/plugin-gen.h               |   7 +-
>   include/hw/core/cpu.h                   |   9 +-
>   accel/tcg/cpu-exec.c                    | 108 ++++++++++++++++--------
>   accel/tcg/cputlb.c                      |   5 +-
>   accel/tcg/plugin-gen.c                  |  22 ++---
>   accel/tcg/translate-all.c               |  90 ++++++++++++--------
>   accel/tcg/translator.c                  |   2 +-
>   target/arm/cpu.c                        |   4 +-
>   target/avr/cpu.c                        |   2 +-
>   target/hexagon/cpu.c                    |   2 +-
>   target/hppa/cpu.c                       |   4 +-
>   target/i386/tcg/tcg-cpu.c               |   2 +-
>   target/loongarch/cpu.c                  |   2 +-
>   target/microblaze/cpu.c                 |   2 +-
>   target/mips/tcg/exception.c             |   2 +-
>   target/mips/tcg/sysemu/special_helper.c |   2 +-
>   target/openrisc/cpu.c                   |   2 +-
>   target/riscv/cpu.c                      |   4 +-
>   target/rx/cpu.c                         |   2 +-
>   target/sh4/cpu.c                        |   4 +-
>   target/sparc/cpu.c                      |   2 +-
>   target/tricore/cpu.c                    |   2 +-
>   tcg/tcg.c                               |   6 +-
>   25 files changed, 226 insertions(+), 115 deletions(-)
> 


