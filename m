Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A755917A2
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 01:29:51 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMe6A-00017n-5U
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 19:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMe3w-0005tr-Fc
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 19:27:32 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMe3u-0005wD-0U
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 19:27:32 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 202so1961186pgc.8
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=pP9NME/cEdYZDyh63Y2sY0tcp9pP5cKoVI7Ej9HZGYs=;
 b=WnJlcrieqL1vZuWKZKQ5D3XHjBclfd2shUKwfzLsa4b66eaQRICL43w+Wu4JGB5iZ8
 KJNcDSAh5j3qJOMvLJQtxr5Q0Rn4vRKgjf/lED3udZ0xq8TDQLCQKjUoSLcWJ1l6CEWD
 J92/vY6g9EcFBZIkXJsZl3S+Dzxq2M6R/5VWBbYTHcvc0WjlG+8PcjArdYb61k4tXyRQ
 cA/TxMIx3Ab1mnBtVDKokd1zFKaCI1YyM/VoFACCVqe5c+7rxBNSOoSZnayQVz42hrTu
 i+1KQz0uW9Ki/UX3Cd7WHWQ0p0EuE+cpncOdQtk1uyQrD2aD658GKx8VNVmbwjqWHHc/
 udnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=pP9NME/cEdYZDyh63Y2sY0tcp9pP5cKoVI7Ej9HZGYs=;
 b=rzt3UT+RHpvkPXOlRpAgLdl+w4IPbduKHlZWw+ic7U1npPQZtOQ+bGKPxAVofN3ze/
 0sF+UZzLZDquHp8kAJc6YeDnfxGuEq//1hDnrGBqmhqlc/bRRsd5GKh+0URvW4rWPm/0
 f8aVEtVX/Nvwp3JCXjGjQpU5VepongQ7HfyOBDmYPRfvfkqnYKW7A9kV9F1C3EtYE23i
 ICuazSEHbFBqrziG6aYodpyj58r/5X2N4kBNQU3VeiZYjrYp9XDGFL7AKkSWlQygrddm
 6aSHi4qsQjTqxRuHW8wo2hwxv9+f18aO4bR6Uv7zvQbIm+LaoWvuF4/nzvubNQfljgro
 zakg==
X-Gm-Message-State: ACgBeo1xg28RlQiYsordeUKEHK1cfGfel568lT5ydHaW6oA30GOw0KWH
 et3CrPVbMonJXIUw/5IluU/5xw==
X-Google-Smtp-Source: AA6agR4+dVD1G36tY2SrViBTBT037QuQqR1V7Qup+zfDk2zjDMJ6+yXynoL3zLBZ6EFd29qQH4q7vw==
X-Received: by 2002:a63:e343:0:b0:41c:d5cd:a39 with SMTP id
 o3-20020a63e343000000b0041cd5cd0a39mr4946712pgj.512.1660346848504; 
 Fri, 12 Aug 2022 16:27:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a656091000000b00415d873b7a2sm1853743pgu.11.2022.08.12.16.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 16:27:27 -0700 (PDT)
Message-ID: <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
Date: Fri, 12 Aug 2022 16:27:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Content-Language: en-US
To: Furquan Shaikh <furquan@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/11/22 13:41, Furquan Shaikh wrote:
> Unlike ARM, RISC-V does not define a separate breakpoint type for
> semihosting. Instead, it is entirely ABI. Thus, we need an option
> to allow users to configure what the ebreak behavior should be for
> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> privilege specification[1], ebreak traps into the execution
> environment. However, RISC-V debug specification[2] provides
> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> be configured to trap into debug mode instead. This change adds
> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> should treat ebreak as semihosting traps or trap according to the
> privilege specification.
> 
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf

I don't see why you need to change anything at all.

Semihosting doesn't only use 'ebreak', but a sequence of 3 insns:

     slli x0, x0, 0x1f       # 0x01f01013    Entry NOP
     ebreak                  # 0x00100073    Break to debugger
     srai x0, x0, 7          # 0x40705013    NOP encoding the semihosting call number 7

If the -semihosting command-line argument is absent, then the new DSCR fields apply as 
normal.  If the -semihosting command-line argument is present, and the ebreak is not 
surrounded by the required nops, then the new DSCR fields apply as normal.  But if the 
command-line argument is present and the nops are present, then semihosting overrides the 
architecture and DSCR does not apply at all.


r~

