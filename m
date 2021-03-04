Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA332DB39
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:33:31 +0100 (CET)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuf4-0007J6-Up
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuYa-00024d-JX
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:26:49 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuYX-0001HB-TI
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:26:48 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o38so19639807pgm.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dadidNNwg6C4uwntvqv8rWVDz4L5aFgOmUZdv8nJOQs=;
 b=U6Dkm4WOSeON8E0+ZvwvUjVWuGhWG5IRbveKawkgNLAfNdzm+YZvt2Re9HuDdVn+6a
 Y2eyqZPDwNepY1YN2ujynlIeQNunLa1mFigG/bvLf56E0uD1/6beClmGHZndSQo9hKzU
 FrOdqcm3IG29tDZwZkD2hX7klhXsCyb7HOnTjlV22PjwxuTVs0RCcKrKK6K8ruP18gFk
 4oU+FVdEGOENh5NNV2QVVriH9rlx71Wzr4x6k2UKFGS4tt4XlovIFYyNGOIZUYXcRuIz
 OMMrNMZsFTXYLJpBxGS5vpaVqQmaUShR3uCc8//pejYSuz9O4JcNM42i5CkU1Bu7Wr9X
 PaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dadidNNwg6C4uwntvqv8rWVDz4L5aFgOmUZdv8nJOQs=;
 b=BZVNanq2byU8BnjoGag0BUl/8KptoZmKbX8CztRWtlD/zrwZ+fmqsZDLG7c6VBl+jj
 ao+q/oFyn1WNHP+MhrASPNngX3FupKwB49WwsTv2/ekVCVrc72i49PRoIlqDd3LBmK5u
 aqXiPOWNAlf6SK2efE+wYKmtcwPEOk2OeURtgBJtQmGfDDn3/r7L8t6fSqMF604z+w4c
 pKaPZqp+BPDXaKJztb7Pxl7APj5FMJ/E2zDkLxXDDxw7Iq+ZIckiWLMOkZ2i0TpukH5H
 0M8gBGAGpu7P0QPI+/oltEqouSJD4yQJCGNgnDbkZgzUX8zZl2irhJ3z/ZL3YyYwWxgU
 c9Tg==
X-Gm-Message-State: AOAM533mixGqXMR6E84Lu5/knGKZjLbEn8mPwCAAP//0JLmRSfsF+D0S
 Xq3rXHpgzsns2sUIJtuIQReBKoZnLpLRrw==
X-Google-Smtp-Source: ABdhPJxx8qPcDfPeb8EgkKuW8PSWo6Z4JT5nfc0xZB4IKD70KhXpeVI6M4hm/q2f9thlHpJaVpq76Q==
X-Received: by 2002:a62:2acf:0:b029:1ed:5dbb:717a with SMTP id
 q198-20020a622acf0000b02901ed5dbb717amr5239950pfq.39.1614889604400; 
 Thu, 04 Mar 2021 12:26:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y202sm224201pfb.153.2021.03.04.12.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:26:43 -0800 (PST)
Subject: Re: [PATCH 31/44] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64d49b5e-3c0d-cc56-a498-a346c7766851@linaro.org>
Date: Thu, 4 Mar 2021 12:26:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The SSE-300 has a slightly different set of shared-per-CPU interrupts,
> allow the irq_is_common[] array to be different per SSE variant.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

