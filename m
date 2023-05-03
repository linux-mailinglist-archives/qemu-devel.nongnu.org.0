Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE16F5555
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:52:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu99K-0003Uj-Ax; Wed, 03 May 2023 05:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu99H-0003KA-Vr
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:51:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu99E-0007fW-Ks
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683107503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8C7eAF3BkV6fTbkBLLehxwlHzgJPLF8jk3ZWdlnriAc=;
 b=OXDO8Zb6X3abBu6geh7ZQZywQrzB7fn6JkfXctCH/Te48KrHVm2Vb+IdkYsB51BLml7QwL
 p7/rbQmLSuDWYlrg82146OviGBEzeBNLM0G1PUB3TZCrAWbXlbkrcbiehVnbbk1T+3MKr/
 dyB7j2ZwyglLOJAMGlylNKo6uBsc0RY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-LxlSkuiLPt-C74lZyizjSw-1; Wed, 03 May 2023 05:51:42 -0400
X-MC-Unique: LxlSkuiLPt-C74lZyizjSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f321e60feaso16624905e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107501; x=1685699501;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8C7eAF3BkV6fTbkBLLehxwlHzgJPLF8jk3ZWdlnriAc=;
 b=b6BVI+40i9q41mgS7m5cS0Q8Ug0WfKf5BozykZawL04ZJfGdGXNHcphM+QDBoBEOno
 DO5ojlJHi0m8OPS/4ha8Cpcp34g8Y80FiawLicwKM3zGbmmUGQlxUZ7LbJxGuMuKf8Ta
 6ZVWHDR9o7qkC1Y4IB7clES1kJIjjoR1uNgSQWvQ3/kydSlU+aagpngm6bRcgc/+07oz
 iu3QDJBRcmiXoUnLjTP1Cqul5NOoZkkfDzchvzWA5REHSBHtBeIVfi4iRtKt973ewC+Y
 XLlpSoLesfyxlB/9fzskfu/wCTUgixwyVXqoIGSb9s51HHPdbs2mc072AQrCYgSL+tAE
 P+kw==
X-Gm-Message-State: AC+VfDysWButdS2oY7OjYvgc9Swk7r1ASY8Z+kU81scdvmO3VkZjl85J
 /DzUUbK6goo3MAd/7Toibcdw6QBhfgN62TE4UA4dct+Iy16lx4weIqYJKhVwXdoujLNY98tdZ+6
 cepL3GdN2V38vY/Y=
X-Received: by 2002:a05:600c:243:b0:3f0:7eda:c19f with SMTP id
 3-20020a05600c024300b003f07edac19fmr14576584wmj.11.1683107501238; 
 Wed, 03 May 2023 02:51:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4x11LP8Apv5BgGbv4m2uc4QlGVAlTWpb5pWczpFbtojXSvhLTmDlHPBJwuQ4WV0OIl+CBnaA==
X-Received: by 2002:a05:600c:243:b0:3f0:7eda:c19f with SMTP id
 3-20020a05600c024300b003f07edac19fmr14576543wmj.11.1683107500908; 
 Wed, 03 May 2023 02:51:40 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b003021288a56dsm32451125wrs.115.2023.05.03.02.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:51:40 -0700 (PDT)
Message-ID: <a4fe1cc0-aad3-c77e-5e05-b5e6e32d69bf@redhat.com>
Date: Wed, 3 May 2023 11:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 22/22] tests/qtest: skip bcm2835-test if no raspi3b model
In-Reply-To: <20230503091244.1450613-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 03/05/2023 11.12, Alex Bennée wrote:
> We can't assume the machine exists and should gracefully skip the test
> if we haven't built the model. This is ostensibly fixed by
> db2237c459 (tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI)
> but I still hit it during my tests.

The problem is likely that you build aarch64-softmmu with the minimal 
config, but still keep arm-softmmu around with the full config? Then 
CONFIG_RASPI will still be set at the meson.build level since it is taken 
from config-all-devices.mak here.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/bcm2835-dma-test.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
> index 8293d822b9..2e6245e9e2 100644
> --- a/tests/qtest/bcm2835-dma-test.c
> +++ b/tests/qtest/bcm2835-dma-test.c
> @@ -107,12 +107,11 @@ static void bcm2835_dma_test_interrupts(void)
>   
>   int main(int argc, char **argv)
>   {
> -    int ret;
>       g_test_init(&argc, &argv, NULL);
> -    qtest_add_func("/bcm2835/dma/test_interrupts",
> +    if (qtest_has_machine("raspi3b")) {
> +        qtest_add_func("/bcm2835/dma/test_interrupts",
>                      bcm2835_dma_test_interrupts);
> -    qtest_start("-machine raspi3b");
> -    ret = g_test_run();
> -    qtest_end();

Where did the qtest_end() go?

It's maybe cleaner if you move the qtest_start() and qtest_end() calls into 
the bcm2835_dma_test_interrupts() function instead.

  Thomas


> -    return ret;
> +        qtest_start("-machine raspi3b");
> +    }
> +    return g_test_run();
>   }


