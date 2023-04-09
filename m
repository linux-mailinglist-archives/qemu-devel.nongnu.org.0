Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4B6DC0A3
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 18:23:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plXnr-0006F7-GV; Sun, 09 Apr 2023 12:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plXno-0006DS-IH
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 12:22:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plXnm-0004Vw-JV
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 12:22:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id c3so3014328pjg.1
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 09:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681057320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxeRLqemqVnw7bAW2EUyUTrZvndiNEG+4n9utkLAD3o=;
 b=VkwYoIsSt1uhiq4KsO8f97RjwqvYB/i+s3RKAR4//qn43oQg+rfqpqpm55fDZ6caBU
 FIQ7lhwTBVloKVXwXE6k7GIYsJ+Pk+T3Wf5faae9JisRXPBxgEHl9XN/EOGR/V064tFw
 +wkGWcvV4YEBGQSz/pWrS2qP+sLd+xEGhXShiutnKhZrXFhyrBe4Ic0uCiq18RAHa0F0
 P2+BC7QE3meYXwMx7Ym/59GEa4rthjJqht7GHwz/27SwsqW3fr/DL/i2WOmxB2jW8hK+
 TXTJwZCrWCcuZHnE9j7b1IEjMqi7TavvpsWocaHbyTz/BGJB6DkEqDwBCjrIcPW/cUC2
 TVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681057320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxeRLqemqVnw7bAW2EUyUTrZvndiNEG+4n9utkLAD3o=;
 b=Gb07AQfc/yLagnwNGu8v5KZkk5wjNXU0zVLpTFFBz8KXbGulGvqpVGH36OVPwELVw4
 psuMWEHY5hqc3byNlN5irS8cyKrdjExYwueHoXcYNkI1DDZb7D2UvDf+SafXjQbNmMKN
 WqxpuPoDVLG4SdfRuyVziWGMIstPqeIbc0FNRB02VolElVW6W9nelZoseP3jT2qRlO4z
 mJHi9bktBctYowyoxv7Fo5bjyjM303nB2d/caMpDSC8kMm2ZTK/ftKVqjGyA0MU4wQvC
 Pw7z/nsGaWFJLpfe3b0mircbWG06iCYoscrjItof1VbMIYK8wM+32IY/fYiKZx9z4rwh
 7KiA==
X-Gm-Message-State: AAQBX9c7uLZyOHMJ4qROBqZKaQekRiGDxKnh+m8DUBSpn+VPjMq/4N70
 6kEqJto8OpwqhLpM/6icepJP0w==
X-Google-Smtp-Source: AKy350bzJ7slD8fFr5oRdrBEix9wxx9/yS7zKc6vguIdtNIZm9YeDv3vJhGswKXT2Nm6UERqz+FE1Q==
X-Received: by 2002:a17:903:1389:b0:1a4:f79d:67bc with SMTP id
 jx9-20020a170903138900b001a4f79d67bcmr10160407plb.43.1681057319604; 
 Sun, 09 Apr 2023 09:21:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:d714:12f0:3102:b5ae?
 ([2602:ae:1541:f901:d714:12f0:3102:b5ae])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a1709028b8500b00198d7b52eefsm6033889plb.257.2023.04.09.09.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 09:21:58 -0700 (PDT)
Message-ID: <9bf63987-e868-d663-b8a4-e6a4f7ab0eba@linaro.org>
Date: Sun, 9 Apr 2023 09:21:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 qemu-ppc@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Anton Johansson <anjo@rev.ng>
References: <20230408070547.3609447-1-richard.henderson@linaro.org>
 <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.888,
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

On 4/8/23 14:24, Cédric Le Goater wrote:
> On 4/8/23 09:05, Richard Henderson wrote:
>> Fix a crash writing to 't3', which is now a constant.
>> Instead, write the result of the remu to 't1'.
>>
>> Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
>> Reported-by: Nicholas Piggin <npiggin@gmail.com>
>> Reviewed-by: Anton Johansson <anjo@rev.ng>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Looks good:
> 
>    https://gitlab.com/legoater/qemu/-/pipelines/831847446
> 
> I have a PR ready for this same branch. If you want to me send,
> just tell.

Yes, please.  Also, the comment above needs s/t1/t0/.  :-P


r~

> 
> I don't think we have tcg tests for the prefix or mma instructions
> introduced in P10. That would be good to have.
> 
> C.
> 


