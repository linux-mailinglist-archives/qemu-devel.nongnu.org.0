Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE86A916A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzSh-0007CP-NN; Fri, 03 Mar 2023 02:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXzSd-0007C0-Qq
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:04:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXzSb-0005xf-JR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 02:04:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id oj5so1587220pjb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677827042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9qxR+LsNp3aFMRW6JEaKPzeka+7ImnlF0fF7dWEDWdA=;
 b=OUpipDmmHsci7EN7YfKNlduJr4LoyRUr14H9uAzJGDTGGRdctWByMMtVSHI/K78c4C
 +/V4lJ211Uw7ZdDPYF4+6PHUBY8sqwjzT6iCDEULPh51sT3tqTKRMFR5uIcFihOjqdFP
 ZbLd07xd0s6GOLAnd3Fcngi9KY0WHXkaPQDuQr5/7VNoFsuOb4SRNe2LWPcOlt8YmiVW
 qg0/crxmBJiFZ0cD0LaID/7UE6t5eAHqK6b1hgJUpYTHZ8SyQk9S7x4juOJg6kiwlILt
 Envug9crXgm7xcgt7NipuST3fZTdLbqKrAgxcQsUE0eHTpC8jFqCXYBEvGixPIKcjI2y
 F1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677827042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qxR+LsNp3aFMRW6JEaKPzeka+7ImnlF0fF7dWEDWdA=;
 b=C2VS97zLX1AX+x/fVMAMm4UcNKJoOozeqAYJsBPd6M8ks8Wcl7D0HPdzYx8cgdKd1L
 i4YVUKBQV8cxyGUXS/wkT/zLMx3mHIG8AwNhpW3SPzXokxkAqyecIn7imglPibu8bg2A
 Dgk8sn0fvETSOMS0MR6xZy6RK2Z3szOyHNroCDY6OT3y27eeCwYc0yiVIMF6fMVJ6FWj
 P0gognxSvc1eFYtLBkShlpmRmeMAxTJG5zJAsU/5Qy6gCuYLYA6UKdyD86jetr8aKxmd
 IuVvypJSjvP9VSsfevULxfGDmhQphaM7E69n/quoiJTvJXpAOVH0O1taDHjxIDDg5pEq
 UF9A==
X-Gm-Message-State: AO0yUKX6vimYSdrqOaA5ojYbxXm6zwpX98No92PiplILBtoUu81Q4Br+
 ez1QDG/wpSdaWuribd3GrTq2kQ==
X-Google-Smtp-Source: AK7set8MSB6U3LwgSLkbqB5frxxsjuK5QTsM5998ZT+sb7Ca+7TftJEva/ZJIPy4rcJHuSq9ILDQOw==
X-Received: by 2002:a05:6a20:5489:b0:cc:120c:b259 with SMTP id
 i9-20020a056a20548900b000cc120cb259mr1563263pzk.39.1677827042020; 
 Thu, 02 Mar 2023 23:04:02 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.8]) by smtp.gmail.com with ESMTPSA id
 j22-20020aa78d16000000b005a909290425sm825551pfe.172.2023.03.02.23.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:04:01 -0800 (PST)
Message-ID: <f0589d64-79cf-7b59-47ae-ac1428f20241@bytedance.com>
Date: Fri, 3 Mar 2023 15:02:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Re: [PATCH v6 09/12] cryptodev: Account statistics
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, mst@redhat.com
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
 <20230301105847.253084-10-pizhenwei@bytedance.com>
 <Y/8xdwWYywVu4jIp@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Y/8xdwWYywVu4jIp@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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



On 3/1/23 19:05, Daniel P. Berrangé wrote:
> On Wed, Mar 01, 2023 at 06:58:44PM +0800, zhenwei pi wrote:
>> Account OPS/BPS for crypto device, this will be used for 'query-stats'
>> QEMU monitor command and QoS in the next step.
>>
>> Note that a crypto device may support symmetric mode, asymmetric mode,
>> both symmetric and asymmetric mode. So we use two structure to
>> describe the statistics of a crypto device.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   backends/cryptodev.c       | 68 +++++++++++++++++++++++++++++++++++---
>>   include/sysemu/cryptodev.h | 49 +++++++++++++++++++++++++++
>>   2 files changed, 112 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> With regards,
> Daniel

Hi Daniel,
Thanks for your patience in the trunk of work!

Hi Michael,
All the patches in this series have been reviewed by Daniel, a small 
improvement(use macro to walk a list which is pointed out by Dr. David 
Alan Gilbert) remains and I'd like to do this work in another followup 
change.

-- 
zhenwei pi

