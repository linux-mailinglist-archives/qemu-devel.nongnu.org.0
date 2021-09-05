Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C0400EA8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:07:43 +0200 (CEST)
Received: from localhost ([::1]:32960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMnBm-0000y9-4F
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnAY-0008CP-PS
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:06:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnAX-0007A2-Eq
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:06:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id q14so4932893wrp.3
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NDPMJH+s/pOyzHmbw7BfF0p7wQATXYlu60PxgPi5ic0=;
 b=heesdtxes7+6wxiRklucHOBkApuTigFB7UYlVFSyKhwCxCFKtXxe4Z4ahjwAnehxiG
 kJe4Y+7IIS+of87PSPkRY3bDwhusAuf5OafmDBYiG5uwq5TIW7SUxjryyr1weZBzT4rn
 E5d516kKTF5fPVFNFtk1wflz8NHFldZt4cfuLo/0b+2FDy+UsdqPR6lTzsGKW84OuT1s
 0g2Nsrepkv/R/WmIUmR5XgIGny5XwUTTSQmAfs8AVwckMElSZqyXMtOq9ytn1G/BELrO
 vawKK7qx+M61p9JKw+F61FWQyHFq4WmpS9gQn8PEUObFUMi+2yjM6mRhB3KZV9BgTnnC
 rUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NDPMJH+s/pOyzHmbw7BfF0p7wQATXYlu60PxgPi5ic0=;
 b=qk4Ywn/5ngzy8qv4/xLjFlYb3TEUC4fPCxJXdv9zra36afhy9CUAUqZLUWOIgMEYhN
 nhQwKbWo6qHbNVnfJu7/ishwc1vKBM455lVvXzNxD/YjSiz2Mm5rJUXV42jTUiD9Ucsv
 FuWKqtVNdFRnq4hbYDDdjCR9yXmdjWenUe/7jDgeDAMoAd37wY4VJCm4Po7G4Q8QPEG2
 5vi84I+291s0Oi06eMCR3lW57zAn4tDQEpqn7UUj82Ap9udkIP3k3FcUnhQiVtrUL2Z6
 6qWWTb+VpXac8sC8Piq0igrj0mePBK0PAEK57I0oE+ryc3SRn12ZIByNXVbGvQJDbNQ9
 0tng==
X-Gm-Message-State: AOAM533qlMlObv7XZWg+lYRXsGXOAiflhiPh7XCtEk61U8YdFJaTxiNn
 dmD+A0XWpk1Zt9FSOC6NSizg5Q==
X-Google-Smtp-Source: ABdhPJyxvY9GLQbgtst208f2NeHrRkjsb8nL0BWVxyy/W3B/wMbH86oplAD6zWdyBpgvfH3m66aulg==
X-Received: by 2002:a05:6000:352:: with SMTP id
 e18mr7192619wre.238.1630829183691; 
 Sun, 05 Sep 2021 01:06:23 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id k1sm4257817wrz.61.2021.09.05.01.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:06:23 -0700 (PDT)
Subject: Re: [PATCH v10 02/16] target/riscv: fix clzw implementation to
 operate on arg1
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0499caa-7172-1ed0-50aa-e7d601f6c5ed@linaro.org>
Date: Sun, 5 Sep 2021 10:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 10:35 PM, Philipp Tomsich wrote:
> The refactored gen_clzw() uses ret as its argument, instead of arg1.
> Fix it.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v10:
> - New patch, fixing regressions discovered with x264_r.

Fixes: 60903915050 ("target/riscv: Add DisasExtend to gen_unary")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


