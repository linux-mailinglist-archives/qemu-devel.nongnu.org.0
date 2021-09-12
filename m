Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C58407F8B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:48:07 +0200 (CEST)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPUWM-0005WE-55
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUUs-0004A1-II
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:46:34 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUUq-00062J-SR
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:46:34 -0400
Received: by mail-pf1-x42f.google.com with SMTP id e16so6795234pfc.6
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I8xFaMcbSOLpfI7f3468dXDJbgxhKvf+2cUAlaptaM4=;
 b=lL8KZ907Qe/UqX5MVYEP3Yj5BKKG/nA+PctFERdl/JYLA8YAyCNWTB6aSmeu1cTeVJ
 +REP/XyTl2Mt4qoETM/nopPNdlCUhKadSpq/Dt7Q7ErHZ8X18ogK8Ffsc3FWtxUrwgqt
 onmbUHdmd9qevwM1RgxdqvX/QiqGlQ/qIxuB31QnUYiKB9NFKU37GMf8QqjSooVJp9XX
 guaKEZSf++SmovpBtQ7RrbpIEpFyNqXicESe01EK7hly+NGCIaRFa8sm35L3kv77WLkK
 +0/ygydSSEw0XSNvIwOxYyrMJdbmToyXXg3dBfdneOigvBF4f3RKYBioYnXW7iuVvEGY
 Cm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I8xFaMcbSOLpfI7f3468dXDJbgxhKvf+2cUAlaptaM4=;
 b=0IesuiVM18ieORMZYwymDnp4Clte7e5z+RIXpi0G03VY9BtwrCL1QQOx5uCNkZGuax
 PoByOHfIW6i67zouPACRak9MiPEcKTWXuyeQ+bnzpk6BlD12QtDlbHpRwfQpZQmOt/r+
 DA7UgP/cP/Cgs3ppdTYQOvijxrdvypWXBwqFAnNyVMD5kBe0UpzJfa+VlW+9WNGwEXgc
 7wnJmOlQi7TNu1qI3ik0yBWbPNh5tkRG55ZPdoth1Dnrf0lFl2XuI8qqK6HNfeGvbHNf
 xAgXmyY0cWfIFbIjwl9Wy5r0yTwOQJ39g24W+Jy5IfBkFr6Vxrtc5kjqyzoneySPcs/y
 59EA==
X-Gm-Message-State: AOAM533VryFn1/eEoPo5TENwl7YcuVt0v5DiMJxx/FClNYmGJDXWj1B5
 B0pgagh31PCvnhQ44QYfYOCF7nJEykRRug==
X-Google-Smtp-Source: ABdhPJyjbObJeAFU+37n8W5v9p7bPDC/KyWHBSwERyMOdst3BRGj1NRrueG69IjFe09pjyP6VTqO9A==
X-Received: by 2002:a63:1351:: with SMTP id 17mr7690993pgt.173.1631472391053; 
 Sun, 12 Sep 2021 11:46:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p68sm1731602pfb.106.2021.09.12.11.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 11:46:30 -0700 (PDT)
Subject: Re: [PATCH v4 20/30] target/ppc: Introduce PowerPCCPUClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210912172731.789788-1-f4bug@amsat.org>
 <20210912172731.789788-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61ffee53-71e0-0c69-ed54-623e026cf4e9@linaro.org>
Date: Sun, 12 Sep 2021 11:46:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912172731.789788-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 10:27 AM, Philippe Mathieu-Daudé wrote:
> We're moving the hook from CPUState to TCGCPUOps. TCGCPUOps is
> a const structure, so to avoid creating multiple versions of
> the same structure, simply changing the has_work() handler,
> introduce yet another indirection with a has_work() handler in
> PowerPCCPUClass, and ppc_cpu_has_work() method which dispatch
> to it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu-qom.h  |  1 +
>   target/ppc/cpu_init.c | 23 ++++++++++++++---------
>   2 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

