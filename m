Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0B6A4ADC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:30:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjBr-00053C-Mr; Mon, 27 Feb 2023 14:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjBp-00052u-DE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:29:37 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjBn-0002po-MA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:29:36 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so7862034plf.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k9Bq40uYgJ0QIg50j3bOGlIX/9bqM4YinREPlCmZTyI=;
 b=Eo2mRyFpVvP6aZHMFN67OZKdRziNnx8MzCIA9IZByna8/6nAaCkl+S5cIqSFYbHck3
 sqaQKetzpSziDIxN+Bf3Cvh8TU366pjI/B8/wZBZE7O0Lj5vYF1gZ33cnzU5oxy/StwX
 OqB98PX4PFtDUIL+qYb50ZcOpHU2Mm2s9te9VLWUDclADvCMDm1lCDLwk18S3QjpwIer
 cFivsCtLZaOCurSUbLEOElEjgP6F/npltYn87jgtFV+MU95ue2AZFiDL0aQfMQqQwEmQ
 qIKOxsz0NV8V0Hvf/FX7EnkMM9/av43m4diAJ6tN3nn0SW+qPuZ1oOd6B3wOdhaqbrAe
 j43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k9Bq40uYgJ0QIg50j3bOGlIX/9bqM4YinREPlCmZTyI=;
 b=7q8uaaqYm0pQWZV41F/yV15QzTqFx4ebeySu6rfg2o2bCp1clEUQPKyd4on/vjOtBW
 sPgWtuUWE/W+Usud6sovYkcU2/YHKBhQ1anLaowthdRp2mheJtj7G9+J85bWWLxqTEpg
 vsFYnfK3iamSVNCvx8e1pQFXqhjHSMMcHhZjutuGnvSvV4EL5jPCZxP09cQZbIaadZ4H
 DmuRNySrCgx0CTOW/SX+1I8/mrx5JWmFfMpSg3lH1Lt5oo3obXAPmXirrSj+9mr3nQZh
 tnkRZOsZSww3reZCh/KQi2cnQYL1fTfHhzGObYPnF4Qs89mfJwQR9unLVIALQh93UlhT
 wvFQ==
X-Gm-Message-State: AO0yUKWwgz4u27wTgLru+CLxHne1/SkNKjJHb4dlspj0ACymYb1yZvj+
 2zLoHHdbKz+icVEll8YZuHmwyA==
X-Google-Smtp-Source: AK7set9eljVieyY0IhXmYS7lchamSgVrVQPvYieFU9PIqU8zxy6CddDBfkRqcqDTnI5XvLwhcUADdg==
X-Received: by 2002:a17:903:28c6:b0:19c:e842:5ec3 with SMTP id
 kv6-20020a17090328c600b0019ce8425ec3mr9502454plb.60.1677526172980; 
 Mon, 27 Feb 2023 11:29:32 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q19-20020a170902b11300b001963bc7bdb8sm4956876plr.274.2023.02.27.11.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:29:32 -0800 (PST)
Message-ID: <a3ce6675-b162-712d-3ce4-e8236fd6aab6@linaro.org>
Date: Mon, 27 Feb 2023 09:29:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/4] target/i386: add FSRM to TCG
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
 <20230227101332.636203-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227101332.636203-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 00:13, Paolo Bonzini wrote:
> Fast short REP MOVS can be added to TCG, since a trivial translation
> of string operation is a good option for short lengths.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

