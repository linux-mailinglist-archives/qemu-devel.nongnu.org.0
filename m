Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718F371338
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:52:00 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVF9-0001Ft-M6
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldVDy-0000j3-Hs
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldVDw-0002NG-OS
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620035444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+uTF6EdGDH7NA1V63h7BCW3Eix+zrfa7Z/jezRAfWE=;
 b=IgBooYr0AFEv5NJ/Izg8FjJTML5mFJkhWT2SvqKVDKQ+XnzsC7IcI3vEpzb27vf9gRxoS5
 AOJBwa8mIKpu9F9tqvCiSSkB+JebawHE+jv3wXN1PI8ZubuSg9BzJA/Ybf5qWGzj4taDaL
 1CjZI8aUjG/X1LCcS3kJL2LQ6Go8jks=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-VclyGQXkOa6j7S-UAv0a5w-1; Mon, 03 May 2021 05:50:42 -0400
X-MC-Unique: VclyGQXkOa6j7S-UAv0a5w-1
Received: by mail-wm1-f69.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso2254876wme.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+uTF6EdGDH7NA1V63h7BCW3Eix+zrfa7Z/jezRAfWE=;
 b=Dup+Re3bWkU5YVOoRIyWxd7gnITidaPummSRUWowlLBysKCJEPjOymRsG6gDJqteYg
 8MmvQt3JoD0e27nsOjBlf7XrlkqGLA1E3ZXlRPBNJdyU7hepjmmuXbpgXkQDC76/vrEE
 pxRXew8BXrpbj/YXunF+3qq+WSoJxkHvO8kGNoAOv6kB8gDkrHQ7zSDDY++KXEc5uciD
 EMo0TPVd8WePH3KZ62uj/SgTERNKe5Qs7BIc+pNf6W3n2OWY0Io7rwuGhzz2um0NRm5q
 bAiu4Flm5fNJleex56I3Pupcc2r2DRUFKaC2PvzDwvaNXQmRY9fEFP9HuEmmKnwBtRIQ
 zF+Q==
X-Gm-Message-State: AOAM530RpkGwYV//gdlm6FWaHBGqIuzK1zth7WwbM1IcIJmwjR97Ydwj
 VZLG+swJTv0SvvE/mBQPmYclRcSgzb++4aqBI/zsHCozBqT8LIaDuqbFj/tV6Zcpsp4QaHpaFDx
 AysxNNoTHldU7gifX3Z6OJQY30LnKNqYfhhWrrbqw63F6PNkwczSj0EIjra1p2MDq
X-Received: by 2002:a5d:6181:: with SMTP id j1mr24274023wru.16.1620035441409; 
 Mon, 03 May 2021 02:50:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZQz8yY8gNMYsbXeTffTUnVjDSDI4gu1JD/OBVq6Uf+VpQ0djU6t7ltnAVhy0DSrahB3+h7w==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr24274000wru.16.1620035441160; 
 Mon, 03 May 2021 02:50:41 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id g25sm3985339wmk.43.2021.05.03.02.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:50:40 -0700 (PDT)
Subject: Re: [PATCH 3/4] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow
 warning
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-4-thuth@redhat.com>
 <20210503110000.56f175ac.cohuck@redhat.com>
 <8a3e7c60-4b71-aa28-938c-f42259e9435b@redhat.com>
 <000ea451-915f-13d1-aebe-48eeb80277db@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c0169589-5811-8dc5-5e5b-4580927dc90b@redhat.com>
Date: Mon, 3 May 2021 11:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <000ea451-915f-13d1-aebe-48eeb80277db@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:31 AM, Thomas Huth wrote:
> On 03/05/2021 11.30, Philippe Mathieu-Daudé wrote:
>> On 5/3/21 11:00 AM, Cornelia Huck wrote:
>>> On Sun,  2 May 2021 19:48:35 +0200
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>
>>>> When building on Fedora 34 (gcc version 11.0.0 20210210) we get:
>>>>
>>>>    In file included from pc-bios/s390-ccw/main.c:11:
>>>>    In function ‘memset’,
>>>>        inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>>>        inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>>>    pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a
>>>> region of size 0 [-Wstringop-overflow=]
>>>>       28 |         p[i] = c;
>>>>          |         ~~~~~^~~
>>>>
>>>> The offending code is:
>>>>
>>>>    memset((char *)S390EP, 0, 6);
>>>>
>>>> where S390EP is a const address:
>>>>
>>>>    #define S390EP 0x10008
>>>>
>>>> The compiler doesn't now how big that pointed area is, so assume its
>>>
>>> s/now/know/
>>> s/assume/it assumes that/
>>
>> Oops, thanks. Thomas, do you want me to repost this patch fixed?
> 
> I can fix it up in my tree here, no need to resend.

Great, thank you!

Phil.


