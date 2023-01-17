Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650166E120
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:44:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnCE-0006cr-RR; Tue, 17 Jan 2023 09:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHnCA-0006be-Bt
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHnC6-0005l9-9e
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673966648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4X2y0x/yE1wx7qRNmIW7kry4Dk6zX4eDIibxfairG7E=;
 b=I3reOcPHgxIGbPm3AAjtqkCLb8KgglQ5Y+Z3vZBm3sCNCh6YT6Dni2D8K0TE2HAYfHHqcP
 01kuQjJJ4F8R7eOuWJf+IFvOzVpq1hcih7pvbPh5aCX2s23LIzkrj4H4Sa3rIcDFB3PsAX
 KDlULoeHp4Ae2LjDgPV2Y0oB/45ywck=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-212-jG7_FjNzN_ClvUw5aEyQOw-1; Tue, 17 Jan 2023 09:44:05 -0500
X-MC-Unique: jG7_FjNzN_ClvUw5aEyQOw-1
Received: by mail-vs1-f69.google.com with SMTP id
 q63-20020a674342000000b003d224439ed9so2697500vsa.16
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4X2y0x/yE1wx7qRNmIW7kry4Dk6zX4eDIibxfairG7E=;
 b=wKAFQXuyqlpDm9pzxyzK/Yck3uldbBOAiE9Rc/WxxQlegALWiMhyANws2BFWxINzVs
 WQZIz87n34ydaJ4C6Q1iyuRnFP1VyIKKqrKHI3PhMuFB8sOSxA/+aa3kwe9BSqTsenbV
 xfQez70jARU9U7FMnUVP/R9DgrfChlKUbzqZ8ul1w1mc8R9s6QfTBjBropJxjQxaZ4ST
 i47JewjLuCMw0rm/1xuBXBpNU7cJ/gPQ8ZVVERU+x1ymlDytkPVYPX+9sXODgXwyP+ms
 xx2CYSulNOWxyoDgPkyXMR9x9xorFf7/akUP2kDqXOVNiLyKk/vLAcAJRw6sRetLvddI
 xDAw==
X-Gm-Message-State: AFqh2koNcU4EcyAvMWZeHw9uWmTQA37pMuwGeqvwIARc7yJ5l52pT++L
 UDnwQ25JpHyBQMfGrgXn2vEGrtlzzjnRbiEBCbDB2hlq6OEvEqSCalGqG/5EPXUDX1LCcj4zgri
 25j9N39PZMyI5cN4=
X-Received: by 2002:a1f:f881:0:b0:3c0:f6d6:3722 with SMTP id
 w123-20020a1ff881000000b003c0f6d63722mr1555017vkh.11.1673966631879; 
 Tue, 17 Jan 2023 06:43:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCcwm9BjqKQXlrBIoyA5chwrS2FuXOgrWXrA2efaWUlsgLEYvLr3wF8TYmlVQtkO17AsiIZw==
X-Received: by 2002:a1f:f881:0:b0:3c0:f6d6:3722 with SMTP id
 w123-20020a1ff881000000b003c0f6d63722mr1554995vkh.11.1673966631648; 
 Tue, 17 Jan 2023 06:43:51 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 q44-20020a05620a2a6c00b006fc9fe67e34sm6157182qkp.81.2023.01.17.06.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 06:43:51 -0800 (PST)
Message-ID: <e4337549-713c-77e9-dc35-f9f4a1737609@redhat.com>
Date: Tue, 17 Jan 2023 15:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] util/qemu-thread-posix: use TSA_NO_TSA to suppress
 clang TSA warnings
Content-Language: de-CH
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-2-eesposit@redhat.com>
 <48125c54-b421-6ed6-5af9-b05b8b249fd1@linaro.org>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <48125c54-b421-6ed6-5af9-b05b8b249fd1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 17/01/2023 um 15:33 schrieb Philippe Mathieu-Daudé:
> On 17/1/23 14:52, Emanuele Giuseppe Esposito wrote:
>> QEMU does not compile when enabling clang's thread safety analysis
>> (TSA),
>> because some functions create wrappers for pthread mutexes but do
>> not use any TSA macro. Therefore the compiler fails.
>>
>> In order to make the compiler happy and avoid adding all the
>> necessary macros to all callers (lock functions should use
>> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all
>> users of pthread_mutex_lock/pthread_mutex_unlock),
>> simply use TSA_NO_TSA to supppress such warnings.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/qemu/thread.h    | 14 +++++++++-----
>>   util/qemu-thread-posix.c |  2 +-
>>   2 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
>> index 7c6703bce3..81ec9fc144 100644
>> --- a/include/qemu/thread.h
>> +++ b/include/qemu/thread.h
>> @@ -3,6 +3,7 @@
>>     #include "qemu/processor.h"
>>   #include "qemu/atomic.h"
>> +#include "qemu/clang-tsa.h"
> 
> Missing file?     ^^^^^^^^^^
> 
? Forgot to pull latest changes? I see clang-tsa.h in master


