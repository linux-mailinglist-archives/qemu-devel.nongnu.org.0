Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6B45761D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:58:30 +0100 (CET)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo89c-0007Cc-R1
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo88F-0006Hj-Fv
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo88C-00082h-Tr
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637344618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5zgyr3e7VPgLIDxbz6Sbm57VyOf5TWT82Y8sibq3fo=;
 b=amLjc2j0SUOMjuOCxWuRWFCWgZg4gtv9CEyHVuepxNElgJNPsifoC/oRVHGLYmfUzCnu+T
 eyfFEBp0Yq2m8TKUXFaUlmVnEgWwfCyXVQ6ZQ91/WopT85jFhqGRLIobF0mwYFQG1Gsc9G
 pdIVsdayOzGiJeL39ds1CrlGYcpapCA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-wgf4f1ZwNj2achXf3qNe7g-1; Fri, 19 Nov 2021 12:56:57 -0500
X-MC-Unique: wgf4f1ZwNj2achXf3qNe7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so4413739wmb.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=V5zgyr3e7VPgLIDxbz6Sbm57VyOf5TWT82Y8sibq3fo=;
 b=W1Uy7xDP/kRo2vRk3nPx6frhG19gdN99V2s9ECdMyWtYIGE+cgC8JaGZiNiHKIii5r
 iGU+YB2FQ2O/VMGmZ+GsXxcbuzN4zOe+iONR2VsoEVkiA4xwtUj8wb417EeOysE1vtmM
 JCepvamSxC9wxkhTyaCnBAtPu/RN53mFAwPPThoVHFVgCkU57nU+T+9isz1KyQUnJeHw
 Q/8YslacDtnRfSgGyK1Np3UJdP+nKXRGY8c2pxN987cGrO/rfBMDt1GUXgJK3He0Q8lf
 RvrfULiQKX3QWOXKMCH3lzZX1rhFBkVUDlmBoPvCpg779wlt+W985wclSQAZWGDROKnL
 CoRA==
X-Gm-Message-State: AOAM530ruZGPcdoA7kkkxmC9E7ntCBA9nE3pKKYri85xE0sGn6Rd5c8d
 C/yIzF9M+0TuVt3bb34z6Asrns3ajmtGoFafAbtY7M7p4EKWtsystr88Co71bdGApvAmd81pbTI
 1N1MdQsfhgduufRg=
X-Received: by 2002:a7b:c207:: with SMTP id x7mr1935795wmi.108.1637344616174; 
 Fri, 19 Nov 2021 09:56:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc6HUnRaYjcHXMpSZie9WD6jj+roYM5tLVBpXifrPhPfd4lHU9jiHpAdS0YJlO8FrjzmfK/A==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr1935754wmi.108.1637344615858; 
 Fri, 19 Nov 2021 09:56:55 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6271.dip0.t-ipconnect.de. [91.12.98.113])
 by smtp.gmail.com with ESMTPSA id
 l15sm311197wme.47.2021.11.19.09.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 09:56:55 -0800 (PST)
Message-ID: <ff21ed32-b3a4-621e-0ec0-bf4ee180e245@redhat.com>
Date: Fri, 19 Nov 2021 18:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
 <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
 <20211117143015.00002e0a@Huawei.com>
 <8576e0e8-aa06-1c05-9849-806c2bce4141@redhat.com>
 <20211118102837.00002069@Huawei.com>
 <655c65af-fd7a-8007-37b3-a56c60a0ec5b@redhat.com>
 <20211118112306.00004b55@Huawei.com> <20211119105851.0000594a@Huawei.com>
 <33b10c1b-46c2-3107-ddad-ca532b2c40e4@redhat.com>
 <20211119172607.0000019f@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
In-Reply-To: <20211119172607.0000019f@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, alison.schofield@intel.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 kangkang.shen@futurewei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> I'd really appreciate if we could instead have something that makes virt
>> happy as well ("makes no sense in any physical system"), because virt is
>> most probably the biggest actual consumer of ACPI memory hotplug out
>> there (!).
> 
> No problem with finding such a solution - but it's an ASWG question
> (be it with a code first discussion). I have no idea what other
> operating systems would do with overlapping nodes today.  We need to
> jump through the hoops to make sure any solution is mutually agreed.
> Maybe the solution is a new type of entry or flag that makes it clear
> the 'real' node mapping is not PA range based?

