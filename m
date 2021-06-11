Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F73A4119
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:16:48 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrf9b-0006Vt-4H
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrf7W-0003Hq-4o
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrf7T-0007bg-MO
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623410071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXNtjK5OetjXysskRCFF+3DETn5Zto55rEzFFjb5ztc=;
 b=F/9hYq/buiBm/iDUCuqbCnNt/bS/yRjMZ3z/lgorJikA+YocMMAxHtr+UoyDktHyS8sCR2
 1xGxEIKyWzRV662yuTMLNdqENHIEfgKhdV+EnvSbFqk6htdS+MpmO7xepP8KES83LavHei
 oz5aYoTGRO3bcseUnDdPm5zj72M+wAI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-sCFz6iZHMHmXwwfU6E_F-w-1; Fri, 11 Jun 2021 07:14:30 -0400
X-MC-Unique: sCFz6iZHMHmXwwfU6E_F-w-1
Received: by mail-wm1-f72.google.com with SMTP id
 w3-20020a1cf6030000b0290195fd5fd0f2so4323472wmc.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXNtjK5OetjXysskRCFF+3DETn5Zto55rEzFFjb5ztc=;
 b=pCQqD732vYlslr/WIrdRKyB1VcjNUCFrPduJ6Yu4sFu9AL0HVX0neXICmJf6fCudnz
 iNmTUTu189nugYIO4hmvR9Fwi/NQshsVeuh9jSTSvrmigu36ZLYEHauHGb/GBVETJepI
 yEnP6OPimF5d3W6UJoPFmVEOwXcQCRrPo5w4Obrxs7DDcohAsQZtmV7ew35sbCcwZeOV
 NNwNKsROWB5Ie/iH1SQBRJHV1BdhIs/Y7YLKlqWBIr9VMBXbnuy/B0Up2igRkfiokVDB
 mI/Du01l5/YVIdvRxn7wLJlY/XcykjdnAX+iuOpjTT8UE+dpxIWGT3b4PM3bBV9NkOMA
 7ACg==
X-Gm-Message-State: AOAM530i3UiBJDxXKjKPb4WodscmHEjNjing2+XFJ6h+dGVVlfdlzNVs
 /mOQ+0aB8E3N6vn9RfpUCe+oF3TDrKgkAoYbRr2Ty7GgfexTlF1+kz7y/cmUmlXyZZveQCvrE7f
 PB709OkWNY8/hoYE=
X-Received: by 2002:a1c:c911:: with SMTP id f17mr3519741wmb.60.1623410069100; 
 Fri, 11 Jun 2021 04:14:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxROBIq1dmz3C1uqwo1JIKZRlts2jyBLINjbncC7xIfCxwD3O2TITppp8jEXFStb+ip7a18A==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr3519721wmb.60.1623410068923; 
 Fri, 11 Jun 2021 04:14:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm5798223wmc.29.2021.06.11.04.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:14:28 -0700 (PDT)
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210609122234.544153-1-pbonzini@redhat.com>
 <0f6e48bc-6c72-63b5-a3d5-ec2696437237@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c5ed6cf3-4517-bfc3-ddef-49f4444d2048@redhat.com>
Date: Fri, 11 Jun 2021 13:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0f6e48bc-6c72-63b5-a3d5-ec2696437237@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: eesposit@redhat.com, qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 17:01, Vladimir Sementsov-Ogievskiy wrote:
> 09.06.2021 15:22, Paolo Bonzini wrote:
>> If we want to wake up a coroutine from a worker thread, aio_co_wake()
>> currently does not work.  In that scenario, aio_co_wake() calls
>> aio_co_enter(), but there is no current AioContext and therefore
>> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
>> then attempts to call aio_context_acquire() instead of going through
>> aio_co_schedule().
>>
>> The default case of qemu_get_current_aio_context() was added to cover
>> synchronous I/O started from the vCPU thread, but the main and vCPU
>> threads are quite different.  The main thread is an I/O thread itself,
>> only running a more complicated event loop; the vCPU thread instead
>> is essentially a worker thread that occasionally calls
>> qemu_mutex_lock_iothread().  It is only in those critical sections
>> that it acts as if it were the home thread of the main AioContext.
>>
>> Therefore, this patch detaches qemu_get_current_aio_context() from
>> iothreads, which is a useless complication.  The AioContext pointer
>> is stored directly in the thread-local variable, including for the
>> main loop.  Worker threads (including vCPU threads) optionally behave
>> as temporary home threads if they have taken the big QEMU lock,
>> but if that is not the case they will always schedule coroutines
>> on remote threads via aio_co_schedule().
>>
>> With this change, qemu_mutex_iothread_locked() must be changed from
> 
> Did you miss "qemu_mutex_iothread_locked() stub function"?

Yes, that comment refers to the stub.  Let me resubmit with a testcase 
and I'll fix that too.

Paolo


