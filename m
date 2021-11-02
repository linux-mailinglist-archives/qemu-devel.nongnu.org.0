Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE4443627
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:57:28 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyyO-0003mF-50
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyx6-0002wK-Ji
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:56:08 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyx3-0000LD-IL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:56:08 -0400
Received: by mail-qt1-x834.google.com with SMTP id h4so162731qth.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yOFecMmChVDVQd1yY1gTt3CEQJmeF3p7PpwVFrzOMbo=;
 b=BRJHlSJylHqWQzorWlhrlqC/ie3MSA5FP4O5TVgpKR9vNXVRELhe+J8LNPgvJZizRJ
 5bncF6wSm2czK/eQmizE5GCtrrM9sJGKsDcIt9bhHpdgfEbGZllzEbQgnPKNUCsq1uH+
 PYJeVu6WtrN5+bp13Kism/wWjzVpkZZBtmmmcSpoDzvWyhsit2pdKjqiJqWGNjYu8j2p
 Cc1/Ys/yf6gGibQuEHO/e+OyRp+ttwbIYdzVWRb1IsyVmLmsl3llHSEz8fNSeE0w0uBj
 2/tp/v+Dfq1IYcNxqtyuQBKv529gjl6QLWZ1h+ejk61LJfY6AnsrPP92XD16PO/1we22
 B0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOFecMmChVDVQd1yY1gTt3CEQJmeF3p7PpwVFrzOMbo=;
 b=axoF/9t08vimr7sTyBd2pj6rluK5CVl716XSZ06sFm4gXPUEtdTPW3ovzKUyrURtGC
 kUO7sIBQg6oVpKarTWTDBOxk/NvPJPJW0bzGYwnkzwre777eSQtEpcr026u9FEz8UMO8
 UHipYlYPaD8eC9V5Sn06Z+LyQaWnZI1M1hns2zGmstmMo3XrZLBZmaul6Jl+PhdIjOym
 TaTt2XEbhsuJJHpwzLN+yKDZEgRjzFIXriH7pyaazkUs3sDKSkzXITXC41bogBcq2dth
 76XIrhj2HNE/fTG3mzBZZCukuPcH0q3sOzMXd/GSDx1KpXOmy2uH+cN6xybJyBxhWmUZ
 BWVQ==
X-Gm-Message-State: AOAM5333jQ2YRs9s6tSCoe6mF09506ufDT8uuBZfWU6F9XfaXWsVWZCc
 JN2P1DtW+3ueiNEPooHdfm4CPA==
X-Google-Smtp-Source: ABdhPJw3BPvFW+BwDSEUe5qsIZGgIkxVPiiynrIm8eBGIo6ltl83AqjmOz1HNYArebbMRrqUV3OsBg==
X-Received: by 2002:ac8:7d0f:: with SMTP id g15mr33690263qtb.60.1635879364275; 
 Tue, 02 Nov 2021 11:56:04 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u6sm10000809qtc.86.2021.11.02.11.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 11:56:03 -0700 (PDT)
Subject: Re: [RFC 4/6] target/riscv: rvk: add implementation of instructions
 for Zk*
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <345c3fc7-72f9-a5b8-1545-fe7835ed8905@linaro.org>
Date: Tue, 2 Nov 2021 14:56:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102031128.17296-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 11:11 PM, liweiwei wrote:
> +uint8_t AES_ENC_SBOX[] = {
> +  0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5,
> +  0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
> +  0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0,
> +  0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,

Use "crypto/aes.h".


> +/* SM4 forward SBox. SM4 has no inverse sbox. */
> +static const uint8_t sm4_sbox[256] = {
> +    0xD6, 0x90, 0xE9, 0xFE, 0xCC, 0xE1, 0x3D, 0xB7, 0x16, 0xB6, 0x14, 0xC2,
> +    0x28, 0xFB, 0x2C, 0x05, 0x2B, 0x67, 0x9A, 0x76, 0x2A, 0xBE, 0x04, 0xC3,
> +    0xAA, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99, 0x9C, 0x42, 0x50, 0xF4,

Hmm.  We have an existing copy of this in target/arm/crypto_helper.c.  I think we should 
move that code out to a shared location like aes.

> +#define sext_xlen(x) (((int64_t)(x) << (XLEN - 32)) >> (XLEN  - 32))

This is (target_ulong)(int32_t)(x).


r~