Yeah, something like "we might see hotplug within this range to this
node" would clearly express what could happen as of now in QEMU.

> 
>>
>> I mean, for virt as is we will never know which PA range will belong to
>> which node upfront. All we know is that there is a PA range that could
>> belong to node X-Z. Gluing a single range to a single node doesn't make
>> too much sense for virt, which is why we have just been using it to
>> indicate the maximum possible PFN with a fantasy node.
> 
> I'm not convinced that's true. The physical memory
> is coming from somewhere (assuming RAM backed).  I would assume the ideal
> if going to the effort of passing NUMA into a VM, would be to convey
> the same NUMA characteristics to the VM.  So add it to the VM at
> the PA range that matches the appropriate host system NUMA node.

I think we only have real experience with vNUMA when passing through a
subset of real NUMA nodes -- performance differentiated memory was so
far not part of the bigger picture.

The issues start once you allow for more VM RAM than you have into your
hypervisor, simply because you can due to memory overcommit, file-backed
memory ... which can mess with the PA assumptions.

As you say, with all fully RAM backed (excluding SWAP) there is no
overcommit, there are no emulated RAM devices and things are easier.

>>
>> Overlapping regions would really simplify the whole thing, and I think
>> if we go down that path we should go one step further and indicate the
>> hotpluggable region to all nodes that might see hotplug (QEMU -> all
>> nodes). The ACPI clarification would then be that we can have
>> overlapping ranges and that on overlapping ranges all indicated nodes
>> would be a possible target later. That would make perfect sense to me
>> and make both phys and virt happy.
> 
> One alternative I mentioned briefly earlier is don't use ACPI at all.
> For the new interconnects like CXL the decision was made that it wasn't
> a suitable medium so they had CDAT (which is provided by the device)
> instead. It's an open question how that will be handled by the OS at the
> moment, but once solved (and it will need to be soon) that provides
> a means to specify all the same data you get from ACPI NUMA description,
> and leaves the OS to figure out how to merge it with it's internal
> representation of NUMA.
> 
> For virtio-mem / PCI at least it seems a fairly natural match.

Yes, for virtio-mem-pci it would be a natural match I guess. I yet have
to look into the details. I'd be happy to just use any other mechanism
than ACPI to

a) Tell the OS early about the maximum possible PFN
b) Tell the OS early about possible nodes

>>
>>
>> Two ways to avoid overlapping regions, which aren't much better:
>>
>> 1) Split the hotpluggable region up into fantasy regions and assign one
>> fantasy region to each actual node.
>>
>> The fantasy regions will have nothing to do with reality late (just like
>> what we have right now with the last node getting assigned the whole
>> hotpluggable region) and devices might overlap, but we don't really
>> care, because the devices expose the actual node themselves.
>>
>>
>> 2) Duplicate the hotpluggable region accross all nodes
>>
>> We would have one hotpluggable region with a dedicate PA space, and
>> hotplug the device into the respective node PA space.
>>
>> That can be problematic, though, as we can easily run out of PA space.
>> For example, my Ryzen 9 cannot address anything above 1 TiB. So if we'd
>> have a hotpluggable region of 256 GiB, we'll already be in trouble with
>> more than 3 nodes.
> 
> My assumption was that the reason to do this is to pass through node
> mappings that line up with the underlying physical system.  If that's the case
> then the hotpluggable regions for each node could be made to match what is
> there.
> 
> Your Ryzen 9 would normally only have one node?

Yes. I recon it would support NVDIMMs one might want to expose via a
virtual NUMA node to the VM. I assume it would not be represented via a
dedicated NUMA node to my machine.

> 
> If the intent is to sue these regions for more complex purposes (maybe file
> backed memory devices?) then things get more interesting, but how useful
> is mapping them to conventional NUMA representations?

Emulated NVDIMMs and virtio-pmem are the interesting cases I guess. The
issue is much rather that the PA layout of the real machine does no
longer hold.

-- 
Thanks,

David / dhildenb


