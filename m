Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77A666830
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 02:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlax-0007zU-HQ; Wed, 11 Jan 2023 19:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlau-0007zB-Rh
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:24 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlat-0001tP-Ch
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:24 -0500
Received: by mail-pg1-x52f.google.com with SMTP id q9so11709137pgq.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iVEXVYcxWSmfzQFKJMyL7E3iSBukQo8tVDxCxAnpVc8=;
 b=HlQ/I4b/LYx+x0RxAC3k2us1AmMmYXibzwqJXnao+6i8PxVQ/6qaYdu5Sg1lo1BMUO
 FrS8z1WTIOeC/KyA+ZvxL/V+04C77b5Yq9X7EKFqEfTnGfP6kRMaSNpkHVZxlLJrT9s3
 dgjfI1mj6z7JhAi2xGInylFf50MiWLkzu3qDy5tuRxV1OsVU2s2DOmO+Xi4CBkWZLstX
 vXOg5RMBzrR4kQT93eCL3wT1AQKVgntxt/7OseAGAcLqKFBBiEYuKNspZu8DVhAo5oXL
 zcN/d8nRcniJUbPNY5tmpzOZmTJd6vBW4PJE4Yd+V7TEIbwjMqCKpG7uD9OmRIXTrjHR
 g2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iVEXVYcxWSmfzQFKJMyL7E3iSBukQo8tVDxCxAnpVc8=;
 b=Bi0d6p1Vo7L2A5gHgmEEq0s5lhpEV3IW7y3tKVRTweEnkFmO2dYd4lOPIz8DYwvv1C
 IDU3DSIhvC4b6Zr7ysXfRD8jQKYomaPiUdba/DZz019B1hRREmtqUFbN9bUlReOlArjD
 keVIy9BGPurYUUYynJ4elnRArtl2exC22wn39pAdn6XFiW7a2V4I6H1UPJML2SDunCKX
 U2zHVqd+wnUAPQeLrBKgTAEWAwaYpPdQkMQ8BZtHDSfKRHqLJtte8x9CfcNAtEbHb308
 VGSGJEss8pfkoq56ewTnXIO1S7lQu6ndtHLEoxLtKiOdneAiCZEHTd4O4lQv+MPyQK4B
 ywfw==
X-Gm-Message-State: AFqh2koEJwcGNoYY4HmFbEDD10SYY5z4CQPAwGV4TLGjX6QsyWlSry20
 9x965+Ooekvdpf0YHvBY25Q4LQ==
X-Google-Smtp-Source: AMrXdXs1dUS3C4mibaOpvIvbXuieXxRu9Rw1dJN1t+IsKE9wOq+19pHt9SUExFBQCB7ON0Mj8HHlGQ==
X-Received: by 2002:aa7:9208:0:b0:582:fba:319f with SMTP id
 8-20020aa79208000000b005820fba319fmr3637626pfo.27.1673483841797; 
 Wed, 11 Jan 2023 16:37:21 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 w65-20020a623044000000b0056c349f5c70sm10573837pfw.79.2023.01.11.16.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:21 -0800 (PST)
Message-ID: <8aa8719d-6848-3059-1156-c86cf1dbdd3b@linaro.org>
Date: Wed, 11 Jan 2023 10:07:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/3] linux-user: Clean up when exiting due to a signal
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230111014705.2275040-1-iii@linux.ibm.com>
 <20230111014705.2275040-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111014705.2275040-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 17:47, Ilya Leoshkevich wrote:
> When exiting due to an exit() syscall, qemu-user calls
> preexit_cleanup(), but this is currently not the case when exiting due
> to a signal. This leads to various buffers not being flushed (e.g.,
> for gprof, for gcov, and for the upcoming perf support).
> 
> Add the missing call.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/signal.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

