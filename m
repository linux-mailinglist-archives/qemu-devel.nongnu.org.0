Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C945312C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:48:20 +0100 (CET)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwwk-00082A-LC
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwvw-0007Ns-5o
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:47:28 -0500
Received: from [2a00:1450:4864:20::431] (port=43657
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwvu-0002UB-FV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:47:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id t30so36913481wra.10
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cg+rz7daBnRDgIVgBC/GOdhyEAK566gN8Oq7EhD7NvQ=;
 b=k0VzUo3ZXlvmjvRdqvEMTnTM2Vd79T14+9eQAsXLeeHcO1RHhfwO6QxMmyfhMFJrLw
 x4H1sQbX9PPZl/yAaYuUFvNt6+Uh16/4veIgzCHBlZqHk5K/FXw3YpiYnuXNcE2J3Gc6
 IKVDOiEeLq+x7Wj8mIrIr2uM6bqqcpgwuC4vi5cvry3S1ZcJdsBu1TcJY2rQJ2IqHHTH
 BORvJ6uUIt2CL1uMwXTkyJCetWnYKBS5IFTPJ15c3+oLHVRN+e9Vfa7tL0e1//QqP2w9
 lzAGOqk9PAMMZ9X9ROAY12FDV4cRyc6QoBF0qnr4GP0f3iqINq1Y1q79wL4AFAEeJxhA
 +3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cg+rz7daBnRDgIVgBC/GOdhyEAK566gN8Oq7EhD7NvQ=;
 b=6x4k1YDB6krqtOuQJMY0lBW1Da5m/KLiYSv54to2iBsK/F5bWthU9fWWzwbZPa3ZbR
 Hkr1LshZAwIzMnbBE9q9leR5sm1bVMRglM0Yv9QiPcLeyo3AJebXMG1VT6y9yhvwLcIj
 NYUzbuax/5/aHNlRJfjE2SPdvtFUwAsfE7GQrxgTkHoV9nD3SyChdoGTakej/ra+jatD
 i9PfgBAnwve1n/nVZoNCmWuzmzpUsi/77PokbDKSc3EfT8Q58k9M3czHCF97VZB9VQOi
 bSMa40M931Y27LHORsh3UYp8HHsIHHua05wvsgK93fQ4SIzb6jkouK7ZU2TfDfrKyqMB
 xTBQ==
X-Gm-Message-State: AOAM533Kn5eif0iNyJcgqWiOie+cX4dmnNyCCVqA21FvHfL485rOFC6w
 SEK06Xuw24yNKd5J6qZQNQwNKg==
X-Google-Smtp-Source: ABdhPJzN8FCK7jx9U8AOctQhb1c9P75DiZ1LYmbmJ0w6gP7k0vvkfYHkbGQqjGT5AU0Ud/beYjCvIQ==
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr8762939wrs.374.1637063244559; 
 Tue, 16 Nov 2021 03:47:24 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id l21sm8026460wrb.38.2021.11.16.03.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:47:24 -0800 (PST)
Subject: Re: [PATCH] gitlab: skip cirrus jobs on master and stable branches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211116112757.1909176-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab0d6cd2-27e4-43cc-10d8-6226ebcc3643@linaro.org>
Date: Tue, 16 Nov 2021 12:47:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116112757.1909176-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 12:27 PM, Daniel P. Berrangé wrote:
> On the primary QEMU repository we want the CI jobs to run on the staging
> branch as a gating CI test.
> 
> Cirrus CI has very limited job concurrency, so if there are too many
> jobs triggered they'll queue up and hit the GitLab CI job timeout before
> they complete on Cirrus.
> 
> If we let Cirrus jobs run again on the master branch immediately after
> merging from staging, that just increases the chances jobs will get
> queued and subsequently timeout.
> 
> The same applies for merges to the stable branches.
> 
> User forks meanwhile should be allowed to run Cirrus CI jobs freely.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

