Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697EB3484A7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:34:13 +0100 (CET)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPC4q-0006mT-G9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC1Q-00046h-Ha
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:30:41 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC1O-0007TB-5h
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:30:40 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso76719oti.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jkCodbVKQwrpAzv9XXNv9yihGXshGFKiz+Dcv3jbbI0=;
 b=AjbadpV0j1Ck97eqeS9HcB4sMPI8Nf9XttxFgF1jpkKxpdrTSF/2i2YkDsSo6t0uR7
 GkkqT4Y8vRYwghwQ1/LwmJU3FHn43k6wrEHQDiLmaoxunRXIJEhbjZunAisFSR3MNgF1
 KkVpMNa200G9SK4TWih8lNkWI+1V2km69GRQ1TD7uHjO72UNP24DpdHnWwSiD7Uwv88C
 LE43hXR2EdcsyzKl+xcxI5jR72h3MYEn8uLQYg1Paf04GgaRr+bGBqmcxNy31yJqm3Bt
 ik7Ur5cehVO3UMbuXNXTgxPS8iqBNNQsaece/bN2UtCVCRMwIqfLWXtfupm403DMIx1d
 pqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jkCodbVKQwrpAzv9XXNv9yihGXshGFKiz+Dcv3jbbI0=;
 b=XMQ5iEI2O2qO/QQY31ncVSN99uz+hUUvhKBg7SsrH9PQHkhEaKkbRRg1qXfKVlfrub
 f8HmkiM5ZQ7HzrvSWxL+C2cp3r/EcToiuoXCV9a2Ya5dOpJcPhuQaH7nWMz2nZEwpZlK
 dg3c+hpTTL2FqPynKsDgOZjVVQY6uBeX1nKOKv0RDbIx+49kLUbXjjjmVdAq0xVkRZKP
 mGUW2W/K87Ie8JXtFzdYENHu1vBhbMhF8D+ZIrhyolJSRdwzhb09i+15C3NbkDSxJ8z1
 6UPFDMHlVd0q6Zh1+fcCVlrPsJBg/sZiGysjm64ddTdp+UUD5TiyYusv9m8IdSGH/kW7
 iw7Q==
X-Gm-Message-State: AOAM533E0iEWCEE8zDuELvYe+fKFr+mIPvClpr/HX0fYxdQC9Htj+rdQ
 MxF4oBIWQHO6SM70H/esiijcLw==
X-Google-Smtp-Source: ABdhPJw+wtRK/gPpUyG6TwFe+eAyahiwh+dLaoU1364NFNTRL/wGcYs9/aNcyKe44IuWDzahgdPQ4Q==
X-Received: by 2002:a05:6830:11a:: with SMTP id
 i26mr4974688otp.91.1616625037102; 
 Wed, 24 Mar 2021 15:30:37 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o9sm841447otl.39.2021.03.24.15.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:30:36 -0700 (PDT)
Subject: Re: [RFC v11 31/55] target/arm: remove kvm include file for PSCI and
 arm-powerctl
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-24-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2bb8ee58-56a5-5139-4010-2dde870dc40a@linaro.org>
Date: Wed, 24 Mar 2021 16:30:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-24-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> The QEMU PSCI implementation is not used for KVM,
> we do not need the kvm constants header.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/arm-powerctl.h | 2 --
>   target/arm/psci.c         | 1 -
>   2 files changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

