Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7C225665
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 06:03:26 +0200 (CEST)
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxN1R-0003V0-Mg
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 00:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxN0c-00035k-Ic
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 00:02:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57548
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxN0a-0002Xt-MW
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 00:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595217751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsqPnP5+97afLZmnsJLR98M8P3GIpJ9baDWq4axUo2M=;
 b=IjueYqpEpWU3Gpdbio+qhM4N/479VoZZICzk1tysICsKSSxuiRx/3ini2FrPUyC5md8awg
 tfTXSyvIoeqB4LmWs3YeXEFQFOYms1CynllE3cU9mIgvr2eYi2QVIZgTyyCr4SG3Zw5JTb
 wHS4czyqSuvhLWVpfMR8WvqqwSYl8wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-KITRNxaoP2GL6BXP_ESekw-1; Mon, 20 Jul 2020 00:02:27 -0400
X-MC-Unique: KITRNxaoP2GL6BXP_ESekw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1D918015F3;
 Mon, 20 Jul 2020 04:02:26 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94D0D5D9E4;
 Mon, 20 Jul 2020 04:02:08 +0000 (UTC)
Subject: Re: [RFC v2 1/1] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
To: Peter Xu <peterx@redhat.com>
References: <20200707195429.GF88106@xz-x1>
 <5004a059-6eb0-4ef3-40b7-94dfbf9ec08f@redhat.com>
 <20200708141657.GA199122@xz-x1>
 <14b1ca26-448d-0feb-7529-6546809aaa59@redhat.com>
 <20200709141037.GF199122@xz-x1>
 <fb2f8d35-3f04-55ac-e0c0-7eeedbaf2429@redhat.com>
 <20200710133005.GL199122@xz-x1>
 <05bb512c-ca0a-e80e-1eed-446e918ad729@redhat.com>
 <20200716010005.GA535743@xz-x1>
 <b0319440-6e53-f274-59ba-6dbc67de69be@redhat.com>
 <20200717141806.GE535743@xz-x1>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d772c597-e6a2-ab88-43c5-b35b77d6c84e@redhat.com>
Date: Mon, 20 Jul 2020 12:02:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717141806.GE535743@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 00:02:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/17 下午10:18, Peter Xu wrote:
> On Thu, Jul 16, 2020 at 10:54:31AM +0800, Jason Wang wrote:
>> On 2020/7/16 上午9:00, Peter Xu wrote:
>>> On Mon, Jul 13, 2020 at 12:04:16PM +0800, Jason Wang wrote:
>>>> On 2020/7/10 下午9:30, Peter Xu wrote:
>>>>> On Fri, Jul 10, 2020 at 02:34:11PM +0800, Jason Wang wrote:
>>>>>> On 2020/7/9 下午10:10, Peter Xu wrote:
>>>>>>> On Thu, Jul 09, 2020 at 01:58:33PM +0800, Jason Wang wrote:
>>>>>>>>>> - If we care the performance, it's better to implement the MAP event for
>>>>>>>>>> vhost, otherwise it could be a lot of IOTLB miss
>>>>>>>>> I feel like these are two things.
>>>>>>>>>
>>>>>>>>> So far what we are talking about is whether vt-d should have knowledge about
>>>>>>>>> what kind of events one iommu notifier is interested in.  I still think we
>>>>>>>>> should keep this as answered in question 1.
>>>>>>>>>
>>>>>>>>> The other question is whether we want to switch vhost from UNMAP to MAP/UNMAP
>>>>>>>>> events even without vDMA, so that vhost can establish the mapping even before
>>>>>>>>> IO starts.  IMHO it's doable, but only if the guest runs DPDK workloads.  When
>>>>>>>>> the guest is using dynamic iommu page mappings, I feel like that can be even
>>>>>>>>> slower, because then the worst case is for each IO we'll need to vmexit twice:
>>>>>>>>>
>>>>>>>>>        - The first vmexit caused by an invalidation to MAP the page tables, so vhost
>>>>>>>>>          will setup the page table before IO starts
>>>>>>>>>
>>>>>>>>>        - IO/DMA triggers and completes
>>>>>>>>>
>>>>>>>>>        - The second vmexit caused by another invalidation to UNMAP the page tables
>>>>>>>>>
>>>>>>>>> So it seems to be worse than when vhost only uses UNMAP like right now.  At
>>>>>>>>> least we only have one vmexit (when UNMAP).  We'll have a vhost translate()
>>>>>>>>> request from kernel to userspace, but IMHO that's cheaper than the vmexit.
>>>>>>>> Right but then I would still prefer to have another notifier.
>>>>>>>>
>>>>>>>> Since vtd_page_walk has nothing to do with device IOTLB. IOMMU have a
>>>>>>>> dedicated command for flushing device IOTLB. But the check for
>>>>>>>> vtd_as_has_map_notifier is used to skip the device which can do demand
>>>>>>>> paging via ATS or device specific way. If we have two different notifiers,
>>>>>>>> vhost will be on the device iotlb notifier so we don't need it at all?
>>>>>>> But we can still have iommu notifier that only registers to UNMAP even after we
>>>>>>> introduce dev-iotlb notifier?  We don't want to do page walk for them as well.
>>>>>>> TCG should be the only one so far, but I don't know.. maybe there can still be
>>>>>>> new ones?
>>>>>> I think you're right. But looking at the codes, it looks like the check of
>>>>>> vtd_as_has_map_notifier() was only used in:
>>>>>>
>>>>>> 1) vtd_iommu_replay()
>>>>>> 2) vtd_iotlb_page_invalidate_notify() (PSI)
>>>>>>
>>>>>> For the replay, it's expensive anyhow. For PSI, I think it's just about one
>>>>>> or few mappings, not sure it will have obvious performance impact.
>>>>>>
>>>>>> And I had two questions:
>>>>>>
>>>>>> 1) The codes doesn't check map for DSI or GI, does this match what spec
>>>>>> said? (It looks to me the spec is unclear in this part)
>>>>> Both DSI/GI should cover maps too?  E.g. vtd_sync_shadow_page_table() in
>>>>> vtd_iotlb_domain_invalidate().
>>>> I meant the code doesn't check whether there's an MAP notifier :)
>>> It's actually checked, because it loops over vtd_as_with_notifiers, and only
>>> MAP notifiers register to that. :)
>>
>> I may miss something but I don't find the code to block UNMAP notifiers?
>>
>> vhost_iommu_region_add()
>>      memory_region_register_iommu_notifier()
>>          memory_region_update_iommu_notify_flags()
>>              imrc->notify_flag_changed()
>>                  vtd_iommu_notify_flag_changed()
>>
>> ?
> Yeah I think you're right.  I might have confused with some previous
> implementations.  Maybe we should also do similar thing for DSI/GI just like
> what we do in PSI.


