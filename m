Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D746F2D4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:12:00 +0100 (CET)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNtd-00026b-GX
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvNhY-0001oK-UG
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvNhK-00036h-Mq
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639072747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d88Wvm9QLT1FMTmNgdRl9+IMiIkPmChvU1EgygthUbs=;
 b=Qqa4YHGkvluGdfp0PER0pvpbFCgCONFwj0mEhJpL94ikvrwEuv2h1jWb7mLKUHOLSdYHm5
 yDlPLUrCq15Y14W3XqYZFbU7dxuJpWh0Y62DVenhb4gTteduBleKTZyFg8S+TlaNkU0Pd5
 3mcF9R1nK0ngyUEPgI6NiMKjSXoR/og=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-7r4PqBJkNVe3FhZdOKhNtg-1; Thu, 09 Dec 2021 12:59:06 -0500
X-MC-Unique: 7r4PqBJkNVe3FhZdOKhNtg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so5241554wmg.2
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 09:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d88Wvm9QLT1FMTmNgdRl9+IMiIkPmChvU1EgygthUbs=;
 b=qgehabkIClxb9aNUK4eu84P2L2NdmV8Ycajf9JFC5yp9ENwAM07N1WNodFT2IiVALA
 t2pjBgPEx0vIuEPpI4lc17O2W3cKp2JEi427CaRY41BT9zSF9E9T9QcnBHsmoD3+CGvL
 Pt72fGzDfcxYEy2MTgWpl8iJFKKR8xU5I2Jw6PMz4ZQbZtSy3HMO6Nwl1gzw7bc50gbv
 i6CzQDneQrvOQkx+wnXeSpGBWEmG/V5zW1h/zsZHhAXng+fdtaR0v/shjjdmb8jcx6YB
 V2SX0qWq11HZV8VpFDU67VsCLZXWyIMZnhudx0TG7iY9Y6U5fDI9K0N84JRch1XKk85m
 NUng==
X-Gm-Message-State: AOAM530VgaJuZYF/185cWs2T8NFtF4gQFcVr40BNlwwbB2vY6X4iKWqX
 M17hE3g2nfkXRXdcyEcXIPrzqrzsvtyi6I8EFhQ+KhDY/NLl2zI10iOSWjkQCsqesfPtWgkNm+i
 vejQkTdr0xSUvWVM=
X-Received: by 2002:a1c:448b:: with SMTP id r133mr9328440wma.85.1639072744937; 
 Thu, 09 Dec 2021 09:59:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzIztHJVg+k6l6fi6UbvNnCPKQcJynzouhI/Mk2Uw6rn45YKJHdlW2/XJZ25j3FAuIiTU5JQ==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr9328417wma.85.1639072744732; 
 Thu, 09 Dec 2021 09:59:04 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id 4sm547936wrz.90.2021.12.09.09.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 09:59:04 -0800 (PST)
Message-ID: <e28f8b4a-1003-9c8d-bf59-842357b5771b@redhat.com>
Date: Thu, 9 Dec 2021 18:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] scripts: Explain the difference between linux-headers and
 standard-headers
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211209173431.172710-1-thuth@redhat.com>
 <CAFEAcA-oEZWkuH8zc1m1EvZyupjTGBtCtb8Jafk6EhSRcY9hDA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-oEZWkuH8zc1m1EvZyupjTGBtCtb8Jafk6EhSRcY9hDA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/2021 18.44, Peter Maydell wrote:
> On Thu, 9 Dec 2021 at 17:34, Thomas Huth <thuth@redhat.com> wrote:
>>
>> If you don't know it, it's hard to figure out the difference between
>> the linux-headers folder and the include/standard-headers folder.
>> So let's add a short explanation to clarify the difference.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   scripts/update-linux-headers.sh | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
>> index fea4d6eb65..96c7daef94 100755
>> --- a/scripts/update-linux-headers.sh
>> +++ b/scripts/update-linux-headers.sh
>> @@ -9,6 +9,13 @@
>>   #
>>   # This work is licensed under the terms of the GNU GPL version 2.
>>   # See the COPYING file in the top-level directory.
>> +#
>> +# The script will copy the headers into two target folder:
> 
> "folders"
> 
>> +#
>> +# - linux-headers/ for file that are required for compiling on a Linux host
> 
> "files"
> 
>> +#
>> +# - include/standard-headers/ for files that are used for guest device emulation
>> +#
> 
> 
> We could expand on this a little if you like, eg:
> 
> - linux-headers/ for files that are required for compiling on a Linux host.
>    Generally we have these so we can use kernel structs and defines that
>    are more recent than the headers that might be in /usr/include/linux
>    on the host system. Usually this script can do simple file copies
>    for these headers.
> 
> - include/standard-headers/ for files that are used for guest device emulation
>    and are required on all hosts. For instance, we get our definitions of the
>    virtio structures from the Linux kernel headers, but we need those
>    definitions regardless of which host OS we are building on. This script
>    has to be careful to sanitize the headers to remove any use of Linux-specifics
>    such as types like "__u64". This work is done in the cp_portable function.

Sounds like a very good idea! Could you please send this as a patch (since 
this wouldn't be my own words anymore)?

  Thomas


