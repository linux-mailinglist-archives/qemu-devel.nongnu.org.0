Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA43ECAED
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 22:27:20 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMj0-0003RK-N1
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 16:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMhW-0002SG-Hf
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:25:46 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:47010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMhU-0002Il-DA
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:25:46 -0400
Received: by mail-pl1-x636.google.com with SMTP id u15so3098604plg.13
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jJZJOsJc74cTq9NrM1Vw0sSYicGuxj4gwEjKb4yzS6w=;
 b=amIMdnksFK0KZOJmVrmUJCqKQ8rfwoiJuMVn68ahOuMq98tKyfS7QYrj52PlzTlb8E
 Fy4FeJPA0Q2jWgVRE/ndcjZc529g9vEN0f46dvK5bmn4GwLMJfjmKiBPG9wxZvU6JaFw
 CXjWnL5YNqpj4yGAs3mymux7qccJD4sMMQ8azSFxdKZ438a6L7tmggZiGLDruL1U6mzq
 A9tYeSxDhqlSUZYnPo1a08gzo74+BF2pyHdwQ7wpn1JaGvgZTq4KDT502TOtvFDPENcs
 d5wMTJ/1aZXvNqJ3um3Z7I63ogjczUjwnBX5dLVz2o2ZjZRhCRW+PGqSgFFqRBd9SjLi
 sv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJZJOsJc74cTq9NrM1Vw0sSYicGuxj4gwEjKb4yzS6w=;
 b=i84kti1qVu4XSZWJJO86IbVyu8cGPq1pM5XHl0oMVK2wPOI9yu7vjO97/EoL8rbp53
 6EsRbwDvW9de7VjRxU9zxC/HJAz0h3WTQDKrXmD/1ApWskqsGUUQkgTwZ+D3XG7X6Mg1
 41A2WamfeQm6rHlPbhTHWNTStyaFc01laiFpmahWcejAYYuuiKNFXz29QQiT3a7tNNh0
 PLYlPJoIta1jdyfAHXUfdNCIYmvDOyxciGz8AuiPIKwuJpSG/MsZEGMllG1Yu+mmrKcj
 ps2lV27KumYN/ZB3HwKGVsBPa8W/dqNRISKELsvkXAMBFAG6xZ1cV7dCNKU8ooWK1M6l
 3tmw==
X-Gm-Message-State: AOAM533oVqUI/f/CyKFbaHOgBWuWSOkkubWpM893PAwPop0G1Ik3l0PW
 dC7TwFlMGCkigmO05vVguti78w==
X-Google-Smtp-Source: ABdhPJwFFDVce3i8RxUBPYwiVftoH11G7qG+ODv7sFtI6cmLHSIC1J1s/VGiO3dDnDA6C1hgkzzPzQ==
X-Received: by 2002:a17:90a:b284:: with SMTP id
 c4mr13589570pjr.213.1629059142745; 
 Sun, 15 Aug 2021 13:25:42 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q5sm8410272pfu.185.2021.08.15.13.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:25:42 -0700 (PDT)
Subject: Re: [PATCH for-6.2 6/7] linux-user/arm: Use force_sig_fault()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd2680f7-e667-42a4-6eba-d4f26e3c62fa@linaro.org>
Date: Sun, 15 Aug 2021 10:25:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> Use the new force_sig_fault() function instead of setting up
> a target_siginfo_t and calling queue_signal().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I threw in a comment confirming that the si_addr value for the "bad
> SWI immediate" SIGILL really is different from the PC value reported
> in the ucontext_t and resumed from if the handler returns, because it
> looked like a bug to me when I was reading the code...
> ---
>   linux-user/arm/cpu_loop.c | 54 ++++++++++++---------------------------
>   1 file changed, 16 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

