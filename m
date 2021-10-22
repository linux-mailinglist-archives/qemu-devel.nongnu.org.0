Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBB437FFE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:43:23 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2Ju-0006fn-Rh
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2IM-0005o0-V5
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:41:46 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2IL-0003jI-Bq
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:41:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t184so4459388pgd.8
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GSPQtPwOblZpk9BvGNbyHWEOgPuonsLG7LtwxWqjr/c=;
 b=yPSr/Y85uBtM17uZisNo9zyFoWlXZj2K/3M8Dy+MAlncScytke1lNCEJzQLU53OH/X
 KZ6xi9LX8Q/p6gspsbc3XxrnPrbbLE1Uy3DGO6fQBl2p7ofxWO1gtEPnAnVeoeAQgNO0
 OLvqA2BQTsuxzQ2s2nR9aRrnr9CjcC9sq6A8q5J9/GoOWbgAe9gW0BPkyVIcCTYuRKpL
 n8ksPPzQk4WPizbSSrIVhlXBQoxdrgduUyWiUxIUOTijbjPzCVpIHYW63Xi1BKQ0j7A0
 EMZub/vcR/H4W7M0rdmZdw2ae1KdpaDBOhPKgB3w8tmrPWcNIZS9+ZFNuAn3B6QCZW3Z
 3Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GSPQtPwOblZpk9BvGNbyHWEOgPuonsLG7LtwxWqjr/c=;
 b=YMCapIm8zhw7MQDhdweQh17j60Cbh5tIi9JuuMZZL2bLIp7amQx59hfpquQhSq7OCe
 pWuMir23A3ZZ6+Z93ED2ZxFlycOIpQoDesi4QhCkUo5xlysUECiv9giiFvOTEqr+iBcZ
 aGQw3fLZYuxzmjMKseGpx2Mb6RtcSCGmVY0mCDQXEiBKc0VBVLMqpft7bXRqSZhEHU4o
 KL1kr5JarC9kA6d9eyK6WFBlXnReltOnlf+R7dw17QnPZah7ZpCRLh8SP7MY69o6AnKK
 xjmtAHkSRpT5X71RnVhN0MOkfO+pupi6agtDpz00AzVsgF9/45q2pZDfLgC0Fim1+rhU
 J4ug==
X-Gm-Message-State: AOAM530P4Srqcd8zbv7SAcJO0A8XIiU4SZ5zOYicOIiQQYOIqmJ8tII8
 e2HtJU/YASGYFsiziJQys98nBQ==
X-Google-Smtp-Source: ABdhPJwHo0GIAB70fkk6LO+w6WNeFVhTjRcTaYunMHJY7ZwRx05eW3Expt4KUYgNm973hKQhYtzj9A==
X-Received: by 2002:a63:3348:: with SMTP id z69mr1693035pgz.177.1634938904123; 
 Fri, 22 Oct 2021 14:41:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id pj12sm10257455pjb.19.2021.10.22.14.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 14:41:43 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/mips: Fix MSA MADDV.B opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211022174550.36937-1-f4bug@amsat.org>
 <20211022174550.36937-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0cf0dd8-bbe2-a4eb-0d5c-e117a677c133@linaro.org>
Date: Fri, 22 Oct 2021 14:41:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022174550.36937-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 10:45 AM, Philippe Mathieu-Daudé wrote:
> The result of the 'Vector Multiply and Add' opcode is incorrect
> with Byte vectors. Probably due to a copy/paste error, commit
> 7a7a162adde mistakenly used the $wt (target register) instead
> of $wd (destination register) as first operand. Fix that.
> 
> Cc: Aleksandar Rikalo<aleksandar.rikalo@syrmia.com>
> Fixes: 7a7a162adde ("target/mips: msa: Split helpers for MADDV.<B|H|W|D>")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_helper.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

