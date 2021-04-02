Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962A352E0C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:14:04 +0200 (CEST)
Received: from localhost ([::1]:37232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNMw-0000Qr-O8
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNKi-00082j-0E
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:11:44 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNKg-0001zp-Cr
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:11:43 -0400
Received: by mail-pg1-x529.google.com with SMTP id b17so258568pgh.7
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QdD7HEZR0muMqnZaelCXg/4/u7m18lqMo7GL/1Ukw2I=;
 b=CQ3iMnktLwW3XHgqy4r8NHRHoWLvMyB3L/qx96UtSgcHVKgyh5UDgDs4AA1kKF7Im/
 KLrSrO5hfR/y0EQt3di/oW9wtwasFdSg1rJ91aTcxWjXD/q9Apei93qEMN8TRsNJSNj0
 2sZWICP3BEbABhp/KAhrLepDZOxlYG6tUcHI6DpPwjUgDGZBwrFbz2EVP1LI6A/1WG5I
 7zCIfG4FmyaUOJSmCo/qttHixxQBeHCVAIs60HfGKgsl6NAZkbzVGFhVhx8VPTnILgub
 pfGehJIbefo/Na16NmUg61l/EsWsYDMQQStnUNTx6THCMjfn+CD5094TwBG0fkBRgbtl
 e2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QdD7HEZR0muMqnZaelCXg/4/u7m18lqMo7GL/1Ukw2I=;
 b=ejldSpZpDttom8BCVk5Yak6rlg4N89kY352V1j1A1hTzEM5U47i0ab3fTQFRO7pkL7
 +EsvADshHIGZbWbqL5b+sbYITA7Jj/M3NTD43OjVsJ3b2115mK4cKhe+Qz+RjpbXeevb
 h49FnKczK9mRSfzFnig3ZS2IKdYHNQ9dxGy+FRc+lOobyRYvEPA7c8CbWM3IjebuVxsO
 bspyeBbk1TjO9trU9rDvF0lo9gVxiVT4RNaZ8/L1t9RcWJDeiK7zdds3fxypCp8Tv79x
 pLs4R9eJm7M/q3CR8P160udu8KgiXrzEWhvFQO2kcro6xgn6pNItaJfRt2J4EqtHOh2o
 D8QA==
X-Gm-Message-State: AOAM5302x4DHQ6G9eUwLEGV/+IepdUJVW3+9ajlhJTA3YYOsy/C2Q//5
 N6UIVRWx1L0cbZBc1qrDtAf44Q==
X-Google-Smtp-Source: ABdhPJx8GyYpwdBNpSMHV1Ohq6skPBfKtMS+Mqs3BWdjm5RnV6vD5rnzse1ZabF35ErRPFIvMTRTjA==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr12513182pgh.192.1617383500822; 
 Fri, 02 Apr 2021 10:11:40 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q10sm8576990pfc.190.2021.04.02.10.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:11:40 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] target/riscv: Convert the RISC-V exceptions to an
 enum
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94b40cdc-4869-730e-50c2-0d33f93be077@linaro.org>
Date: Fri, 2 Apr 2021 10:11:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 8:17 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> Reviewed-by: Bin Meng<bmeng.cn@gmail.com>
> ---
>   target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
>   target/riscv/cpu.c        |  2 +-
>   target/riscv/cpu_helper.c |  4 ++--
>   3 files changed, 26 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

