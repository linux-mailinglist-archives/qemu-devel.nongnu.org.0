Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A2379498
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 18:53:16 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg99e-0002Si-V6
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 12:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg98m-0001KS-0l
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg98j-0001eQ-Vy
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620665537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvJ84Iq0mUXWhTCrshAhUOTVJktyeGHgk2vrzoIFcXc=;
 b=OQNgH5fI7pyEG6MgEs8l3WcAjQKkmk+ecdjeqE0+c8v4HfIC4cOP+F3NXs9qJOjSu8ulR5
 pAx3JIm8oP32KQhuUIKbsP3aSz1TwJVZ4X4ou8AlFzX3a+s6KkhnhxwFEGoygAC6OTfV65
 m4CxpGvafvc+r5uib72CPbr3Obh6rX0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-iYGxGbq0OhukxOzaXXdhHg-1; Mon, 10 May 2021 12:52:15 -0400
X-MC-Unique: iYGxGbq0OhukxOzaXXdhHg-1
Received: by mail-ed1-f69.google.com with SMTP id
 d18-20020aa7d6920000b0290388b4c7ee24so9437262edr.12
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 09:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CvJ84Iq0mUXWhTCrshAhUOTVJktyeGHgk2vrzoIFcXc=;
 b=Ip4ZSIxkBRce+SrlEJ6+Me6ZN680jfvf4CJdeXLK59+Xt4U1aB81cMs0qjkuNK0ZtS
 f6bCuR8TRISschGBRz5V6Goqfi6DrTdoO16k2+hWLXTFMs865OB+DrlO3D6SfTsXJrQc
 MhfPPSF+wd4cojU67aSQ5169orMteaKWzEVwIREseRuxUEEQGWtuNLbhLa6x0lrAB4lw
 5/mIYTgqQoD6U4lp6Fs2Yk2vrLb2+XFz5D5SSz3HXZgS16/WtfgXKuVITMAD0BWjBspE
 cqgE6SNsnzefPpRTA6khiCAE2UTK/ZGj/0JCNF1SEbzzu9fjuX6tOxc7Bk8WmJgfQJKh
 zkYA==
X-Gm-Message-State: AOAM531J2+6fjKPIE+mvely3UDxuBq2es+5i8PPZXg/PWta07qc+CjLu
 WaaMBHaavvjCYNwFUUeIQIE0WwKT6vMyImAR4YD6hY/WiTloCLgU3QRjE7vtlSutDc4OZzHQhfh
 PTb37/NQl1fuKaQ/rmLJnebM6OMxY2ZV7wJV5m31z5EazJlAEsDGqkSZawsR5lTe9UTQ=
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr30539174edt.55.1620665534025; 
 Mon, 10 May 2021 09:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyroBNBzBjEKm1rLfHD75+khWmb05+Ug6lEnzXFJzV9FVriKDW+/DJFVwd9CYfl5o+wAOXsug==
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr30539128edt.55.1620665533627; 
 Mon, 10 May 2021 09:52:13 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 q16sm11965675edv.61.2021.05.10.09.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 09:52:13 -0700 (PDT)
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
 <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <3d7d8bf6-a750-045a-0e47-5c496995e1c8@redhat.com>
Date: Mon, 10 May 2021 18:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/05/2021 13:28, Vladimir Sementsov-Ogievskiy wrote:
> 10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
>> Progressmeter is protected by the AioContext mutex, which
>> is taken by the block jobs and their caller (like blockdev).
>>
>> We would like to remove the dependency of block layer code on the
>> AioContext mutex, since most drivers and the core I/O code are already
>> not relying on it.
>>
>> The simplest thing to do is to add a mutex to be able to provide
>> an accurate snapshot of the progress values to the caller.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   blockjob.c                    | 33 +++++++++++++++++++++++++--------
> 
> [..]
> 
>> --- a/include/qemu/progress_meter.h
>> +++ b/include/qemu/progress_meter.h
>> @@ -27,6 +27,8 @@
>>   #ifndef QEMU_PROGRESS_METER_H
>>   #define QEMU_PROGRESS_METER_H
>> +#include "qemu/lockable.h"
>> +
>>   typedef struct ProgressMeter {
>>       /**
>>        * Current progress. The unit is arbitrary as long as the ratio 
>> between
>> @@ -37,21 +39,50 @@ typedef struct ProgressMeter {
>>       /** Estimated current value at the completion of the process */
>>       uint64_t total;
>> +
>> +    QemuMutex lock;
>>   } ProgressMeter;
>> +static inline void progress_init(ProgressMeter *pm)
>> +{
>> +    qemu_mutex_init(&pm->lock);
>> +}
>> +
>> +static inline void progress_destroy(ProgressMeter *pm)
>> +{
>> +    qemu_mutex_destroy(&pm->lock);
>> +}
> 
> 
> Could we instead add a c file and add the structure private? Then we'll 
> have progress_new() and progress_free() APIs instead.
> 
> This way, it would be a lot simpler to control that nobady use structure 
> fields directly.
> 
Makes sense, I'll do it.
> 
> 
>> +
>> +static inline void progress_get_snapshot(ProgressMeter *pm,
>> +                                         uint64_t *current, uint64_t 
>> *total)
>> +{
>> +    QEMU_LOCK_GUARD(&pm->lock);
>> +
>> +    if (current) {
>> +        *current = pm->current;
>> +    }
>> +
>> +    if (total) {
>> +        *total = pm->total;
>> +    }
>> +}
> 
> We don't have caller that pass only one pointer. So we can just do
> 
> *current = pm->current;
> *total = pm->total;
> 
> implicitly requiring both pointers to be non NULL.

Is it so performance critical that we need to skip these safety checks?
IMHO we can keep it as it is.

Thank you,
Emanuele
> 
> 
> 


