Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A43F70E9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:09:43 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInyb-0005BX-Um
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mInxk-0003lL-PM
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 04:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mInxj-0007MH-1w
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 04:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629878922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHv6FqhfFc3pBb8cfh1oPUwCJU4D6byrdXvL0mdXQGg=;
 b=XIr/InxO/mWzDNOSRi2wIMSaRlqhln1Pc9wveN97lt6i+uV9ylEaeh44Qehn1s8CM4UuhZ
 Uhl3oG3/AmNeoDKhFMhtjshcj2JIgGwc4IFtMYO+w/p4BSW2AjC3PFVoBZzZ32WvQCCw0h
 rhGeW6l/XcgbaDRy6mFkgu/8jEhqE8E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-_eX_yr9ZNdalVmVLTVN2ZQ-1; Wed, 25 Aug 2021 04:08:41 -0400
X-MC-Unique: _eX_yr9ZNdalVmVLTVN2ZQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso6370023wri.18
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 01:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SHv6FqhfFc3pBb8cfh1oPUwCJU4D6byrdXvL0mdXQGg=;
 b=nH4L5bM6BaMdSoaGefZ1rjW9BTq7NPClcjlHZfiMMlr6JtxY01vv9MVfLxWEpHGBkR
 h/ZHbKYzrgggQJmHoEwqas/lji3ejOzFP/UKpIsxEGvb3M17GLNYRBGBMN0W6B+/tPUP
 mgasxmDjPy7LkhHtjTOOxyjEn7b0TvMzoV9F1UDdfmgcMsEZCbqZ3Yfv5FJYx90ySBKi
 wWY587e4pwkptqMrtWIPJFbfqvsQJZyOxFAtpSCrxmxVpC21/3pBjF0BIjMQuxTLyn1y
 7uANPL4HFZ4q+C7wQx0hoIpLqdz7OnD9drim9vKqN0vsq/b+kOLHBk4fSr7ViiKBpgtW
 FXKw==
X-Gm-Message-State: AOAM531rgJreO5i9Jdm1glcnCKZiXdzM/rL/RrSgQLAjR/up5e8lbRyh
 hWZ1nxcFwjg8IjEvmphBkYnw3m+iIHvQsHToL2490ohoT35Lfh7LlLOneJoq5qT82RdZyidl5da
 8vxiG1NrNwiIYNWc=
X-Received: by 2002:a7b:ce0f:: with SMTP id m15mr7924753wmc.62.1629878919836; 
 Wed, 25 Aug 2021 01:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKv+ERXDFWgsXtwEdrOO3E4Ew3hXwzxx+1tso6XUto8GC7yIJ5QvawJsmB6uasNUX6b48CMg==
X-Received: by 2002:a7b:ce0f:: with SMTP id m15mr7924735wmc.62.1629878919602; 
 Wed, 25 Aug 2021 01:08:39 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d6b.dip0.t-ipconnect.de. [79.242.61.107])
 by smtp.gmail.com with ESMTPSA id c6sm4191433wrp.95.2021.08.25.01.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 01:08:39 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org>
 <4246646f-dee8-c868-0439-1ba7c8fdef3e@redhat.com> <YSVOCUREQaw+rTen@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <ca60c3c9-3372-53bb-04ff-dca1d2081e78@redhat.com>
Date: Wed, 25 Aug 2021 10:08:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSVOCUREQaw+rTen@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 21:52, Peter Xu wrote:
> On Tue, Aug 24, 2021 at 06:24:27PM +0200, David Hildenbrand wrote:
>>>> Not so much; here's the list of priorities and the devices using it:
>>>>
>>>>          |--------------------+---------|
>>>>          | priority           | devices |
>>>>          |--------------------+---------|
>>>>          | MIG_PRI_IOMMU      |       3 |
>>>>          | MIG_PRI_PCI_BUS    |       7 |
>>>>          | MIG_PRI_VIRTIO_MEM |       1 |
>>>>          | MIG_PRI_GICV3_ITS  |       1 |
>>>>          | MIG_PRI_GICV3      |       1 |
>>>>          |--------------------+---------|
>>>
>>> iommu is probably ok. I think virtio mem is ok too,
>>> in that it is normally created by virtio-mem-pci ...
>>
>> IIRC:
>>
>> intel-iommu has to be created on the QEMU cmdline before creating
>> virtio-mem-pci.
>>
>> -device intel-iommu,caching-mode=on,intremap=on,device-iotlb=on \
>> ...
>> -device virtio-mem-pci,disable-legacy=on,disable-modern=off,iommu_platform=on,ats=on,id=vm0,...
>>
>> Creating virtio-mem-pci will implicitly create virtio-mem. virtio-mem device
>> state has to be migrated before migrating intel-iommu state.
> 
> Since we're at it.. frankly I didn't fully digest why virtio-mem needs to be
> migrated before when reading commit 0fd7616e0f1171b.  It gives me the feeling
> more like that virtio-mem has a ordering dependency with vfio-pci not
> virtio-mem, but I could be wrong.

"We have to take care of incoming migration: at the point the
  IOMMUs get restored and start creating mappings in vfio,
  RamDiscardManager implementations might not be back up and running yet:
  let's add runstate priorities to enforce the order when restoring.

s/runstate/vmstate/ :|

I recall that we can see IOMMU_NOTIFIER_MAP events when restoring an 
IOMMU device. vfio_get_xlat_addr() would be called and could reject 
mappings targeting virtio-mem memory in case the virtio-mem device has 
not restored its bitmap from the migration stream such that 
ram_discard_manager_is_populated() would be reliable. Consequently, we 
have to restore the virtio-mem device state (not the virtio-mem-pci 
device state!) before restoring an IOMMU.



> 
> E.g., the IOMMU unit shouldn't be walking page table if without a device using
> it, then it won't fail until the device walks it in region_add() hooks when
> memory replay happens.

I recall it happened when switching to the iommu region e.g., in 
vtd_post_load()->vtd_switch_address_space(). But I forgot the exact call 
path.

-- 
Thanks,

David / dhildenb


