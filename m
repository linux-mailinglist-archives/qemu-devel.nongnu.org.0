Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983F6D5042
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:26:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOsA-0007k1-8I; Mon, 03 Apr 2023 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjOs4-0007j5-So
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:25:36 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjOs2-0007eg-3e
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:25:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so33539356pjt.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680546332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oo1gXdLrfw+B2C28ncRq3vUfFHL5Qngowf+/7hAn400=;
 b=qlEOiVyeERU4onliXN9I06HFZHTrpf7ZS2aCI1gtYvn5XRFfvL6ElF5yBriIiP7AmN
 TOO7iui7V9aBk3jKoW6ZQh+t/oO4WdTSg0+27hrNPztmN9ByqmUgr9pJDVWtmUbfysgu
 sX7yMTvj7RGFlQTSMhVn91GgAxEsJ3vZsxieegqDRbe2DnnjCNdK9o7dKstrBJEN1BYj
 47okvzOnb7OF5odNFgh10lakMc7xKdw3tUvqvlTnFeQXRuuPIlTSCD3tw8sKOus0ByXV
 Yl3jo/VIli/0JH37jZKd4/Tl/vuBHrTIMcr8/67jr38MCwBpE3+/5pIY4wTLLFTnZl4s
 nXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680546332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oo1gXdLrfw+B2C28ncRq3vUfFHL5Qngowf+/7hAn400=;
 b=nGmJH8bbmzcfmVwuTpQh2rv44ktFtOl3NQCO12j/zSla9tLqNLlhn6JapxfE0H0aVD
 fRLJ9zCAlCPzQQTLsPCt8QX5EzY/7NLFDnUpmpGLIYDZd2CL1U0cT6qjvk8Rrzy9Mn5p
 nED95HE1pD8dSkAqCJGmZwaYiC1MUP0frrmn5lkqNufNPbgprLvP4yv0y0Ug4QdXVX1+
 hAjF1AspZnE/KHFYWHXPcRdkHO3RCPaEEqBHglGG74P+fgYp2BaaoLJ2XIpEMkjYDHE9
 gvHiiFvYpIUqaz6NMjugMjDP66i7UOzzooaOYCWJ0L16ea8xURUwAQokONFCejNDqH+4
 uLxA==
X-Gm-Message-State: AAQBX9fF+7sgmyNeOqHYBpv1bhbwtEtOHekR0N11odNifgmHdSKz7hIH
 +1aqdDJcUzDZl889V/wu1s2SqQ==
X-Google-Smtp-Source: AKy350ZG1PTvp4l4HQAh7HcStUwBy35Tn0ToHqcG7v735E0s93mUK0CZLk/Dqklzxg17RlrTJBBR1Q==
X-Received: by 2002:a17:90b:4d83:b0:23f:9a73:c20b with SMTP id
 oj3-20020a17090b4d8300b0023f9a73c20bmr40937033pjb.18.1680546332572; 
 Mon, 03 Apr 2023 11:25:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a17090a800900b00233db0db3dfsm10171967pjn.7.2023.04.03.11.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:25:32 -0700 (PDT)
Message-ID: <e4872ab3-4cbc-6312-6b43-e61d535b8bc5@linaro.org>
Date: Mon, 3 Apr 2023 11:25:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 02/10] softmmu: Don't use 'singlestep' global in QMP
 and HMP commands
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 07:46, Peter Maydell wrote:
> The HMP 'singlestep' command, the QMP 'query-status' command and the
> HMP 'info status' command (which is just wrapping the QMP command
> implementation) look at the 'singlestep' global variable. Make them
> access the new TCG accelerator 'one-insn-per-tb' property instead.
> 
> This leaves the HMP and QMP command/field names and output strings
> unchanged; we will clean that up later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   softmmu/runstate-hmp-cmds.c | 18 ++++++++++++++++--
>   softmmu/runstate.c          | 10 +++++++++-
>   2 files changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

