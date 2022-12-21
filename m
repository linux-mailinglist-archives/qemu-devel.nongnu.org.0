Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0B653501
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Zo-0000EO-40; Wed, 21 Dec 2022 12:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82Zl-0000AF-CM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:08:17 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82Zj-0001Gy-Nx
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:08:17 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso2947742pjp.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=32CKJsIEQfVT1E0fb7Rf3n09fZB0OXpfQTfmhkWjd7I=;
 b=LDvGWkd4VxEujKsERr2VJU+5Kpu5Xk1Y85EXa4jM6v+HGJfeKKA+eMi8dKQM6iNR9W
 b0Sb2qlE1rscmVfdAKJF3a/2Yu6HO0kV6midL4niRofJN7LwKB1WiCIzXvtTJSjoqSYM
 E1BhTYms/JJ59L7Q/QREHFd7vtE4g1Y5A0/0BCZLY8F3Cgp0pIW8WsPX3vafLqBoDirJ
 +758U7BAgGCXOtabsFU7yAgsWOiaoPtx2zYrE2XkztFNuJugpWdUXdY7xK/mWaKQM+SO
 LeLG0QDGzsKKBrqSKhTzgD4b5X3vizkRIZA07uKrhJ17DTNXn7FrZCYIxbmhF5bzpwNn
 vQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=32CKJsIEQfVT1E0fb7Rf3n09fZB0OXpfQTfmhkWjd7I=;
 b=i6QoVpTXGhrKhLYJw++6IPHLMBry1sTS/7DDPw1v2Dx1EnXJpTsGgR+4eHxMIpey54
 D5JGlEqanetzzefqEpBtnHJhtrl6L7BXch5Zur7MTjmpysZEynksyfLsTYVC53xG4GEJ
 LP9qWHAd7OKv2sghU9w/Tx/Vh+HiC3983rVlnl97u15Y5pkxG52X0SxlaRigtj75USGd
 /uSbAKkYz51F8DvMeFriUDIYR4ZFPlnTb038ARrDHO2a59XiashC3mQ6xzBjIrp/zywr
 jPbYm+snKwtNO78zFfWgBwKRAy2I8cQ/c39qnEbQ0PTTypd5S0VBJvUQgwcbrwOYpBR4
 qk/g==
X-Gm-Message-State: AFqh2koUM5x6JxACHoyAUWpK02vcuk2/Msj2GI+UfJgZwNQ9Npd06Mpy
 6MWLCXL8v/Xra+gmv8D18/IpXg==
X-Google-Smtp-Source: AMrXdXuZGKGZJ0mcs/b9A3x8fjeTvkd5dq55Hp/7adGuZCAtkF2Q8TGfQhw0P6rT/AucpkJi40xsyw==
X-Received: by 2002:a17:902:e944:b0:189:d8fb:1523 with SMTP id
 b4-20020a170902e94400b00189d8fb1523mr3027348pll.36.1671642493991; 
 Wed, 21 Dec 2022 09:08:13 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:e04c:516d:5698:abe8?
 ([2602:47:d48c:8101:e04c:516d:5698:abe8])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902714a00b00176e6f553efsm11666984plm.84.2022.12.21.09.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:08:13 -0800 (PST)
Message-ID: <7d41b1a5-bfb1-e9b8-a920-7a07da91d32c@linaro.org>
Date: Wed, 21 Dec 2022 09:08:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: Set pc_succ_insn for !rvc illegal insn
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-stable@nongnu.org
References: <20221203175744.151365-1-richard.henderson@linaro.org>
 <CAKmqyKOY-RfSOeuuQazaZ6UvGRfOhrT7-Lk_FCDfpyybN9GZAA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKOY-RfSOeuuQazaZ6UvGRfOhrT7-Lk_FCDfpyybN9GZAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 12/20/22 22:20, Alistair Francis wrote:
>> +# Disable compressed instructions for test-noc
>> +TESTS += test-noc
>> +test-noc: LDFLAGS = -nostdlib -static
>> +run-test-noc: QEMU_OPTS += -cpu rv64,c=false
> 
> This fails the `make check-tcg` for Linux user mode when testing plugins.
> 
> This diff is required to get it working. I have applied the change myself
> 
> diff --git a/tests/tcg/riscv64/Makefile.target
> b/tests/tcg/riscv64/Makefile.target
> index 9973ba3b5f..cc3ed65ffd 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -9,3 +9,4 @@ TESTS += noexec
> TESTS += test-noc
> test-noc: LDFLAGS = -nostdlib -static
> run-test-noc: QEMU_OPTS += -cpu rv64,c=false
> +run-plugin-test-noc-%: QEMU_OPTS += -cpu rv64,c=false

Oops, thanks.


r~

