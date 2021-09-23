Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997041592F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 09:37:50 +0200 (CEST)
Received: from localhost ([::1]:42988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTJIj-0007x0-1G
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 03:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTJHR-0006TA-Al
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTJHN-0007Iw-Fs
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632382584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CoP0thARdeTPemimHQ7zP25ax0Lu0ZBJw0EM47IUfmY=;
 b=hbiTPp0JXqfGyKJhbjUUr2F2DI199M3TTS70K0xbdiPg93hSpDzu9v1iLJYE3PobarcFRQ
 bWLrGWh/Uktt3kQZCKGY6q9+Azl3QtJZGdsvXi1CuCAwKIiyaJI6+6PM7lI1DPGsxj1t1U
 DImQtJEYXUe1DwiHJRib+LhvTKwSJ50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-VmZLdIK7PTSDq-pTy1tmoA-1; Thu, 23 Sep 2021 03:36:23 -0400
X-MC-Unique: VmZLdIK7PTSDq-pTy1tmoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9199A100C660
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 07:36:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 576EB60854;
 Thu, 23 Sep 2021 07:36:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBBB5113865F; Thu, 23 Sep 2021 09:36:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
References: <20210922125734.79712-1-david@redhat.com>
 <YUtOTk+R9G8spK6a@work-vm>
Date: Thu, 23 Sep 2021 09:36:20 +0200
In-Reply-To: <YUtOTk+R9G8spK6a@work-vm> (David Alan Gilbert's message of "Wed, 
 22 Sep 2021 16:39:58 +0100")
Message-ID: <87fstvhhfv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael
 S . Tsirkin" <mst@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * David Hildenbrand (david@redhat.com) wrote:
>> We want to rate-limit MEMORY_DEVICE_SIZE_CHANGE events per device,
>> otherwise we can lose some events for devices. As we might not always have
>> a device id, add the qom-path to the event and use that to rate-limit
>> per device.
>> 
>> This was noticed by starting a VM with two virtio-mem devices that each
>> have a requested size > 0. The Linux guest will initialize both devices
>> in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
>> one of the devices.
>> 
>> Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Michal Privoznik <mprivozn@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> 
>> Follow up of:
>>     https://lkml.kernel.org/r/20210921102434.24273-1-david@redhat.com
>> 
>> v1 -> v2:
>> - Add the qom-path and use that identifier to rate-limit per device
>> - Rephrase subject/description
>> 
>> ---
>>  hw/virtio/virtio-mem-pci.c | 3 ++-
>>  monitor/monitor.c          | 9 +++++++++
>>  qapi/machine.json          | 5 ++++-
>>  3 files changed, 15 insertions(+), 2 deletions(-)
>> 
>> diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
>> index fa5395cd88..dd5085497f 100644
>> --- a/hw/virtio/virtio-mem-pci.c
>> +++ b/hw/virtio/virtio-mem-pci.c
>> @@ -87,6 +87,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>>      VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
>>                                           size_change_notifier);
>>      DeviceState *dev = DEVICE(pci_mem);
>> +    const char * qom_path = object_get_canonical_path(OBJECT(dev));
>>      const uint64_t * const size_p = data;
>>      const char *id = NULL;
>>  
>> @@ -94,7 +95,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>>          id = g_strdup(dev->id);
>>      }
>>  
>> -    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
>> +    qapi_event_send_memory_device_size_change(!!id, id, *size_p, qom_path);
>>  }
>>  
>>  static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
>> diff --git a/monitor/monitor.c b/monitor/monitor.c
>> index 46a171bca6..21c7a68758 100644
>> --- a/monitor/monitor.c
>> +++ b/monitor/monitor.c
>> @@ -474,6 +474,10 @@ static unsigned int qapi_event_throttle_hash(const void *key)
>>          hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
>>      }
>>  
>> +    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
>> +        hash += g_str_hash(qdict_get_str(evstate->data, "qom-path"));
>> +    }
>
> It makes me wonder if all these entries could turn into:
>   str = qdict_get_try_str(qdict, "qom-path");
>   if (str) {
>       hash += g_str_hash(str);
>   }
>
> and then stop worrying about checking each eventtype there?

Prone to accidental capture when we add to event data later on.  I feel
it's better to be explicit.


