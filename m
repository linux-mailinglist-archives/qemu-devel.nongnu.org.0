Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035333D1B8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:22:31 +0100 (CET)
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6qM-0006AC-De
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM6k2-0001Vu-4a
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM6jm-0006RA-5x
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615889737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdXK3zZrwuaGLf88qGN3LdZ59vGi1hZflJLE54i21ps=;
 b=gXBtRMkMQzERlJ1Hqwnc2O8TlvW8KshBvRQ8UqPXBchLhWcKc0rpf2jssjQmdCl1PoJIIU
 DS70VwJnvkqhr3xv49akmQmmd4pBzXIEK49HAy++xlqzNzGSifcmKVvNnkyB2rJuPHUtMZ
 sCjhcLXJ1lulxzgC0+k2b9fVs7wOskE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-ooZLnvyjPWmKFM1ekfFW1Q-1; Tue, 16 Mar 2021 06:15:35 -0400
X-MC-Unique: ooZLnvyjPWmKFM1ekfFW1Q-1
Received: by mail-wm1-f70.google.com with SMTP id f9so9404305wml.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DdXK3zZrwuaGLf88qGN3LdZ59vGi1hZflJLE54i21ps=;
 b=TjKhbp77P2HWoQdge29U9PaTVzTCYrFJrWPEWS34lUEyTLY3mvshdJwS1VKvhBHzLJ
 iV4thf+yvvkbou3lGjVj/XI305OT9O2kmG+9WWh5MkrEe92BorvFOZKtmK2ACYEesD2G
 tg7BO5Jr9cJrtH5HIGz3XcmdBp1dcoKd93/bfO1JmVZ7a2Tnne3jG5YF39WCbChUllXO
 KUKP8sAAU8eHAMg3/k1Hpie8PdjpGY4naYsO3xKlqIXZNb3yZGscC3SRWKxMqgmXmZ0V
 QSibohJJK/+a7YyvTBtv3Xweo4J9qQu3auCwN2xEoIesCYTsfB5Qx1ZaEFOAaLoSIowb
 S18w==
X-Gm-Message-State: AOAM53045SWT83pFZgFW+7PzXSdP9zHu5Aelz8RNIPdEOeryHUIQAsDb
 OYrv2jGlMyZ61h/6VfJZleMQnPN8JJ7mfKqXCPPAsAzJVt71dBJ9pB/fKPdwS6OCw3bXLP41p3F
 iriLbVIyQKAaxJ9w=
X-Received: by 2002:adf:c641:: with SMTP id u1mr4076617wrg.332.1615889734393; 
 Tue, 16 Mar 2021 03:15:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK5Q6zWOCLYxAB3+4BvDXEYRaYZBDQ8DZ4WLqtsBH1C/3RxrRoqM5icKojgTqSFRvMrZxrtw==
X-Received: by 2002:adf:c641:: with SMTP id u1mr4076608wrg.332.1615889734174; 
 Tue, 16 Mar 2021 03:15:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r2sm21188848wrt.8.2021.03.16.03.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 03:15:33 -0700 (PDT)
Subject: Re: libqemuutil
To: Markus Armbruster <armbru@redhat.com>
References: <87zgz38o0v.fsf@dusky.pond.sub.org>
 <d0c5aa88-029e-4328-7a53-482a3010c5f8@redhat.com>
 <87zgz34dgv.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <402b68d0-ae55-d69f-5b86-aacd541c3c4b@redhat.com>
Date: Tue, 16 Mar 2021 11:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zgz34dgv.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 11:09, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 16/03/21 10:07, Markus Armbruster wrote:
>>> I suspect the linker happens to pick the one that makes things work,
>>> until something in my patch makes it pick the other one.
>>
>> Ouch.  Fortunately the stub is unnecessary and can be removed.
>>
>> ----------- 8< ------------
>>  From fe45350cc11434efe3461c540bb0f258bbe010f7 Mon Sep 17 00:00:00 2001
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Date: Tue, 16 Mar 2021 05:25:48 -0400
>> Subject: [PATCH] qemuutil: remove qemu_set_fd_handler duplicate symbol
>>
>> libqemuutil has two definitions of qemu_set_fd_handler.  This
>> is not needed since the only users of the function are
>> qemu-io.c and the emulators, both of which already include
>> util/main-loop.c.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> diff --git a/stubs/meson.build b/stubs/meson.build
>> index a054d5877f..8a3e804cf0 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -34,7 +34,6 @@ stub_ss.add(files('ram-block.c'))
>>   stub_ss.add(files('ramfb.c'))
>>   stub_ss.add(files('replay.c'))
>>   stub_ss.add(files('runstate-check.c'))
>> -stub_ss.add(files('set-fd-handler.c'))
>>   stub_ss.add(files('sysbus.c'))
>>   stub_ss.add(files('target-get-monitor-def.c'))
>>   stub_ss.add(files('target-monitor-defs.c'))
>> diff --git a/stubs/set-fd-handler.c b/stubs/set-fd-handler.c
>> deleted file mode 100644
>> index bff7e0a45a..0000000000
>> --- a/stubs/set-fd-handler.c
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -#include "qemu/osdep.h"
>> -#include "qemu/main-loop.h"
>> -
>> -void qemu_set_fd_handler(int fd,
>> -                         IOHandler *fd_read,
>> -                         IOHandler *fd_write,
>> -                         void *opaque)
>> -{
>> -    abort();
>> -}
> 
> Tested-by: Markus Armbruster <armbru@redhat.com>
> 
> I'll include this in my pull request, if you don't mind.

Yes, of course.

Paolo


