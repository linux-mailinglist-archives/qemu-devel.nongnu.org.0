Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9F3A1DB0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:27:15 +0200 (CEST)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3r7-0001jU-PT
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3qK-0000bW-Ke
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:26:24 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3qJ-00024W-2P
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:26:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso2137947pjb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Q1/AQpsyRJPnyhH8C7GnW3xI1HgxCrSvxnQd0R95bdw=;
 b=jpjg6gY02EO1IF3hhkFvsFwe060MpIrkqI/KR+3SEfjEnxE8N2OtrWN52NHEE5UlbO
 j2tWoNlQqTBeRvhUG1+1usimQOFPsu2WI6eUpSTSi/TWfYFhBYHF3ihE3gFvuyod1d9F
 ojTPjwBKBhtW9ekrLFRrsfhVfn7FrfOAgLP76DaPcGcu3lkWGpnRwX4ZsxdEHa20lwZj
 Y3X/PR1/7oYBgqfzrwl53s8s4WG7zEPm7L4wsXURceeP/cyDWjwAdTYvo98/sbITjl+E
 xB/cMVuuAhm+KMvhoyQqGtIXltecJkDb1/zcILG74+zzi3SeqEXNZBgIDGm09xv4KgBT
 QVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1/AQpsyRJPnyhH8C7GnW3xI1HgxCrSvxnQd0R95bdw=;
 b=B5ya42Kjg05WWlW4fP/wUb/HHmX/rDKMFKI16HoXX+eIliftKRad+zLt3oAgyMHJ85
 hK6P4Th41axB6hNDmss29n/As0wdkDjMqbtV67b1xEUzbz2gWkGTZF8qryCG7aT8mqNR
 oCd4U6nzRz5U4TqHXc1xUZ4OT9oQGFMAGPuRzFWd5XnF1NkQShh6lLCVyJ6syE+pVTKw
 fBfXjMYRGsYI0n++32q+O0PvjSC06QbL+xZxH24+NwVpw1rgHkKSVgvzdQxqkBBcAIAp
 IMHRzNSVXG2OHPG0NlV/C3eEODoqIM5By1mYL6dO01IgFiiWiWoA/feoZxZg/gJVIz5N
 QWmg==
X-Gm-Message-State: AOAM530dmvGyGWLa6IEd4IOEwyInM9og3pdKRwXYcOrvefZ2Lcio2WAV
 8AwsJzDk0Zc/4mXcgWTWkvwsuA3SeSU6qA==
X-Google-Smtp-Source: ABdhPJwSTTP2cQN2v56R53XQpnbAgXkCnzORpJifJZRcBxHWgROGpuikgLHNrUwlwb/RF3EtC3bqyA==
X-Received: by 2002:a17:90a:1c02:: with SMTP id
 s2mr1137788pjs.172.1623266781185; 
 Wed, 09 Jun 2021 12:26:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p13sm323444pfn.171.2021.06.09.12.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:26:20 -0700 (PDT)
Subject: Re: [PATCH 43/55] target/arm: Implement MVE VQSHL (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5aaa6d24-2b1f-0cc9-5bde-cf0fe73cc55b@linaro.org>
Date: Wed, 9 Jun 2021 12:26:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VQSHL insn (encoding T4, which is the
> vector-shift-by-vector version).
> 
> The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
> the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.

Ah, from before the sve2 merge, and associated cleanup.
There are now helper functions in vec_internal.h for this.

The decode looks fine.


r~

