Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C524171B8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:23:22 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkEb-0005Cj-Vr
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsX-00075R-Lo
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:34 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:36520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsW-0003RK-4Y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:33 -0400
Received: by mail-qv1-xf29.google.com with SMTP id jo30so6083976qvb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=glfEEYAW2sQ6zZXMnjg3hGz9ux13iCLYosoeuuHBf0E=;
 b=GcWB3x6v0cwf/4A9U0xbEc5RMS/kPzaTo3Y/NV7IEAMTajzKoR2ulYACgBZqTpTy3u
 lk5zB1JMJlgvUVBdbToufVefbTQgAOpJv+sBTpehBKw71K04E6rC+ByBFOa2UdSNd8SH
 Nf3UBt1/5nAvuWMMHtx8gebHpyhd7VStFomQPjy80c8nHRhbulIQAc+F9CM1ghHSJfWv
 DXeq5Dv9+TieJhQoPskCddtHQtuCuQLZs3yp6UzTVKZd8m0Hi9ARuXUzyH9Oojn6XYHF
 1Ylsn2FT8+bieAVsWafgXH5Eft9hGY1lyJAPHMKJ24VvtxsWSt2JO50X9D2fDSG7esH/
 IDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=glfEEYAW2sQ6zZXMnjg3hGz9ux13iCLYosoeuuHBf0E=;
 b=nGIawVJNKLNjVUJMXVK6fp0ajL02lf8YzEchVgPJL/nDIxIMU9VtN/B7fsml8TB+oL
 J1NGUp1ENY4jbdhHRzZM75xQ7OKYIflSTLY8zXSQe4tLMuqLTzO10yYtccqu0mT0dkoB
 EzGxdFXQDOGIwE1lY5dVD5u7YAsgC45wRt/TY9tYINp62DKVwFH9sNN6xCCkMXgfS8Ft
 VUSj02cw8Qzq24cZZ9DATUqoankKpStO243tIi8MXcLe8Lc5RvKNfJhHVyGY82zy/pLM
 iaWzq2YbzkVSu0bn50OtVfvCSn9QciFoM1UTYpzBCZEbyi4AuufLxuPqlEO30ufx82Pz
 sYqw==
X-Gm-Message-State: AOAM5302HtqHIPoIQvRtaLIMYNZG0do0A+bkdDhqQLqviLQGjIo0Nlta
 CsXCx5YXrDyD13VY0/WMBrfUuGiFWkkSHQ==
X-Google-Smtp-Source: ABdhPJwsOolovejiFv9MjC9ncfqo1unRAuRBmyGixpzVf1mi3sqwI+6SqCh2i2qxIYwoKtaD8gW03g==
X-Received: by 2002:a05:6214:490:: with SMTP id
 ay16mr9641833qvb.25.1632484831254; 
 Fri, 24 Sep 2021 05:00:31 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id k15sm5262773qtp.82.2021.09.24.05.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:30 -0700 (PDT)
Subject: Re: [PATCH 12/14] bsd-user/sysarch: Provide a per-arch framework for
 sysarch syscall
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2f814a5-bb49-7a24-49a3-b78b1715a2fb@linaro.org>
Date: Thu, 23 Sep 2021 11:08:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> +/* sysarch() is architecture dependent. */
> +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
> +{
> +
> +    return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);
> +}

Extra newline.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

