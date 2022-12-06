Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E041464441F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 14:08:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Xf8-0002Rp-9o; Tue, 06 Dec 2022 08:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2Xf5-0002RD-Pw
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:07:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2Xf3-00008a-Gi
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670332019;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzcHoUkhI3GvHdLxSCSW4YmSIpIF9O32UMtbOl1ar9M=;
 b=f1YqDyN1JLssswB3FpSSLvv1f7C1lJTJZroiqlXXCxlO5aP128z+eSGi5cwf+qqwEdsgXq
 Fuc1C8KVa9/BCkTODTrrcOOgYf4A238gi2YpRo247VfDLUHkfhGqBSjKfLOPZ5F1B4Za74
 OMycTwikBnQiGsUtoV7I4QQNQgHm/zA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-TPeAFIYlNbmsMH_ofmDnuQ-1; Tue, 06 Dec 2022 08:06:58 -0500
X-MC-Unique: TPeAFIYlNbmsMH_ofmDnuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so9936434wmb.5
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 05:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzcHoUkhI3GvHdLxSCSW4YmSIpIF9O32UMtbOl1ar9M=;
 b=KFJ6xUSg0yNLcZY2Lf90kHNz58aXl+7MxWW7f69Zd2GXpNdMSOgMN3q/h4lOHaT7o6
 hZjzFIAuO91vjBIIIaW+ipuSiXUZ+Sf1eQKjLAhx/tQkRlFTn+H68LtV92zUgmjwWlXY
 TXE2mACwy25GV2FVItJSIDefElQrzZzzBfHdizr96zBP1Jw2d9z7co0AW0V9NRhrT5v7
 rQ+aKLc5PTrqB7lduFWFdsKT0nVcfW3Va5liggfOMtDISmW0DkdCDTs6/AAzd/EnoseH
 dmaVCfC+XxvmsK1MbzJ/B0HdjWMSDlD8EQkcZhdHPVNNckkOuOyEpu1QszUTwBHaR5OK
 2UMQ==
X-Gm-Message-State: ANoB5pnxkGmGAWC2kF10NXs/x4SeG1uE6oD2pmjd+gJQXDzyOQa0dNCS
 frESpScqisVuBUCxE8HxqzoA/Pk7bGHR03Aa70AnyAREdHEesZKthqjrLb5nb1ZYmRCQDjSBbKe
 uvd4po3rOre7/JkA=
X-Received: by 2002:a5d:4b91:0:b0:242:131c:1051 with SMTP id
 b17-20020a5d4b91000000b00242131c1051mr26238974wrt.318.1670332017330; 
 Tue, 06 Dec 2022 05:06:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62/NtuevXsRQE5Z3C/CYja9Q6tSI2dMklWDIIYr5RjETc0LLv3r7BR36V9uKwd2ASQd+hjxA==
X-Received: by 2002:a5d:4b91:0:b0:242:131c:1051 with SMTP id
 b17-20020a5d4b91000000b00242131c1051mr26238963wrt.318.1670332017043; 
 Tue, 06 Dec 2022 05:06:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a5d638f000000b0024207478de3sm16345844wru.93.2022.12.06.05.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 05:06:56 -0800 (PST)
