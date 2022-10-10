Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BC5FA17F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:59:28 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvBf-0006K1-Nx
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohusd-0005Zz-Sz
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:39:47 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohusc-0000QW-9A
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:39:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gf8so10115628pjb.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g07p88oF1DcRN+h+PI+f6txZOSWtYFcbvRMB0xxUZIY=;
 b=o2YZaaFumvoD34tsnD5iVLKq5eQnstGON9F9pJA7JmlALz+DoFonOoXHHDqwDRTlRc
 Zg5MBhpoSaRQTcpRxAOEzrY7mxgtES9/2LEm1N/GpZdi0ZoF3m4LOHQ3TmUF6dfqZXMB
 6SX0rIFxnR1pqrLFoIs9OG24Xozk76Ft7sUQ18zI7BnJGUMFYNckrxm8sUFvUXar4itf
 8OSh1wzZRj0htNkeElYzq53brOcHghamS2H0rPzuO6LIep1Nfguo14LDWJplXIQjgwK9
 mPIePvj9oTvEkF969pfT8Nhb0YN5z1sKhWqKdWfteTWkBJWPGrjePiXvP3weg1MqnDtO
 DHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g07p88oF1DcRN+h+PI+f6txZOSWtYFcbvRMB0xxUZIY=;
 b=1A54z0KU+r2TI4sDeyIIx89nht7J8sv4/fQP2J0vyh7VXHqs1wl1dm88T5JV2266W0
 m4atose966eKJqRYveiEV3BlqMnUCqkIhJq6o9OoL+OGqFhHMXnG6gsjr+4bBbFBxYsX
 DqGOVeZfk9STXRmFci4RnPBw9ryaUbs7vzK345y/x3nUsGCmRE6vqoHLwdEKTkekNUIY
 dJnQMeFihiQ+INQDtrWpyrZxDV/nGtylqdAQm3fsR6VoCeuDXSL3bksS13BQ4Id+hQFD
 gM7lvjkowLjTJ9V5NeZeMQPKXSZFyEht0VmExdcI5PfQ8m2hMPSnxFyJc/M3Wdp9dyge
 VKjQ==
X-Gm-Message-State: ACrzQf0w4y6aKpVh7GiQCjU7V/Z6S1vyQX2XG7bJiMrnlt8bQiK7sbJ2
 mob557Q1KZv5TKqu0JENGqNzJw==
X-Google-Smtp-Source: AMsMyM4AN7RoMppbyUb2dNkgP0DSg9gjgfZZZa9XGCa95H+Gl0b9hPTfEgTizuuLbI+RWjJLOfZN4Q==
X-Received: by 2002:a17:90b:4b02:b0:20c:c3a8:38d with SMTP id
 lx2-20020a17090b4b0200b0020cc3a8038dmr13258837pjb.12.1665416383794; 
 Mon, 10 Oct 2022 08:39:43 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 w62-20020a17090a6bc400b00205fafa6768sm9461311pjj.6.2022.10.10.08.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 08:39:43 -0700 (PDT)
Message-ID: <0a7e1c87-fbf1-6fbf-b631-377d59c1ba86@linaro.org>
Date: Mon, 10 Oct 2022 08:39:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/3] linux-user: i386/signal: support XSAVE/XRSTOR for
 signal frame fpstate
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221010142127.295676-1-pbonzini@redhat.com>
 <20221010142127.295676-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010142127.295676-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 07:21, Paolo Bonzini wrote:
> Add support for saving/restoring extended save states when signals
> are delivered.  This allows using AVX, MPX or PKRU registers in
> signal handlers.  The patch follows the Linux ABI.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   linux-user/i386/signal.c     | 115 +++++++++++++++++++++++++++++------
>   target/i386/cpu.c            |   2 +-
>   target/i386/cpu.h            |   3 +
>   target/i386/tcg/fpu_helper.c |  64 +++++++++++--------
>   4 files changed, 138 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

