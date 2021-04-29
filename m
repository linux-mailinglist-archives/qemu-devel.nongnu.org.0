Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EF36F237
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 23:43:37 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcERb-0006ts-Ni
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 17:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcEQd-0006Od-1U
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 17:42:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcEQb-0002NG-Ge
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 17:42:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso572171wmq.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G9XajQbDL/h2yV1V2LUofTG9d+sVEXeA5r10ikWAO8g=;
 b=sNerdu5Uv3XkqD08pwEHDkQIV2TQaTQ3PWTL1Pob/IvCW8VZhdt24FfGqYfvNCKIoL
 BoOFgRbRJTB9cSDpXFYJl4LdxOVgOO5iLyMTyWeMeLTZCmDJEQ+e6FaRrTBn3DFI39aM
 1nP8l53jvUJXEnwzWzMj4c6dusSQJG1ZhdKOzWOZurHI9aSMWDqvlyhm538Qhdp6jl44
 estih4HFAmO+2XgDLxUBi9jtI1SJ3xQ//PInqjU+eY1RMWDuPPjcGhmnP9q1nqavbgsQ
 CncKLvDnP9OPMMfN8l0MzZV4U+2ayodvoQaxNvnJsJBlKWaaef7/pOT9O3Hi9laKKp5i
 edGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G9XajQbDL/h2yV1V2LUofTG9d+sVEXeA5r10ikWAO8g=;
 b=m+cEMFtn/J/zRJQN6REN7TrVLjV4rqEOEUZB3bJbd8FcaBV1JPMy/i/6yJ7izmRFfy
 XRFNKwuKuWsxKXPOBOFlmsYwqH+4dODImRC65y+9CzDHI2YviUGEbgIQ8Z5mEm6KDk9c
 blzZ1vT8ieCyo6mJFEcDCkgHXMBZJzOEXrk2NotZZq/gCP7yM42CKd0Z/Hybh4GFNjjs
 rXfS28AIX/x/60ztFBzKhivh2xgtjgZzFwvSybOEbY1XoK2JoCJjl6Xx0GM4hTg2aXtF
 xIFvGG09FMkl4GKYueinWTB2XYW63P0Dz99xg7K4LreZ5cBrdk1VPEBssQpd3CB/Esom
 BiSQ==
X-Gm-Message-State: AOAM530XG7yiGHAtjFGHCtNRMYmhPNjCSM68mvCWKErn0xK9Fu05XjxO
 viMYnvSk2Hm03u8JTGHSJPQ=
X-Google-Smtp-Source: ABdhPJzI4ZVzbJdnRg2o9vaB5K9GqRrVgVIlUK0UZahKa13RwN+rp6chx+TFocg4FJNGfU+DnO4hsw==
X-Received: by 2002:a1c:21d5:: with SMTP id h204mr2383410wmh.95.1619732552017; 
 Thu, 29 Apr 2021 14:42:32 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b14sm6236531wrf.75.2021.04.29.14.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 14:42:31 -0700 (PDT)
Subject: Re: [PATCH v4 00/30] target/mips: Re-org to allow KVM-only builds
To: qemu-devel@nongnu.org
References: <20210428170410.479308-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <685c33a8-b622-a59b-570c-6c434a1d8772@amsat.org>
Date: Thu, 29 Apr 2021 23:42:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:03 PM, Philippe Mathieu-Daudé wrote:
> TL;DR:
> 
> This series restrict TCG-specific objects by moving them to
> the tcg/ subdir. Code is moved around to satisfy 3 cases:
> { generic sysemu / tcg sysemu / tcg user}.

> Philippe Mathieu-Daudé (30):
>   target/mips: Simplify meson TCG rules
>   target/mips: Move IEEE rounding mode array to new source file
>   target/mips: Move msa_reset() to new source file
>   target/mips: Make CPU/FPU regnames[] arrays global
>   target/mips: Optimize CPU/FPU regnames[] arrays
>   target/mips: Restrict mips_cpu_dump_state() to cpu.c
>   target/mips: Turn printfpr() macro into a proper function
>   target/mips: Declare mips_env_set_pc() inlined in "internal.h"
>   target/mips: Merge do_translate_address into
>     cpu_mips_translate_address
>   target/mips: Extract load/store helpers to ldst_helper.c
>   meson: Introduce meson_user_arch source set for arch-specific
>     user-mode
>   target/mips: Introduce tcg-internal.h for TCG specific declarations
>   target/mips: Add simple user-mode mips_cpu_do_interrupt()
>   target/mips: Add simple user-mode mips_cpu_tlb_fill()
>   target/mips: Move cpu_signal_handler definition around
>   target/mips: Move sysemu specific files under sysemu/ subfolder
>   target/mips: Move physical addressing code to sysemu/physaddr.c
>   target/mips: Restrict cpu_mips_get_random() / update_pagemask() to TCG
>   target/mips: Move sysemu TCG-specific code to tcg/sysemu/ subfolder
>   target/mips: Restrict mmu_init() to TCG
>   target/mips: Move tlb_helper.c to tcg/sysemu/
>   target/mips: Restrict CPUMIPSTLBContext::map_address() handlers scope
>   target/mips: Move Special opcodes to tcg/sysemu/special_helper.c
>   target/mips: Move helper_cache() to tcg/sysemu/special_helper.c
>   target/mips: Move TLB management helpers to tcg/sysemu/tlb_helper.c
>   target/mips: Move exception management code to exception.c
>   target/mips: Move CP0 helpers to sysemu/cp0.c
>   target/mips: Move TCG source files under tcg/ sub directory
>   hw/mips: Restrict non-virtualized machines to TCG
>   gitlab-ci: Add KVM mips64el cross-build jobs

Thanks, series applied to mips-next tree.

