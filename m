Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CD30E373
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:44:51 +0100 (CET)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O54-0003BL-7x
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NXl-0006P8-Sc
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:10:29 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NXg-0005IO-So
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:10:25 -0500
Received: by mail-pj1-x1036.google.com with SMTP id lw17so3814389pjb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xXH70jlx+87f9yl/A2GH6y3056OHg0pxw2bQ9jKAMU8=;
 b=gNg/vD0L1hU7KzaBnN1+zC7iD58BW27ALF50GnFWzUjMR0uC9wjGf3O5y7EGw963Al
 qrVIpOnq6HKEMqpFSb7ucjGSDsOXbQQ6e84ov1GtXruLQ/tNFau5OovIQbiWmUp/x8Zm
 OsTwfzaL8qTBJ7i4kN6StfUoMYdkw0O+DFnak9CWqN/Jx8YLVTv0uzRRNo9bSNM+RMYy
 o0wCqMndHplk0JE8Qx1UTmAagbCzPUcN2Pwg1T890DRNIuGaXABXFgHuNmkp6zieIuAB
 FpEQ/2CJhmSm4NludTwWZv1d5jyQgTIRm5GNdz0eqcrlqiZJ+1IVdoaKGpmPCJyxm6hH
 4p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xXH70jlx+87f9yl/A2GH6y3056OHg0pxw2bQ9jKAMU8=;
 b=kQDHGwFD30Xf1g7/YN1nJPuu72tjhZ6wx905c1Bq2qoydJaIO1Crua26KjPXCPGhZI
 4mfFLUkiz+DuItAq6TioEs0hCbNNLEXXmoPHyRoh+6U6+QwMw8bhElFOOgCH/NZuFQis
 xKjgqWg3OLX7+GKNUm+JBwBrJ84QDIQc1MjBLCtTixSc8TSV63epz98GpqZI4Ib89lO5
 YFWe4XaiZ6sChn23aBaFfcK68qs/0CESUsk2jKZO/r5To4af2f1/kAWdUYV7JfxVE4cc
 UUvXemB7hQksNIhOYa+cdwQtrmwu1/jiwMXSpR2ZxXPc1V5322HJjQUNy4t+m1T8mr4z
 Ohig==
X-Gm-Message-State: AOAM531wLckvK8K8OHSg4hB1n7S7M/5q9HH0n8e8A7MOdfpR83XVNVUd
 w8pw+ZTwr/wN3n4fnPYwhTG3Fg==
X-Google-Smtp-Source: ABdhPJysP4TpTLppD2+veQOt2QZTJ/8Y6mwYR6QOWBnFg6DZtgXZ5+h/1MLBEr6GOd49i6nCqUrueA==
X-Received: by 2002:a17:90a:a516:: with SMTP id
 a22mr4601347pjq.192.1612379418229; 
 Wed, 03 Feb 2021 11:10:18 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id v26sm2830853pff.195.2021.02.03.11.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 11:10:16 -0800 (PST)
Subject: Re: [PATCH v5 03/31] exec: Use uintptr_t for guest_base
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-4-richard.henderson@linaro.org>
 <fd583fe4-46c5-a9dc-dd3f-c38504e2e498@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f51c9b7a-c9b5-29b6-9f88-b6d774be5da9@linaro.org>
Date: Wed, 3 Feb 2021 09:10:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd583fe4-46c5-a9dc-dd3f-c38504e2e498@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 9:08 AM, Philippe Mathieu-Daudé wrote:
> On 2/3/21 7:59 PM, Richard Henderson wrote:
>> This is more descriptive than 'unsigned long'.
>> No functional change, since these match on all linux+bsd hosts.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/exec/cpu-all.h | 2 +-
>>  bsd-user/main.c        | 4 ++--
>>  linux-user/elfload.c   | 4 ++--
>>  linux-user/main.c      | 4 ++--
>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
>> index c23c77589b..c52180e8e6 100644
>> --- a/include/exec/cpu-all.h
>> +++ b/include/exec/cpu-all.h
>> @@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
>>  /* On some host systems the guest address space is reserved on the host.
>>   * This allows the guest address space to be offset to a convenient location.
>>   */
>> -extern unsigned long guest_base;
>> +extern uintptr_t guest_base;
>>  extern bool have_guest_base;
>>  extern unsigned long reserved_va;
>>  
>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>> index 65163e1396..c09d74d788 100644
>> --- a/bsd-user/main.c
>> +++ b/bsd-user/main.c
>> @@ -41,7 +41,7 @@
>>  
>>  int singlestep;
>>  unsigned long mmap_min_addr;
>> -unsigned long guest_base;
>> +uintptr_t guest_base;
>>  bool have_guest_base;
>>  unsigned long reserved_va;
>>  
>> @@ -965,7 +965,7 @@ int main(int argc, char **argv)
>>      g_free(target_environ);
>>  
>>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
>> -        qemu_log("guest_base  0x%lx\n", guest_base);
>> +        qemu_log("guest_base  %p\n", (void *)guest_base);
> 
> Why not use PRIxPTR?

Didn't think of it.  Worth a respin?

> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 


