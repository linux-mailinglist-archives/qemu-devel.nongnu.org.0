Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6667277A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:50:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDUS-0002OH-Ta; Wed, 18 Jan 2023 13:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pIDUJ-0002Nx-TO
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:48:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pIDUI-0007B2-2T
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 13:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674067721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjJnLZX2xiPOgv75lLDyi1Y/Th228ymKSb/CUaNreac=;
 b=JQea/FLeLfbvFLZ+HMRVyiPJmtCOFxzjIGTGcEsqqB90RkEnp00dyqSGTcmYk6IKAeNlCK
 /hlKzF8aQMB2POKqiDNklPCcMWc1CY1h+JCvCr4m5oOCLRANFUunPjHgOrXzmprIDyz9SJ
 tXplVeA2Dzj6ody78WYofDagQFcCG2c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-v4b2PYSaOh-syGsOMDKbRw-1; Wed, 18 Jan 2023 13:48:40 -0500
X-MC-Unique: v4b2PYSaOh-syGsOMDKbRw-1
Received: by mail-qk1-f198.google.com with SMTP id
 az6-20020a05620a170600b0070689de396dso5317615qkb.18
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 10:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pjJnLZX2xiPOgv75lLDyi1Y/Th228ymKSb/CUaNreac=;
 b=3M8mNLzCHS6DWyVwM7mKxi+keQUHCMePVnLUtHmqo8m+Z//kDSsYwSU6ie+aZsWI4n
 NjHxNvy4MDBLG2qp+/9ANQxUH6RGc6JLxwm3/SUHo+f7/CrSRFKd9TxsrSizY3GEGvhl
 haQdrm31pyvTEfJpJ7TkYL6U2Dt78xL9dDXqAf04H0gj7L30Sd5eTxpEkkihpooyeJOH
 JY65CjH+Ml2MzU78Q/rwxqz+eiqAbx3wltYMaUTw22uXkUIuK3QDLxSG+rUsDH2jyPji
 eIJfXhVHnkyF+FsNpcJxUkMPuRd5t7gGCHlxXXnTVgrTn3ZSt1B/lHA/EHZrl//G5D72
 izMg==
X-Gm-Message-State: AFqh2kqrlqw+bBQx9K+eb87q6n17lcX75lsjNgodKTcylCk262UXeV2j
 nR00FvPemJduDKHxiixN9Zq3v0P65B4UdS3AO5w87Q4pmIoPOm661KAmSEsn8G2t5aeCfqkB+e/
 CZo3XBIAjK67MyFI=
X-Received: by 2002:ac8:12ca:0:b0:3a8:2d6:521e with SMTP id
 b10-20020ac812ca000000b003a802d6521emr45762789qtj.37.1674067719350; 
 Wed, 18 Jan 2023 10:48:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXudXQsAmoLmeIt2mou6m55xKcHKU/lV+pef2Cg+V7Tyw+MEb4Ii4+34z7xsCRy8cFMcQ5D8aw==
X-Received: by 2002:ac8:12ca:0:b0:3a8:2d6:521e with SMTP id
 b10-20020ac812ca000000b003a802d6521emr45762766qtj.37.1674067719048; 
 Wed, 18 Jan 2023 10:48:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bp35-20020a05620a45a300b00705b4001fbasm7343450qkb.128.2023.01.18.10.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 10:48:37 -0800 (PST)
Message-ID: <c10df5a4-ad66-6868-3ce6-a3921a4c5727@redhat.com>
Date: Wed, 18 Jan 2023 19:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com> <Y8FQ9li7gQ+bPiRe@myrica>
 <20230113105700.2d860fbe.alex.williamson@redhat.com>
 <Y8g0YQ4NylOUzeUW@myrica>
 <20230118112832.261d6bea.alex.williamson@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230118112832.261d6bea.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 1/18/23 19:28, Alex Williamson wrote:
