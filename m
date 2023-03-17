Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D1C6BEA9B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAeo-0002Bb-AP; Fri, 17 Mar 2023 10:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdAem-0002BN-8E
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:02:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdAek-0000yk-Q3
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:02:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id iw3so5381054plb.6
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679061725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MldaVXgdD29W3lBwG487teXpEZpP+Of1U1146PHbGsg=;
 b=HIHG/o4lpxc8FSPyKRb1B1m1yJ7NJ637TkpqzIPSOAMe+EKbAxljqh1PukIuaVU3VK
 DPlCYO7HJyR4/nK0/RdeBWDuuzXfWXBBtreh+9C3t8tyh0mTRPjwQj1oR58FunLWsAkr
 rgMStEhfeSH0OPALXFspyQaI3RLGFrWMQGe5PjECbNA6LEy/UCbAsUCWTAyhO6DXWkZj
 7vxGOnECOGujPE68B9r3mYGhCYwjT0MYSAw1L4/hGSIiYbIOI6oQVwbYnupb95PalZP2
 J+DrvzqNs0ZhGM0y/moRaHII7eC9Pz1F3LnJWZI/FyWAU2uGvKwBCRa91yoEV356TpOY
 f17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679061725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MldaVXgdD29W3lBwG487teXpEZpP+Of1U1146PHbGsg=;
 b=wGLL/cvKRSARTDi2prF2WIo97WoD/5JEoUP4ZBYGqZ+EaA8laqSqrz+PiYBCgDwv/C
 I3ALHw8kVmH/kZnlBz4/b9fGSkwDPUeXKDr83KiPqTKiZ1QakvNbP/ukrcDNAGRFYbN4
 HBHPBcQ3IKO9K4ro6xzpJpWGeRlLdzJWcc4VcTnMOtaGHQzjgDNSIjZTs4Komshz4KMN
 NPl4bAHSpqcLvEInatyEeCpjKZY1kTXMtjUMN0f+tYuy1Lk0eyfv/lqH3tShlbymtf96
 1PfZjQVnHs6/v9yDR2woOGFafrF6Qm52J9w6xOQ2BmP608D7Bs4GxWUaFr/hXjKVi4hE
 zlZg==
X-Gm-Message-State: AO0yUKUHJ/hzYcj3LlNpVPYvDe9VlMuMryrxJyZgrdDxvEKisJ1+AoYy
 8Df8ccsBIcVaV+P8Y0H6YzQg0g==
X-Google-Smtp-Source: AK7set+Qo2eTUEWXfYLsa3aLYv7uvw0hMylPtJYTVDmxccsOjG4M95JVX8bdv7gW33gotwco6d9mBQ==
X-Received: by 2002:a05:6a20:3d89:b0:d4:6190:582 with SMTP id
 s9-20020a056a203d8900b000d461900582mr9308173pzi.34.1679061725031; 
 Fri, 17 Mar 2023 07:02:05 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 g23-20020a63f417000000b0050bd9c8c53dsm1524411pgi.23.2023.03.17.07.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 07:02:04 -0700 (PDT)
Message-ID: <a8d13f61-6354-454d-2983-eeb65cb6bc61@linaro.org>
Date: Fri, 17 Mar 2023 07:02:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Question about TCG liveness_pass_1
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <66de3418-1fbf-ead1-bf29-f9e06523cdf2@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <66de3418-1fbf-ead1-bf29-f9e06523cdf2@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/16/23 19:57, LIU Zhiwei wrote:
> Hi Richard,
> 
> When I read the tcg code, I find a corner case which may be a bug in liveness_pass_1.
> 
> I see all TEMP_TBs or global temps are set to TS_DEAD | TS_MEM when enter liveness_pass_1. 
> Think about the  sequence.
> 
> 
> 1)Write_global_temp_0 // 0->TS_DEAD, but not recorded in arg_life

Here TS_MEM->TS_DEAD, so *is* recorded in arg_life.

> 2)INDEX_op_qemu_st   //trigger an exception here.

Here TCG_OPF_SIDE_EFFECTS is set, so call la_global_sync, so  0->TS_MEM.

> 
> 3)Ref_global_temp_0   // TS_DEAD->0
> 
> 4)Write_global_temp_0 // TS_DEAD | TS_MEM -> TS_DEAD
> 
> As 1) will not write to memory, its register will be reused by the 3). I think it may miss 
> a write to global_temp_0 when enter an exception.

Was there a specific test case that you find is miscompiled?


r~


