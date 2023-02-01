Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD087686F70
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:00:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJGK-0002Qo-H5; Wed, 01 Feb 2023 14:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJG1-0002Oc-K7
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:59:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJG0-00063k-0t
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:59:01 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 5so19591040plo.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOf7Hc0SmEF18G3J36RbFIgI+/cw0ocbXcxE2XDicYc=;
 b=JP4VlijsXVsLi6E7nx5KAwOt1WK1Jji8hejiaaLAqP91HGiI8zFnhF7mKLZVPCfTsJ
 vpWuYuINWLKwf3ubLBXt7Ps+fpdBql2NVf9ZZhRUvttQDBXmXvl3mQN3B5SlH2ckyJgI
 TAaMIPGH9h3EhaXY3cTof2dAiU9LLcCir8PfAuQK2gaUxLnLk1YWopKpC966T9TRrIQI
 Xh3DdwNQe7YF2eths+AdUKpbes3mcGiyYLFquy5YQ+NiuUz7+AGFJ6Mt08uindeQ9XvU
 wVkJTfiHU9KCK9mVkcEmG8ociDaA65JRauf1NQbA9plM3Q1Shrx1SQpj0Qeh5rDtvjr/
 1U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOf7Hc0SmEF18G3J36RbFIgI+/cw0ocbXcxE2XDicYc=;
 b=YopzjYskuqf6kdMmyQ7y2QbocCeD4gANF95deGL8+X4TVwtI/NPWre3WaSHAsKbvT+
 sEl+ytlfXJ8GKtK2KycUqGTRSP+9PXN9ObIwvqsEsz2PRw8uTklZY048BZ3rd4x4EhJI
 8in7SOHKKCRCursmJm8OOoO0nMl3QAUdeCNsl5MvgllGahq84LvIMcQSwl20dKYynHQA
 8qs5kJTXCnp3+U6GpgzwTwQwIZa/TsMbfI36ZzW/xTv6maGVFXtQJPYNvl05/nbgXY20
 b4EXXSRE3mK42fOYc6q+X4xXLUYNKjWEGzwVFMPf8ioBxCeYai6/CjpM04Ehp/k2++4S
 ghAA==
X-Gm-Message-State: AO0yUKXJNc58RC0TeZV3hEIexCZqnRQqHcDmpm4WfOn1w9/Ld8RhF976
 OdHeZ8GeXgoUjEh7a3V/KRL9Tw==
X-Google-Smtp-Source: AK7set8s0yYzgoDjA1/rJtV1q6oDooanZvOmnn4lqGUiQQVRtz6/WgYL53eInpOWQ7flcJZH5zDlEQ==
X-Received: by 2002:a17:903:18e:b0:196:2364:e908 with SMTP id
 z14-20020a170903018e00b001962364e908mr5605072plg.37.1675281537988; 
 Wed, 01 Feb 2023 11:58:57 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170902b68f00b0019678eb963fsm7363900pls.145.2023.02.01.11.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:58:57 -0800 (PST)
Message-ID: <6c0f02a8-2982-89dc-3470-889fbb04780f@linaro.org>
Date: Wed, 1 Feb 2023 09:58:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] cpus: Make {start,end}_exclusive() recursive
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230201004609.3005029-1-iii@linux.ibm.com>
 <20230201004609.3005029-2-iii@linux.ibm.com>
 <4db3d7ce4d835056e6ecc98f382174b06f80f7b3.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4db3d7ce4d835056e6ecc98f382174b06f80f7b3.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/1/23 03:07, Ilya Leoshkevich wrote:
> I can include this in v2, if the overall recursive lock approach is
> considered appropriate.

I think it's a good idea.  Certainly an improvement over removing the lock from the plugin 
code, like I tried.


r~

