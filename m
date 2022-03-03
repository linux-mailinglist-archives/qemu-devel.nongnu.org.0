Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F54CC841
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:43:16 +0100 (CET)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtEB-0000Vl-B5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtCD-0006l6-Ho
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:41:13 -0500
Received: from [2607:f8b0:4864:20::431] (port=41601
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtCC-0004N8-3p
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:41:13 -0500
Received: by mail-pf1-x431.google.com with SMTP id p8so5875510pfh.8
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BQIoEJ7S5dzCm9BAbt8oLQtDQ5JsSUQBoXNNlip4qK8=;
 b=lbJSgQOmh9KVXcPDgGPyT58CHwLQQVwS8X35WHQ0SkSDaBSNCgL/JbCoqU6N68oENA
 Q5LU1/0ymZSCCmTQyxIJlmbO1widqq6PL9Hxaxt2gYbhuqoNqrTPtXid7zxdBkvhL3C/
 VmhTV5OiL58ikMM0TwiJMc6ureVOClILjFJIxtqMbi3ImCIE0qzU+BMuGyvCZcWEf2fm
 dyW6JipgLcnkb/bBo6ZGWfISDFiVDaua5fOitoZdPz8jySlKZ/3ZJkiaRfwSyRy3JWNd
 jByx/Dxggqb9a6elEDYpIgjOKbnQfUWvq9XSyWO9P8aXC9Zra8hqaUfC/KrwIQgNfvpk
 FpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BQIoEJ7S5dzCm9BAbt8oLQtDQ5JsSUQBoXNNlip4qK8=;
 b=L8JAGv7Rojg2Yii0YwhIceaZ/vcR+DJWCwtIef6PJJU5kMEARjb9e3zIh4GlovCHUj
 FSOYBsL6uqpta9FCduKptARotxTJZQdBThROxtjtkLDtEqOUrVKBbVTtjv/W/fvAJXhW
 8AI2GFUwX+aykT/UDBzoHV8kMxt27UFElHZMu+47cT0IGI5eTRig49RVACs+BVgkkikJ
 3vIV+IhU9t/cOF/Kji9AdC2rrhbeKPDrydxYN6y+XRimjwzn+ZQxPcd9KN7sMamNmU1Q
 5FymM9cQQ8GpF2PMdpphBuXNWhjhTngZrzEBlmj7PnuFgiGIqhO9LGX6bTvEii95aSAP
 E7rQ==
X-Gm-Message-State: AOAM530Ap5C8x699LfObES4TEGVxC7Y/kK/JRhYsYxUczYsLAgm0jpfE
 RPyDj3hREgh7rNxorWOmHfwBBw==
X-Google-Smtp-Source: ABdhPJwBUhNH2pdXz59bRbJMQTrky/1rDrc6jNBkgFSBU8zEusHauX5E3Xb78MwwaahHWajlxckHVg==
X-Received: by 2002:a05:6a00:1da3:b0:4e1:68a4:3f1f with SMTP id
 z35-20020a056a001da300b004e168a43f1fmr40255694pfw.64.1646343670764; 
 Thu, 03 Mar 2022 13:41:10 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056a00245100b004c283dcbbccsm3644231pfj.176.2022.03.03.13.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:41:10 -0800 (PST)
Message-ID: <0a02de8d-218c-0064-8b63-873762a7a717@linaro.org>
Date: Thu, 3 Mar 2022 11:41:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] hw/intc/arm_gicv3_its: Add trace events for table
 reads and writes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/3/22 10:23, Peter Maydell wrote:
> For debugging guest use of the ITS, it can be helpful to trace
> when the ITS reads and writes the in-memory tables.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 37 +++++++++++++++++++++++++++++++------
>   hw/intc/trace-events    |  9 +++++++++
>   2 files changed, 40 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

