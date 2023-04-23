Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BA6EBE30
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:11:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVkN-0004Xo-CS; Sun, 23 Apr 2023 05:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVkI-0004SO-P5
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:10:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVkH-0000t4-6g
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:10:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so3956635e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241056; x=1684833056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yL9jA/xha/JnArU6CD2vbwZ3V+YHXaTg3O5pMFCT1oU=;
 b=T3kNNN2iPneA2ytGtm5wd/NYem/FjD0A7csuwIufwwgSo10b1Dn8pwloXDFSIVbWks
 YhbJnTqBMxx9xBShY3ZU2lbyEVcBYCpg+rbgM5/tuz9kBlmWfTuOSvA6LRydNBVZq+e1
 Om47Q2Y2Ox0Ma8gBplDYVO+EizRxsoksCKR4KcSmBDDooAfRDPtTCNLAO63BWEd008od
 uWjNTfXwxnX8Bt4nq/1FYvTui6g6GeDX53vA7HjouZHgNzvlbkpHwCVgFow/oZryy/Ry
 RvfIiGBc+nXqjqzmvgBMIiOx+e1JgXMtouTmVU9gtDW+jvBjiAyV1UHH9FqQL7FGfc7Y
 vphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241056; x=1684833056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yL9jA/xha/JnArU6CD2vbwZ3V+YHXaTg3O5pMFCT1oU=;
 b=BlUWOUW5tGPpECOgvATL8aWVrXASmYXRiY3USe6xw/AwSICj/4IFLpi3Ls7VCkRtU0
 i2BcZ7E1UjL9QQlbjj935Cjn73h54t6stOg4oY8CVcBPEi9+gNzS4zQpCm3RGLd7khDL
 pNF1Ogl+dG74QVEtKq9pLoOXd6c3Tno44BONGLyb9m2PseogeGHwxiH3n4KYSNGprtzr
 2ulmK4U0ioMkKsmTublRa2p3opYfKJJEAktWiq1m2YalOPHT1B11vcTREwPIoxQKv5Ze
 vPGI9YR0VpluSjYZdYyTpWI3A80PERXYVbXQY66Svh0qV1DWeT52VGeKc1E7cKtmT6Nu
 AljA==
X-Gm-Message-State: AAQBX9cNkI6GIlnUmk+jVfB+qE9ab4jiwOdQoK7lFVAKu6hucuU+tRpk
 g3AZ7P6dPg9uRX3Ng/3jYjy3sA==
X-Google-Smtp-Source: AKy350b55ySIPc9MQiK4uL+ZupzKKIBJ+0tELy90WvCRdjadxFQyQp89hiObnMt98LWIafzqCJXwrA==
X-Received: by 2002:a05:600c:24cd:b0:3f1:79ad:f3a8 with SMTP id
 13-20020a05600c24cd00b003f179adf3a8mr5045470wmu.16.1682241056001; 
 Sun, 23 Apr 2023 02:10:56 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003f18372d540sm9083121wmc.14.2023.04.23.02.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:10:55 -0700 (PDT)
Message-ID: <6f98eae8-30b6-9253-38b9-0663a6861f4e@linaro.org>
Date: Sun, 23 Apr 2023 10:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/8] accel/tcg: Replace target_ulong with vaddr in
 helper_unaligned_*()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-5-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-5-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/20/23 22:28, Anton Johansson wrote:
> Updates helper_unaligned_[ld|st] to take the store/load address as a
> vaddr instead of a target_ulong.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/user-exec.c  | 4 ++--
>   include/tcg/tcg-ldst.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

I've got patches posted to remove these functions.


r~

