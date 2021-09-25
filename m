Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A014418340
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:34:42 +0200 (CEST)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9hJ-0008Qw-FJ
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9bR-0000DE-DQ
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:28:37 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU9bP-00013Z-1f
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 11:28:36 -0400
Received: by mail-qk1-x729.google.com with SMTP id 138so31331419qko.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/1NJ1utX8sQJpv+uqZ8V9EHtkfSOxT5poMmwuRUTKy4=;
 b=E8Dkl9XuDIYntUNZ1Vigu74S9fTkincvwudwYvfXuVTHJ9HJAW2tqqBwXJqfbYW7tY
 uq7v8O0kzOXugmZMbqNyIFEM69O2ebQVLluFIExN0ewGIdI6BIn7ZQW45aXh1Ye9+B9g
 1yJAu5HvNC6UL6MkssNWIi7V6VwQ4siBEz27v+vwKBJ5PKHdN1cgKxJ0B+7nhbKeoB0D
 mhu0yg963j6P+iSfSiCAMkysaUmQBCRaUaVHnJ6wETgxUTlXmS3PwRtPG+0G/8xsWrsW
 xph0YsLCmcYdIluEzmywBzYpnXY4l2zE2PCEyrcVC2fQO/2ga6Lza046+34Tu/dxyKy8
 HpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/1NJ1utX8sQJpv+uqZ8V9EHtkfSOxT5poMmwuRUTKy4=;
 b=XRMbs4e6OgpCWY6TSUhTOKV5xtsgP4yQplh7oiPyqCyq8uJ/bNvcbFRIcproZgjjl5
 TZRVxbc9J5b+Fbz/EKxFgGi5Y42NeW/VCOrV3sTecRfI0reghhuMg5CBtlmmCt8vhIEj
 X3+mUDQxELas+GppUWoubvSQK278mbATx9tuTAFzuZfb2VxZ4Z5+NiM5nKxf/Pld9ykF
 eQTDX1pYdL6T02QJZTA5JxFxHG06LOPziqOFXurOTIbrNxY2rF+k5SqVcJ0yOz0Tw39m
 1JRlAMjPeYbep+enYvx8kcXe1j2n8u2XDHo4CKHgFdTiif0yzXHBV34hiz76nuuIwJcO
 IbMg==
X-Gm-Message-State: AOAM532sOAZaFLUP7K7GQmNgNAr5/02vriBnuOi4EFdQ3KjJRYTLefh9
 IFnTEEqBluHxvjkaTc62wluHUi6kCTNyMA==
X-Google-Smtp-Source: ABdhPJzkTy1AZXrUs2bpSi7p1894RMOV0yXO0k8ybl4xG5KeNyTEgkx6ERE7n3if9W1TRfuKbVqXsA==
X-Received: by 2002:a37:a051:: with SMTP id j78mr16438715qke.50.1632583713911; 
 Sat, 25 Sep 2021 08:28:33 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id p187sm8806658qkd.101.2021.09.25.08.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 08:28:33 -0700 (PDT)
Subject: Re: [PATCH v7 00/40] accel: Move has_work() from CPUClass to
 AccelOpsClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210925145118.1361230-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db0359fd-cfef-f959-02b4-258188c49312@linaro.org>
Date: Sat, 25 Sep 2021 11:28:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 10:50 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (40):
>    accel: Simplify qemu_init_vcpu()
>    hw/core: Restrict cpu_has_work() to sysemu
>    hw/core: Un-inline cpu_has_work()
>    hw/core: Move cpu_common_has_work() to cpu_has_work()
>    accel: Introduce AccelOpsClass::has_work()
>    accel/kvm: Implement AccelOpsClass::has_work()
>    accel/whpx: Implement AccelOpsClass::has_work()
>    accel/hvf: Implement AccelOpsClass::has_work()
>    accel/xen: Implement AccelOpsClass::has_work()
>    accel/hax: Implement AccelOpsClass::has_work()
>    accel/nvmm: Implement AccelOpsClass::has_work()
>    accel/qtest: Implement AccelOpsClass::has_work()
>    accel/tcg: Implement AccelOpsClass::has_work()
>    accel: Simplify cpu_has_work()
>    accel/tcg: Introduce TCGCPUOps::has_work()
>    target/arm: Explicit v7M cores use arm_cpu_has_work as
>      CPUClass:has_work
>    target/arm: Restrict has_work() handler to sysemu and TCG
>    target/alpha: Restrict has_work() handler to sysemu
>    target/avr: Restrict has_work() handler to sysemu
>    target/cris: Restrict has_work() handler to sysemu
>    target/hexagon: Remove unused has_work() handler
>    target/hppa: Restrict has_work() handler to sysemu
>    target/i386: Restrict has_work() handler to sysemu and TCG
>    target/m68k: Restrict has_work() handler to sysemu
>    target/microblaze: Restrict has_work() handler to sysemu
>    target/mips: Restrict has_work() handler to sysemu and TCG
>    target/nios2: Restrict has_work() handler to sysemu
>    target/openrisc: Restrict has_work() handler to sysemu
>    target/ppc: Introduce PowerPCCPUClass::has_work()
>    target/ppc: Restrict has_work() handlers to sysemu and TCG
>    target/riscv: Restrict has_work() handler to sysemu and TCG
>    target/rx: Restrict has_work() handler to sysemu
>    target/s390x: Restrict has_work() handler to sysemu and TCG
>    target/sh4: Restrict has_work() handler to sysemu
>    target/sparc: Remove pointless use of CONFIG_TCG definition
>    target/sparc: Restrict has_work() handler to sysemu
>    target/tricore: Restrict has_work() handler to sysemu
>    target/xtensa: Restrict has_work() handler to sysemu
>    accel/tcg: Remove CPUClass::has_work()
>    accel/tcg: Simplify tcg_cpu_has_work()

$ make check
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc capstone slirp
[1/143] Generating qemu-version.h with a meson_exe.py custom command
Running test qtest-aarch64/qom-test
**
ERROR:../git-alt/accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be reached
ERROR qtest-aarch64/qom-test - Bail out! 
ERROR:../git-alt/accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be reached
Broken pipe



r~

