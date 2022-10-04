Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4788C5F3F22
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:03:49 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdq8-0007nb-Bo
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ofdhO-0008Vm-US
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ofdhK-00038h-Tv
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664873682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uo7ER/nK1LMFqMkHmwHsLQdfhrwV9qmsco7Z4/sG2uU=;
 b=ceMeGxoxdd/fCgwFsV/NqN8kVUDcfeEvrBCDUec45m1pq0lGXooAHAZQAbZNtS3+QNna/4
 O0n1LdtC8tr5+WbnXuRC8lEe0erh57skbIhtfIO/WrLxybKNDaskpJak+yUHV4+NrlWmNi
 BQ09r60BLJgr7OVzt9Y/imRWkY0RmhM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-r8-FpwetMT2UuUWjVHjF-Q-1; Tue, 04 Oct 2022 04:54:40 -0400
X-MC-Unique: r8-FpwetMT2UuUWjVHjF-Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 m3-20020adfc583000000b0022cd60175bbso3792261wrg.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=Uo7ER/nK1LMFqMkHmwHsLQdfhrwV9qmsco7Z4/sG2uU=;
 b=mK5ujN0/1raT3n7SNKcsIFiu3jN+laVnyKwdriYU1BTRWLSw9Hgf/8wWa5AHdSv2xR
 VUmDq2qValzlw9K8uuSuxvHufPkhh4RP4QgEWcT3cWltvxKItknSMNoeAyQxdiX4wNcm
 6NDgjERQignobahC4M7AvjvYjrz8Dn5PlSm868dqDZtte8agl24sEgVHD0zX9CDccpUH
 J8ZIbPya1yH+Z5nYkmsNGYVFiq9VLDa5lpWfbRelgYeplh10pQgKR6FZ4hpkxKfVzDvq
 mV7vz2xNJda99FlVkYy3RAPM6rXDglXXfwW+F44jPAK8EnEsvoz3L+t94Q7Lyu96lSzI
 oVeQ==
X-Gm-Message-State: ACrzQf2llLuN3UyQadUxHvQB6ph78DXkJ6l4+kZY2Pru5m4Zi7MDFetJ
 ZKS+vUHD4oSkHYXk0i8ySoW47UgSkFWOlr1gUAVlXTKKKabN4eTrZ0Pd5COb01orl/RRShlbQw7
 pMsHI10hf7xYeoIM=
X-Received: by 2002:a05:6000:90b:b0:22c:beec:5b26 with SMTP id
 bz11-20020a056000090b00b0022cbeec5b26mr15539657wrb.490.1664873679719; 
 Tue, 04 Oct 2022 01:54:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WFAMHYDuC0tTQw4anBzSqyxC4GjqpEg4bFSnp5S65ag6LN567tjqCV41204hShQqBiAZORw==
X-Received: by 2002:a05:6000:90b:b0:22c:beec:5b26 with SMTP id
 bz11-20020a056000090b00b0022cbeec5b26mr15539643wrb.490.1664873679406; 
 Tue, 04 Oct 2022 01:54:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:5000:4fff:1dd6:7868:a36?
 (p200300cbc70650004fff1dd678680a36.dip0.t-ipconnect.de.
 [2003:cb:c706:5000:4fff:1dd6:7868:a36])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfee83000000b0022cc3e67fc5sm11843095wro.65.2022.10.04.01.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 01:54:38 -0700 (PDT)
Message-ID: <ce438aff-ed23-86ac-dd01-281ff50ffd76@redhat.com>
Date: Tue, 4 Oct 2022 10:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 0/5] pci-ids: virtio cleanup
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 peter.maydell@linaro.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <4f186b7a-79b6-8253-c886-e8b24310ab8a@redhat.com>
 <20221004074438.b6v5dsatrlgfzs3c@sirius.home.kraxel.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221004074438.b6v5dsatrlgfzs3c@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.22 09:44, Gerd Hoffmann wrote:
> On Fri, Sep 30, 2022 at 04:22:21PM +0200, David Hildenbrand wrote:
>> On 30.09.22 15:58, Gerd Hoffmann wrote:
>>> Drop legacy ids for virtio 1.0 devices, they are not needed
>>> and will be overridden anyway by generic virtio pci code.
>>>
>>> Improve modern virtio id documentation.
>>>
>>> Gerd Hoffmann (5):
>>>     pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
>>>     pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
>>
>> I remember that for some weird reason, this was required for Linux to
>> actually make use of the device. I never figured out why -- maybe that
>> changed.
> 
> Looking at 'info pci' the mem + pmem devices look identical with and
> without this series ...
> 
>    Bus  0, device   3, function 0:
>      Class 0255: PCI device 1af4:1058
>        PCI subsystem 1af4:1100
>        IRQ 11, pin A
>        BAR4: 64 bit prefetchable memory at 0xfe000000 [0xfe003fff].
>        id ""
>    Bus  0, device   4, function 0:
>      Class 0255: PCI device 1af4:105b
>        PCI subsystem 1af4:1100
>        IRQ 10, pin A
>        BAR4: 64 bit prefetchable memory at 0xfe004000 [0xfe007fff].
>        id ""
> 
> ... and the PCI ID conforms virtio 1.0 (aka 0x1040 + virtio id).

I just did a quick test and it indeed seems to work as expected. Thanks!

-- 
Thanks,

David / dhildenb


