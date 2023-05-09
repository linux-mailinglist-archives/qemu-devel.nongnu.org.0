Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C06FCA04
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:16:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwP3y-0004Hj-9D; Tue, 09 May 2023 11:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwP3n-0004FP-CV
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:15:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwP3b-0007DJ-1u
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:15:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso21715215e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683645312; x=1686237312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9C4gxncKqguGr1DEqYpsxEqhRk0ppLAzsUUZkgFXLQA=;
 b=KtKsGt03mBeQMTLLkUJGBRkk/yuaaJKz/CFkXzE5n3s7dmyXsPzkXah9MxssOu8mEc
 znPYIoqeJpjLK1Rj7UgPV6LjCkCz5W0R8UTDLCNVPoBwT/erGhLb//7h58HNnCUMg52Q
 0q2n2gOAiHBdtkC9x0guTdMQVmIw9uQRO71h8n7s8OeumYTw9gmRDYidgxzcYiheXhNi
 c2erVfZ6e836DBL5TsKriOrF9yJ2oX5zgEGGIAx+NxH5jU4QxhtNuhjPRdESbLgMHOzs
 87MOXboKdSyVIWiGyrsR60kMy5aKkb3UYnhaRwrDu4cIFYPqHfJCjTnq9K+qGco/K1ZB
 HYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683645312; x=1686237312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9C4gxncKqguGr1DEqYpsxEqhRk0ppLAzsUUZkgFXLQA=;
 b=fXtzYGLx6B8KpfHM92Rg2h9ul5l7Vx3r7cOZJb3qNt9YX+PyXV4qwfAzvtnc+Wo015
 7ag3GkN6SKvX/gC78Ly28IIfzKHWYi3EsLrhV/X92LZOzK74KSxEKX03e/xvCmCR8Nho
 a2grDzywaN2hyu+LKdARUqlVwCTDBKPTXiOdFEm6CmFiYs1g5v+fBiVnLVuskbQxn6h/
 dcCDjeH7jgzV5YcTgC3Fm2XOvt8kZBxHxEgB9Nm4LqOfNcyHO1arffOH3PjrfkFS9DeX
 KXKSDIbo7mkK97laf0uUHJphUeRM3MTShFrcEUY9Mqzo2MvQ9/Ngk0/m/O+7eyrSAm/k
 qIYg==
X-Gm-Message-State: AC+VfDzc5v0w/MD8vAl7VP2v9Rs+tcn+Az/QAbUtUU4/F3SDvIBJJR45
 Tv5iVyYH6f8ndubFXO4XamVgPqf+0hBG0vA5FCbeKg==
X-Google-Smtp-Source: ACHHUZ5h15Fdfs7MqHvwhjro/S/QF3MCiECM2bU9obeBn9BehOWYck1GO1mfebJULvUmV+jsfzoFug==
X-Received: by 2002:a7b:c04c:0:b0:3ed:276d:81a4 with SMTP id
 u12-20020a7bc04c000000b003ed276d81a4mr9035374wmc.32.1683645312374; 
 Tue, 09 May 2023 08:15:12 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z13-20020adfd0cd000000b0030631a599a0sm14626642wrh.24.2023.05.09.08.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:15:11 -0700 (PDT)
Message-ID: <bc85b699-bbf7-aa81-8231-7b5c5e579fb2@linaro.org>
Date: Tue, 9 May 2023 16:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 80/84] disas: Remove target_ulong from the interface
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-81-richard.henderson@linaro.org>
 <c2a44892-e0f1-7c68-d860-ed1c612d72b7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c2a44892-e0f1-7c68-d860-ed1c612d72b7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/8/23 15:19, Thomas Huth wrote:
> On 03/05/2023 09.23, Richard Henderson wrote:
>> Use uint64_t for the pc, and size_t for the size.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/disas/disas.h | 17 ++++++-----------
>>   disas/disas.c         | 19 +++++++++----------
>>   linux-user/elfload.c  |  5 +++--
>>   3 files changed, 18 insertions(+), 23 deletions(-)
> 
> You also have to update lookup_symbolxx in bsd-user/elfload.c, I think.

Yep, missed that.


r~


