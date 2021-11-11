Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44B44D5E7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:35:50 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Mv-0008Gf-66
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Ky-0005pz-Hq
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:33:48 -0500
Received: from [2a00:1450:4864:20::42e] (port=36814
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Kv-0006Bb-T2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:33:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s13so9287180wrb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MNjeZJLEsrlupKmy/abmn7RdjYiOywbGi3wvVeRJflw=;
 b=AAJMS/DfOQxUfDP4drRuUCKSBfrSsJb/jO70iVUyxmb7VUx7+rKxgWp0i0RbCFBSS2
 bQzy5nf7QeK/yg6V0Xue/UvIQ7+Yjm93VeeOvNr0lXY43CGNIkORU6D4XOAh7CiUy+fb
 Sa7bumOYIeqckgUztVnOK0n+jUzDNZ1OPW3ae5abIvKKGfwBIm+/8BJTYi644uPq1Jft
 QGQhFcigRrLGfTa6Z1M8t1v6I3UX1yRH+uxWTDv/cOe0EIzwWwtDvpRKwuFb4eDyc9j7
 ORCUEGWAqBYb7x8uz6Z2P0uMstbz5n3J1OeDVxHmxMi4KrREmZJ+CVx427zgurI8KOP2
 CHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNjeZJLEsrlupKmy/abmn7RdjYiOywbGi3wvVeRJflw=;
 b=A+o+WpA1BQhynM2kZQJH17SzcQ+7WsTjGlqLyeV7tqRBBS98VyhHEkZS9tprqEZQBz
 B2wryOVWHrZxA3tuMR8VSBoxeam25v3tw0M7fEkbPdREMZ801Y43eg4D+LnDo5PlC6jD
 jkIxIYCzBA9RbYdrE9gcxuicFI+Ls8cQJSqWi8KSFWO8UrrN0kBXogtOH7Y0gchdt2GW
 uCiOC+soLFPDH3K98R2y5pgOGFHFBt3PUc9dk6E+KTmTt2icvzudMUQoV4ANjBQGRJTn
 1rHVitMuWIzrWuyTSvjC/QWTc+r60p1wRyflwQbrMzRtjjr8ePEX3ce8lY/w1K/2gsTY
 7unA==
X-Gm-Message-State: AOAM533YSZoJ2l5XF+Yz2F83iBuxU/rR7FjwFLv6BIKdFGiMpnHFpUae
 KAoCT2pc0B5vAFDSFu8z6jdVYQ==
X-Google-Smtp-Source: ABdhPJxN9KjFDez1PYxG90APiuX8tc9W49g/EpsuuhO4drm4qgS4RpTTB65FW+iVbi8Q/vEXjIMvxA==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr7926875wrn.257.1636630424345; 
 Thu, 11 Nov 2021 03:33:44 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id h17sm8510300wmb.44.2021.11.11.03.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:33:43 -0800 (PST)
Subject: Re: [PATCH v3 13/20] target/riscv: Fix RESERVED field length in VTYPE
From: Richard Henderson <richard.henderson@linaro.org>
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-14-zhiwei_liu@c-sky.com>
 <8f43db00-bd51-cadc-4c57-0db699a96aa0@linaro.org>
Message-ID: <6b23e7f0-43ff-8782-f193-e5e6394f1ffc@linaro.org>
Date: Thu, 11 Nov 2021 12:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8f43db00-bd51-cadc-4c57-0db699a96aa0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 12:33 PM, Richard Henderson wrote:
> On 11/11/21 6:57 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 52ce670cbe..b48c7c346c 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -105,7 +105,7 @@ typedef struct CPURISCVState CPURISCVState;
>>   FIELD(VTYPE, VLMUL, 0, 2)
>>   FIELD(VTYPE, VSEW, 2, 3)
>>   FIELD(VTYPE, VEDIV, 5, 2)
>> -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
>> +FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
> 
> Or better, remove it in the next patch.

Bah, nevermind.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

