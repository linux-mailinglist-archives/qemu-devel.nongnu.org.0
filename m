Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68D69BBA2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 20:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTSza-0003zo-Lv; Sat, 18 Feb 2023 14:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTSzY-0003zZ-Q6
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 14:35:28 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTSzW-00042G-Vs
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 14:35:28 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s3so1309253plg.9
 for <qemu-devel@nongnu.org>; Sat, 18 Feb 2023 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GVimopM9nsGyKogmPStaemWmYX+ncqWbsZ+eteXaxgg=;
 b=mU7YaWB9WFaiFTlpoU/BkTn3ykstVLaH0zUFnkZgVboyBZTV4B7Ny3QCN0Eoq0Gg+y
 WgAmDLVXdegti4YUhZKattB7ZeIHE2EwfkVzbX8SxT0DY+9FyMutl1bzjqSxRSdnKqOw
 9D3hv7mVoAQ0ZvW9H4qTm2vAe6i6BvYGPLJoYkbIHLNt+ca91uHL9xJEhLuwHmuv9dW3
 VpTQk9W2i2pvfp2xlYQFnjzFGc4RG1XqCDZh46fyCb39sJ4gnAVFxdxhwgZiO1TvSARM
 OKdXtJhyFveOdFh4uQr/+DPdNlLsO1vuskbPM3GhK6cwT723TfOhIm/bQKZcWKMnb9zr
 3fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GVimopM9nsGyKogmPStaemWmYX+ncqWbsZ+eteXaxgg=;
 b=LGGTHDrHkvamj9MJzhFFFnvUbLrXGRNHohFZfZTmZh6DEwFz/WHmt0IuXiHBREcNd9
 Bio0BIKpw93bSFgg3Pq2gn6VVhJJceTRVAa84rIAPPSzx3ihyCpxxSAfcs6nwz3mTiXi
 KNH0psOjFoFriZslc+qUtQ1cLtHowlZ7aye80nYq3REomPVUyO9YzdnC6+AdZWKQr+Mu
 4NG7cs+oYmCG5ez0q6mxT5y/l2cP3P8/DVJd7pP3QuhmKKnkroqn6JBmr1dXvZphBqcd
 hHKsjYrd1w9jjUykpb3Q7X7p2kUuQSOS3u8pnIU3bDRDawiAsNea17Bh4WyRZSlR3dGV
 AVFw==
X-Gm-Message-State: AO0yUKVhR4w/FoYu/2igkG4SkRqblAYBHpxefWDFRoZf3RUkjFv9LFIc
 esWvesG1abnw4ZVO5+y4TdL7cg==
X-Google-Smtp-Source: AK7set+77KSDPSpEOdKjUlXddELohKN0HTDxUp2/T6KRm4jabngwP7vxskg+Y312MJLet77RhWPqSQ==
X-Received: by 2002:a17:90b:2243:b0:234:1a60:a6b0 with SMTP id
 hk3-20020a17090b224300b002341a60a6b0mr1931309pjb.34.1676748924719; 
 Sat, 18 Feb 2023 11:35:24 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 gz2-20020a17090b0ec200b002312586b5b1sm110675pjb.57.2023.02.18.11.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 11:35:23 -0800 (PST)
Message-ID: <4e3ac25e-6443-9365-66e4-ebd903aa29b9@linaro.org>
Date: Sat, 18 Feb 2023 09:35:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 2/4] target/riscv: implement Zicboz extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-3-dbarboza@ventanamicro.com>
 <20408b85-2ad0-4cbc-4ccd-c512ba15ba06@linaro.org>
 <d468f8c6-f8ec-6d40-44ab-3e76df458680@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d468f8c6-f8ec-6d40-44ab-3e76df458680@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 23:28, Daniel Henrique Barboza wrote:
> "A cache-block zero instruction is permitted to access the specified cache block whenever
> a store instruction is permitted to access the corresponding physical addresses and when
> the PMAs indicate that cache-block zero instructions are a supported access type. If access
> to the cache block is not permitted, a cache-block zero instruction raises a store page fault
> or store guest-page fault exception if address translation does not permit write access or
> raises a store access fault exception otherwise. During address translation, the instruction
> also checks the accessed and dirty bits and may either raise an exception or set the bits as
> required."

By the way, I think the documentation should specify what happens if the page is *not* 
accessible.  Is badaddr = {rN, aligned(rN), unspecified, but somewhere in the block}?


r~

