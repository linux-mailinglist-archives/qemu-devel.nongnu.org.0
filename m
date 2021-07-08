Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449373BF734
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:04:12 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Px5-0003GU-CR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m1PsS-0007OA-IW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m1PsQ-0004lY-MI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625734762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qE3U9Iar5cUMENZiF7huPGOrhJvOQHR8oA7KSXsroDQ=;
 b=H+3kyjj3G8bTEtE/Cq0ZP1CIzwwU22EXrO14POukczs3auXhSE0AWTDlISsxxWSkOGiUl0
 kKqIxIwGHnQfIVnnaCDdrZpwnE/6SaNHGEc7hNVJBka7/csg9/F2ucJC8Q3y/yFpYuWVPp
 gTTpiWgHkcH4iuuVZm1K6ydRufzfG7k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-Px7dOqgAN8mC78qqes0XSQ-1; Thu, 08 Jul 2021 04:59:19 -0400
X-MC-Unique: Px7dOqgAN8mC78qqes0XSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m9-20020a0560000089b02901362e1cd6a3so1674591wrx.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 01:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qE3U9Iar5cUMENZiF7huPGOrhJvOQHR8oA7KSXsroDQ=;
 b=nPL/DMEyRItBkzDJV8M926X3WIQaelEGpMl6scU8NmXvee7nHdNdYKXtKnlkG/zNZS
 ta/AYrTBCfhCIiKEOfgpCFCkkxog7uqOx4CkNvrv49kBu0UbMQiAcrvl6QepHlip4J7R
 yBlqHiOKpwbO7KtzRMYUaMhvsmY+RSNxmsjwgzHKC7lrBOgkBZ7kGD2VqIuqrfnwuvqZ
 t3YxlmOEI5pWdYWPs5Bzy9bXv85v0Fh4hmT4sIxxd04SjTrrmkTvPhhp7PdsKy10Yvfm
 9wsD60bdXPonkOtdaWxbYUP9KoSr2AlMl42l9qw6QKjm8RE2755yDyyFt3cER5nBZfAs
 ebqQ==
X-Gm-Message-State: AOAM530Tl+Mz2ZmjYvOJnudLDqQYRrj7ItVkhHx2OiMKcX/PpkpL9n8V
 8e5jvOIAUxyMD2fdIrXWVAvOWhf9r4wIv6vGaxeLTmfh004IG43Yz1SlIwAC7iR/wJqrqDIB4N6
 ACrGSXfPzjRvX4DI=
X-Received: by 2002:a05:6000:1b90:: with SMTP id
 r16mr25290432wru.316.1625734758651; 
 Thu, 08 Jul 2021 01:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU5/iHCpEhPyY18JudV834Nb4/zdUxevghnl7jIdLdSI5KpwZW3LEu0qoR/vSj7WiYDqJrSg==
X-Received: by 2002:a05:6000:1b90:: with SMTP id
 r16mr25290418wru.316.1625734758477; 
 Thu, 08 Jul 2021 01:59:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t15sm1539688wrx.17.2021.07.08.01.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 01:59:18 -0700 (PDT)
Subject: Re: [PATCH] docs: Add '-device intel-iommu' entry
To: Peter Xu <peterx@redhat.com>
References: <20210611185500.343525-1-peterx@redhat.com>
 <6355528a-5d67-f178-90f9-53103d7540f1@redhat.com> <YOXJ1ZKPtNuOGkuN@t490s>
From: Eric Auger <eauger@redhat.com>
Message-ID: <6af2ab1a-b0fd-781b-9769-09748318990c@redhat.com>
Date: Thu, 8 Jul 2021 10:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YOXJ1ZKPtNuOGkuN@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,
On 7/7/21 5:35 PM, Peter Xu wrote:
> On Wed, Jul 07, 2021 at 11:29:47AM +0200, Eric Auger wrote:
>> Hi Peter,
> 
> Hi, Eric,
> 
>>
>> On 6/11/21 8:55 PM, Peter Xu wrote:
>>> The parameters of intel-iommu device are non-trivial to understand.  Add an
>>> entry for it so that people can reference to it when using.
>>>
>>> There're actually a few more options there, but I hide them explicitly because
>>> they shouldn't be used by normal QEMU users.
>>>
>>> Cc: Chao Yang <chayang@redhat.com>
>>> Cc: Lei Yang <leiyang@redhat.com>
>>> Cc: Jing Zhao <jinzhao@redhat.com>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>  qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 14258784b3a..4bb04243907 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -926,6 +926,38 @@ SRST
>>>  
>>>  ``-device pci-ipmi-bt,bmc=id``
>>>      Like the KCS interface, but defines a BT interface on the PCI bus.
>>> +
>>> +``-device intel-iommu[,option=...]``
>>> +    This is only supported by ``-machine q35``, which will enable Intel VT-d
>>> +    emulation within the guest.  It supports below options:
>>> +
>>> +    ``intremap=on|off`` (default: auto)
>>> +        This enables interrupt remapping feature in the guest.  It's required
>>> +        to enable complete x2apic.  Currently it only supports kvm
>>> +        kernel-irqchip modes ``off`` or ``split``.  Full kernel-irqchip is not
>>> +        yet supported.
>> maybe explain how the default is chosen (based on kernel-irqhcip mode?)
> 
> Will do.
> 
>>> +
>>> +    ``caching-mode=on|off`` (default: off)
>>> +        This enables caching mode for the VT-d emulated device.  When
>>> +        caching-mode is enabled, each guest DMA buffer mapping will generate an
>>> +        IOTLB invalidation from the guest IOMMU driver to the vIOMMU device in
>>> +        a synchronous way.  It is required for ``-device vfio-pci`` to work
>>> +        with the VT-d device, because host assigned devices requires to setup
>>> +        the DMA mapping on the host before guest DMA starts.
>>> +
>>> +    ``device-iotlb=on|off`` (default: off)
>>> +        This enables device-iotlb capability for the emulated VT-d device.  So
>>> +        far virtio/vhost should be the only real user for this parameter,
>> I thought if was needed for vhost. What is the usage for virtio?
> 
> I used "virtio/vhost" because vhost is only one type of virtio backend, so
> normally they should be used in pair.  Also, the "ats=on" parameter should be
> an option to virtio frontend rather than vhost, hence I mentioned both.

OK makes sense.
> 
>>> +        paired with ats=on configured for the device.
>> What is not obvious to me is whether there is a kind of diagnosis
>> whether device-iotlb and caching mode settings are consistent with
>> vfio/vhost usage. Does qemu exit if there is inconsistency?
> 
> Caching mode check is done in vtd_machine_done_notify_one().
> 
> I think there's no such check for vhost, however iirc vhost should work
> with/without ats=on; I did't check deeper.
OK
> 
>>> +
>>> +    ``aw-bits=39|48`` (default: 39)
>>> +        This decides the address width of IOVA address space.  The address
>>> +        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
>>> +        4-level IOMMU page tables.
>>> +
>>> +    Please also refer to the wiki page for general scenarios of VT-d
>>> +    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>>> +
>>>  ERST
>>>  
>>>  DEF("name", HAS_ARG, QEMU_OPTION_name,
>>>
>> Besides, it is quite useful.
> 
> Thanks for taking a look!
> 
Besides,

Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric


