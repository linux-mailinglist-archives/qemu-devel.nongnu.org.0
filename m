Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F147B5E81BF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:28:59 +0200 (CEST)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnQ3-00067K-3y
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obmsR-0008VK-Cl
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 13:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obmsO-0002pY-EE
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 13:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663955651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mp73IV0ep+/4uY3KxjypfRgCkA77Qza2lm120McEpiA=;
 b=M24WyS1hVrU6+9gZggOVF0Zz8iDx5ii8oAUJM/tgy3wahe7SI6jhXDYUwFWcsyPKzTGIIX
 zy3GvNUvZCKnvvSdIrQhc+gwf2jXKezAx0cJknBPXPDo8fR2qqT9N9pYNfrW5pA9WBiSZ9
 li3wH2kyo5R1K77Th2+qzt526ZQfgNs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-4f5ANzrvM0CwELMglllPcg-1; Fri, 23 Sep 2022 13:54:10 -0400
X-MC-Unique: 4f5ANzrvM0CwELMglllPcg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so3805415wmb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 10:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Mp73IV0ep+/4uY3KxjypfRgCkA77Qza2lm120McEpiA=;
 b=3vqm+8BQikpeeJHzAZrP8kZgB1jNNWhg0xsu63kJm4AdIwFOy6DKWDk3HYO2hfJGi1
 l7DTp0nu1SoQKZezO/XpbPIW8O9CfcxlM7RNIL2nsi9q7WR1sPwSYSpdQaDbO55lsR7E
 R2e7nOWRLN0BDuMfxZl2j8/RNesPFj9RzZB3ZCpB4tPS4TN53UwAE1QlANaLYUrzqwYw
 6lcjggr2Y9SfH1lzOfFbQ8gqFx1SzbKFF0M+tMq8V0oSs6zinSVYnor4r2xwkzpwBX0J
 zCgrDWarZmS44YUGdei3ZTzFp1AcSnJ1A4d/du/lvJPAwZb0pIgOlBkDUofNO81Ecwd5
 b+cA==
X-Gm-Message-State: ACrzQf2Go9wtVy0X+BmVwFhr+Cc7oGLW7BR9at1VkG5+8H/WK5JQcedt
 cYwZ7T7ohL6VXNF5HBHl8xz8WQwEO64uD3TyEjbeps0jbqEvzGe1HRcYE9BQsYp1r56522zjyxa
 Z0kYhPExdCP57cdU=
X-Received: by 2002:a7b:ce0d:0:b0:3b4:8728:3e7e with SMTP id
 m13-20020a7bce0d000000b003b487283e7emr6444351wmc.182.1663955648952; 
 Fri, 23 Sep 2022 10:54:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4I0VkPQNWu9lmWlL6n+FYIEBjPo/sd25rUPdT1Nn7QUKcaPUFW5p+9CPjWeAkN9npkbRBqGw==
X-Received: by 2002:a7b:ce0d:0:b0:3b4:8728:3e7e with SMTP id
 m13-20020a7bce0d000000b003b487283e7emr6444346wmc.182.1663955648748; 
 Fri, 23 Sep 2022 10:54:08 -0700 (PDT)
Received: from [192.168.8.103] (tmo-097-189.customers.d1-online.com.
 [80.187.97.189]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c41cb00b003b31fc77407sm2924387wmh.30.2022.09.23.10.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 10:54:08 -0700 (PDT)
Message-ID: <fd1740bf-7b7a-380f-241c-22bcf0628400@redhat.com>
Date: Fri, 23 Sep 2022 19:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 18/39] tests/qtest: libqtest: Install signal handler
 via signal()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-19-bmeng.cn@gmail.com>
 <CAJ+F1CLCX1hbc9ps3nosh76r_MFmp2DrkTwb2Mqi7hEtsEHFAw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1CLCX1hbc9ps3nosh76r_MFmp2DrkTwb2Mqi7hEtsEHFAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2022 21.55, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Sep 20, 2022 at 2:32 PM Bin Meng <bmeng.cn@gmail.com 
> <mailto:bmeng.cn@gmail.com>> wrote:
> 
>     From: Bin Meng <bin.meng@windriver.com <mailto:bin.meng@windriver.com>>
> 
>     At present the codes uses sigaction() to install signal handler with
>     a flag SA_RESETHAND. Such usage can be covered by the signal() API
>     that is a simplified interface to the general sigaction() facility.
> 
>     Update to use signal() to install the signal handler, as it is
>     available on Windows which we are going to support.
> 
>     Signed-off-by: Bin Meng <bin.meng@windriver.com
>     <mailto:bin.meng@windriver.com>>
>     ---
> 
>     (no changes since v1)
> 
>       tests/qtest/libqtest.c | 14 +++-----------
>       1 file changed, 3 insertions(+), 11 deletions(-)
> 
>     diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>     index 8b804faade..f46a21fa45 100644
>     --- a/tests/qtest/libqtest.c
>     +++ b/tests/qtest/libqtest.c
>     @@ -66,7 +66,7 @@ struct QTestState
>       };
> 
>       static GHookList abrt_hooks;
>     -static struct sigaction sigact_old;
>     +static sighandler_t sighandler_old;
> 
>       static int qtest_query_target_endianness(QTestState *s);
> 
>     @@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
> 
>       static void setup_sigabrt_handler(void)
>       {
>     -    struct sigaction sigact;
>     -
>     -    /* Catch SIGABRT to clean up on g_assert() failure */
>     -    sigact = (struct sigaction){
>     -        .sa_handler = sigabrt_handler,
>     -        .sa_flags = SA_RESETHAND,
>     -    };
>     -    sigemptyset(&sigact.sa_mask);
>     -    sigaction(SIGABRT, &sigact, &sigact_old);
>     +    sighandler_old = signal(SIGABRT, sigabrt_handler);
>       }
> 
>       static void cleanup_sigabrt_handler(void)
>       {
>     -    sigaction(SIGABRT, &sigact_old, NULL);
>     +    signal(SIGABRT, sighandler_old);
> 
> 
> I would rather make the usage of signal() specific to WIN32, but it's up to 
> the maintainers to decide what's best.
> 
> Thomas, Laurent, opinions?

I don't mind much either way ... I'd say let's take this patch since it's 
already done and it avoids some #ifdefs in the code.

  Thomas



