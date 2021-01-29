Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB962308CC9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 19:54:10 +0100 (CET)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5YuH-0007yH-Bh
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 13:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5YtM-0007RU-CU
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 13:53:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5YtJ-0007tz-0b
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 13:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611946387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2lQG7NOq1Y30ihZ3JvjW7LHsEzNf1l5ZIU262Ux5yw=;
 b=c0PgIOjsr976CNPR89OESQ0xSsQ9hu4Lw3TcbFho97eBvzcNxipZGJzdi1cOaStyx7zRJ3
 0YGYQjvlWUkJU4g2Ww88KsHp2txdbOWmDSs/aE+xXzKi2KvZeXZUnWhsyn8QfMbda/cD0T
 Y1phN9Ph0/y16LurcAA3uGkojVefAMg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-qHk1PJWYOCmbO7EGzCILVQ-1; Fri, 29 Jan 2021 13:53:04 -0500
X-MC-Unique: qHk1PJWYOCmbO7EGzCILVQ-1
Received: by mail-wm1-f69.google.com with SMTP id q24so3688423wmc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 10:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v2lQG7NOq1Y30ihZ3JvjW7LHsEzNf1l5ZIU262Ux5yw=;
 b=Vg2l0mH3BmqCqLo7ibGs00t5L9WzanZZxoN0ga+085p4h4CQ0I/be1EP9rTuuyGAeG
 RcXvX+VO7hbFvLqmPHkA6SG8toMC/Aci6NmScVZSfwZLGwZE+EhVl7M1rrvybs1CqHCk
 Jhxeay22sf/LItSZTthkPEfg2TJkucBVOdSvqL8W6kseld9dAeHM9U9YECrGbdMUJ5WX
 jWyykhEZdP5Y5eisjN25mK2eNSEhVpUHRcRyzr7iCc2oDsXUtNYBTpCosMkvIXW+15CW
 0SdVdDOxiC13QavUkwUGQT8SXXBFThmOlqBN21fGzEEJXmAc6+xrZ/Q8s5B1bqQUD1AZ
 MYpg==
X-Gm-Message-State: AOAM530RO0i+jVTyxDxu7X6YS6/ArW6opyNhgnPWOaubQvGl85h+ciHU
 CVJC8S0RPuf6dSpw7oceMRW+2kxcCkGQZ2UqJIP1K3BThi7CEmHZz0XS8o1ey6rueFFt022coW4
 XnQOJwIGSxC5drxI=
X-Received: by 2002:a1c:9609:: with SMTP id y9mr5027760wmd.75.1611946382913;
 Fri, 29 Jan 2021 10:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhbUhkw2usSXuyBhWcgXQlVTDKUdIPuIMDaI+Sf+8W+zkgRq8BrEHInJgZztI5WgVvi9yPgw==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr5027741wmd.75.1611946382729;
 Fri, 29 Jan 2021 10:53:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 9sm3199432wra.80.2021.01.29.10.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 10:53:01 -0800 (PST)
Subject: Re: [PATCH v4 09/12] target/arm: Make m_helper.c optional via
 CONFIG_ARM_V7M
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-10-philmd@redhat.com>
 <d9af8896-efec-c850-655e-1d1eb2629762@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d57cc48a-2eb4-011d-7903-91042de507d3@redhat.com>
Date: Fri, 29 Jan 2021 19:53:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d9af8896-efec-c850-655e-1d1eb2629762@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/20 11:48 AM, Richard Henderson wrote:
> On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
>> +arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
>> +
>>  arm_ss.add(zlib)
>>  
>>  arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
>> +arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
> 
> I'm a bit surprised about adding the file twice.
> Since ARM_V7M depends on TCG, isn't the second line redundant?

This does:

if TCG
    if CONFIG_ARM_V7M
        files('m_helper.c')
    else #!V7M
        files('m_helper-stub.c'))
    endif
else #!TCG
    files('m_helper-stub.c'))
endif

So:

if !TCG or !V7M
    files('m_helper-stub.c'))
else
    files('m_helper.c')
endif

There might be a better way to express that in Meson...
I only understood how to do AND with arrays, but not OR.

Paolo/Marc-André, is it possible?

Thanks,

Phil.