Ok.


>
>>>>>> 2) for the replay() I don't see other implementations (either spapr or
>>>>>> generic one) that did unmap (actually they skip unmap explicitly), any
>>>>>> reason for doing this in intel IOMMU?
>>>>> I could be wrong, but I'd guess it's because vt-d implemented the caching mode
>>>>> by leveraging the same invalidation strucuture, so it's harder to make all
>>>>> things right (IOW, we can't clearly identify MAP with UNMAP when we receive an
>>>>> invalidation request, because MAP/UNMAP requests look the same).
>>>>>
>>>>> I didn't check others, but I believe spapr is doing it differently by using
>>>>> some hypercalls to deliver IOMMU map/unmap requests, which seems a bit close to
>>>>> what virtio-iommu is doing.  Anyway, the point is if we have explicit MAP/UNMAP
>>>>> from the guest, logically the replay indeed does not need to do any unmap
>>>>> because we don't need to call replay() on an already existing device but only
>>>>> for e.g. hot plug.
>>>> But this looks conflict with what memory_region_iommu_replay( ) did, for
>>>> IOMMU that doesn't have a replay method, it skips UNMAP request:
>>>>
>>>>       for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
>>>>           iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
>>>>           if (iotlb.perm != IOMMU_NONE) {
>>>>               n->notify(n, &iotlb);
>>>>           }
>>>>
>>>> I guess there's no knowledge of whether guest have an explicit MAP/UMAP for
>>>> this generic code. Or replay implies that guest doesn't have explicit
>>>> MAP/UNMAP?
>>> I think it matches exactly with a hot plug case?  Note that when IOMMU_NONE
>>> could also mean the translation does not exist.  So it's actually trying to map
>>> everything that can be translated and then notify().
>>
>> Yes, so the question is what's the assumption before calling
>> memory_region_iommu_replay(). If it assumes an empty mapping, there's
>> probably no need for unamp.
> The only caller of memory_region_iommu_replay() is vfio_listener_region_add(),
> when there's a new vIOMMU memory region detected.  So IIUC that guarantees the
> previous state should be all empty.


Right, so there's no need to deal with unmap in vtd's replay 
implementation (as what generic one did).

Thanks


>
> Thanks,
>


