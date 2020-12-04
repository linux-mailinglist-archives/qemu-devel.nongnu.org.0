Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F952CF722
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:58:14 +0100 (CET)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klK1l-0007H3-5a
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1klJyR-0005zi-Fd
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1klJyP-0000Rq-4I
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607122483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3+gl4WdbPtXKsRICXKxPE7bk2EupajiaPiAoXQa8RE=;
 b=Si9b+Q4Djw/FgqeY+t/jyqjf9HvG5aW4zkFxhfagnQcigN4q1g4zLV0AnlacgSdQkpP6DV
 iPqlfYk09reqRiGVsCv0nspYI2hRQ5c8EbQxHUww3y9Ypf9A+BrabGhWg6n7q2e5yk5hrX
 YQ7ew4hBCmYnVO8/zB3kzxvgnWx91bA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-FCF1_NG5PxK65nDeFtTnwg-1; Fri, 04 Dec 2020 17:54:40 -0500
X-MC-Unique: FCF1_NG5PxK65nDeFtTnwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E654A80ED9B;
 Fri,  4 Dec 2020 22:54:38 +0000 (UTC)
Received: from [10.3.112.195] (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B6160C04;
 Fri,  4 Dec 2020 22:54:24 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] qapi: More complex uses of QAPI_LIST_APPEND
To: Markus Armbruster <armbru@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-8-eblake@redhat.com>
 <871rgpg27o.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <54de873e-53df-8ed8-291b-d0d17a96d057@redhat.com>
Date: Fri, 4 Dec 2020 16:54:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <871rgpg27o.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 2:50 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> These cases require a bit more thought to review; in each case, the
>> code was appending to a list, but not with a FOOList **tail variable.

>> +++ b/hw/core/machine-qmp-cmds.c
> [...]
>> @@ -294,41 +281,31 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>>  static int query_memdev(Object *obj, void *opaque)

>>          v = qobject_input_visitor_new(host_nodes);
>> -        visit_type_uint16List(v, NULL, &m->value->host_nodes, &error_abort);
>> +        visit_type_uint16List(v, NULL, &m->host_nodes, &error_abort);
>>          visit_free(v);
>>          qobject_unref(host_nodes);
>>
>> -        m->next = *list;
>> -        *list = m;
>> +        QAPI_LIST_APPEND(list, m);
> 
> The old code prepends, doesn't it?

Good catch, will correct and hoist this into 4/7 for v3.

> 
>>      }
>>
>>      return 0;
>> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
>> index cf0627fd01c1..1afcc29a0649 100644
>> --- a/hw/mem/memory-device.c
>> +++ b/hw/mem/memory-device.c
>> @@ -199,7 +199,7 @@ out:
>>  MemoryDeviceInfoList *qmp_memory_device_list(void)
>>  {
>>      GSList *devices = NULL, *item;
>> -    MemoryDeviceInfoList *list = NULL, *prev = NULL;
>> +    MemoryDeviceInfoList *list = NULL, **prev = &list;
> 
> Here, you reuse the old name for the new variable.

>> +++ b/hw/pci/pci.c
>> @@ -1681,41 +1681,34 @@ static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num);
>>
>>  static PciMemoryRegionList *qmp_query_pci_regions(const PCIDevice *dev)
>>  {
>> -    PciMemoryRegionList *head = NULL, *cur_item = NULL;
>> +    PciMemoryRegionList *head = NULL, **tail = &head;
> 
> Here, you use a new and better name.
> 
> I'd like to encourage you to name tail pointer variables @tail
> elsewhere, too.

In v3, I will consistently rename the FOOList ** variable 'tail'.

>> @@ -2863,7 +2846,6 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
>>
>>      while (mem_blks != NULL) {
>>          GuestMemoryBlockResponse *result;
>> -        GuestMemoryBlockResponseList *entry;
>>          GuestMemoryBlock *current_mem_blk = mem_blks->value;
>>
>>          result = g_malloc0(sizeof(*result));
>> @@ -2872,11 +2854,7 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
>>          if (local_err) { /* should never happen */
>>              goto err;
>>          }
>> -        entry = g_malloc0(sizeof *entry);
>> -        entry->value = result;
>> -
>> -        *link = entry;
>> -        link = &entry->next;
>> +        QAPI_LIST_APPEND(link, result);
>>          mem_blks = mem_blks->next;
>>      }
>>
> 
> This one looks like a candidate for PATCH 6.

Yes.  Will hoist.

v3 will be posted soon.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


