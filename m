Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3146FDB08
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:50:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgSE-0006Cl-Q0; Wed, 10 May 2023 05:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgS5-00068x-TB
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:49:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgS4-0008SW-9h
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:49:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30644c18072so4609146f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683712179; x=1686304179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJe4i1snfD9TA1FRAFCvOmPA542fa+kNNLPu0LDsIfs=;
 b=uRItUyJk3hgDjZ7SldkPseyMoQAyta317uKJDFy4tEtjC5ooezqIRpaUBG+32BcxBr
 XvRmdQKhAyiYOLYEQEa+u8LBjsiUA1SdQkW47eusPIa7s9MrNgtO4Il1KE/RQjSeL/jl
 qKU7OAKfIiR7MAALG7LtWa+bgVnhRIC1DfqdjfJ3aAhIRDWLWnJaQAICaVWBEudbrJ+h
 wZ4UGrORD7P7kGpFclJY8n2w+XYhu9cTF227GoXYzkyIBdrda1CCYuooSuKxYkm0gjse
 qApdgglkwDjV3fXaTWOVeiWFxe/djtzZkiHSeC9ZGbBcujJk21CEnd1S709HsfNdqKxi
 p0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683712179; x=1686304179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pJe4i1snfD9TA1FRAFCvOmPA542fa+kNNLPu0LDsIfs=;
 b=Cp9NN0NjnvfkQ/Eib5dHZOgo423ZPknv3UNoQg9t/0gPAc/Zon2ZdQQyK0xw2lrVWq
 cOOXMOWMahEpwVodKH0DuunYNis2Ven+8Xe34HvJgjzaVSolgTRxzRU8lkiXAoZCk3Cr
 P8EezZYKNspKrN/nmk7z+TZhDv85clRUnNTwKs+exaP0wqQ+46CoG5MKVOS1otmTqQFm
 T2H0y+Qf1Aq6WDqQJLMArKNk7ugRNjPu/cg7bi7ZYs+/w49N+NydbMaHMPaQHNC2bZkO
 iU9rmbl32Va7vCM2NG5lPKWCWgZ8FBP9K2EBwVxXMchUmoazCrx8tfzbg5JbAOKk6QLR
 GXIg==
X-Gm-Message-State: AC+VfDza4TDWdOE19ZcErPOoTBbSnUgROJVCmV7RtSM13Xifzn4BGRkk
 9vuyC443cXLBqp68ZzGVZcvWdg==
X-Google-Smtp-Source: ACHHUZ65u3OfrEu56epOwSMP8G0oA4XV6TrNET3eeBtfnmOBQ9a7JXbeM+mCMMv16NUemwa/mwhK3Q==
X-Received: by 2002:adf:ea52:0:b0:2d1:3eb9:c3c2 with SMTP id
 j18-20020adfea52000000b002d13eb9c3c2mr12613983wrn.54.1683712178711; 
 Wed, 10 May 2023 02:49:38 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0030789698eebsm13231514wrw.89.2023.05.10.02.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:49:38 -0700 (PDT)
Message-ID: <6c3ed306-0aa1-ae8d-c9f8-79c088bd2a5e@linaro.org>
Date: Wed, 10 May 2023 10:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/12] accel/tcg/cputlb.c: Widen addr in
 MMULookupPageData
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-6-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-6-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 15:13, Anton Johansson wrote:
> Functions accessing MMULookupPageData are also updated.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/cputlb.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

