Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA133806F7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 12:12:31 +0200 (CEST)
Received: from localhost ([::1]:36100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhUnt-0001dy-A5
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 06:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhUlV-0000n8-R2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 06:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhUlS-0007lA-JE
 for qemu-devel@nongnu.org; Fri, 14 May 2021 06:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620986988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7iTKYzdL/3G5+9zOuEKzoFhFMiIn1pa4FaTDVd4H/4=;
 b=gkZBz06Bw7tNJPxynx1K89cnCLwxGMZZfuZnkuYljbw8utWbi6sWh5Lk5KRNBYdDC4xEmF
 0p3J7rctR7IVbYnx7nQiKUdIgzDcHMQbRgBfcXRcKil4YvR8lhEhNbYcP27ilKGTWFuD28
 byabQA6Jt12d7rNnGrbCZbpNytBA85o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-6F5dOpDpMoSCpS7R19J8qw-1; Fri, 14 May 2021 06:09:46 -0400
X-MC-Unique: 6F5dOpDpMoSCpS7R19J8qw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f8-20020a1c1f080000b0290169855914dfso925239wmf.3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 03:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j7iTKYzdL/3G5+9zOuEKzoFhFMiIn1pa4FaTDVd4H/4=;
 b=FefB0u0+ggA8RWT5hpoB4niTgu2yNYZM3WqCaC+XPgwNEW6NYhmh20IGQiQYbFvXwy
 kQbv/cYfnxLW+Z2QGD9ygAGYHbfzBBdnlAXqN7Z5T9YxuBFKPCSKOty8vdj9wMAM7pWF
 bV+Aw6p3alvipsWvxvabTV1V4yqtLz18p2kdj73rw4c8fmW1CR9Jlc457dgl5TeeSIo8
 wIwjZONn1HD/V2zbgT7XPai0+8hFBI+LSzEmkjzSsRsCAEGS/I9hmH+OgSycdeYiVyi9
 3pltZebaBzs0RfKK2w8ysIlb1wrjWZLAlGtTfDDe2BUua/6JxrosABcr8m6wk+zo3tCK
 e04Q==
X-Gm-Message-State: AOAM5302adSZZX12ADkODgyRfJE3bnq8Q4NhMJVqhOXjEbMt0Z//RmqV
 Q+zfnyH9xAwBHGotX4o0SbVGto9h/vjHEOOpzZlXLp9+oTbxwLTDD0oaHU7bsr3U4yFhpyW8T3e
 peiWStVRHpbkso7b6m/sbl/6beR/tsV/dSNQrQ/zbspyaT5vmU4w7qBqn23LI1NU=
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr57980660wrw.309.1620986985693; 
 Fri, 14 May 2021 03:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+w02gT8ZCSyjKsVENTfBCgzsi5toF00XzgIpwoI99HEkYEncE5BKUfG+yjjIj+PMorVppTg==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr57980615wrw.309.1620986985292; 
 Fri, 14 May 2021 03:09:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id m11sm4772911wmq.33.2021.05.14.03.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 03:09:44 -0700 (PDT)
Subject: Re: [PATCH 3/3] pc-bios/s390-ccw: Add a proper prototype for main()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-4-thuth@redhat.com>
 <1539bd87-8ba2-9015-ecfe-753af61847f2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <30134a03-459f-5029-fb57-48e266bb2d41@redhat.com>
Date: Fri, 14 May 2021 12:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1539bd87-8ba2-9015-ecfe-753af61847f2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 21.54, Philippe Mathieu-Daudé wrote:
> On 5/12/21 7:15 PM, Thomas Huth wrote:
>> Older versions of Clang complain if there is no prototype for main().
>> Add one, and while we're at it, make sure that we use the same type
>> for main.c and netmain.c - since the return value does not matter,
>> declare the return type of main() as "void".
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   pc-bios/s390-ccw/main.c     | 3 +--
>>   pc-bios/s390-ccw/s390-ccw.h | 1 +
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
>> index 5d2b7ba94d..835341457d 100644
>> --- a/pc-bios/s390-ccw/main.c
>> +++ b/pc-bios/s390-ccw/main.c
>> @@ -281,7 +281,7 @@ static void probe_boot_device(void)
>>       sclp_print("Could not find a suitable boot device (none specified)\n");
>>   }
>>   
>> -int main(void)
>> +void main(void)
>>   {
>>       sclp_setup();
>>       css_setup();
>> @@ -294,5 +294,4 @@ int main(void)
>>       }
>>   
>>       panic("Failed to load OS from hard disk\n");
>> -    return 0; /* make compiler happy */
>>   }
>> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
>> index 79db69ff54..b88e0550ab 100644
>> --- a/pc-bios/s390-ccw/s390-ccw.h
>> +++ b/pc-bios/s390-ccw/s390-ccw.h
>> @@ -57,6 +57,7 @@ void write_subsystem_identification(void);
>>   void write_iplb_location(void);
>>   extern char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
>>   unsigned int get_loadparm_index(void);
>> +void main(void);
> 
> Can we keep the forward declaration in the source?

There are two main() functions, one in main.c and one in netmain.c, that's 
why I think it's better to declare the prototype only in one place, i.e. in 
a header?

  Thomas


