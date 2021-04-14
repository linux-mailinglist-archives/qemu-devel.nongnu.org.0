Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D935EB58
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:15:51 +0200 (CEST)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWW0M-0004Jg-S0
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWVzC-0003Ee-LL
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:14:38 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWVzA-0006VA-QW
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:14:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id t23so9519666pjy.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAAq5ItyC12mz4O4d4lIMv9wThII8XtGy9912qs54fM=;
 b=evm3PkZc5l9SNGPVMIWrcfbzANrH1eSzTzoMRId4viORtuV1Rks3qYkJh6KLpTXIp/
 s3Usr3+TGzrPCA6Div6ASYetIPX1znd/JmdaZBWFGae3noG4zMbIIAjkZYnSQUW8Bxso
 FkPKHnKHsQjTRjcPdnvyA/y8HKasALJaJF/yp8/boPD4HnhphV1FHkq8etImG07VcflP
 RIoCmD+I9JBkMtCOstJYtc9wEB/7kp/Bocs2rI6p9ZozmfbZQEgOtX8AFHRIfpqb/dxu
 u++0na5voJ9SLEo/WzNnIish6qPxVjd345/ht3On8NPs6iArTEgVo+IOkpKKphNdJrSO
 OyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAAq5ItyC12mz4O4d4lIMv9wThII8XtGy9912qs54fM=;
 b=ff8pZszi6rnVXsWJqF2uKmrbuZBn3QjOgVYrgepjFyH9mg2T1v6QXNgdYbS2g4YIZ4
 adHnezQ3T7UN79/ZW+872/MvrfvpmLVxYVCtDcfQUT1kiuSO8ijgBHBez/6Zayh7wCHe
 p+j8LxsUyMuXDqVuU9b5G5RT68f2LQO3RfjcbX98IUReDRU8W8HiibBxcvIuEZKq17xu
 7fsHiv+nRK7QKWnYJXIZz9uYbGs9clFRvSYBJ5tDcV9a++V8raz7Nvb+mC7z8GhJ6I4g
 K+FpgN+1FzlbBYgUhRwSNHEOX3TmurG+OSUv8nmYftdnAHUstFK86gIgeewgCk+nNcUx
 tuwQ==
X-Gm-Message-State: AOAM533A0kb5If/C4v3DFyPjue3VbgJZyHDLCRdbJNrvSGCgMDgdQc+i
 fwubWPz2HibB5Rh6rL41Iku8pQ==
X-Google-Smtp-Source: ABdhPJyfv+8RTikYJjcyLBRm3OihQhuTLX76dfWzIUAcSmCfVcWddSxnKpro0UNRX+K4gZFhWQBeNQ==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr1066895pjz.37.1618370075444; 
 Tue, 13 Apr 2021 20:14:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id o9sm14863487pfh.217.2021.04.13.20.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 20:14:35 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] target/riscv: Remove the hardcoded SATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec8a710c-c38a-ca35-7f44-1caffd1987c2@linaro.org>
Date: Tue, 13 Apr 2021 20:14:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 4:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_bits.h   | 11 -----------
>   target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
>   target/riscv/csr.c        | 20 ++++++++++++++++----
>   target/riscv/monitor.c    | 22 +++++++++++++++++-----
>   4 files changed, 51 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

