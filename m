Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE83902BE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:48:51 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXQQ-0004Nd-Tx
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXNC-0000lB-Sd
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:31 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXNB-0006AW-7S
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kr9so8794512pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2n+5IqYls0lS97cpa4blde3aawx3WRsneRqPWR+6F8s=;
 b=fe1q4rnlDUKGt9oCKGbCROYL58VmSEAwzQKsVEXD0CyYrTxTqFCRPaRQ6DWagTXqVF
 MSB3IDiVHTRS4gWu1KQP0xmKIFUhp4zo6seap6WbYg+gY32U2hWH5dJLmHOCcF85+mPv
 803WyYH0O+/ICqh1Yv31HaEQ2CyMtNkMstmIKkXgESXlLnRpptz4TX6+MBq4t0eUqQrH
 UHGgk2ZWQGo330ij8NWq2Dqszth2c/vnzaYZi8HB0/dq/snOdjZTD9UkxZjigZyLVa1b
 L5gRXYKfZ+DaN+RC5W/OCvlAkcit37N7XPO7z+SIdlEBawPc9PdyszlfeRAb0OLyj832
 9Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2n+5IqYls0lS97cpa4blde3aawx3WRsneRqPWR+6F8s=;
 b=pRh8yKuA7QPiGxI63vflVkKUOcYQfF0w3FM0zg0QiXdWCCDo16hn3hRmpMw332uDT2
 cU8Odtv4UGR8omfPik2OBzeUjlAGFvelYbKpUXq2OdGOFgjq3yH7uT/sEfVR42iofMKu
 F3LM54NNCC32Go69RDLMl+TZdpAIU9yHNgU2dFyA1COFqe3N3dqUsSzuu47/wAA4LGRw
 ouBxCPlXVFP3WVuaWSgghA/hnsfOixpJN0qyCkIWBetMzkEoIe9jt/5Z4KUPoGT9qIgR
 CI6gywgfRLRRxf+4ZE2D5std8jgmLvbc7L0HEhABfkYehicUzrPYX3fTAaabbOTX9m2m
 OPBw==
X-Gm-Message-State: AOAM5310sDHLPGgLgTAwiy9DvCXp3FDiP13YDAvAQckdWfNLl7MWenOk
 BhMmQBVOy5pkfFGd27u2+ZMOdg==
X-Google-Smtp-Source: ABdhPJz4fNL/pNNHO1hpQQPrAOCrbHuMNFC2kkBb0V11YRCc1rBgbZ5RH0UWia73h1Q4P4NdMnneqQ==
X-Received: by 2002:a17:90a:2aca:: with SMTP id
 i10mr30888937pjg.110.1621950327329; 
 Tue, 25 May 2021 06:45:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 e6sm2369734pjt.1.2021.05.25.06.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:45:27 -0700 (PDT)
Subject: Re: [PATCH 5/9] accel/tcg: Add
 tlb_flush_page_bits_by_mmuidx_all_cpus()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdb4d598-3fa7-fb0a-9df9-059e384b917f@linaro.org>
Date: Tue, 25 May 2021 06:45:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/exec-all.h | 13 +++++++++++++
>   accel/tcg/cputlb.c      | 24 +++++++++++++++++-------
>   2 files changed, 30 insertions(+), 7 deletions(-)

Forward tlb_flush_page_bits_by_mmuidx_all_cpus to
tlb_flush_range_by_mmuidx_all_cpus passing TARGET_PAGE_SIZE.


r~

