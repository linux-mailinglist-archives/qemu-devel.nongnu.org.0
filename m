Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270E434D08
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:05:28 +0200 (CEST)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCDe-0003v4-Li
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdCAm-0001qi-2z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdCAk-0005IV-8D
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634738544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9tvD2uVaw6BHRYfXuxHv9YxacpMbHzyZxhicdfk/dI=;
 b=dUtQ75uNdaRKjl2WcRBoJcuLnZ0qp18Sk3+VemfRjbL3OWeFTyFASQEtJOdY3RKWRIUgzt
 /yCbjpBJHzjtz5bcCYYAgRPWVISTnEIs5MicQDUENp/gzQN0LJ6wmyhOaxziiY0dxzSLSh
 qjsGA9zCxpukrJLkrx37YG0N7mR9EQ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-o59u4DTXMyOISz3lja_BFw-1; Wed, 20 Oct 2021 09:58:23 -0400
X-MC-Unique: o59u4DTXMyOISz3lja_BFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so407684wmn.6
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=j9tvD2uVaw6BHRYfXuxHv9YxacpMbHzyZxhicdfk/dI=;
 b=MsBqI8bbWJQP2SnfuCdV97dpxY07fK7OZM+qX+9VY/MpdkkNutilyrOTIsKXilnWXJ
 lM6nGS54HZMlGOKexX1HdJYUBWcRbLrZ1fhuI2efq6tpCMl3L1e3HFQgEUu6xr7WARdl
 g3xfWAbFw7qjzo8tOljn5UyWr+qzX0SSxlDErDL+7qUIBUnl/p0d8EOd2eBXmUEfWK0s
 AjArmiyLwMZrfpZzYceZ14f+MwcHrGrEqDY3df4p2/OLSdkjpI1Mp7YMs1NoTB1GcQoF
 COItRvgiew6SjTPvWq5x7VMudyRxnJJTMwFA3OF9YvzRHvo0VC//B1odxbX4TOyn2hKn
 SuZA==
X-Gm-Message-State: AOAM533lYUKux4TydDZ5FI3Ca9BrI6lYoRfSPXpQv3GTGA2Fc0U46IjK
 thvh3exvpIRa/UtmJ8XjJs7mdOs31tq/g2ot1gTD2t+mx1sXyi4zhXIjEW/6OKE9nd/r1nSp311
 dK3PzgFKM1PZR0Ts=
X-Received: by 2002:adf:a28f:: with SMTP id s15mr26658483wra.138.1634738302099; 
 Wed, 20 Oct 2021 06:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzs168PG46px/M2TzuMZiYuv7MlsIqL/aM0rg6z+zlA/zidYsTW13G+b6S7Y6sGqEvEIYRfg==
X-Received: by 2002:adf:a28f:: with SMTP id s15mr26658459wra.138.1634738301882; 
 Wed, 20 Oct 2021 06:58:21 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63d4.dip0.t-ipconnect.de. [91.12.99.212])
 by smtp.gmail.com with ESMTPSA id
 25sm5340278wmo.18.2021.10.20.06.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:58:21 -0700 (PDT)
Message-ID: <99f9b35e-ddb8-7b1c-28fc-324ccb9c1285@redhat.com>
Date: Wed, 20 Oct 2021 15:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
 <YXAeGdkCPh5h+kHg@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
In-Reply-To: <YXAeGdkCPh5h+kHg@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.10.21 15:48, Daniel P. Berrangé wrote:
> On Wed, Oct 20, 2021 at 03:44:08PM +0200, David Hildenbrand wrote:
>> On 18.08.21 21:42, Peter Xu wrote:
>>> This is a long pending issue that we haven't fixed.  The issue is in QEMU we
>>> have implicit device ordering requirement when realizing, otherwise some of the
>>> device may not work properly.
>>>
>>> The initial requirement comes from when vfio-pci starts to work with vIOMMUs.
>>> To make sure vfio-pci will get the correct DMA address space, the vIOMMU device
>>> needs to be created before vfio-pci otherwise vfio-pci will stop working when
>>> the guest enables the vIOMMU and the device at the same time.
>>>
>>> AFAIU Libvirt should have code that guarantees that.  For QEMU cmdline users,
>>> they need to pay attention or things will stop working at some point.
>>>
>>> Recently there's a growing and similar requirement on vDPA.  It's not a hard
>>> requirement so far but vDPA has patches that try to workaround this issue.
>>>
>>> This patchset allows us to realize the devices in the order that e.g. platform
>>> devices will be created first (bus device, IOMMU, etc.), then the rest of
>>> normal devices.  It's done simply by ordering the QemuOptsList of "device"
>>> entries before realization.  The priority so far comes from migration
>>> priorities which could be a little bit odd, but that's really about the same
>>> problem and we can clean that part up in the future.
>>>
>>> Libvirt can still keep its ordering for sure so old QEMU will still work,
>>> however that won't be needed for new qemus after this patchset, so with the new
>>> binary we should be able to specify qemu cmdline as wish on '-device'.
>>>
>>> Logically this should also work for vDPA and the workaround code can be done
>>> with more straightforward approaches.
>>>
>>> Please review, thanks.
>>
>> Hi Peter, looks like I have another use case:
>>
>> vhost devices can heavily restrict the number of available memslots:
>> e.g., upstream KVM ~64k, vhost-user usually 32 (!). With virtio-mem
>> intending to make use of multiple memslots [1] and auto-detecting how
>> many to use based on currently avilable memslots when plugging and
>> realizing the virtio-mem device, this implies that realizing vhost
>> devices (especially vhost-user device) after virtio-mem devices can
>> similarly result in issues: when trying realization of the vhost device
>> with restricted memslots, QEMU will bail out.
>>
>> So similarly, we'd want to realize any vhost-* before any virtio-mem device.
> 
> Ordering virtio-mem vs vhost-* devices doesn't feel like a good
> solution to this problem. eg if you start a guest with several
> vhost-* devices, then virtio-mem auto-decides to use all/most
> remaining memslots, we've now surely broken the abiltiy to then
> hotplug more vhost-* devices at runtime by not leaving memslots
> for them.

You can hotplug vhost-* devices devices as you want; they don't
"consume" memslots, they can only restrict the number of total memslots
if they provide less..

We have this situation today already:

Coldplug/hotplug > 32 DIMMs to a VM. Then hotplug a vhost-user device
that's based on libvhost-user or rust's vhost-user-backend. Hotplug will
fail.

Nothing really different with virtio-mem, except that you can configure
how many memslots it should actually use if you care about above situation.

> 
> I think virtio-mem configuration needs to be stable in its memslot
> usage regardless of how many other types of devices are present,
> and not auto-adjust how many it consumes.

There is a parameter to limit the number of memslots a virtio-mem device
can use ("max-memslots") to handle such corner-case environments as you
describe.

Set to 1 - exactly one ("old behavior").
Set to 0 - auto-detect.
Set to > 1 - auto detect and cap at the given value.

99.999% of all users don't care about hotplug of limiting vhost devices
and will happily use "0". The remainder can be handled via realization
priority. Nothing to confuse ordinary users with IMHO.

-- 
Thanks,

David / dhildenb


