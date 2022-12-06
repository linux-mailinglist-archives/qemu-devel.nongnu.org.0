Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E85C644932
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ans-0006Li-3r; Tue, 06 Dec 2022 11:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ang-0006LO-Fg
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ane-0005GF-G9
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670344085;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phuq/XZm7BUqB3nhrvFfENx4EfW0d8Hu13QSnD/zQxw=;
 b=KYKmdbQolFl1DEHzyOprho3ibkpzZgFR6ukMh34Fa6vsK9wV3t5/AmdQsfNFokQbUCi9EP
 hLNqV6cHHJr5ax/68Ag6g+/czsR632VKRK0Pqb0XyqfguFB4KLvdJ0KnFJ+RwrrXFUlXLE
 a1okjf08YcpFQ07NqAUfaBVjLj6AGsA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-kf_m4fVCPdyX26Y_IJF7qw-1; Tue, 06 Dec 2022 11:28:04 -0500
X-MC-Unique: kf_m4fVCPdyX26Y_IJF7qw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so5463503wma.3
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phuq/XZm7BUqB3nhrvFfENx4EfW0d8Hu13QSnD/zQxw=;
 b=JGZvw20JmWV0M6n5QPyo7G7yzN/KeB/1kwNStGAk3qabd/13HDEAPlPdwDg2CXrKJu
 sx0i5HgjfU48k6iplENAtCZgZzmvUKBd7aZkBI5psxc9o5n8BdzGTmN3suAdC2ITXmk+
 BBcIZgQHTXhYD5IQtk3kvhIT7jaMQQ6GB0+JRPyMd7K7ZOPRI2oJyCk9wS1VTprlPW6b
 S5trfXnHBptKA9E63F0zi1ZaYkSKtmyXs4oPH3g1iQXBgOOyXThy4YUHhGZoANeut+zD
 7U8MjrCu2K3mf6PpIrZgL/ADsbgrCuWRsfTskhyY+3ofbgi4dwhWsHMgub2U4+zSLUCr
 2TFQ==
X-Gm-Message-State: ANoB5plREAkUrtWxU9LvrkgZ4GWbIkCZY3TtLWLMgBlhDKga+H+eNSO+
 eO0ikM0NfWBVG3YR0/vKZ+x89vcF3sxBPMR9RdhbR0K9+eWDxtas6QuOwL1HFGirMC4SnW9rXT3
 4a4E/ZDHujRyVwnk=
X-Received: by 2002:a1c:7709:0:b0:3cf:6a83:c7a3 with SMTP id
 t9-20020a1c7709000000b003cf6a83c7a3mr23551379wmi.21.1670344083157; 
 Tue, 06 Dec 2022 08:28:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PjsEVSSPSzSCRWTln6nTSbGHBCHNsI9d2IgrVaYWuhiJCsSQJ7EalsWe4pEmQz9IDCB3kUA==
X-Received: by 2002:a1c:7709:0:b0:3cf:6a83:c7a3 with SMTP id
 t9-20020a1c7709000000b003cf6a83c7a3mr23551354wmi.21.1670344082840; 
 Tue, 06 Dec 2022 08:28:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003c70191f267sm29372658wmp.39.2022.12.06.08.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 08:28:02 -0800 (PST)
Message-ID: <e9ec1a33-f2a3-3170-298d-d0f70de59b3d@redhat.com>
Date: Tue, 6 Dec 2022 17:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <CACGkMEu2NrYULRLZAUNbp5SAUVPb8nMZb9=3=JWFHciC7FAHkg@mail.gmail.com>
 <Y45+pQJtMftyIHGQ@x1n> <6189ef29-fe38-bc74-aff1-034eb28ab031@redhat.com>
 <Y49oM/xkFkIcuSxO@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y49oM/xkFkIcuSxO@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/6/22 17:05, Peter Xu wrote:
