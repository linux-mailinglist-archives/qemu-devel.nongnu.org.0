Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7C5A1DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 02:48:08 +0200 (CEST)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRNW3-0003q6-LN
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 20:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNT1-0002BY-83
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:44:59 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNSz-0008TN-NE
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:44:58 -0400
Received: by mail-pf1-x430.google.com with SMTP id 199so63150pfz.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 17:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=rwpLr4lYs5T2dIjCNoY+U3L39TNUs7NB4hYOof1SWPk=;
 b=UVVubYHVtu2gRiL6B3biTT64CW1pi0/4XEufcOVjLVAHdxLaJmOrfqwldeIltJvwMR
 tJaNy0j5eQOgOrC5GCvw3Mq7LkLngCSxv3kiNC5Xvc3BlenVHiCuxe8JIKRfh6iD8onZ
 rw0/Q/vXp6oY3kIJkSm59WqWNQi3PBmyQJ7LAH655egKxu5KXiglH7JvCYQifG+1ea4N
 Ct+KXH/pu8A8poprsuKqbKQy+ikKaQTipl01UjOjehW11wq+o/IaLIumE1vOPOb8a3YP
 9isNqS8rw7NLlZyNGQiD5KZMGUlcS/uecJHVCVZ6KMTwIE0ibrVFo+RHDdEuGorzC0oW
 pxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rwpLr4lYs5T2dIjCNoY+U3L39TNUs7NB4hYOof1SWPk=;
 b=r9z/nnRChvhV5ugLr77YNepLDEPuCa0YPWK3+oFY0uHn64wVu+ckMry00Jilwrb/Wx
 Xe4151cdueoxO5zWvsKmtqWHmR0Q53IF67BZLlJh5CmxyvNHslcw2nG1QBEhJEjdvJUO
 +D3LnXW1fhCJb4a4z+MeHUSTKAI7toXAHju3tt8k7/3nIgyL88s2bNBGGxxBWE1cPtX4
 yUPqJo1FqKBfvQeGFsOr3or5TPwgTAnjHHHCQqlw1F0HpfqJ4Ma88j8VvxJp0CxZb3bM
 9HmLRZ605qh9eCS1Ewj/lGMObo4N54OAGzwJsgW2NttagUzA2UT3Q8fNDKErDWaF99u4
 tq4w==
X-Gm-Message-State: ACgBeo0A2xHR8AWQ7lZjqtlosiyKzxcsXeipY+nucDSNVh/xcqzzJylK
 MDo0sq2YpvVABxQb97Sr1Fq4gw==
X-Google-Smtp-Source: AA6agR5IVVLI14JqW25iV1C/XQukikNLcQFUOb8AyQk2rvd0zzZOBvEyIPOctzfW+NFQRdqebda+Zg==
X-Received: by 2002:a05:6a00:170c:b0:537:27b4:ebfe with SMTP id
 h12-20020a056a00170c00b0053727b4ebfemr1450611pfc.19.1661474696210; 
 Thu, 25 Aug 2022 17:44:56 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 pt7-20020a17090b3d0700b001f3162e4e55sm331147pjb.35.2022.08.25.17.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 17:44:55 -0700 (PDT)
Message-ID: <ee600a5a-bad8-9b43-6da4-fff58dcc274a@linaro.org>
Date: Thu, 25 Aug 2022 17:44:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/18] i386: Floating point arithmetic helper AVX prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-12-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-12-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Prepare the "easy" floating point vector helpers for AVX
> 
> No functional changes to existing helpers.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-16-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 138 ++++++++++++++++++++++++++++--------------
>   1 file changed, 92 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

