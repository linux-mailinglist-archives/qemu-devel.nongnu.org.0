Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089826AD39A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 02:00:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZLf1-0006tk-2v; Mon, 06 Mar 2023 19:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZLez-0006tc-Tb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:58:33 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZLex-0003FV-3w
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:58:33 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so193927pjn.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678150709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a2QIhxZoHezJe9TL966snnmASNMSKKzci8qpOKKo5UA=;
 b=Y+84U49YouS3YjJCEwpOcQSYEeD+uAC6xDtTLHmN+bzbLQVPAcJ7R3wzMLCkoPc88+
 EfLvYlYq7F7jV3PuGU8TkvT2SnMCCweUjLyXMvdH06aZ+blJGXABStH+l68eiRYlLZkL
 D4RiBClBfczboA8MpO9WMT8pyaNdn46yNWea/meV7gkQ0VTc8PqZD+2xFMrp66QEJ6MI
 OiFpa175JF3AAJ4E4+40I1ShCMQViK+orKZbJMDVX9M3xhri4CNY8eQ7R7TwfgNrtZ1I
 wz6Le3Vdim2ZhpDvGU15t4nFd62YsfMBcGaY1UoomMqQcQ6aAlBU5NtuE/4bUZaHQCYA
 kYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678150709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2QIhxZoHezJe9TL966snnmASNMSKKzci8qpOKKo5UA=;
 b=zwLS9JKkRzqdvMTLrLF36uTa7ZyQiCBbri1kQ4HXjf6jPQjxfCQf/3iknaMOyTEcPn
 xqOTLvEpCrJqBaSevsaOW0yS33eNK2dJCpncbMhMhCw7GPFgOFVBwWc9qJVfhrdlyJPx
 +NeJQe05YJvOqKO/UXxFpzk/fePnaLe3Ec1gCUDdZSS0WnXEuLgNGvySfkB8I7cH9xcw
 jdxHyObMPaunEEk+4W6xz20NVIVyP/VnaHMYUeaMpLPLEMDZkkxXG85x1eanGP/h4+iM
 +BzpfTh0qKN/hoyiMmru5mGeIagFcgUQQ6ZR5IfDdJEpKeG++pRsbKg7LFnBVDkSpaTF
 H6rg==
X-Gm-Message-State: AO0yUKV1D6j3gCuaQY7PbYkAsRITVmZEX39RvEVzSZoIiF+LgWXHHgnd
 /TceAjZXPdTACLGb2SPyimmlOQ==
X-Google-Smtp-Source: AK7set/ZXCI4/e+UkitugTXE/DVF4edbv4WBs5vCHBMU1EGSZlCTlQFMJUzN5PRK+WkOD5jAON48aw==
X-Received: by 2002:a17:90b:180d:b0:22b:b375:ec3f with SMTP id
 lw13-20020a17090b180d00b0022bb375ec3fmr13719923pjb.21.1678150709065; 
 Mon, 06 Mar 2023 16:58:29 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:a31d:20ef:5db3:4465?
 ([2602:ae:154a:9f01:a31d:20ef:5db3:4465])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a17090a6b0e00b00233b5d6b4b5sm8145033pjj.16.2023.03.06.16.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:58:28 -0800 (PST)
Message-ID: <03a8daa2-aec0-c92c-6bd5-16cd5ef13b24@linaro.org>
Date: Mon, 6 Mar 2023 16:58:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/23] Fix NB_MMU_MODES to 16
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, mrolnik@gmail.com, tsimpson@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, edgar.iglesias@gmail.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230306175230.7110-1-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306175230.7110-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/6/23 09:52, Anton Johansson wrote:
> This patchset fixes NB_MMU_MODES to 16 for all targets, meaning the
> macro is no longer target-specific.  16 mmu modes is large enough to
> cover all currently supported targets (12 arm, 10 ppc, ...), and is the
> maxiumum supported by the softmmu tlb api.
> 
> As mentioned by Richard in response to our RFC, softmmu tlbs are
> dynamically resized and so the overhead of an unused mmu index is fairly
> low.
> 
> The grand goal is to allow for heterogeneous QEMU binaries
> consisting of multiple frontends.
> 
> RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html
> 
> Anton Johansson (23):
>    include/exec: Set default `NB_MMU_MODES` to 16
>    target/alpha: Remove `NB_MMU_MODES` define
>    target/arm: Remove `NB_MMU_MODES` define
>    target/avr: Remove `NB_MMU_MODES` define
>    target/cris: Remove `NB_MMU_MODES` define
>    target/hexagon: Remove `NB_MMU_MODES` define
>    target/hppa: Remove `NB_MMU_MODES` define
>    target/i386: Remove `NB_MMU_MODES` define
>    target/loongarch: Remove `NB_MMU_MODES` define
>    target/m68k: Remove `NB_MMU_MODES` define
>    target/microblaze: Remove `NB_MMU_MODES` define
>    target/mips: Remove `NB_MMU_MODES` define
>    target/nios2: Remove `NB_MMU_MODES` define
>    target/openrisc: Remove `NB_MMU_MODES` define
>    target/ppc: Remove `NB_MMU_MODES` define
>    target/riscv: Remove `NB_MMU_MODES` define
>    target/rx: Remove `NB_MMU_MODES` define
>    target/s390x: Remove `NB_MMU_MODES` define
>    target/sh4: Remove `NB_MMU_MODES` define
>    target/sparc: Remove `NB_MMU_MODES` define
>    target/tricore: Remove `NB_MMU_MODES` define
>    target/xtensa: Remove `NB_MMU_MODES` define
>    include/exec: Remove guards around `NB_MMU_MODES`

Thanks, queued to tcg-next.


r~