Message-ID: <3240586f-1d8f-920a-0f7b-52322432ad92@redhat.com>
Date: Tue, 6 Dec 2022 14:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <9de7491a-0787-fca5-0738-da5e8288b683@redhat.com> <Y4j+8y8EnWkZor2+@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y4j+8y8EnWkZor2+@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Peter,
On 12/1/22 20:22, Peter Xu wrote:
> On Thu, Dec 01, 2022 at 07:17:41PM +0100, Eric Auger wrote:
>> Hi Peter
> Hi, Eric,
>
>> On 12/1/22 17:25, Peter Xu wrote:
>>> It seems not super clear on when iova_tree is used, and why.  Add a rich
>>> comment above iova_tree to track why we needed the iova_tree, and when we
>>> need it.
>>>
>>> Suggested-by: Jason Wang <jasowang@redhat.com>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
>>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
>>> index 46d973e629..8d130ab2e3 100644
>>> --- a/include/hw/i386/intel_iommu.h
>>> +++ b/include/hw/i386/intel_iommu.h
>>> @@ -109,7 +109,35 @@ struct VTDAddressSpace {
>>>      QLIST_ENTRY(VTDAddressSpace) next;
>>>      /* Superset of notifier flags that this address space has */
>>>      IOMMUNotifierFlag notifier_flags;
>>> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
>>> +    /*
>>> +     * @iova_tree traces mapped IOVA ranges.
>>> +     *
>>> +     * The tree is not needed if no MAP notifiers is registered with
>> s/no MAP notifiers/no MAP notifier
> Will fix.
>
>>> +     * current VTD address space, because all UNMAP (including iotlb or
>>> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
>>> +     * notifiers.
>> because all UNMAP notifications (iotlb or dev-iotlb) can be triggered
>> directly, as opposed to MAP notifications. (?)
> What I wanted to say is any PSI or DSI messages we got from the guest can
> be transparently delivered to QEMU's iommu notifiers.  I'm not sure
> "triggered directly" best describe the case here.
yes "transparently delivered" is OK. Or "guest invalidate commands can
be directly passed to the IOMMU UNMAP notifiers without any further
reshuffling". But that's nitpicking.
>
> PSI: Page Selective Invalidations
> DSI: Domain Selective Invalidations
>
> Sorry to mention these terms again, but that's really what the "transparent
> delivery" means here - we get the PSI/DSI messages, then we notify with the
> same ranges in IOMMU notifiers.  They're not the same concept but we do
> that transparently without changing the core of the messages.
>
> Maybe I should spell out "!MAP" as "UNMAP-only"?  Would that help?
yeah those are unmap notifiers if I am correct.
>
>>> +     *
>>> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
>>> +     * reasons.
>>> +     *
>>> +     * Firstly, there's no way to identify whether an PSI event is MAP or
>> maybe give the decryption of the 'PSI' and 'DSI" acronyms once ;-)
> Please see above. :)
ok thanks
>
> These are VT-d terms used in multiple places in the .[ch] files, I assume
> I'll just keep using them because otherwise I'll need to comment them
> everytime we use any PSI/DSI terms.  It might become an overkill I'm afraid.
OK maybe just using the full terminology once is enough.
>
>>> +     * UNMAP within the PSI message itself.  Without having prior knowledge
>>> +     * of existing state vIOMMU doesn't know whether it should notify MAP
>>> +     * or UNMAP for a PSI message it received.
>>> +     *
>>> +     * Secondly, PSI received from guest driver (or even a large PSI can
>>> +     * grow into a DSI at least with Linux intel-iommu driver) can be
>>> +     * larger in range than the newly mapped ranges for either MAP or UNMAP
>>> +     * events. If it directly pass-throughs any such event it may confuse
>> If it directly notifies the registered device with the unmodified range, it may confuse the drivers ../..
> Will fix.
>
>> So the range of the MAP notification can be adapted based on the existing IOVA mappings.  
> Yes, e.g. the iova tree makes sure we don't map something again if it's mapped.

OK

Thanks

Eric
>
> Thanks,
>
>>> +     * the registered drivers (e.g. vfio-pci) on either: (1) trying to map
>>> +     * the same region more than once (for VFIO_IOMMU_MAP_DMA, -EEXIST will
>>> +     * trigger), or (2) trying to UNMAP a range that is still partially
>>> +     * mapped.  That accuracy is not required for UNMAP-only notifiers, but
>>> +     * it is a must-to-have for MAP-inclusive notifiers, because the vIOMMU
>>> +     * needs to make sure the shadow page table is always in sync with the
>>> +     * guest IOMMU pgtables for a device.
>>> +     */
>>> +    IOVATree *iova_tree;
>>>  };
>>>  
>>>  struct VTDIOTLBEntry {
>> Thanks
>>
>> Eric
>>


