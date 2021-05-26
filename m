Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D639206F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:04:26 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llypN-0006s8-9x
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llynY-0004mV-Ie
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:02:34 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llynW-0000M7-5g
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:02:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id e15so1106996plh.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fnMhK2W6TGviFqWgW6pZVkGMWdw7PDOaPP2PEx0aQZo=;
 b=IlKzRMXjzXYlpOMWKVZZbAG+IJ2v3qHSRraWHioPmejIbTZPDWL40s1kDGxy7mAz9F
 xlbjf74mVd9b5Axi/ZPlCELoYIForZ7gpsNxzj9H5kxaNxPcyIe9vHuV6OYXXtIP10/x
 9kX11ogQcnZvDxCJhVSbtTY21ED2If6hsEn7LFvIK1qDsk7Fu+aWlEN3wxgM45bSUMW+
 LtgyXbYhcNNfvlh8OKBjnA6Ijv8ia1fqA8QLkEUWMN5y+w0FnhLlgvpdobwZbSGV88NR
 niMkSfKrVWQx0QuDUgHNfwYOPGzgVeknSVme0YlgaUFyugWByNv0+3WLBf4O3LB7LcC4
 t0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fnMhK2W6TGviFqWgW6pZVkGMWdw7PDOaPP2PEx0aQZo=;
 b=RauwnE6VH88GPta5FcOiZiU+sMZlkllaczCFmINRVz0IklIipIbu5h0V54KKIpwQqs
 c/sZojRYOq6wV2Qpumj49ReMvYy9Nh0YnUpL1h5xKyURL/xHIVrGJ7jH42Eo5++g5WuA
 HvA0ZTa+T3wC1Cv3tTOJrV1ww5NtfQatj5ujLYPSH7hrbAvlAJLmFhKGlibOxAQ4JCPR
 s0r15cftBihduypjz8GHfywBYdAD8KBGUrJsb3F0RbXvQAuD9pKVX2emnXsTe9wFJnfq
 qwpSeZmBsLQ9ejXV0EPLX1PbmwDCJlryoZCEfcZkqjfdEYeP74AnT6preQCN47s1wehZ
 GyUA==
X-Gm-Message-State: AOAM533xWQjQcn6PfLcOw3HkbIEt/njEHy7mCtbmstGRT5XO9TGngeIB
 G8N3RsgLRLKaKxKywbgVFBP5/Q==
X-Google-Smtp-Source: ABdhPJzdRezQmlhThmSw8/4Ky1U/0kRmW5lcc2nXjozhgiBeog4RcmpoRt+MJwuQ62AjxtI5fyfKxw==
X-Received: by 2002:a17:90b:30d8:: with SMTP id
 hi24mr37774998pjb.67.1622055746966; 
 Wed, 26 May 2021 12:02:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c17sm119968pgm.3.2021.05.26.12.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:02:26 -0700 (PDT)
Subject: Re: [RFC PATCH 12/15] sysemu/kvm: Make kvm_on_sigbus() /
 kvm_on_sigbus_vcpu() target agnostic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbb9b4a2-adca-70c4-5b53-14fe7e32335d@linaro.org>
Date: Wed, 26 May 2021 12:02:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> kvm_on_sigbus() and kvm_on_sigbus_vcpu() prototypes don't have
> to be target specific. Remove this limitation to be able to build
> softmmu/cpus.c once for all targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/kvm.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

