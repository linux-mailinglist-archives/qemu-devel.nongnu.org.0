Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC2471D16
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:56:24 +0100 (CET)
Received: from localhost ([::1]:45290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVtP-0005ee-M3
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVs9-0004gZ-7y
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:55:05 -0500
Received: from [2607:f8b0:4864:20::52c] (port=35408
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVs7-0001rh-5p
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:55:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id j11so12818902pgs.2
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+UeYsBhFjCydbUuQ5rgpZcpkx46cZyRXNoHLfigUbE=;
 b=XZJ37AuGnlwbEPTEaSRhkSYBCuVWn/uAct2xDy7VaIgkxErFBVZjT2fzycxoRnIEYo
 YsBUfk9YjgBU0845XTk/y58j+SIF5R88ORTMZh1kYVSDV9gJQQkjK8+AFCiSkd3WvSTk
 CdNB43C3nz0ebMH5AD2kpPXAKS9WnfMcwdsKJHyYA5BXR2z2lNYivj866pGIMXMYWaon
 /dHLBa0X8FG/u3tcesevDXwdaG8Jne39tX6jWwsmt2Wap/5w/8uQ7MPOap1ecWMgymXq
 qUgcdS28ENgowinI+dkRvkIT191gRJHNSV25KbbgC+CyH4YBg+UUXwzRG3MgDjJhYHE6
 dgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+UeYsBhFjCydbUuQ5rgpZcpkx46cZyRXNoHLfigUbE=;
 b=vvYYHQ/USdSdHFHSH3rQHTiUsD/iB5JBu4LpgDkFml9sgWmM9S1IlqsiOabl+NG9gd
 Ai50RwFrdpwpBLttS6WWisS48k7/wtfjiWmUUuukVmMqBZ4XLgDJR69ZsueUhOEG7oDx
 XGGxd61tfrZrfUvfYhpXcHHwAGPp2wVt+hY8IIL9ULiLuFVGwTBhaoPlXzu6yQj0eL8I
 J9s2u6/r8ejS4ZsP0S24IFgw/49tXy/2ciLLi5hj8J5SiMtoyDZaK9Mrw8sJduH53BEC
 XOrHDFcAKRF6WsCUHENOp/qb/6OBPfs6nwXZV2qQVesWMMVXASFIqB7gQYtFLwW+U3TJ
 0pLQ==
X-Gm-Message-State: AOAM5329HnlCMJLlIUH98WW8k+uVSdR9O7ClHH9+q50srT2A4axMQ2wy
 Gckg2yoE04Nwqt13PE/kgTiAgA==
X-Google-Smtp-Source: ABdhPJx7OeLUuCDdjXXADo5Az99yAKqaG55e45qhEop2vnYidQSZ/1/mZiP+M6tol2y3T69ZYZO8og==
X-Received: by 2002:a05:6a00:1305:b0:4a2:75cd:883b with SMTP id
 j5-20020a056a00130500b004a275cd883bmr30135877pfu.44.1639342501852; 
 Sun, 12 Dec 2021 12:55:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e29sm8082552pge.17.2021.12.12.12.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:55:01 -0800 (PST)
Subject: Re: [PATCH 19/26] hw/intc/arm_gicv3_its: Don't use data if reading
 command failed
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73cf1d60-4f99-8fc1-63ce-a055a6b4801f@linaro.org>
Date: Sun, 12 Dec 2021 12:54:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> In process_cmdq(), we read 64 bits of the command packet, which
> contain the command identifier, which we then switch() on to dispatch
> to an appropriate sub-function.  However, if address_space_ldq_le()
> reports a memory transaction failure, we still read the command
> identifier out of the data and switch() on it.  Restructure the code
> so that we stop immediately (stalling the command queue) in this
> case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

