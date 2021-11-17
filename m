Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D274542B7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:33:37 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGNs-0004iN-Gr
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGN4-00042v-Q0
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:32:46 -0500
Received: from [2a00:1450:4864:20::42f] (port=46759
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGN3-0002sR-AG
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:32:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u1so2971144wru.13
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C7jLksjOJJsFch2DtS4JWxdZh/lf/Foi7hOT0zPMhWE=;
 b=CZjkWS9NCKC/jsmDukBk/ki2VLsi6syBYhu+yR9JpCucldgs9Ofw+du5ziIKKOdKiH
 qzrKboPkHik5kxawcFYTjAZj74xQ0PNoymTfpsnvNg5QvIjE11wKmetIGsPDmPOqXtmQ
 bV+I+2G3tlIO68QQZLynZbLcqmNxRZih5srW0sZjm+BCVmt6doVR4jWrQQLwqaQ4T5WC
 9+wTRx0CwcjNh7syglwn+2MkbQWiNz4T93fXk/JKZlhrJ+AE7N26OeTvqOPIq1D8Y3GC
 llIDUA4HiXYg5b/+x5I9uWxP6zAo9m1dp4HkZPNt25Ht6YBD0+w1mp5Q4n+TTkbUSG6W
 kT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C7jLksjOJJsFch2DtS4JWxdZh/lf/Foi7hOT0zPMhWE=;
 b=urJosg5gmDQzrS7ODS+uXNmCO/100V7WNB2pMoXzAPCoDvXucVaby+xZZCQQaZH54h
 Rnae5xd1nX9LDLHWdYxLG4EFj1tjoCpKVZPEoFM/PqkLIaNVW0v0Z1PC9Gw4uSauhjee
 /ZmnOkpxrbo+CWHZQM/+4OQfnAEarY20DAtUamJ9bjF3B+GjfV/csy/400yot0XdkksK
 sb37EAA6cbiXRX2KgpnpUYZYxk7kJqn6/DRWbD3PvnqzMfT7EPR7rNNshfABKURsWTMv
 2h7fTb51iNNwzVdcjt3mOKhz4BSg8yvBWujtJEUSRVNfGU8WqTKkrbos+NubSL3y5j8b
 e/+w==
X-Gm-Message-State: AOAM531vPTow1xGr54p8DCREflKCmbjQpjIANTP5swS3OINwRsN59SPT
 bQsCS/xIQrpZ35hYk4U+HniOig==
X-Google-Smtp-Source: ABdhPJwZ+PcEluizAa+E+g8PP4hNRe7xRtiQhAafVTq7sOlYiptSgywxArmn8TjV0Ag7m3I2Ua9DMA==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr17340341wrw.439.1637137963761; 
 Wed, 17 Nov 2021 00:32:43 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id r62sm4684956wmr.35.2021.11.17.00.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:32:43 -0800 (PST)
Subject: Re: [PATCH v4 8/9] common-user: Adjust system call return on FreeBSD
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-9-richard.henderson@linaro.org>
 <dddc2e78-27ae-dcb3-6f10-29f935fec9c4@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31127125-7e7e-ac1f-07f9-2f62df6c1f28@linaro.org>
Date: Wed, 17 Nov 2021 09:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <dddc2e78-27ae-dcb3-6f10-29f935fec9c4@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 9:23 AM, Philippe Mathieu-Daudé wrote:
> On 11/16/21 12:02, Richard Henderson wrote:
>> From: Warner Losh <imp@bsdimp.com>
>>
>> FreeBSD system calls return positive errno.  On the 4 hosts for
>> which we have support, error is indicated by the C bit set or clear.
>>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> [rth: Rebase on new safe_syscall_base api; add #error check.]
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-
>>   common-user/host/arm/safe-syscall.inc.S     | 11 +++++++++++
> 
> Can we split this in 2 patches?
> 
>>   common-user/host/i386/safe-syscall.inc.S    | 10 ++++++++++
>>   common-user/host/x86_64/safe-syscall.inc.S  | 10 ++++++++++
>>   4 files changed, 42 insertions(+), 1 deletion(-)

Why 2?

They're small enough that I think having them all together is fine, but otherwise why 
wouldn't I split to 4?


r~

