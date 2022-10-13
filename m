Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41B5FE0BB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:15:04 +0200 (CEST)
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2jW-0000RC-AL
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2hK-0006R8-Fj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:12:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2hH-0005rr-0X
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:12:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id z20so2508156plb.10
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TV7RvzMQm9elidyZsFlsKnYOBqSCg+pEfmVdIlOHq8o=;
 b=vi9ZpuVZymBtN+MQINRuODZEwTVhlQEZcYoZQ+MniVoY4QfPGRGX5M1VqN5YkkvdrF
 hem9cEGO2xCYnGk8O7tKfLAL66ttZ1Xby/yIQuQ7HWtFdDvcN8U+Oe9QLMnXghhe2JAw
 0GIRLMxJllsRMQ4uZcgd+L+Skzv8JnL3GcNOlFrjIBtqAOGE8bEYOB9YaiDD9jV5xjrv
 ozwYoVh0tH7HonOcZN1X4KoMYIAB1U0hUEGBTCeBWv1hiOZi8wr3aBwA+SNLP02VOtb6
 bUrs9aYr4rZoq2ZfVWW0hkvF1uYM1V1RJIfa9qYtEJFw3glTm5Yrtjs+tFMv9E/K80jF
 4WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TV7RvzMQm9elidyZsFlsKnYOBqSCg+pEfmVdIlOHq8o=;
 b=f25Cs3ZcLomVJiSH9g5o1TPBA6sfCsMa6eH4fgYbkmwGpa5pnnXdMyPVwF87letWKn
 uMme47Iy9Pb1C1oclzDAm6Jqvq6+L1/e5XP8c1hkvEwi1X17aqz7QfEFgAceulD7V/Uy
 yY6mAmlfQqcaJmQ5180s2T0jOpseBZ0xLe9PAoemOFvzySWr5pT2EKaOS11tZ2Jpj6CD
 C+LDpob4oCDFjIvas2OWYAnUej8325UajbskLcUWrJgpn+vxB+PK9qC56NGzuFrrCRwR
 rMXf9ndwkkcgsl5qG6vhfeSaJlJ1lC+NPs7h+TQmgGjp4MdN9fYzICFbcSLlm03ptqRh
 wfVg==
X-Gm-Message-State: ACrzQf1Z6dfX/Ps2lzwPC1mlepm9I4LzBoCQHcqx3gtAMQYWwjxmzIF7
 zOt7ryuGaN8fod8J4Wg/K++BnQ==
X-Google-Smtp-Source: AMsMyM57MhpJUieJ1Eih7/JrMWnvk9iqU0uIRCUOOyvPLHJknAz6ssbx4shAVUpRZGew85ZuA6qc0g==
X-Received: by 2002:a17:902:f693:b0:17f:6974:cf7f with SMTP id
 l19-20020a170902f69300b0017f6974cf7fmr908026plg.60.1665684760801; 
 Thu, 13 Oct 2022 11:12:40 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 u5-20020a170903124500b00174c0dd29f0sm159829plh.144.2022.10.13.11.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:12:40 -0700 (PDT)
Message-ID: <43a26fdb-fe70-1e11-174f-38110bd1f592@linaro.org>
Date: Fri, 14 Oct 2022 05:12:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] semihosting: Write back semihosting data before
 completion callback
To: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221012014822.1242170-1-keithp@keithp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221012014822.1242170-1-keithp@keithp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 18:48, Keith Packard via wrote:
> 'lock_user' allocates a host buffer to shadow a target buffer,
> 'unlock_user' copies that host buffer back to the target and frees the
> host memory. If the completion function uses the target buffer, it
> must be called after unlock_user to ensure the data are present.
> 
> This caused the arm-compatible TARGET_SYS_READC to fail as the
> completion function, common_semi_readc_cb, pulled data from the target
> buffer which would not have been gotten the console data.
> 
> I decided to fix all instances of this pattern instead of just the
> console_read function to make things consistent and potentially fix
> bugs in other cases.
> 
> Signed-off-by: Keith Packard<keithp@keithp.com>
> ---
>   semihosting/syscalls.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