> On Tue, Dec 06, 2022 at 02:16:32PM +0100, Eric Auger wrote:
>> Hi Peter,
>> On 12/6/22 00:28, Peter Xu wrote:
>>> On Mon, Dec 05, 2022 at 12:23:20PM +0800, Jason Wang wrote:
>>>> On Fri, Dec 2, 2022 at 12:25 AM Peter Xu <peterx@redhat.com> wrote:
>>>>> It seems not super clear on when iova_tree is used, and why.  Add a rich
>>>>> comment above iova_tree to track why we needed the iova_tree, and when we
>>>>> need it.
>>>>>
>>>>> Suggested-by: Jason Wang <jasowang@redhat.com>
>>>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>>>> ---
>>>>>  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
>>>>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
>>>>> index 46d973e629..8d130ab2e3 100644
>>>>> --- a/include/hw/i386/intel_iommu.h
>>>>> +++ b/include/hw/i386/intel_iommu.h
>>>>> @@ -109,7 +109,35 @@ struct VTDAddressSpace {
>>>>>      QLIST_ENTRY(VTDAddressSpace) next;
>>>>>      /* Superset of notifier flags that this address space has */
>>>>>      IOMMUNotifierFlag notifier_flags;
>>>>> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
>>>>> +    /*
>>>>> +     * @iova_tree traces mapped IOVA ranges.
>>>>> +     *
>>>>> +     * The tree is not needed if no MAP notifiers is registered with
>>>>> +     * current VTD address space, because all UNMAP (including iotlb or
>>>>> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
>>>>> +     * notifiers.
>>>> So this means the UNMAP notifier doesn't need to be as accurate as
>>>> MAP. (Should we document it in the notifier headers)?
>>> Yes.
>>>
>>>> For MAP[a, b] MAP[b, c] we can do a UNMAP[a. c].
>>> IIUC a better way to say this is, for MAP[a, b] we can do an UNMAP[a-X,
>>> b+Y] as long as the range covers [a, b]?
>>>
>>>>> +     *
>>>>> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
>>>>> +     * reasons.
>>>>> +     *
>>>>> +     * Firstly, there's no way to identify whether an PSI event is MAP or
>>>>> +     * UNMAP within the PSI message itself.  Without having prior knowledge
>>>>> +     * of existing state vIOMMU doesn't know whether it should notify MAP
>>>>> +     * or UNMAP for a PSI message it received.
>>>>> +     *
>>>>> +     * Secondly, PSI received from guest driver (or even a large PSI can
>>>>> +     * grow into a DSI at least with Linux intel-iommu driver) can be
>>>>> +     * larger in range than the newly mapped ranges for either MAP or UNMAP
>>>>> +     * events.
>>>> Yes, so I think we need a document that the UNMAP handler should be
>>>> prepared for this.
>>> How about I squash below into this same patch?
>>>
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>> index 91f8a2395a..c83bd11a68 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -129,6 +129,24 @@ struct IOMMUTLBEntry {
>>>  /*
>>>   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
>>>   * register with one or multiple IOMMU Notifier capability bit(s).
>>> + *
>>> + * Normally there're two use cases for the notifiers:
>>> + *
>>> + *   (1) When the device needs accurate synchronizations of the vIOMMU page
>> accurate synchronizations sound too vague & subjective to me.
> Suggestions?
Well I would say:
when the notified device maintains a shadow page table and must to be
notified on each guest MAP (page table entry creation) and UNMAP
(invalidation) events (VFIO). Both notifications must be accurate so
that the shadow page table is fully in sync with the guest view.
>
>>> + *       tables, it needs to register with both MAP|UNMAP notifies (which
>>> + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).  As long as MAP
>>> + *       events are registered, the notifications will be accurate but
>>> + *       there's overhead on synchronizing the guest vIOMMU page tables.
>>> + *
>>> + *   (2) When the device doesn't need accurate synchronizations of the
>>> + *       vIOMMU page tables (when the device can both cache translations
>>> + *       and requesting to translate dynamically during DMA process), it
when the notified device maintains a cache of IOMMU translations (IOTLB)
and is able to fill that cache by requesting translations from the
vIOMMU through a protocol similar to ATS. In that case the notified
device only needs to register an UNMAP notifier. In that case the unmap
notifications are allower to be wider than the strict necessary.

However the problem is since you need to satisfy the VFIO use case, how
do you detect when you are allowed to invalidate more that the strict
necessary?

Eric
 
>> s/requesting/request
>>> + *       needs to register only with UNMAP or DEVIOTLB_UNMAP notifies.
>> would be nice to clarify the distinction between both then
>>> + *       Note that in such working mode shadow page table is not used for
>>> + *       vIOMMU unit on this address space, so the UNMAP messages can be
>> I do not catch 'is not used for vIOMMU unit on this address space'
> How about: "Note that in this working mode the vIOMMU will not maintain a
> shadowed page table for the address space, and the UNMAP messages can be.."?
>
>>> + *       actually larger than the real invalidations (just like how the
>>> + *       Linux IOMMU driver normally works, where an invalidation can be
>>> + *       enlarged as long as it still covers the target range).
>>>   */
>>>  typedef enum {
>>>      IOMMU_NOTIFIER_NONE = 0,
>>>
>>> Thanks,
>>>
>> Thanks
>>
>> Eric
>>


