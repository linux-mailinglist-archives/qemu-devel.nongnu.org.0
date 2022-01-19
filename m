Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADA493962
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:19:07 +0100 (CET)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8za-0008Kb-1u
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:19:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nA8ug-0005ck-63
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:14:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nA8uc-0000kp-JO
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642590837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WPNgP+MaxDLrAi4lWJn+xY4Zps/8Q9NWhE+nukw7i4=;
 b=eUsrjG9MrL9fB52KXTIZLXb6qHSv7CGKGXuyQkc/H6Q8bZvAotlS+7iep2e4RYNsD3neqQ
 JXvkWsbPKOuUxrrU7l+UP//ozg8EQ2vBDrX7BPvxl2+9rs2BHXcm7PjpzLQPOremTlQg2/
 KPXxo6b7YEWVour2gISjeyVqkKXQPaw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-RxlCl6dhNnmYUm9JKsHdtQ-1; Wed, 19 Jan 2022 06:13:56 -0500
X-MC-Unique: RxlCl6dhNnmYUm9JKsHdtQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso1658593wmb.9
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 03:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=3WPNgP+MaxDLrAi4lWJn+xY4Zps/8Q9NWhE+nukw7i4=;
 b=E1MPAr1T44pjP075zsGIWMIhcqWAfKUtNKo81sjFmHdvLrp5yPg3b1T/ZMf31PloyB
 iDS62TMvRZTGRYFRTgCWFYgMfIDBq6b9jwzF6EzC1PLc2Amj3r+e11qO1YF+HhfAVMb8
 geRjW+rTrqaatBHX+VJvgp1816uotmOMcs+5O0ltiKIsZeAZadXEZV8Q6QGCqV7iZciT
 13W/f+SKgwMNzeQU5tzoqtUGR+CvfqwemzfaCuNGC38Ft9gMD0edz0/uUwSTopPVLZCk
 +c1l0hn4XB11PYAPDgSuhOJuXmLZUAaQV98YIC/QhaErH7i2G6s2Ro52TYmYZ9wkgYS7
 0lkg==
X-Gm-Message-State: AOAM532RQRqkRYti4GYyIkwVcDDQ4EhpOKXa4Em53GAVGk0jhjSqLPw1
 RMWuqwfxQHXClKr6L5tCEOyjJAJf8qyiyRprLyBCtGrfDcm2xbTCJ2LiebllCnMPev2LvygaPel
 HXlKYOiosSe3HZcA=
X-Received: by 2002:a5d:588e:: with SMTP id n14mr10670679wrf.658.1642590835002; 
 Wed, 19 Jan 2022 03:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZGapidMrsXetZuxoPQwiIzlu94f1YQ4nQ0ueoqMtK8i4oj812SOkmW7M1qnB9SiiX8QSfJg==
X-Received: by 2002:a5d:588e:: with SMTP id n14mr10670665wrf.658.1642590834806; 
 Wed, 19 Jan 2022 03:13:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id g189sm6010805wme.18.2022.01.19.03.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:13:53 -0800 (PST)
Message-ID: <fe510110-38b8-7caa-abfe-2b10d49baa26@redhat.com>
Date: Wed, 19 Jan 2022 12:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 01/16] job.c: make job_mutex and job_lock/unlock()
 public
From: Paolo Bonzini <pbonzini@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-2-eesposit@redhat.com>
 <a353e5a5-2223-0bc6-325a-4c708dce24a9@redhat.com>
In-Reply-To: <a353e5a5-2223-0bc6-325a-4c708dce24a9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 10:56, Paolo Bonzini wrote:
> On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
>> job mutex will be used to protect the job struct elements and list,
>> replacing AioContext locks.
>>
>> Right now use a shared lock for all jobs, in order to keep things
>> simple. Once the AioContext lock is gone, we can introduce per-job
>> locks.
> 
> Not even needed in my opinion, this is not a fast path.  But we'll see.
> 
>> To simplify the switch from aiocontext to job lock, introduce
>> *nop* lock/unlock functions and macros. Once everything is protected
>> by jobs, we can add the mutex and remove the aiocontext.
>>
>> Since job_mutex is already being used, add static
>> real_job_{lock/unlock}.
> 
> Out of curiosity, what breaks if the real job lock is used from the 
> start?  (It probably should be mentioned in the commit message).
> 
> 
>> -static void job_lock(void)
>> +static void real_job_lock(void)
>>   {
>>       qemu_mutex_lock(&job_mutex);
>>   }
>> -static void job_unlock(void)
>> +static void real_job_unlock(void)
>>   {
>>       qemu_mutex_unlock(&job_mutex);
>>   }
> 
> Would it work to
> 
> #define job_lock real_job_lock
> #define job_unlock real_job_unlock
> 
> instead of having to do the changes below?

Ignore all this, please.

Paolo


