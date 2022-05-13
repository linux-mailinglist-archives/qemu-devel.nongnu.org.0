Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B652653C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:50:39 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWco-0000tV-AP
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWba-00008F-Da
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWbX-000746-G5
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652453358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iggW8M9c0sXd3OomzDq4dgkDX7qZlsrKjQMghkBcLc8=;
 b=MfrGx0Xq4/s1KFS/oZYWGycBJ+hTNKBa/NalokY0n31xKbcQm6+XQxFR7UgnOu4MbI5Xtm
 pZ9E8c44vQTp/HzHWmvgqThTmtlFQ0VGikEJg1wqh77IEjty1gWXuqBUftgXqSoG3gYW8F
 9ig5hOnEAK/+GNkxZwHQWyXnpAeef/0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-7yvCco7kN-y89aQRmnUJrQ-1; Fri, 13 May 2022 10:49:17 -0400
X-MC-Unique: 7yvCco7kN-y89aQRmnUJrQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so3010790wma.4
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=iggW8M9c0sXd3OomzDq4dgkDX7qZlsrKjQMghkBcLc8=;
 b=UJN0qa0i14PWYMPuYxtgeCSygG2Sm9RgW6ebQLsgpcH6aGl/x01IeL9teEmaFCJl/t
 bXcueIjEC1xfgmr38pKi+wIvBYj032ZX21QKB1dreRY5QeDbdjUVlEctFmjkoNCmBV+H
 cvnQV40g2ZSqxZRargtT6ED1IwtmOA0Dt09N2vihO8ZBPaTlEXk0njZYon7XaG1rotvB
 DCiXt4Z/SWHJRyS52TnVx021C9oNN9YJ+HzGZPxJ3SGa/9GbGV/zGwY/hcnsfaINDZVq
 wFPXcwHyr+sGqhwFIm949BSdJkGZDy+dII2aD4sBysg8fyBW+I2yacqozTFGmxYgGqx0
 SNCg==
X-Gm-Message-State: AOAM530bwyi2eDnzO7d41kZ/Au/RbZLebakpU2ZQ8MAgz7clzb11K/9L
 tEGAGTjufxGa/LjgMFd2rO1Z0znolLW573/tHNSdandjpxpd7jQ0ED9tzJhWKnTNT0SznuJUpc3
 u3sb80DBsVZ89P1Q=
X-Received: by 2002:a05:600c:a01:b0:395:c416:d82d with SMTP id
 z1-20020a05600c0a0100b00395c416d82dmr7258095wmp.88.1652453356228; 
 Fri, 13 May 2022 07:49:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyUXWdOF6AKD0E4TO/Ns0bQ+tXHDy+xeIFUahAZnjX+YhUq09NS8ULNHBA1hYZbJVOMAE6Dg==
X-Received: by 2002:a05:600c:a01:b0:395:c416:d82d with SMTP id
 z1-20020a05600c0a0100b00395c416d82dmr7258076wmp.88.1652453355971; 
 Fri, 13 May 2022 07:49:15 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 z1-20020a05600c220100b003942a244f53sm5402826wml.44.2022.05.13.07.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:49:15 -0700 (PDT)
Message-ID: <4dc1e95b-e3ed-1605-5e53-b25162c1d932@redhat.com>
Date: Fri, 13 May 2022 16:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tests/qtest: kill off QEMU with SIGKILL when qtest exits
 abnormally
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220513143743.198390-1-berrange@redhat.com>
 <0377cbbc-1d6c-67bc-eaef-aec105694088@redhat.com>
In-Reply-To: <0377cbbc-1d6c-67bc-eaef-aec105694088@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13/05/2022 16.47, Thomas Huth wrote:
> On 13/05/2022 16.37, Daniel P. Berrangé wrote:
>> If a qtest program exits without calling qtest_quit(), then the
>> QEMU emulator process will remain running in the background forever.
>>
>> Unfortunately this scenario is exactly what will happen when a
>> g_assert() check triggers an abort().
>>
>> Prior to switching to use of 'meson test', this problem would
>> cause tap-driver.pl to hang forever. It was waiting for its
>> STDIN to report EOF, but that would never happen due to the
>> ophaned QEMU emulator processes keeping the pipe open forever.
>> Fortunately this doesn't happen with meson, but it is still
>> desirable to not leak QEMU processes when asserts fire.
>>
>> Using the Linux specific prctl(PR_SET_PDEATHSIG) syscall, we
>> can ensure that QEMU gets sent SIGKILL as soon as the controlling
>> qtest exits, despite being daemonized.
>>
>> Note, technically the death signal is sent when the *thread* that
>> called fork() exits. IOW, if you are calling qtest_init() in one
>> thread, letting that thread exit, and then expecting to run
>> qtest_quit() in a different thread, things are not going to work
>> out. Fortunately that is not a scenario that exists in qtests,
>> as pairs of qtest_init and qtest_quit are always called from the
>> same thread.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   tests/qtest/libqtest.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>> index 228357f1ea..553e82e492 100644
>> --- a/tests/qtest/libqtest.c
>> +++ b/tests/qtest/libqtest.c
>> @@ -19,6 +19,9 @@
>>   #include <sys/socket.h>
>>   #include <sys/wait.h>
>>   #include <sys/un.h>
>> +#ifdef __linux__
>> +#include <sys/prctl.h>
>> +#endif /* __linux__ */
>>   #include "libqtest.h"
>>   #include "libqmp.h"
>> @@ -301,6 +304,21 @@ QTestState *qtest_init_without_qmp_handshake(const 
>> char *extra_args)
>>       s->expected_status = 0;
>>       s->qemu_pid = fork();
>>       if (s->qemu_pid == 0) {
>> +#ifdef __linux__
>> +        /*
>> +         * If the controlling qtest process exits without calling
>> +         * the qtest_quit() method, the QEMU processes will get
>> +         * orphaned and remain running forever in the background.
>> +         *
>> +         * Missing qtest_quit() calls are, unfortunately, exactly
>> +         * what happen when a g_assert() check triggers abort() in
>> +         * a failing test scenario.
>> +         *
>> +         * This PR_SET_PDEATHSIG setup will ensure QEMU will
>> +         * get terminated with SIGKILL.
>> +         */
>> +        prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
>> +#endif /* __linux__ */
>>           if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
>>               exit(1);
>>           }
> 
> Would it make sense to install a signal handler for SIGABRT instead and make 
> sure that we tear down the QEMU instance there? ... that would then also 
> work for other non-Linux operating systems?

Wait, we're doing that already ... why doesn't it work for your case?

  Thomas



