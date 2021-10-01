Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5741E7A0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 08:34:02 +0200 (CEST)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWC7N-0002pL-86
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 02:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWC5q-00024R-BP
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 02:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWC5m-0004n4-5u
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 02:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633069939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwgGN5Brqan7ZpXF5mRuRA3Yx4O/iyPE3kwKOR5o4gY=;
 b=X7fDQ5EJACMikrswX6mxwTdGCFpCHnp+kTr2yDotcHA9jJTbFoHeDTY57YIzZ3TKx4HPBh
 8D34FTAXRfUQCx4F8IXUnZS6b/KjoI3B25dGS2aE/YGows49pp3HCyEbjjL7d6zcq3tCrv
 fg38uitV5ej7b8DqMTSuk+5a5A8Tinw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-CytPv1oEPEScB1k9WBeu-w-1; Fri, 01 Oct 2021 02:32:16 -0400
X-MC-Unique: CytPv1oEPEScB1k9WBeu-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 z194-20020a1c7ecb000000b0030b7ccea080so5504114wmc.8
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 23:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LwgGN5Brqan7ZpXF5mRuRA3Yx4O/iyPE3kwKOR5o4gY=;
 b=sBtgoLBAen//R6RXOQLuYd/AJiWWbl0pNZo0duPfT5Mqs0b6G9gtzjNTF5HlAmnBzs
 FUebLwBqxiuA3lC12V0vXyKN1ohup/o/Ak4TrRYyUN9m6CyeAntttET/ubbl6kjn+l2e
 dWu8x9CIrE7Vz1R4PFZ3I9aWDbW6dHwA7L9ayX/xEQKJgt2DGZVYzeZza+S+YgvcZm9/
 mwVlz90L9u9KZOZ71TFke3WomBekoBdQ4EGkGcMz2Rpdst8kz7hcLmz87o5uyfxHCEYw
 S7LnxRs49s+LzXU0eAYdrZPG1cxpSeDaWXzF4/r4AuAjxZqCiz87XuMj03BUHjNcN4wy
 j2wQ==
X-Gm-Message-State: AOAM531orFLjvRj0VX4cnWZLQDqpihU5X4mnUs5PbzOlrardDqQGNclC
 pMHLLx0aXD9O+g/8EoSE+RcVveJZ7g/yh8jeFNpepqWfYivf28JfChwUjRqF4EHdqXWY6hsGv1E
 xhR26GiWv5ualJUQ=
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr2688104wmj.33.1633069935702; 
 Thu, 30 Sep 2021 23:32:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwodUJjJPWFHzYjxNP8tvyiFmV88jvwgOPuiNUS3DX/p/3s1Nta0t+hyYuyLasJ1yX0gCPauA==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr2688081wmj.33.1633069935431; 
 Thu, 30 Sep 2021 23:32:15 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.142])
 by smtp.gmail.com with ESMTPSA id r9sm4997169wru.2.2021.09.30.23.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 23:32:15 -0700 (PDT)
Message-ID: <2440584b-07db-0851-e25d-0f304075053f@redhat.com>
Date: Fri, 1 Oct 2021 08:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] failover: fix unplug pending detection
To: Ani Sinha <ani@anisinha.ca>
References: <20210930082032.1237812-1-lvivier@redhat.com>
 <alpine.DEB.2.22.394.2109301450580.579856@anisinha-lenovo>
 <ec216e3a-71a3-c7a5-628f-1871d063d2a2@redhat.com>
 <alpine.DEB.2.22.394.2110011046060.579856@anisinha-lenovo>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2110011046060.579856@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jens Freimann <jfreimann@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 07:19, Ani Sinha wrote:
> 
> 
> On Thu, 30 Sep 2021, Laurent Vivier wrote:
> 
>> On 30/09/2021 11:24, Ani Sinha wrote:
>>>
>>>
>>> On Thu, 30 Sep 2021, Laurent Vivier wrote:
>>>
>>>> Failover needs to detect the end of the PCI unplug to start migration
>>>> after the VFIO card has been unplugged.
>>>>
>>>> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset
>>>> in
>>>> pcie_unplug_device().
>>>>
>>>> But since
>>>>       17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on
>>>> Q35")
>>>> we have switched to ACPI unplug and these functions are not called anymore
>>>> and the flag not set. So failover migration is not able to detect if card
>>>> is really unplugged and acts as it's done as soon as it's started. So it
>>>> doesn't wait the end of the unplug to start the migration. We don't see
>>>> any
>>>> problem when we test that because ACPI unplug is faster than PCIe native
>>>> hotplug and when the migration really starts the unplug operation is
>>>> already done.
>>>>
>>>> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>>>>       a99c4da9fc2a ("pci: mark devices partially unplugged")
>>>
>>> Ok so I have a basic question about partially_hotplugged flag in the
>>> device struct (there were no comments added in a99c4da9fc2a39847
>>> explaining it). It seems we return early from pcie_unplug_device() when
>>> this flag is set from failover_unplug_primary() in virtio-net. What is the
>>> purpose of this flag? It seems we are not doing a full unplug of the
>>> primary device?
>>
>> Yes, to be able to plug it back in case of migration failure we must keep all
>> the data structures.
> 
> Ok so two things here:
> (a) could you please add a comment to PCIDevice struct in pci.h to clarify
> what the flag actually means, why it is there and what it is supposed to
> do.

Will be in v3.

> (b) the naming of the variable could be something like do_partial_unplug
> or some such. This could be a separate patch.

OK, I'll do that on a separate patch: I'm already working on a patch series moving most of 
the failover code to PCI files (hotplug is a PCI feature not a virtio one).

https://patchew.org/QEMU/20210820142002.152994-1-lvivier@redhat.com/

>   >
>> But reading the code again it seems this part should be in
>> acpi_pcihp_eject_slot() rather than in acpi_pcihp_device_unplug_cb() to
>> prevent the hotplug_handler_unplug()/object_unparent()  rather than the
>> qdev_unrealize() (to be like in pcie.c).
> 
> Correct. You need to place the check earlier so as to be equivalent to
> what the native hotplug code does.
> 

Thanks,
Laurent


