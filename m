Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB932F23C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:16:29 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF00-0007WE-8g
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lIE5s-0000or-SX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:18:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lIE5q-0000Dr-Av
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614964703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l549FkSjJaU1J6PrhCb9ns4RKCvHclZlszja7wQ+Dwo=;
 b=gla2kkYYPOMSU1wLgtLH48iazMWrqf/6WJ1+aj+RAi8Fh3kcR+/73OYo8nlgDUvmOTLxLp
 fELG5FOKd6nSHM+k5F6bpCDyq6OoKxJeiMloicfU7v9ZuP135iAXFVE7QJyvKu8zV+CTM9
 iyYJg/g0f/eDLdd1a7x2QQzhNf5L5P4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-w8B5lbiEM1Gyc4ZgnTLpXA-1; Fri, 05 Mar 2021 12:18:19 -0500
X-MC-Unique: w8B5lbiEM1Gyc4ZgnTLpXA-1
Received: by mail-wm1-f69.google.com with SMTP id n25so1084866wmk.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l549FkSjJaU1J6PrhCb9ns4RKCvHclZlszja7wQ+Dwo=;
 b=EiYHktqKkXSECEprrRzFzEcrEV4SBY+SNXwdrRyOfQZD6KTTmg+sAVGHqQy36MMHqs
 fov1dp/PDYhgP+2S51jltnFpKzUQ3ZwJayzKOhnJVujBKCBVyqyMrPPz9Hn5xFqnJ6B1
 L/LGn6BGTsd5ZDe9/dM4ddtJuPdPDZNoB5D+Ww/FINM/Fwh5rLjvYh8wNot9+0/m08RH
 f5/caUtO0dFeAEoJIn54NjCVVgcBeUGwpOvJpU7W3qqTe/LKXVa3jr+sPfqjMNu+5u0D
 n7KKCF2hWlaWJwZM2UDoAAQx3NZrgU4qTZRqNEiNT3TC1OdjXAoCGBeYs876LhonFZtg
 UWDw==
X-Gm-Message-State: AOAM530Lunh621d7lj7/U0awIqDcbr0M4vP0J+gWkyWX9HZHj9BjHVfU
 uBs7yT9cpsgYfWeDq/MO6eW3q59kGhmcZegMdsx0JXMKlZsck6a0tv5b+ekdlAkgoQ0Tn6tC5aK
 6zaCin8Av5DjWm7+LMxiQIzWhsWwGbiqRX6Ty5G0lRIqMtebQ9AsptV6bIsu2avohEMk=
X-Received: by 2002:adf:f852:: with SMTP id d18mr10746642wrq.210.1614964697755; 
 Fri, 05 Mar 2021 09:18:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR9B9G5/Gw7qe8kOZ/Zakx7vYFQJIU/PlJKWFWfNy09M/rq8L3EoV5zkxsiebIF/ISUL/7Xw==
X-Received: by 2002:adf:f852:: with SMTP id d18mr10746614wrq.210.1614964697426; 
 Fri, 05 Mar 2021 09:18:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c11sm5601045wrm.67.2021.03.05.09.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 09:18:16 -0800 (PST)
To: Daniele Buono <dbuono@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
 <5829357a-6759-8314-140c-214016862446@redhat.com>
 <19c10e57-b515-ae96-1924-54103d575a58@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
Message-ID: <de675aaa-0cff-e953-58da-cb0a86daa984@redhat.com>
Date: Fri, 5 Mar 2021 18:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <19c10e57-b515-ae96-1924-54103d575a58@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 05/03/21 17:52, Daniele Buono wrote:
>> diff --git a/net/slirp.c b/net/slirp.c
>> index be914c0be0..82e05d2c01 100644
>> --- a/net/slirp.c
>> +++ b/net/slirp.c
>> @@ -174,23 +174,42 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
>>       return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>   }
>>
>> +typedef struct SlirpTimer {
>> +    QEMUTimer t;
>> +    SlirpTimerCb cb;
>> +    void *cb_opaque;
>> +} SlirpTimer;
>> +
>> +static void slirp_timer_cb(void *opaque)
>> +{
>> +    SlirpTimer *st = opaque;
>> +    st->cb(st->cb_opaque);
>> +}
> 
> This call is still violating CFI (st->cb is a pointer in libslirp), but
> now that we have a specific callback for slirp, we can easily add a
> "QEMU_DISABLE_CFI" decorator to disable CFI only on `slirp_timer_cb`.

Ok, so let's go with your patch for now.  Independently we could change 
libslirp to:

- add a separate callback (timer_new_v2?) in SlirpCb.  If it is set, we 
use it and pass an enum instead of the SlirpTimerCb cb.

- add a function slirp_timer_expired(enum SlirpTimerId timer_id, void 
*cb_opaque) that does the indirection but without passing around an 
arbitrary function pointer.

In 6.1 we will update the internal libslirp to a version that supports 
the new API, through a patch very similar to mine above.  By requiring 
that new version as the minimum supported one, enabling CFI will be 
possible even with system slirp.

You can open a slirp merge request at 
https://gitlab.freedesktop.org/slirp/libslirp.

> The problem is that an attack on the timer is as easy now as it was
> without CFI. You just have to change the timer entry to call
> slirp_timer_cb, and the opaque pointer to a SlirpTimer struct you
> created, anywhere in memory, with a pointer to your own function and
> your own parameters. The call to slirp_timer_cb is valid for CFI, while
> the call to st->cb is not checked anymore.

I understand better now the situation, thanks for taking the time to 
explain it.

Paolo


