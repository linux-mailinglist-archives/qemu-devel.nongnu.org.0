Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C8497724
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 03:07:33 +0100 (CET)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBolY-0001Q4-ET
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 21:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBokE-0000fe-9z
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 21:06:10 -0500
Received: from [2607:f8b0:4864:20::42a] (port=39621
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBok8-0007Y2-Ol
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 21:06:09 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a8so9067173pfa.6
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 18:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r/as/pInPrezYkuVkYN+TQBMrMFKt/ah4LJ7RdU35Jc=;
 b=F9tMuHtSda0AGV/uu/2M2hdt9wd4G3pl3r1YXu9AJ+e6SfuzGfM9YcIFeeVdGvtZJU
 J1QbyKUc/3FbTD50OctLDj9kI2UlpS3sGVNYAw6jeO5IWw+1qm3l/NwQX5pVu5h2kU71
 ihJkRhbQRnmGKskn5/4v+IAm3jYJWkJiCXc2uZZbJIk3IE4kRWZZjcI823lK2hvFIfNE
 tNvSHgLndsGiIMZujcFtDK38kGQYBcZaIMHEuJFZj6uNzL2nKB3txhugE1+lRm8V5zpu
 v2Mewjvlwm5SMXVaWpBVPycsSlYbvQsDsQ5hla0LeYb4uTTmmrQGtXgvzxeHt8P677tb
 UzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r/as/pInPrezYkuVkYN+TQBMrMFKt/ah4LJ7RdU35Jc=;
 b=06YU7GwGjYtbnXDrJSOxYIEHh8O4yJ5CxwA+n03D97SzQN3cRUkZ5XxbdI8DHWCr3K
 n1G4dKE/9LwlgEBL1oHM1y3WCBcTRTcvLHaAm9Q249FjVmjXS8ws4qlwjeyq94bUP5Lv
 7OsIayyaEIvDWQ3e7eBYeAoq0o7kH22q1sKDSc6ejU3K8E21g/512A+jXExlGrcxPCTZ
 w2kbxe/yyjjwT2hVRcF3wH5TrPjZDAn3eEuGnTKfsONiQBhbmPT1N4KbvYN0Wh0lsmU5
 iPfCUc0HX3yIaCRa4hjgiaUPGElCZxuQsXbJid8mKGvAfUVa8CtCJPgJ0pM6lmttwk+k
 MiVQ==
X-Gm-Message-State: AOAM532+DLfU3no03BxqHwKxFo30H1pT+bOePFT6IIIbMHkFPeCyfujU
 excqf3q5rHKWCzh0a0DeTU4pLw==
X-Google-Smtp-Source: ABdhPJx+iod1MuqUgLYAtZLXCPWdEN6D1/sbSgQ4fKqbrBJxEmwhKpY9mTRn6yedm8k/Atp1wUctiQ==
X-Received: by 2002:a05:6a00:181a:b0:4c1:3c75:9c54 with SMTP id
 y26-20020a056a00181a00b004c13c759c54mr12325001pfa.6.1642989957209; 
 Sun, 23 Jan 2022 18:05:57 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id mi11sm1826769pjb.37.2022.01.23.18.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 18:05:56 -0800 (PST)
Subject: Re: [PATCH 16/30] bsd-user/signal.c: host_to_target_siginfo_noswap
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <594f2f8a-4cef-0bd1-f4ce-129d30dac311@linaro.org>
Date: Mon, 24 Jan 2022 13:05:52 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-17-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> +static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
> +        const siginfo_t *info)
> +{
> +    int sig, code;
> +
> +    sig = host_to_target_signal(info->si_signo);

You now have a target signo, so...

> +    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS == sig ||
> +            SIGTRAP == sig) {

... you need TARGET_SIGFOO in the comparision.

Though, really, I think the categorization that Peter suggested is a better way to 
structure this.


r~

