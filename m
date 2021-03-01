Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6F3282F0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:04:15 +0100 (CET)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGl1q-0002p8-7w
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lGl0K-0001zX-3t
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lGl0G-0007hn-WE
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614614554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2RJfsA23A4gpMl/6pL7vfPWnAklr3TJrlZkrk/t++M=;
 b=h4V0clGNk2mQxja/KOXqeM2/YiR4L3YtI7VoZ02Py+osDpwqXUPO3BQFlP5Z2yLNydnajV
 QZrLo8iMk302XJfrUXjTRExETfSNtDM8R2wbLQSnSI0OMhHaIVXHFtc9s63VMqPd6muSpy
 FCPU6OxHpsU9e0bPLtntZH5ZhHJsgQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-7YxPxqyaMraW3Wav7HA6WA-1; Mon, 01 Mar 2021 11:02:33 -0500
X-MC-Unique: 7YxPxqyaMraW3Wav7HA6WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39491107ACC7;
 Mon,  1 Mar 2021 16:02:31 +0000 (UTC)
Received: from work-vm (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D524219C45;
 Mon,  1 Mar 2021 16:02:25 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:02:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Wangxin (Alexander)" <wangxinxin.wang@huawei.com>, mst@redhat.com
Subject: Re: [RFC]migration: stop/start device at the end of live migration
 concurrently
Message-ID: <YD0QD+6IZ2LkNnRN@work-vm>
References: <c716d92c659149f6bdb00c9aa642abf9@huawei.com>
MIME-Version: 1.0
In-Reply-To: <c716d92c659149f6bdb00c9aa642abf9@huawei.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Wuchenye \(karot,
 Cloud Infrastructure Service Product Dept\)" <wuchenye@huawei.com>,
 "Zhoujian \(jay\)" <jianjay.zhou@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wangxin (Alexander) (wangxinxin.wang@huawei.com) wrote:
> Hi all,

(copying in Michael for vhost user maintainer).

> We found that the downtime of migration will reach a few seconds when live
> migrating a huge VM with 224vCPU/180GiB/16 vhost-user nics (x32 queues)/
> 24 vhost-user-blk disks(x4 queues), most of the time is spent in the
> position of stopping the device at src and starting device at dst.

I suspect that's more vhost-user devices than anyone else has run on a
single VM!

> Our idea is to stop the device through multiple threads during the end of
> migration. To be more specific, we create thread pool at the beginning of live
> migraion, when migration thread call virtio_vmstate_change callback to stop or
> start device in vm_state_notify, it will submits request to thread pool to
> handle the callback concurrently.
> 
> We live migrate the vm and count the cost time at different stages of
> stopping/starting devices.
> 
>   -       -     -                 Cost: Original    With state change concurrently
>                 get vring base             36ms          18ms
>         disk    disable guest notify       48ms          32ms
>                 disable host notify        300ms         120ms
> Src             get vring base             1376ms        294ms
>         net     disable host notify        1011ms        116ms
>                 disable guest notify       59ms          40ms
>  -       -      -
>                 enable guest notify        310ms         97ms
>         net     set memtable               48ms          20ms
>                 enable host notify         2022ms        114ms 
> Dst             enable host notify         312ms         78ms
>         disk    enable guest notify        32ms          23ms
>                 set memTable               16ms          10ms
> Total Downtime                             5600ms        962ms
> 
> However, there are some side effects:
> 1. When disable host notify or guest notify concurrently, the vm will be crashed
> due to disabling same notify at the different threads, we now add two different lock
> to solve this problem, it is hacking to do so and may be resulting in other problems.
> 
> 2. As the QEMU BQL will be held by migration thread before stopping device in
> migration_completion, there will be deadlock in the following scene:
> migration_thread                              [thread 1]
>   set_up_multithread
>   ...
>   migration_completion()# get QEMU BQL
>     qemu_mutex_lock_iothread()
>     vm_stop_force_state()
>     ...
>       submit stopping device request
>       to thread pool
>                                            virtio_vmstate_change
>                                              virtio_set_status
>                                              ...
>                                                memory_region_transaction_begin
>                                                ...
>                                                  prepare_mmio_access
>                                                    qemu_mutex_iothread_locked()# N
>                                                    qemu_mutex_lock_iothread()# deadlock
> 
> Now we add another lock to replace the BQL in this scene to solve the problem,
> but we think this is not reliable enough and has potential risk that other
> processes will also use the QEMU BQL during the process of stopping device. My
> question is: how to deal with the conflict with QEMU BQL properly.
> 
> Any advice will be appreciated, thanks.

To me it feels like the other way here would be to explicitly split
each of these stages into two; one where it sends the request to the
vhost device and the other it waits for the response from the vhost-user
device;  (i.e. in the vhost_user case after the vhost_user_write but
before the vhost_user_read) - so instead of parallelising everything in
threads, you'd parallelise all of the corresponding operations;
so all of the get_vring_base's happen at the same time.

Michael: Would this make sense as a thing to change VhostOps
get_vring_base and many of the others into two part operations?
(or maybe coroutines with a yield in???)

Dave
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


