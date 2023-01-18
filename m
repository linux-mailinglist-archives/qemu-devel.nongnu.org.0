Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC2671105
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHy16-0004Ek-LT; Tue, 17 Jan 2023 21:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHy12-0004BS-Tk
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 21:17:30 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHy11-0003U2-3V
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 21:17:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 20so8141339plo.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 18:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DB9Icq7WtSvmq3RDtcTGrL1pbzY4Bnfdnk4RbZHNqvM=;
 b=BPh7hDFwpCUzQTg4jVqhvRf2eWLxR+/2Tflwc2v1LBDwIdMPMsEbeDVSMex/qluzzR
 9YkWbt5D1uNPS8S084jYjCXulhVF0TPeuwJfglauY2h9yZQu2AIppapUSNJuK7frKJRP
 Km3evhqyNtKj/9HybsLrOaSD/vsGhlK8CUhI1JGlSxviQIhrr4Dp2qK8nHByrKeXcrNv
 H2pdoLokp884I7kZKB8de/fETfWudC8pIRyURGqa8p2bQT/YPFsNksucvA83WEYBuz6i
 5u4kj+EQsed7R5g6mDqdBdp4BzFyt/RbFea7rR0PaCEEi6q0cOc2/t6jJEe4myNUaTry
 dazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DB9Icq7WtSvmq3RDtcTGrL1pbzY4Bnfdnk4RbZHNqvM=;
 b=gx2D8wm+2THVgIC2/brF8p1VOqSKjA3LY3w9Lk6jxQVjUPw3ShuRDhClAsmSS32hEK
 eIgGVhljilx/3eSRvKk1B8KBsfl0fggOsOL0Sc0G3Fmb64Q7+FjJEYMeT/6Fj8eE2eCW
 e6WjJkmB4m6EM0P6RXZyu2mPbQ/iElUAEdU50FVkRnckPu71w4n4et5tbScmIJTbvoE1
 O56tNxbPnQ7m+Ou8/jX2ZW7Vodpl+tbKYBpKr8CeZ0AZXKm0qfHX6nhZXwKBdFgj7i/2
 SIMtwVfp1z6RSmbUK07KKvdpq+DE3qbftlXfig4dSdcRa6K2vyORF6sLK1OAUtsKAGPQ
 TzXA==
X-Gm-Message-State: AFqh2krEUt0TqY/9vQoyqX5qRqpS85pMRihUH7QiHNI0bVzW37DNTuRK
 NlgJGRy+g36CgfLy62D3MsgkTw==
X-Google-Smtp-Source: AMrXdXvykBL9ks767AaFUzcBp3CsK8nLvh0WwwyuPr4WeW33yab3n4c8uHljaz6qU68iLnf7UCtX9Q==
X-Received: by 2002:a17:903:32c8:b0:194:58e0:488b with SMTP id
 i8-20020a17090332c800b0019458e0488bmr7609669plr.30.1674008245597; 
 Tue, 17 Jan 2023 18:17:25 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p11-20020a1709026b8b00b00186a2dd3ffdsm21851691plk.15.2023.01.17.18.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 18:17:25 -0800 (PST)
Message-ID: <528e6af6-e3ce-9cbb-3483-638793aac470@linaro.org>
Date: Tue, 17 Jan 2023 16:17:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ira Weiny <ira.weiny@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230111163147.71761-1-philmd@linaro.org>
 <988c2552-f378-f028-d11f-1261c0be1281@linaro.org>
 <26c3c3c8-61f5-8f56-9094-1699fcd516ed@linaro.org>
 <4be6001c-b496-574b-499d-7bc0abf57f4b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4be6001c-b496-574b-499d-7bc0abf57f4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/16/23 22:24, Philippe Mathieu-Daudé wrote:
> On 13/1/23 08:05, Philippe Mathieu-Daudé wrote:
>> On 13/1/23 02:05, Richard Henderson wrote:
>>> On 1/11/23 08:31, Philippe Mathieu-Daudé wrote:
>>>> Implement Richard's suggestion to use __builtin_bswap().
>>>>
>>>> Convert to __builtin_bswap() one patch per OS to simplify
>>>> maintainers review.
>>>>
>>>> Since v2:
>>>> - Rebased adapting ./configure changes to meson
>>>>
>>>> Since v1:
>>>> - Remove the Haiku/BSD ifdef'ry (Peter)
>>>> - Include the Haiku VM image from Alexander
>>>>
>>>> Philippe Mathieu-Daudé (6):
>>>>    qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
>>>>    qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
>>>>    qemu/bswap: Remove <byteswap.h> dependency
>>>>    qemu/bswap: Use compiler __builtin_bswap() on Haiku
>>>>    qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
>>>>    qemu/bswap: Use compiler __builtin_bswap() on NetBSD
>>>
>>> If this passes on all the odd OS's, great.
>>> Failure on some oddball is what blocked my patch set years ago.
>>
>> OK I'll double-check.
> 
> Tested successfully on:
> 
> - QEMU GitLab CI
> - Darwin 22.2
> - FreeBSD 12.4
> - NetBSD 9.3
> - OpenBSD 7.2
> - Haiku r1beta4

Great.  Just in case I missed an individual patch, series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

