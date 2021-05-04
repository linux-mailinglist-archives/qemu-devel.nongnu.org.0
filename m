Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66719372594
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 07:45:59 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldnsa-0002Nd-GI
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 01:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldnq9-0001gH-N9
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldnq6-0007My-OH
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620107001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Owqz/x/vCAVVb3OaJFMyHZtNS190ylLnTp+6QValE4=;
 b=JD7voDng8Y58w3P8cspPDV59EExi+I35EDIWcuq31Bmmr3vC3YOMMy6dkCvuDCNNDTe8wv
 ejHyuefef2o7PMWIuA3PgwOkDmqk3qw850Yaybc29pL9jRqcDU5oNwaBYgvcQBtsxyUpvh
 gALvSh2pEPeYZEGDMXiDSza74I/pxPI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-Cj7FTF68POW5j3yzy0PseQ-1; Tue, 04 May 2021 01:43:19 -0400
X-MC-Unique: Cj7FTF68POW5j3yzy0PseQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 91-20020adf94640000b029010b019075afso5252969wrq.17
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 22:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Owqz/x/vCAVVb3OaJFMyHZtNS190ylLnTp+6QValE4=;
 b=ei49kNY5DdfEpwRcmTQuoGmwCXfmtaLS7AJTYLJDl+FXf5RzQc63r89CBjVVNZbGhY
 kvvO70BieQeJ4gNY3gfK9Qsy4ZfAnMlcPWna4nCiBiCR+lBOUJewP/1oTgH1199REvs8
 FAetSts4B1k5uvSUSzwuG4fKXomD6g3YUHIyUjEQodkRtJMKxIZpNX6mb4Z8FNHRyOw7
 IimCyrcwZ3h5LJRPggqhG9eQkVKZ5wPyAWYsN8/0lQ/JUf65n52+Al37McFwcPRy3B2L
 XJ9LGsOpDQaqdnfw89b/LuYLz2RzVqO9kWc/6nWM+XNaF8H2InGIm0T9UbXKCnuP3Gz/
 Fxhw==
X-Gm-Message-State: AOAM531QgmHhYgaKD39odWn+3rJDunj31Hy+ctK0fOM5kWWpXVmUCumZ
 3XoRsDMSOSH96hk+HtS1wnxO3YDN6Y1gCKOuKFxj5yyzo8KI1FunOaE57kRPWRkiDoa1YkM58rO
 gkFfUMGoKpPUu5Q4=
X-Received: by 2002:a5d:59a1:: with SMTP id p1mr29385586wrr.332.1620106998293; 
 Mon, 03 May 2021 22:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrMOQuV0uI+ZHe6hYLMnfx7ZGQt4BRjiEy4cGuuKgGkabVz9MxC5AqF4v5wAAfMcHthgXHVg==
X-Received: by 2002:a5d:59a1:: with SMTP id p1mr29385564wrr.332.1620106998073; 
 Mon, 03 May 2021 22:43:18 -0700 (PDT)
Received: from thuth.remote.csb (p5791d35e.dip0.t-ipconnect.de.
 [87.145.211.94])
 by smtp.gmail.com with ESMTPSA id e10sm14756427wrw.20.2021.05.03.22.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 22:43:17 -0700 (PDT)
Subject: Re: [PATCH 2/3] tests/qtest/rtc-test: Remove pointless NULL check
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-3-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <35182a93-bed8-e6f1-1421-a4daa26604f4@redhat.com>
Date: Tue, 4 May 2021 07:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503165525.26221-3-peter.maydell@linaro.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Corey Minyard <minyard@acm.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 18.55, Peter Maydell wrote:
> In rtc-test.c we know that s is non-NULL because qtest_start()
> will return a non-NULL value, and we assume this when we
> pass s to qtest_irq_intercept_in(). So we can drop the
> initial assignment of NULL and the "if (s)" condition at
> the end of the function.
> 
> Fixes: Coverity CID 1432353
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/rtc-test.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
> index 402ce2c6090..8126ab1bdb8 100644
> --- a/tests/qtest/rtc-test.c
> +++ b/tests/qtest/rtc-test.c
> @@ -686,7 +686,7 @@ static void periodic_timer(void)
>   
>   int main(int argc, char **argv)
>   {
> -    QTestState *s = NULL;
> +    QTestState *s;
>       int ret;
>   
>       g_test_init(&argc, &argv, NULL);
> @@ -712,9 +712,7 @@ int main(int argc, char **argv)
>   
>       ret = g_test_run();
>   
> -    if (s) {
> -        qtest_quit(s);
> -    }
> +    qtest_quit(s);
>   
>       return ret;
>   }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


