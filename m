Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB6220AD6D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 09:42:42 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joj0T-0006OZ-6a
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 03:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joizh-0005sR-Hq
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:41:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30662
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joizf-0003ux-M8
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593157310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VIo+oh+ogA866LyV8ksFR+LFGOJIhK8mHP39DuBNdw=;
 b=CaIs4dT8ZUNkFkqb4kdJlM10n2HJ/CSVIgjnKcrk6dOXSCYMqfDO9bg8n8ICc3KH68Y54k
 la/SkI3twuEw/HS5tgR3tE6V0yavLcdFbOZ0RXEH0guqdrFlYb2DFrkyUQkPHAGdQkhWi1
 eCm58wVxOqdP+1no8HDOIcHOFRameXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-dy9jgq61PoqLzYjXlqmBpg-1; Fri, 26 Jun 2020 03:41:48 -0400
X-MC-Unique: dy9jgq61PoqLzYjXlqmBpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E40880400C;
 Fri, 26 Jun 2020 07:41:47 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E536660BF4;
 Fri, 26 Jun 2020 07:41:39 +0000 (UTC)
Subject: Re: [PATCH v5 2/5] virtio-iommu: Implement RESV_MEM probe request
To: Markus Armbruster <armbru@redhat.com>
References: <20200624132625.27453-1-eric.auger@redhat.com>
 <20200624132625.27453-3-eric.auger@redhat.com>
 <87zh8r1v6z.fsf@dusky.pond.sub.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5cf11295-b762-9246-8b4b-9d5d1c83749a@redhat.com>
Date: Fri, 26 Jun 2020 09:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87zh8r1v6z.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 02:19:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,
On 6/25/20 9:05 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
>> This patch implements the PROBE request. At the moment,
>> only THE RESV_MEM property is handled. The first goal is
>> to report iommu wide reserved regions such as the MSI regions
>> set by the machine code. On x86 this will be the IOAPIC MSI
>> region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
>> doorbell.
>>
>> In the future we may introduce per device reserved regions.
>> This will be useful when protecting host assigned devices
>> which may expose their own reserved regions
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v4 -> v5:
>> - assert if reserved region type is different from RESERVED or
>>   MSI
>>
>> v3 -> v4:
>> - removed any reference to the NONE property that does not
>>   exist anymore.
>>
>> v2 -> v3:
>> - on probe, do not fill the reminder of the buffer with zeroes
>>   as the buffer was already zero initialized (Bharat)
>>
>> v1 -> v2:
>> - move the unlock back to the same place
>> - remove the push label and factorize the code after the out label
>> - fix a bunch of cpu_to_leX according to the latest spec revision
>> - do not remove sizeof(last) from free space
>> - check the ep exists
>> ---
>>  include/hw/virtio/virtio-iommu.h |  2 +
>>  hw/virtio/virtio-iommu.c         | 92 ++++++++++++++++++++++++++++++--
>>  hw/virtio/trace-events           |  1 +
>>  3 files changed, 91 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>> index e653004d7c..49eb105cd8 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -53,6 +53,8 @@ typedef struct VirtIOIOMMU {
>>      GHashTable *as_by_busptr;
>>      IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
>>      PCIBus *primary_bus;
>> +    ReservedRegion *reserved_regions;
>> +    uint32_t nb_reserved_regions;
>>      GTree *domains;
>>      QemuMutex mutex;
>>      GTree *endpoints;
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 483883ec1d..aabc3e36b1 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -38,6 +38,7 @@
>>  
>>  /* Max size */
>>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>> +#define VIOMMU_PROBE_SIZE 512
>>  
>>  typedef struct VirtIOIOMMUDomain {
>>      uint32_t id;
>> @@ -378,6 +379,63 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>>      return ret;
>>  }
>>  
>> +static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
>> +                                               uint8_t *buf, size_t free)
>> +{
>> +    struct virtio_iommu_probe_resv_mem prop = {};
>> +    size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
>> +    int i;
>> +
>> +    total = size * s->nb_reserved_regions;
>> +
>> +    if (total > free) {
>> +        return -ENOSPC;
>> +    }
>> +
>> +    for (i = 0; i < s->nb_reserved_regions; i++) {
>> +        prop.head.type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM);
>> +        prop.head.length = cpu_to_le16(length);
>> +        prop.subtype = s->reserved_regions[i].type;
>> +        assert(prop.subtype == VIRTIO_IOMMU_RESV_MEM_T_RESERVED ||
>> +               prop.subtype == VIRTIO_IOMMU_RESV_MEM_T_MSI);
> 
> The assertion makes sense here: we're mapping from the generic
> ReservedRegion type (which is unsigned) to the specific
> virtio_iommu_probe_resv_mem subtype (which is uint8_t, but only these
> two values are valid).
> 
> Howver, the assertion should test s->reserved_regions[i].type and go
> before the assignment, to ensure it doesn't truncate!
OK I will do.
> 
> Can I trigger the assertion with -device?  My try to find the answer
> myself failed:
At the moment the virtio-iommu-pci device only can be instantiated with
machvirt, booting in dt mode.
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -device virtio-iommu-pci,len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:99
>     qemu-system-x86_64: -device virtio-iommu-pci,len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:99: pc-i440fx-5.1 machine fails to create iommu-map device tree bindings
>     Check you machine implements a hotplug handler for the virtio-iommu-pci device
>     Check the guest is booted without FW or with -no-acpi
> 
> By the way: s/Check you machine/Check your machine/.

Thanks

Eric
> 
> [...]
> 


