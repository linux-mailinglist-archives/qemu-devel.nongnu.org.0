Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477C44434D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:49:59 +0100 (CET)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxv4-0006rn-37
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhxsu-0004zl-9n
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mhxsl-0004fj-2B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJVMjPHL43qm7IfhEJqlSuGShEPUft018yvv2OfH7/Y=;
 b=YgZySjhTSxF+k8aeD5HpuypXtojmnY/8mSc4SU+bRtYKg5PGepxWHzzjb3uH0oc7IbTv1N
 1GZpk4RQlY4YGz7VDY7x8t0cRVA0QdLKWfeutySov5s3+S1b95XylnxdVQBRkzlyrfsmcW
 896NmVwgYK3t7d/m7veTDjW69tkpd0s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-RfPnxI7yNy2JAaRHmgkL1w-1; Tue, 02 Nov 2021 13:47:33 -0400
X-MC-Unique: RfPnxI7yNy2JAaRHmgkL1w-1
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso1501368wms.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zJVMjPHL43qm7IfhEJqlSuGShEPUft018yvv2OfH7/Y=;
 b=FueBRNI8vK6Aq7IIAsHn3OTQieuXwqR5yX6ntD5IVxysbJmKPxOM+IcAcH8J+6D9Qk
 3SI7J1No8Or1HJpHhjP7XNRRGroQ0t5sviJXYgoRou4RMvdS+rJBATySluCiIGT+mvmq
 G+ClAVUgmTggIWIyHuGEipcBuOaz1NHF7gGH6SQjFxSNLhYsnFOH4SRCsb3ryMNGeciJ
 9AAm/XnH9LsAa7JaPhegyjPKfW5QBUAfI8Klq+2LRh0lbT80Cltlkj921YUny1lbu/tr
 K4ee+mVUWney472zsttOQwiWGCeyapYjpzdqbneWwAelnQnzM4WiUZw/0M41OLo7d3Dr
 FZhw==
X-Gm-Message-State: AOAM531W/xq7VO6vP2XRRG9/OiBLRq609IMN9Hc58tirXs+ac5uQ01H5
 S4ZguKe1e1AuRXj3xZPXplTyZKh3pUfQWW7ai7shrW+Ot1mh1fGJMwjuDIjra1pAilt7DyD2zoH
 I3R/k3JAnnT11Nd4=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr3233692wrs.249.1635875251828; 
 Tue, 02 Nov 2021 10:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdGd0VRNU+jPDvxJ4yvjIzHfy4N+IAKaqiQVFw1Zkdxz9OTncpMwXVyBHRziB5pWMMgB2tug==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr3233676wrs.249.1635875251649; 
 Tue, 02 Nov 2021 10:47:31 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id u13sm18809621wri.50.2021.11.02.10.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:47:31 -0700 (PDT)
Message-ID: <fcd90239-6152-fde8-db95-a3692ae151ba@redhat.com>
Date: Tue, 2 Nov 2021 18:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
To: quintela@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
 <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
 <20211102130811-mutt-send-email-mst@kernel.org>
 <87v91afozo.fsf@secure.mitica>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87v91afozo.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 18:26, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> On Tue, Nov 02, 2021 at 06:06:51PM +0100, Laurent Vivier wrote:
>>> On 02/11/2021 16:04, Michael S. Tsirkin wrote:
>>>> On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
>>>>> As the guest OS is paused, we will never receive the unplug event
>>>>> from the kernel and the migration cannot continue.
>>>>>
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>
>>>> Well ... what if user previously did
>>>>
>>>> pause
>>>> start migration
>>>> unpause
>>>>
>>>> we are breaking it now for no good reason.
>>>>
>>>> Further, how about
>>>>
>>>> start migration
>>>> pause
>>>>
>>>> are we going to break this too? by failing pause?
>>>>
>>>>
>>>
>>> TL;DR: This patch only prevents to migrate a VFIO device as failover allows
>>> to start a migration with a VFIO device plugged in.
>>>
>>> Long Story:
>>>
>>> * before this patch:
>>>
>>> - pause and start migration and unpause-> fails if we unpause too late
>>> because we migrate a VFIO device, works otherwise
>>
>>
>> confused about this one. can you explain pls?
> 
> Pause the guest.
> Start migration.
> 
>       if (migration_in_setup(s) && !should_be_hidden) {
>          if (failover_unplug_primary(n, dev)) {
>               vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>               qapi_event_send_unplug_primary(dev->id);
> 
> We send the unplug request, but the guest is paused.
> 
>               qatomic_set(&n->failover_primary_hidden, true);
> 
> callbacks, callbacks, callbacks.
> 
>          while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
>                 qemu_savevm_state_guest_unplug_pending()) {
>              qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>          }
> 
> And we are not able to get out of that loop, because we never get to the
> point where the guest send the unplug command.
> 
> So, the only other thing that I can think of is putting one timeout
> there, but how much?  That is a good question.
> 

Please, no timeout, IMHO timeout is worse than a clean exit on failure.

Thanks,
Laurent


