Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D637B5BEE5B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:20:07 +0200 (CEST)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajir-0005ct-Kd
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaetD-0007Qj-F2
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:10:27 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:59930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaet8-0005M0-2G
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:10:21 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id DF7962E136A;
 Tue, 20 Sep 2022 18:10:09 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b65b::1:34] (unknown
 [2a02:6b8:b081:b65b::1:34])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 pBPF8S0ZkA-A8PKgfEN; Tue, 20 Sep 2022 18:10:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663686609; bh=h2mAmP7hlCH6glhmP8ghOdS708MPh03DAfeTYt56V+U=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=1VuwPPIPBHiSZ5ZKCT39dH93QA07TCWljwTXFnxXD1z+RWpBSu81BMVr2V1IH5Z4S
 TLt9GOD4CAZ8Sr7ydb9/sPT/WJD4RR0sXYGKati9KrZdWHOlOVigYiw+jC+supDzUF
 YmWY1TUT7fVQIl48fI3s1m0B3PYYitgjYQhfN4j4=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fefba94b-03c3-4c43-55bb-032740f4bd47@yandex-team.ru>
Date: Tue, 20 Sep 2022 18:10:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] virtio: add VIRTQUEUE_ERROR QAPI event
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, mst@redhat.com,
 rvkagan@yandex-team.ru, yc-core@yandex-team.ru
References: <20220919194805.195952-1-vsementsov@yandex-team.ru>
 <87czbqw1aq.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <87czbqw1aq.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.182,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:47, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> 
>> For now we only log the vhost device error, when virtqueue is actually
>> stopped. Let's add a QAPI event, which makes possible:
>>
>>   - collect statistics of such errors
>>   - make immediate actions: take coredums or do some other debugging
> 
> Core dumps, I presume.
> 
> Is QMP the right tool for the job?  Or could a trace point do?

Management tool already can collect QMP events. So, if we want to forward some QMP events to other subsystems (to immediately inform support team, or to update some statistics) it's simple to realize for QMP events. But I'm not sure how to do it for trace-events.. Scanning trace logs is not convenient.

Another benefit of QMP events is that they are objects, with fields, which is better for machine processing than textual trace-events.

> 
>> The event could be reused for some other virtqueue problems (not only
>> for vhost devices) in future. For this it gets a generic name and
>> structure.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   hw/virtio/vhost.c | 12 +++++++++---
>>   qapi/qdev.json    | 25 +++++++++++++++++++++++++
>>   2 files changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index f758f177bb..caa81f2ace 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -15,6 +15,7 @@
>>   
>>   #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>> +#include "qapi/qapi-events-qdev.h"
>>   #include "hw/virtio/vhost.h"
>>   #include "qemu/atomic.h"
>>   #include "qemu/range.h"
> 
> Only tangentially related to this patch, but here goes anyway:
> 
>     /* enabled until disconnected backend stabilizes */
>     #define _VHOST_DEBUG 1
> 
> This is from 2016.  Has it stabilized?

Hmm, I don't know:) It works for us)

But anyway, I agree that error/debug reporting here needs an update. I don't think that dropping the messages is good. Some should be converted to errp-reporting, some to warnings or assertions..

> 
>     #ifdef _VHOST_DEBUG
>     #define VHOST_OPS_DEBUG(retval, fmt, ...) \
>         do { \
>             error_report(fmt ": %s (%d)", ## __VA_ARGS__, \
>                          strerror(-retval), -retval); \
> 
> error_report() is for errors the user can do something about, not for
> debug messages.
> 
>         } while (0)
>     #else
>     #define VHOST_OPS_DEBUG(retval, fmt, ...) \
>         do { } while (0)
>     #endif
> 
>> @@ -1287,11 +1288,16 @@ static void vhost_virtqueue_error_notifier(EventNotifier *n)
>>       struct vhost_virtqueue *vq = container_of(n, struct vhost_virtqueue,
>>                                                 error_notifier);
>>       struct vhost_dev *dev = vq->dev;
>> -    int index = vq - dev->vqs;
>>   
>>       if (event_notifier_test_and_clear(n) && dev->vdev) {
>> -        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d",
>> -                        dev->vq_index + index);
>> +        int ind = vq - dev->vqs + dev->vq_index;
>> +        DeviceState *ds = &dev->vdev->parent_obj;
>> +
>> +        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d", ind);
>> +        qapi_event_send_virtqueue_error(!!ds->id, ds->id, ds->canonical_path,
>> +                                        ind, VIRTQUEUE_ERROR_VHOST_VRING_ERR,
>> +                                        "vhost reported failure through vring "
>> +                                        "error fd");
> 
> Do we still need VHOST_OPS_DEBUG() here?

I think, this should be decided separately from this patch. Here I keep current behavior and add new event.

> 
>>       }
>>   }
>>   
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index 2708fb4e99..b7c2669c2c 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -158,3 +158,28 @@
>>   ##
>>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>>     'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @VirtqueueError:
>> +#
>> +# Since: 7.2
>> +##
>> +{ 'enum': 'VirtqueueError',
>> +  'data': [ 'vhost-vring-err' ] }
>> +
>> +##
>> +# @VIRTQUEUE_ERROR:
>> +#
>> +# Emitted when a device virtqueue fails in runtime.
>> +#
>> +# @device: the device's ID if it has one
>> +# @path: the device's QOM path
>> +# @virtqueue: virtqueue index
>> +# @error: error identifier
>> +# @description: human readable description
>> +#
>> +# Since: 7.2
>> +##
>> +{ 'event': 'VIRTQUEUE_ERROR',
>> + 'data': { '*device': 'str', 'path': 'str', 'virtqueue': 'int',
>> +            'error': 'VirtqueueError', 'description': 'str'} }
> 
> Can the guest trigger the event?

Yes, but as I understand, only once per virtqueue.

> 
> If yes, it needs to be rate-limited.
> 

This may be needed if VIRTQUEUE_ERROR will be shared with other errors. Still adding it now will not hurt I think.

-- 
Best regards,
Vladimir

