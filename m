Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AEC3891CF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:47:10 +0200 (CEST)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNTZ-0001ei-Ii
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNRa-0000NN-6S
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:45:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNRY-0000z1-OL
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621435503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QS6nwM5tBd4j3mZ2aJlTJ76jlQmIP4ly2OZyVlYNy4c=;
 b=LAErzeA4EHCqwMtTnS7Z8GV/+CplHY9cT3sv8DjFZD1MpSecgidmgGO+NedQEHUgCtvTQO
 hwPG5kU+tLprEWGXO/39XkVnea8xUfLcD1GkrN6r/f5AybyypQRrkRRqS9fFnirfnyX98u
 JV/VlBe4vcMepIlDwZ9abCM39bkeZyQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-IGDOaD7UNviiMLS1tUDcTA-1; Wed, 19 May 2021 10:45:02 -0400
X-MC-Unique: IGDOaD7UNviiMLS1tUDcTA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p11-20020adfc38b0000b0290111f48b8adfso3765543wrf.7
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QS6nwM5tBd4j3mZ2aJlTJ76jlQmIP4ly2OZyVlYNy4c=;
 b=BDWTIvRhvX5kyw6vmOTzWBUawbwstB0jmdwqIf9z8bnpU1TM9jks/9+sdnRun9xN9x
 GKkz26I6in00FeX51OeuCmTIjQnhcvbjS8i/ppT4wHdPdy8L7m18gQ5EhDyiEEN6ttsh
 0fEQVRP4ym7J9kiZppAHV+87DWhXMSaNmtFOmzIF0+6ptuUrGvzxh0oRWbL16930Mlj6
 9BnF0HQZytQi7sAW8gWowovQ91W+nr2ZxOk+i/ycO++dkBu82wpKBsfCQD0qcQwUoSsk
 4BLY2yHwijHH4JQMjjLUxTM+HLq/6RKU2mc441jss7zk5hfwcc9feByJB41oe2zihA8Q
 0gOA==
X-Gm-Message-State: AOAM533AP4h+iXOBMB2ALEksbbPIByJJWP6eogzQ9YDUWv6pXotI5zA4
 jrRg1z9wPQfEzbSFniV6zA/727lFqPi6QtqsNux3smICsMM7wsnvDy7UMJ/XrlCRwSYM0OMHer6
 4ytn4X4AefPj4N6m5LOYDrjEPKs9ZwRUp0Ybu+4JvzMghbFv/veE8sCZIyRTPJcWlCoY=
X-Received: by 2002:a1c:2802:: with SMTP id o2mr11892748wmo.170.1621435500620; 
 Wed, 19 May 2021 07:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHlLIVrcsfw0zQyvWqC9lcqiQrd9JResqpoClVJlcsWOHmXUvUrQHM2oEdo4LgvzCN5B/GWQ==
X-Received: by 2002:a1c:2802:: with SMTP id o2mr11892726wmo.170.1621435500322; 
 Wed, 19 May 2021 07:45:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b81sm7719076wmd.18.2021.05.19.07.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 07:44:59 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-2-pbonzini@redhat.com> <87wnrwcfpx.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] cirrus-ci: test installation
Message-ID: <0d6cf9dd-2c82-188c-10fd-f0cd37d1552f@redhat.com>
Date: Wed, 19 May 2021 16:44:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnrwcfpx.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 15:50, Alex Bennée wrote:
>>   macos_xcode_task:
>>     osx_instance:
>> @@ -47,7 +48,7 @@ macos_xcode_task:
>>     script:
>>       - mkdir build
>>       - cd build
>> -    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
>> +    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules --disable-strip
> So what's the --disable-strip about? Surely we don't rely on the
> installer packaging to do that for us?

It was simply testing both with and without strip, to make sure that 
there wasn't anything macOS-specific.

Paolo


