Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE065E4F8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIPD-0004DK-JE; Thu, 05 Jan 2023 00:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIOy-0004C6-4h
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:02:54 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIOv-0003ct-DB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:02:51 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so924750pjj.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IsMrjT5bgFE+wb1Flp77K91WZQSGvYHNLILbRrYHTZI=;
 b=wL5t9ImT4MQyqTflldZoCPNZfe0ZIxWK8bUoNH9a2FAXGLjXFs4Lts68dha7ooxwaX
 sTdjRQY+9F9m6ZvWMxIDe6OiM3U7OXXAlLSq2B/e/n2vo6b65EOZFqUNnqUU6Dr3OG6H
 +9isx/XTSd2aANPpEHIoMP2kiLAe97POEioQKTeeA60Dil20jBNSLvRduNvS3W5lvIH0
 MH/vNDX5WSeG313hvk0FOWQ1xwhKNerHi0xv9rO5yY94OyeiWzuQWr0Qp/mZgM6HrzrD
 62SP9+MVJxbVV8Mch3ajkS1lyTydpYCF0eEgXZi8CQ9yenDp78A2ynPKxPGoH7qeWFOr
 SeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IsMrjT5bgFE+wb1Flp77K91WZQSGvYHNLILbRrYHTZI=;
 b=x0LTSKeDZqTWswlQASCDOppgXQ4s9vuMROdT373jSMnw9qNJ484PGfHkXwaS+H49eK
 /w3Z1IOixDZPY8esBV0zsxAfNop6jiWIay8IOCqfLFyanuCESZfa7+2jtIbfOMhc/X7A
 NCfQ8LKBsG6QpsuIjex7/M5cerkE0bLMrJJVLT9nOIgwZ46gf8iGBP3+iMIMmAPG1a87
 O0HCd2nqrbFH1zRzADrRw9asYOKEx0xI/jX0/fZfUO05UQEtRHCuo3S3ekXOpfPCritR
 WfuA+sonsMLq/59C1x/4bpwVmXTy+xZhWRfO4dMTYQ5VL+yVfhJdQE0QVEosbUTgPKHh
 8MMw==
X-Gm-Message-State: AFqh2kqR4JuFUix79f+DpJt8ny3vQeRp/HGczYdMW8HljY9hD8vezSHh
 gaJ/msfMva+s4QLAKbnVNaJ4DQ==
X-Google-Smtp-Source: AMrXdXumhqdaEvpew9UiRTMGbUFwHKkJX2QBRAlbEeguQL2M3VMwc2V5Jpp4E7p0VT3cn6x5Jj4rkw==
X-Received: by 2002:a05:6a20:c991:b0:b4:6f9:ef7d with SMTP id
 gy17-20020a056a20c99100b000b406f9ef7dmr26968566pzb.35.1672894966779; 
 Wed, 04 Jan 2023 21:02:46 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a1709029a8100b001925c3ec34esm24280697plp.196.2023.01.04.21.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:02:45 -0800 (PST)
Message-ID: <079601b5-1c91-9b85-ff75-91d0abb93ef8@linaro.org>
Date: Wed, 4 Jan 2023 21:02:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 21/27] target/arm: make further preparation for the
 exception code to move
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-22-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-22-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 13:58, Fabiano Rosas wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> the exception code needs some adjustment before being exposed to
> KVM-only builds. We need to call arm_rebuild_hflags only when TCG is
> enabled, or we will error out.
> 
> The direct call to helper_rebuild_hflags_a64(env, new_el) will not
> be possible when extracting out to common code,
> it seems safe to replace it with a call to arm_rebuild_hflags, since
> the write to pstate is already done.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/helper.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

