Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4381CD226
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 08:56:56 +0200 (CEST)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY2Mx-00034H-4S
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 02:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jY2MD-0002ZE-Ca
 for qemu-devel@nongnu.org; Mon, 11 May 2020 02:56:09 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33119
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jY2MC-000578-3b
 for qemu-devel@nongnu.org; Mon, 11 May 2020 02:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589180166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNFMecDL6Kk90lTwlLWJK41W3P8RhHSyCUx7ZlVLZbU=;
 b=d2hgKROGblUbt69/r/FJ2s8W5aFX1x7DWa+qJvM3gj2EK4zRnqq/4HmxxR/VEFn829/vJ7
 v5VyKA2iLXBd84PsMa3NgVtr1OgZL3I+fJWAydQVdrKLIydBmCnYd8Bbk8AdIyynsTyFD/
 In3XHaB4YUx8mjr7eCrNbKOTHHO4nLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-IP-YUhKoOSmYP8x8AdYR-Q-1; Mon, 11 May 2020 02:55:54 -0400
X-MC-Unique: IP-YUhKoOSmYP8x8AdYR-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489A6189952A;
 Mon, 11 May 2020 06:55:53 +0000 (UTC)
Received: from [10.36.114.214] (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F151002382;
 Mon, 11 May 2020 06:55:45 +0000 (UTC)
Subject: Re: [EXT] [PATCH v2 2/5] virtio-iommu: Implement RESV_MEM probe
 request
To: Bharat Bhushan <bbhushan2@marvell.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20200508173057.32215-1-eric.auger@redhat.com>
 <20200508173057.32215-3-eric.auger@redhat.com>
 <MWHPR1801MB19669FBFAD49AD36460B0756E3A10@MWHPR1801MB1966.namprd18.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ba80143c-e053-5323-70a0-72a1dcc04376@redhat.com>
Date: Mon, 11 May 2020 08:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR1801MB19669FBFAD49AD36460B0756E3A10@MWHPR1801MB1966.namprd18.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bharat,
On 5/11/20 8:38 AM, Bharat Bhushan wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Friday, May 8, 2020 11:01 PM
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-devel@nongnu.org;
>> qemu-arm@nongnu.org; peter.maydell@linaro.org; mst@redhat.com; jean-
>> philippe@linaro.org; Bharat Bhushan <bbhushan2@marvell.com>;
>> peterx@redhat.com; armbru@redhat.com; pbonzini@redhat.com
>> Subject: [EXT] [PATCH v2 2/5] virtio-iommu: Implement RESV_MEM probe request
>>
>> External Email
>>
>> ----------------------------------------------------------------------
>> This patch implements the PROBE request. At the moment, only THE RESV_MEM
>> property is handled. The first goal is to report iommu wide reserved regions such as
>> the MSI regions set by the machine code. On x86 this will be the IOAPIC MSI region,
>> [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS doorbell.
>>
>> In the future we may introduce per device reserved regions.
>> This will be useful when protecting host assigned devices which may expose their
>> own reserved regions
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - move the unlock back to the same place
>> - remove the push label and factorize the code after the out label
>> - fix a bunch of cpu_to_leX according to the latest spec revision
>> - do not remove sizeof(last) from free space
>> - check the ep exists
>> ---
>>  include/hw/virtio/virtio-iommu.h |  2 +
>>  hw/virtio/virtio-iommu.c         | 94 ++++++++++++++++++++++++++++++--
>>  hw/virtio/trace-events           |  1 +
>>  3 files changed, 93 insertions(+), 4 deletions(-)
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
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
>> 22ba8848c2..35d772e021 100644
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
>> @@ -378,6 +379,65 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>>      return ret;
>>  }
>>
>> +static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
>> +                                               uint8_t *buf, size_t
>> +free) {
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
>> +        prop.start = cpu_to_le64(s->reserved_regions[i].low);
>> +        prop.end = cpu_to_le64(s->reserved_regions[i].high);
>> +
>> +        memcpy(buf, &prop, size);
>> +
>> +        trace_virtio_iommu_fill_resv_property(ep, prop.subtype,
>> +                                              prop.start, prop.end);
>> +        buf += size;
>> +    }
>> +    return total;
>> +}
>> +
>> +/**
>> + * virtio_iommu_probe - Fill the probe request buffer with
>> + * the properties the device is able to return and add a NONE
>> + * property at the end.
>> + */
>> +static int virtio_iommu_probe(VirtIOIOMMU *s,
>> +                              struct virtio_iommu_req_probe *req,
>> +                              uint8_t *buf) {
>> +    uint32_t ep_id = le32_to_cpu(req->endpoint);
>> +    size_t free = VIOMMU_PROBE_SIZE;
>> +    ssize_t count;
>> +
>> +    if (!virtio_iommu_mr(s, ep_id)) {
>> +        return VIRTIO_IOMMU_S_NOENT;
>> +    }
>> +
>> +    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
>> +    if (count < 0) {
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>> +    buf += count;
>> +    free -= count;
>> +
>> +    /* Fill the rest with zeroes */
>> +    memset(buf, 0, free);
> 
> No need to fill with zero here as "buf" is set to zero on allocation, no?

You're right. I will remove this in the next version.

Thanks

Eric
> 
> Thanks
> -Bharat
> 
>> +
>> +    return VIRTIO_IOMMU_S_OK;
>> +}
>> +
>>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>>                                     unsigned int iov_cnt,
>>                                     void *req, size_t req_sz) @@ -407,15 +467,27 @@
>> virtio_iommu_handle_req(detach)
>>  virtio_iommu_handle_req(map)
>>  virtio_iommu_handle_req(unmap)
>>
>> +static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
>> +                                     struct iovec *iov,
>> +                                     unsigned int iov_cnt,
>> +                                     uint8_t *buf) {
>> +    struct virtio_iommu_req_probe req;
>> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
>> +
>> +    return ret ? ret : virtio_iommu_probe(s, &req, buf); }
>> +
>>  static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)  {
>>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>>      struct virtio_iommu_req_head head;
>>      struct virtio_iommu_req_tail tail = {};
>> +    size_t output_size = sizeof(tail), sz;
>>      VirtQueueElement *elem;
>>      unsigned int iov_cnt;
>>      struct iovec *iov;
>> -    size_t sz;
>> +    void *buf = NULL;
>>
>>      for (;;) {
>>          elem = virtqueue_pop(vq, sizeof(VirtQueueElement)); @@ -452,6 +524,17 @@
>> static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>>          case VIRTIO_IOMMU_T_UNMAP:
>>              tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
>>              break;
>> +        case VIRTIO_IOMMU_T_PROBE:
>> +        {
>> +            struct virtio_iommu_req_tail *ptail;
>> +
>> +            output_size = s->config.probe_size + sizeof(tail);
>> +            buf = g_malloc0(output_size);
>> +
>> +            ptail = (struct virtio_iommu_req_tail *)
>> +                        (buf + s->config.probe_size);
>> +            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
>> +        }
>>          default:
>>              tail.status = VIRTIO_IOMMU_S_UNSUPP;
>>          }
>> @@ -459,12 +542,13 @@ static void
>> virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>>
>>  out:
>>          sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>> -                          &tail, sizeof(tail));
>> -        assert(sz == sizeof(tail));
>> +                          buf ? buf : &tail, output_size);
>> +        assert(sz == output_size);
>>
>> -        virtqueue_push(vq, elem, sizeof(tail));
>> +        virtqueue_push(vq, elem, sz);
>>          virtio_notify(vdev, vq);
>>          g_free(elem);
>> +        g_free(buf);
>>      }
>>  }
>>
>> @@ -667,6 +751,7 @@ static void virtio_iommu_device_realize(DeviceState *dev,
>> Error **errp)
>>      s->config.page_size_mask = TARGET_PAGE_MASK;
>>      s->config.input_range.end = -1UL;
>>      s->config.domain_range.end = 32;
>> +    s->config.probe_size = VIOMMU_PROBE_SIZE;
>>
>>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
>>      virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC); @@ -676,6
>> +761,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error
>> **errp)
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>>
>>      qemu_mutex_init(&s->mutex);
>>
>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events index
>> e83500bee9..5550475691 100644
>> --- a/hw/virtio/trace-events
>> +++ b/hw/virtio/trace-events
>> @@ -73,3 +73,4 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc
>> domain=%d"
>>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>>  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
>> "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>>  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint,
>> uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
>> +virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype,
>> +uint64_t start, uint64_t end) "dev= %d, type=%d start=0x%"PRIx64"
>> +end=0x%"PRIx64
>> --
>> 2.20.1
> 
> 


