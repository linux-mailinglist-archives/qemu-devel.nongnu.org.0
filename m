Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C61D1BAC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 18:59:18 +0200 (CEST)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYuiz-0007Eb-Iv
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 12:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYui2-0006OY-Ch
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:58:18 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYui1-0008VP-CO
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:58:18 -0400
Received: by mail-pg1-x544.google.com with SMTP id 9so17957pgr.3
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sp2HP3/PrI5QhjSdIcvc+EqfDcL2JWXfL+I/kucgoSc=;
 b=KZejRUUi1LNZj2OlwMdrRkhefCjIG199EtkhIcF6k/c6XPwzTMrJF1OqaX/g07uJKM
 Dp5pGg9+6U6Ntdj+H8QrCSuOQT0Nwfu/oU6vbDHIEw/exwcbZzdWJowC4jh8fi1Dv7EO
 opJqHBw8nHHmD+nLh1Twm6AJpMCDBm33WefufbzUESmhOK1NYXfQEGYbdMn8oWB9kNNt
 l7b1ni3IMBTneMa6whkiIYvgPcJW1de01sApQNsStyn03biuBiL0N8yltvx8ZpL5PUnk
 pcoBfKMSHBhDikzruOTAQhGjtViplxBDk7md/9Bvhgbat1gh6GFC7n6Qp1FaWnhv+hMj
 FvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sp2HP3/PrI5QhjSdIcvc+EqfDcL2JWXfL+I/kucgoSc=;
 b=mRtTLZLMoPZkhqwIANLtqTjfV9uJ+fBdtzxq/+oNyQtNYc7JtI+pwlNxrle+bDAT8f
 eOK9wFgl+plPmFQQVk2yrlRdu3bDSCKKt1RxN4uchxKY0h0efU0Yn9xubfflQZ9dHdxT
 ly8J2WXOrTxCr54vULSD8EDDGKdA3J3oHd3IU7FfMkavMYY7gDiyj+FVCEx4k3kpI1FW
 ohfm4TePkHTa6yB64J8B4GUWJanLDFVso3558D43PvIa4J3Mm19NBpLerSuYPgrLxrft
 hjS/N4YYD2yozcCPSvfA62nBoe2BjVkbuj6zgF7G6/f6yu+eLoZTuwcrsPiXjf7YhbpK
 1ehw==
X-Gm-Message-State: AOAM532jj0UQg4Z76pqPAie+I21xcue7TMPK1p5QbsCmyWzZYxmfA1nW
 uGbykx8q0rp2iaSOMRgnzydqmUbjMBA=
X-Google-Smtp-Source: ABdhPJzPazMGYDygsAPWzE5ZJu0FvqlOI8LjpH7NiCg+12vPZJU7WUsEHqbXhKl4hjx/nyAUABN8Bw==
X-Received: by 2002:a63:3342:: with SMTP id z63mr242932pgz.49.1589389095092;
 Wed, 13 May 2020 09:58:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id e11sm201851pgs.41.2020.05.13.09.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:58:14 -0700 (PDT)
Subject: Re: [PATCH v2 10/17] target/arm: Convert Neon VQDMULH/VQRDMULH
 3-reg-same to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44be2984-bbb9-0244-7587-de109add185d@linaro.org>
Date: Wed, 13 May 2020 09:58:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/12/20 9:38 AM, Peter Maydell wrote:
> Convert the Neon VQDMULH and VQRDMULH 3-reg-same insns to
> decodetree. These are the last integer operations in the
> 3-reg-same group.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 +++
>  target/arm/translate-neon.inc.c | 24 ++++++++++++++++++++++++
>  target/arm/translate.c          | 24 +-----------------------
>  3 files changed, 28 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

