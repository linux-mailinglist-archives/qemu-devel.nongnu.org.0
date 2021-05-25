Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D8390CD7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:13:52 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgFD-0001Ja-VU
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgCq-00080t-K1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:11:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgCp-0003kb-0S
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:11:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so14061087pjb.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S/6uV0+ZUfkmo9f6fuXztkA2gQ7iaWksahuYwXZhCpY=;
 b=lyE3hOjOzbU7pHBaQfyzyawG4nKRkcBK1ZOuktjgOUEgMcu9F2l1s8HO5VM3n8cA5F
 9nLNbJWi3JDSoPxKK67xQdII7S+q4Mm6qywez3OLOqHwoSRgSwz4QDHwMV3Ce4rZ4o1i
 mNKlNYJxMcC/MtUxxpRGbMHV5TjG1RMlE9cbEkvMpf5I7XTJ6UMp6ivqDyUcNEh5POOW
 NEKCSVzQNxOQHuI42tXFI9QdatMqF57QnZvIfpMFNSXi5JZdMZEOCSioDU3d8r0isQXP
 B5mGHqixpFEd5u/5Bn1MlKnx3FfUAsB79M44RFCOmx5BDrcn0URAGJViL9ug1wI9B2it
 ygKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S/6uV0+ZUfkmo9f6fuXztkA2gQ7iaWksahuYwXZhCpY=;
 b=eKTh9vsjGD92ip53MjauM5ufibpQIy1YCWseb5CH0+ygNhCFRMHtLnyzkNYsleKJvp
 WOlQOBONmDEVHlo06tF34EPuEinz2EevU1Eyt3GMAr+zMDMsW7nLPImUsHVGTYmfYwEZ
 WcYKYkvxXzTZN9aCRx08tJMtyWEWbeDBTyqLe44rHem6lNsHlVq8Qc5V7S/4WEK1In1y
 2HNNcYeCJxJg2F97MInhHBN0H2ehBfjgKvNopUf4FVpRGJQAXxcdvN6jLDFLKUaqLpMD
 jN5moUlaVynT9xisgCYUPimKRvqtgNI/03d/T3/Ik0tWAWzoFr7B6ytNC6BC/kEckAxd
 Ju6w==
X-Gm-Message-State: AOAM533sQCdN5TOVzM9qTBL7912wk3b4ywvborDs3uB9CaIQatIhzuw4
 sF2BCb27DfNM9kpLLbpKi2Pymg==
X-Google-Smtp-Source: ABdhPJz8EZFEM7xmWeY24euZk3sufgy7HYA+HT+14MW5si9RpIZaOqMCgzQ766XJe8CoVaWflpWpFQ==
X-Received: by 2002:a17:90a:cc05:: with SMTP id
 b5mr33329739pju.6.1621984281501; 
 Tue, 25 May 2021 16:11:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 205sm14321103pfc.201.2021.05.25.16.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 16:11:21 -0700 (PDT)
Subject: Re: [PATCH] replay: fix watchpoint processing for reverse debugging
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162072430303.827403.7379783546934958566.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9dcfaaf0-e88a-f15f-a587-2024bf942b69@linaro.org>
Date: Tue, 25 May 2021 16:11:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162072430303.827403.7379783546934958566.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 2:11 AM, Pavel Dovgalyuk wrote:
> This patch enables reverse debugging with watchpoints.
> Reverse continue scans the execution to find the breakpoints
> and watchpoints that should fire. It uses helper function
> replay_breakpoint() for that. But this function needs to access
> icount, which can't be correct in the middle of TB.
> Therefore, in case of watchpoint, we have to retranslate the block
> to allow this access.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   softmmu/physmem.c |   10 ++++++++++
>   1 file changed, 10 insertions(+)

Queued to tcg-next, thanks.


r~

