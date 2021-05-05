Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D7373CCF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:58:55 +0200 (CEST)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI3D-0002Vp-1J
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leI2E-0001xa-A2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leI27-00055b-JF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620223067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ieaP3xhV9TC3KxDXZX73SbAm73rENQBnFDyXwS4i3k=;
 b=Mdq05q01cSkWOyck9XTMEKh1tGmoVrcCdge7BA0GP0ak17AvITOQA103iUUyPOxtLE/vh/
 NxGaguMV0leiIuybQlBGl9ZN6CTqOJDSdBJNPQJ9QJLCitvTe2EPeXKIVvgnnF5BelBnXn
 vxZMun+j+UrWmEaxUHPzI9KxrY+Rom4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-ZLPuxnDPM0abBWL22iTvGA-1; Wed, 05 May 2021 09:57:44 -0400
X-MC-Unique: ZLPuxnDPM0abBWL22iTvGA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d20-20020adfc3d40000b029010e1a640bbfso725227wrg.21
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 06:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ieaP3xhV9TC3KxDXZX73SbAm73rENQBnFDyXwS4i3k=;
 b=hLf5CFO1nHBucBNNlyq57O9vjXqVPZUVRd2xavXSI3M1VA40C97YoRirecL148rzK2
 tEP0bnUOC3yNU9XxLubMb0PTa4Tx4YsIBfajejGBCm/boBXpAhiLJmfAAg6L/j5uQNIv
 YDSEdLrECciBcnydQTkHeehemQjiqRXqDAsubDY5xoOZc05JtvJcKEB3pgoHb7q9lPMf
 tDjqBeuND8/NaOQJ8+OngXLAdjXo8Mt8dnIrFGwBJ+Bhw3x4UksF/jkGjK4nl7SZ6UxA
 eeNvn8NlTxnJ1jU4zIoyV48/6EagCpXY6KXdqAQjIOwGkxyKevxD8QqLYiMhz6ZLq7dT
 alcA==
X-Gm-Message-State: AOAM530IYMvwl38sZf0vTLeafKLuWqR61WfV/eM08YqEudfaTAo6R5n6
 OkVUuy78tAb91iilENUqrX8sryPN4Xta3xigSZQHPKOZRtYJgOmGs0p0q/KvaNf2ioHcnr7RL7d
 WMRK3cYMU2Zs6h2k=
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr21156360wrw.361.1620223063262; 
 Wed, 05 May 2021 06:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIFbZ1CkBn0IbEK2RJGK33BkNrMxKXjI5egZSvnDKCzp7UE1IxhNylBTuERfTRpirdrUskbw==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr21156349wrw.361.1620223063114; 
 Wed, 05 May 2021 06:57:43 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83394.dip0.t-ipconnect.de.
 [217.232.51.148])
 by smtp.gmail.com with ESMTPSA id r36sm6312675wmp.18.2021.05.05.06.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 06:57:42 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210505135516.21097-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <43132be3-eae3-9dee-f93a-375fb5737634@redhat.com>
Date: Wed, 5 May 2021 15:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505135516.21097-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2021 15.55, Peter Maydell wrote:
> In the glib API, the distinction between g_assert() and
> g_assert_true() is that the former is for "bug, terminate the
> application" and the latter is for "test check, on failure either
> terminate or just mark the testcase as failed".  For QEMU, g_assert()
> is always fatal, so code can assume that if the assertion fails
> execution does not proceed, but this is not true of g_assert_true().
> 
> In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
> include some assertions that are just guarding against possible bugs
> in the test code that might lead us to out-of-bounds array accesses.
> These should use g_assert() because they aren't part of what the test
> is testing and the code does not correctly handle the case where the
> condition was false.
> 
> This fixes some Coverity issues where Coverity knows that
> g_assert_true() can continue when the condition is false and
> complains about the possible array overrun at various callsites.
> 
> Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/npcm7xx_pwm-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
> index bd15a1c294b..a54fd70d273 100644
> --- a/tests/qtest/npcm7xx_pwm-test.c
> +++ b/tests/qtest/npcm7xx_pwm-test.c
> @@ -201,7 +201,7 @@ static int pwm_module_index(const PWMModule *module)
>   {
>       ptrdiff_t diff = module - pwm_module_list;
>   
> -    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
> +    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
>   
>       return diff;
>   }
> @@ -211,7 +211,7 @@ static int pwm_index(const PWM *pwm)
>   {
>       ptrdiff_t diff = pwm - pwm_list;
>   
> -    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
> +    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
>   
>       return diff;
>   }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


