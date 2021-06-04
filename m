Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C439C39B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 01:00:15 +0200 (CEST)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpInW-0002xE-8w
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 19:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpImY-00022L-5i
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:59:14 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpImV-0005qo-Uj
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:59:13 -0400
Received: by mail-pg1-x529.google.com with SMTP id o9so6187855pgd.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 15:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z1cTvou7oP4Ug7sBE5T9uYC4yg5lGy0Z6oF3grcBLFc=;
 b=UHtMccVA8FLiIK0wO0uKZSkkiQxZEbksjYtEifl2vV3rI1fKa7xYCfjJKJPf5+VS16
 f6zwO9htrcLs04LGeWA2iSo6WcJ5EwIowLiRaGy+S5EK/CO5j2qzw4CN7KO4yEe/0auz
 WEMzSssX+vTO+yqCnn8t7L80IHbfgdU9odVtAwadcmfzpudz0rIZsLjJFhgPsf60kZUs
 11AuAb+EdWlHKrIKYceyIZM+gSdVa+Y4bN9MYP8M2Dx/bAH7WWj+8dQFj52J1nfdFygh
 aldC1S/dbouCvUSNEqeoU90ZpYQ5Gfj+xWgBzDnLKNlKT8wRLLEjLtTPzw/xuhb6eV+L
 pwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z1cTvou7oP4Ug7sBE5T9uYC4yg5lGy0Z6oF3grcBLFc=;
 b=W7+7IYEtRqSvN93XQqPSoKVY9Wje+cKoTZSqHU6lNcPX88aE1/5KJQQwIs36xx7sHo
 JzdKKlxfrGj8PCXqmoF0MPZD4+kcU0JrjTaIQ5Dsrx30NspQ+BZ/wX1TJA9a8C4BRfko
 WdEZ7VlcjjlKmwUy6pg8PNTrALVigf17j1Ox/5KdGjV7QW7d22W9LxYgVpunFO58E1sD
 YJndbEVJYdjEv31/8LcPHdQGhbyrqJpPxhBydfggOTdd+tOH1xLQGE1rjxed4Jl8rDAe
 eGuMl+vybZJhDuFjfWYy4vu12mu2PPa8QbhIwBM3EE/fp7u18hbQgDqQAMvFB/n8s/TB
 53Pw==
X-Gm-Message-State: AOAM531ab7KZSKqw4jSp08/IykJxlXFS6SF6Vwzy40ZmtKkYnsaSwV6F
 SKyBBe28uikXMQ2aU3BIJ/CFXg==
X-Google-Smtp-Source: ABdhPJz/Pud0OnWKyb1Ye5dFYyM7wZn4+PT6UgTQ/YVRo9UUYnG5dQqj1UL719U1D7xgTzBzU9kLHw==
X-Received: by 2002:aa7:8ec8:0:b029:2ea:32b:9202 with SMTP id
 b8-20020aa78ec80000b02902ea032b9202mr6548821pfr.36.1622847550009; 
 Fri, 04 Jun 2021 15:59:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y4sm2446852pfg.112.2021.06.04.15.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 15:59:09 -0700 (PDT)
Subject: Re: [PATCH v16 42/99] target/arm: split 32bit and 64bit arm dump state
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-43-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e20518aa-eb77-c34f-cc23-c5f606457466@linaro.org>
Date: Fri, 4 Jun 2021 15:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu32.h |   2 +-
>   target/arm/cpu.c   | 225 ---------------------------------------------
>   target/arm/cpu32.c |  85 ++++++++++++++++-
>   target/arm/cpu64.c | 142 ++++++++++++++++++++++++++++
>   4 files changed, 227 insertions(+), 227 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

