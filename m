Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A552A32D782
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:18:26 +0100 (CET)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHqgD-00008S-O7
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHqe5-0007LR-Uv
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHqe0-0006c6-CN
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614874563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZH8ltdsi2RgSAc3fm5Ac1YaHjqzBbwaJO2etfY5fxVE=;
 b=cEzeCgqgPEDL/JyyoT3dH2AlWrqwPESnMxAdqAFTNhHHEg18WzKTpoQZd5yxqX9F56XHsu
 R+l/04NIFzfSrHujI0yxM1kofXOiDOgiyoelX30VFJiVc70FZzFxg4tNK6R4X0/ywR/lTq
 Mr4jfBhjJMWXIezEh5TYXx1zgtdVrbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-nyR0h36YNzGt-HzWECWfzQ-1; Thu, 04 Mar 2021 11:16:02 -0500
X-MC-Unique: nyR0h36YNzGt-HzWECWfzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1703B760C1;
 Thu,  4 Mar 2021 16:16:00 +0000 (UTC)
Received: from [10.36.113.171] (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B601119C48;
 Thu,  4 Mar 2021 16:15:44 +0000 (UTC)
Subject: Re: [PATCH v1 8/9] util/mmap-alloc: support RAM_NORESERVE via
 MAP_NORESERVE
To: Peter Xu <peterx@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-9-david@redhat.com> <20210302175112.GN397383@xz-x1>
 <522c672e-9c16-48ef-24a8-3687b5332b2a@redhat.com>
 <20210302214444.GQ397383@xz-x1>
 <bdc5819e-726a-ed68-6159-f8cfe219d8bc@redhat.com>
 <20210303170508.GT397383@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <4ea4c474-886d-9469-df12-fb5c671f7312@redhat.com>
Date: Thu, 4 Mar 2021 17:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303170508.GT397383@xz-x1>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> I want to warn the user right away that the configuration is messed up and
>> that "reserved=off" is not effective.
>>
>> For anonymous memory, "reserved=off" will start really being useful when
>> having a way to dynamically reserve swap space.
>>
>>>
>>> I think it's fine to have that early failure, it just seems less helpful than
>>> what glibc was doing which shrinks active memory for real, meanwhile there
>>> seems to encode some very detailed OS information into this helper, so just
>>> less charming.
>>
>> It's not nice, but the messed-up Linux implementation is to blame. Just read
>> the Linux man page of the mmap where there is an explicit link to
>> "/proc/sys/vm/overcommit_memory" for this very reason.
>>
>>>
>>> Btw above [1] "fd != -1 && shared" looks weird to me.
>>
>> As we never have shared anonymous memory (and that's good, because it is
>> super weird) in QEMU, we can simplify to
>>
>> "if (shared) { return true; }"
> 
> Yes this looks easier to read.  Maybe you can assert the fd in the block too if
> you are pretty sure of it.

Yes, and I'll also add more comments to clarify.

[...]

>> It's interesting that you also raise this point: I also want to propose
>> dynamic reservation of swap space for shmem in the future. Instead of being
>> per process, this would have to be per file and similar allow to coordinate
>> with the kernel how much memory we are actually intending to use (->commit)
>> such that the kernel can properly account and reject if it wouldn't be
>> possible. If only a single day would have more than 24 hours :)
> 
> Thanks, all you said looks sane.
> 
> I can't say I fully understand what you'd like to propose.  To me, a sane user
> of /dev/shm should really fallocate() on that before using, but I could also be
> wrong.

Even then, no swap space gets reserved / memory gets accounted; as 
accounting is a bit expensive we don't want to do that on fault/discard 
time. It's still a bit of a puzzle.

Also, fallocate() gets pretty useless once you bring memory overcommit / 
virtio-balloon into the picture :(

> 
> Another trivial suggestion is you can also add these function pointers into the
> comment of the helper, e.g., accountable_mapping() as you referenced.  So it
> would be easier for people to understand where these code came from.

Yes, I'll try adding more comments.

-- 
Thanks,

David / dhildenb


