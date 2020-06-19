Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAAB201E97
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 01:26:38 +0200 (CEST)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmQP7-00027o-QI
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 19:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQOJ-0001LF-4O
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 19:25:47 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQOH-00086w-IV
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 19:25:46 -0400
Received: by mail-pf1-x444.google.com with SMTP id d66so5124011pfd.6
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DqXxlhHR27zlDc9QEEVbgZK6UoWz4beRS3JzYE1SPnY=;
 b=N4GBPsvE3Ou9EUohfNwTCXusGGVwzCc3cEwNOE0eVd49iv/FvlPbNtuILvwollIomI
 8UE+auzTWHfS/j1eheemPPGGTw6D1k0E9Ira+kujMHkfcErLyR7HVA7SyFAqfkYC0ATD
 A5GNOdXfp9ne1+3xQ1K5yVf6dOtnJZ4ZTVjAbXp58IyDcNDGlhMPOR/JFsouN1ExkL0Z
 YSlPlcF6yuA/R9O9kZFAMDJCgeZL6tMZnOeoXcut8WQ95WzOw2WGeRTsVTI0BHPTusHn
 3kKxg/vcdz4K06ODeQ/17hHb/XqttRKlXfJlFjVi253Rah5aii4ae3CRrOPBTV88tErI
 YJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DqXxlhHR27zlDc9QEEVbgZK6UoWz4beRS3JzYE1SPnY=;
 b=ZP0tqJqAFpoz2O/uXHkEx9CktQBl6Ha/lYzxQty/vKyQdqcYDt2Z8q3jVUuZ/jouUL
 3oKKQ5mcwHAjWgdwTQh4cIZRa98L6xq4sZToIrjqglMWerfWv1PO5Npjz1oNaRJY19Ji
 Y/NAWXeEaS1h6eBrAkfrUcl//2Q8bMuEt2Cz5LSbxA9Od4HjaJnmFTyA+mYc6olZyLY5
 9FZ61+w/V2Joe6AbrtbtBGFy4hK4zhm8YdObLSr9s87/AO9enUtEn+hEgpR+gM5r1xk+
 1s/OPdltOMwMtaegslLmPCuFJ+yi59zIgYXy7WBqwtulh5B1q7l+f2Cmny17v09+SXvp
 cohw==
X-Gm-Message-State: AOAM533fTkyggfh0Qm5p0n5Cgb4UiI/pdPq6vR9NorWXAcdNCFr0UVoq
 DSB98kIHFgFvqFsqmZKlTsd8kPHfKvo=
X-Google-Smtp-Source: ABdhPJx9UdoH0Bogrs7wPaj1hl2kcOozR5NIrp9CIXSIHgkW43UFaj6bpr7EecAokBN78LGVjqzMBw==
X-Received: by 2002:aa7:8490:: with SMTP id u16mr9669640pfn.259.1592609143860; 
 Fri, 19 Jun 2020 16:25:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a3sm6772630pfi.77.2020.06.19.16.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:25:43 -0700 (PDT)
Subject: Re: [PATCH 08/21] target/arm: Convert Neon 2-reg-misc crypto
 operations to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64570e3d-a89a-6102-b4a6-b157e06a897e@linaro.org>
Date: Fri, 19 Jun 2020 16:25:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon-2-reg misc crypto ops (AESE, AESMC, SHA1H, SHA1SU1)
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 12 ++++++++
>  target/arm/translate-neon.inc.c | 42 ++++++++++++++++++++++++++
>  target/arm/translate.c          | 52 +++------------------------------
>  3 files changed, 58 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