> On Wed, 18 Jan 2023 18:03:13 +0000
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
>> On Fri, Jan 13, 2023 at 10:57:00AM -0700, Alex Williamson wrote:
>>> On Fri, 13 Jan 2023 12:39:18 +0000
>>> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
>>>   
>>>> Hi,
>>>>
>>>> On Mon, Jan 09, 2023 at 10:11:19PM +0100, Eric Auger wrote:  
>>>>>> Jean, do you have any idea about how to fix that? Do you think we have a
>>>>>> trouble in the acpi/viot setup or virtio-iommu probe sequence. It looks
>>>>>> like virtio probe and attach commands are called too early, before the
>>>>>> bus is actually correctly numbered.    
>>>>>
>>>>> So after further investigations looks this is not a problem of bus
>>>>> number, which is good at the time of the virtio cmd calls but rather a
>>>>> problem related to the devfn (0 was used when creating the IOMMU MR)
>>>>> whereas the virtio-iommu cmds looks for the non aliased devfn. With that
>>>>> fixed, the probe and attach at least succeeds. The device still does not
>>>>> work for me but I will continue my investigations and send a tentative fix.    
>>>>
>>>> If I remember correctly VIOT can deal with bus numbers because bridges are
>>>> assigned a range by QEMU, but I haven't tested that in detail, and I don't
>>>> know how it holds with conventional PCI bridges.  
>>>
>>> In my reading of the virtio-iommu spec,  
>>
>> Hm, is that the virtio-iommu spec or ACPI VIOT/device tree spec?
>> The virtio-iommu spec shouldn't refer to PCI buses at the moment. The
>> intent is that for PCI, the "endpoint ID" passed in an ATTACH request
>> corresponds to PCI segment and RID of PCI devices at the time of the
>> request (so after the OS renumbered the buses). If you found something in
>> the spec that contradicts this, it should be fixed. Note that "endpoint"
>> is a misnomer, it can refer to PCI bridges as well, anything that can
>> issue DMA transactions.
> 
> Sorry, the ACPI spec defining the VIOT table[1]:
> 
> 	Each node identifies one or more devices using either their PCI
> 	Handle or their base MMIO (Memory-Mapped I/O) address. A PCI
> 	Handle is a PCI Segment number and a BDF (Bus-Device-Function)
> 	with the following layout:
> 
> 	* Bits 15:8 Bus Number
> 
> 	* Bits 7:3 Device Number
> 
> 	* Bits 2:0 Function Number
> 
> 	This identifier corresponds to the one observed by the
> 	operating system when parsing the PCI configuration space for
> 	the first time after boot.
> 
>>> I noted that it specifies the
>>> bus numbers *at the time of OS handoff*, so it essentially washes its
>>> hands of the OS renumbering buses while leaving subtle dependencies on
>>> initial numbering in the guest and QEMU implementations.  
>>
>> Yes we needed to describe in the firmware tables (device-tree and ACPI
>> VIOT) which devices the IOMMU manages. And at the time we generate the
>> tables, if we want to refer to PCI devices behind bridges, we can either
>> use catch-all ranges for any possible bus numbers they will get, or
>> initialize bus numbers in bridges and pass those to the OS.
>>
>> But that's only to communicate the IOMMU topology to the OS, because we
>> couldn't come up with anything better. After it sets up PCI the OS should
>> be able to use its own configuration of the PCI topology in virtio-iommu
>> requests.
> 
> The VT-d spec[2](8.3.1) has a more elegant solution using a path
> described in a device scope, based on a root bus number (not
> susceptible to OS renumbering) and a sequence of devfns to uniquely
> describe a hierarchy or endpoint, invariant of OS bus renumbering.
> Thanks,

Independently on the potential issue raised by Alex about later bus
renumbering, I observe that the VIOT content, in my case, is correct and
properly advertises the translation of the RIDs of all my devices. So
the iommu group topology issue I have on guest is not due to the VIOT
ACPI table content.

Eric
> 
> Alex
> 
> [1]https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#virtual-i-o-translation-viot-table-header
> [2]https://cdrdv2-public.intel.com/671081/vt-directed-io-spec.pdf
> 


