Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D760D649
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:45:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRhY-0002OC-TH; Tue, 25 Oct 2022 17:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRhR-000291-S3
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:43:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRhO-0001On-SK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:43:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so354308pji.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9DTdrSN6/qlZXCGy7xNJL6fDY+SfqtAN2m0zpIfsgg=;
 b=lm4OYf+ys7qPcUt3F4CbMDuBN5zp27jTsc88tTrwaN6RsUxfyaE1tksVBBbWpBwQ8f
 HkPKLkN5BVTV1g5ifogje6LIv125MnIBEqH6hZ5nCnNVO3aYi/Nudg3Me3VCfAXjZPbV
 I7E4kMhYX9HsGv7ViDqL7Nedh+j0Rk8bfXVup8voVbkRmjLp3VCg8JtlGMeaVET0ajAe
 /aN19B1hCXr38FW0VcxeCDkM5GeAJ/+gfH5f2aLEIAuNBM3+n2edayRbJC+7ZmDIWoOA
 grQCNdH0wt86W51Mr7m+sHQhBlnP3bOBOo15+X+A+dwiJThrENYu8mvHoq6n0TnbXX6O
 PMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9DTdrSN6/qlZXCGy7xNJL6fDY+SfqtAN2m0zpIfsgg=;
 b=fHqJVEiCbXfgygbCVHNate8HMjpb97ab877+TY1ZGvSujGfMdCVhdLcCBMfuhdKhz6
 JUl5qR1JRCV2/PmC00DAXafHFQmttU2Lp8zJmp8yVE/9hlLRkAJzvuL1uVbHPpUDLTfn
 my7EgyQiegchhgX5K/EjxXtnWrjSt359I/KIHX96K5r1cWzwQq9npYMOrOZ5SjxGqdXU
 4B3mjF0gfKw5pBat0Zv/vn6I/llI0+LKTkOgghMpPZWc58NF6mDf/soen/+ARG8a77kc
 4LDX5Avg3M56xnNBSHE7o3qTsL6UGwhMvF5sB9+R3jRUiUBcpxsh8ceteDKn7tQkZHxo
 Pukw==
X-Gm-Message-State: ACrzQf2c2GGJYWyaTimmhlmjTCT0rgyLBIofbGUMCPaXoN8rLw06yvmf
 4k4va2jUvtBa3xizYQ3SbbxdSg==
X-Google-Smtp-Source: AMsMyM4G5vpKp1c5sA9/DBQ01FmVL/B522/idIvg4yHVGLtyYtF6aV2cfrrBU8Y++9s6ygMmbn5v7Q==
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr40367231plf.57.1666734180623; 
 Tue, 25 Oct 2022 14:43:00 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a170902c94500b001754064ac31sm1601130pla.280.2022.10.25.14.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 14:42:59 -0700 (PDT)
Message-ID: <6d550122-7084-49d1-087c-31f7d8fb29bd@linaro.org>
Date: Wed, 26 Oct 2022 07:42:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/3] accel/tcg: Add a quicker check for breakpoints
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: pbonzini@redhat.com, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221025202424.195984-1-leandro.lupori@eldorado.org.br>
 <20221025202424.195984-2-leandro.lupori@eldorado.org.br>
 <d97d023e-978a-57df-f691-9db89aac0da0@linaro.org>
In-Reply-To: <d97d023e-978a-57df-f691-9db89aac0da0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 07:37, Richard Henderson wrote:
> On 10/26/22 06:24, Leandro Lupori wrote:
>> Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
>> considerable amount of time was being spent in
>> check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
>> amd64), even though it was just checking that its queue was empty
>> and returning, when no breakpoints were set. It turns out this
>> function is not inlined by the compiler and it's always called by
>> helper_lookup_tb_ptr(), one of the most called functions.
>>
>> By leaving only the check for empty queue in
>> check_for_breakpoints() and moving the remaining code to
>> check_for_breakpoints_slow(), called only when the queue is not
>> empty, it's possible to avoid the call overhead. An improvement of
>> about 3% in total time was measured on POWER9.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   accel/tcg/cpu-exec.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Cherry-picking this one patch to tcg-next.

r~



