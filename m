Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED7683159
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsRb-0001G6-7E; Tue, 31 Jan 2023 10:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMsRC-000132-TZ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:20:48 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMsRB-0006LG-78
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:20:46 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so4444374pjd.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=va6oU1EImw0x8a6DIjrXN1+gz4hzHzQKhFHKmMW02LI=;
 b=Sq185LbAOP7JgY4CPX/st1HlDk/r5yZOBf0Wnt+/vgFpDQa6q0ZZaWKjXtT3Yx0c5j
 XijNoukRIw0lsSngSpdEF5iLGANBfldoXGsb61RKI1bCNcO4clqyjYvH0tG/7lOOKZq4
 f1WLHDNWPaTSVOQDZrI5prt7J/P868Ox5vRm3iuEE7wkpp2GNAgVcnOcKNqSsE+/XzX5
 pEfZj/pIiAL4YQ0NUrBuhNvQ8V2WetOFkWjPtM1rfIL27StpXrWYLWjj4BUoa/R3T8rD
 PcxC75ctsUnfau65trdKVQzJJvIIxdmh+T7gUqyw1i8OpnWGcVcJCQqoY/DByhkx+nkq
 k1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=va6oU1EImw0x8a6DIjrXN1+gz4hzHzQKhFHKmMW02LI=;
 b=ZffhKqRzkshvywJPwPdIIn4CmO+dXieFXUatQWVVXFZJ5OKafr5TB2O8+ttTEYDK9V
 hvrnkAJf61RXk7SIe6rmhGBA0MpBIzN9J9+Ys9aCQOBvERFWbs+no4RqgB50Er5PTl6g
 xXakOm/yvtLNYYK0S3XLl7+CYS7v1Kza4CsjOCr8UKe0w+rnKCglzI04La4p/n+W7cGg
 YS7NRdLfrO7DupBZiaUtOcYlFKJhN0wIs3e6DjQflXFzlmpOsp+tuW3wTV/kzg1N85vA
 /dqy70D0yMJGr4TdNXH5N0guIkM87tFcGgxorUCfGarxd16i8EKc2JRNrRX6MBDpU+Ui
 2iiA==
X-Gm-Message-State: AFqh2kp0jgKpNoEk1AK8XgXdCSWXJXXizCwmY+eSSPsM/ZRXnkFkq1Ox
 E8zJsQXzyDNGBG6e9MY3XgRF6w==
X-Google-Smtp-Source: AMrXdXsylZ8FijlQ+BJhnUPJWdRU6yLzHH/ecfCUM5Wl50xNH2PJzd5BkSPNiNPC6nvjtM1WwMDoUA==
X-Received: by 2002:a17:90a:30d:b0:225:f901:ebf8 with SMTP id
 13-20020a17090a030d00b00225f901ebf8mr56356356pje.18.1675178442261; 
 Tue, 31 Jan 2023 07:20:42 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a4-20020a17090a740400b0022bab07f578sm10950204pjg.11.2023.01.31.07.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 07:20:41 -0800 (PST)
Message-ID: <6960d240-b65c-62af-a1a8-3d36a07fd232@linaro.org>
Date: Tue, 31 Jan 2023 05:20:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] readconfig-test: add test for accelerator
 configuration
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230117080745.43247-1-pbonzini@redhat.com>
 <20230117080745.43247-5-pbonzini@redhat.com>
 <2f17c06f-90a9-9bac-8e9a-a1a2842665d2@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2f17c06f-90a9-9bac-8e9a-a1a2842665d2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/31/23 05:18, Thomas Huth wrote:
> On 17/01/2023 09.07, Paolo Bonzini wrote:
>> Test that invalid configurations do not cause a SIGSEGV, and cover a
>> valid configuration as well.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   tests/qtest/libqtest.c        | 28 +++++++++++++++++-----
>>   tests/qtest/libqtest.h        | 12 ++++++++++
>>   tests/qtest/readconfig-test.c | 45 ++++++++++++++++++++++++++++-------
>>   3 files changed, 70 insertions(+), 15 deletions(-)
>>
>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>> index 64ba98bc5853..53d766fe3fa5 100644
>> --- a/tests/qtest/libqtest.c
>> +++ b/tests/qtest/libqtest.c
>> @@ -402,6 +402,26 @@ static QTestState *G_GNUC_PRINTF(1, 0) qtest_spawn_qemu(const char 
>> *fmt, ...)
>>       return s;
>>   }
>> +QTestState *G_GNUC_PRINTF(1, 0) qtest_init_bare(const char *args)
> 
> I think you don't need the G_GNUC_PRINTF here, do you?

Indeed, it is incorrect.


r~


