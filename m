Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063286A4609
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:27:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfNv-0005oC-VE; Mon, 27 Feb 2023 10:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWfNn-0005nr-QN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWfNm-00089o-11
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677511541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlU703ghvrG7RPISAJZwTUPL3HV688Kb7bxSs93jeCg=;
 b=Jf9eR8lLBECNKpYERI8zSVywMphpYxp21zd/VEQhx0NEBp1z9VYb2h9NLF4BugLUxVFQgU
 Jd08Yr351CSRWDblPDa6Wm78Y4CzJCmS3hNGMG0w4sLZWNIVa0PAZsAtbaWOMof8L3Y7xC
 cRxeB9IIS2zUeW7lF1URpdYHdb9qB88=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-jeFVLWx8MGqP0L4PZQDiJw-1; Mon, 27 Feb 2023 10:25:39 -0500
X-MC-Unique: jeFVLWx8MGqP0L4PZQDiJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so716994wrz.18
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 07:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rlU703ghvrG7RPISAJZwTUPL3HV688Kb7bxSs93jeCg=;
 b=2Uu+mh8e4vd9vnQneEe5WI2go3nFhg6FQUpPR64nXpVgpRsPzi3Qvhy3FI24Tmy/6d
 TW6o+bT/LziyrNbjwW6FnKSVfXNISg9+n6ub04Uza3tnfFwTGLUdwtFS7ny3nV5FCYFl
 3rdQL/20rt31k77yyKNveGdAIuVJc6cMK8pzfkPzPJyPoERY+GJLy2X5h6PBow+xlrKE
 veqMOQPeFQioVq6uaaKzq3iEAIN9djBe8ac6k5vqGVOwKahtxwNOZKX8nF2URHEq5b/m
 mvD7bQkqysze3tmO66iLrgmQVHSaPanHJJONH5urcdv529dyCWdUcmcqrEpwJRt3XkJ+
 uQ6w==
X-Gm-Message-State: AO0yUKVsSb70UlIJ5DNOAsxOhqNQzOHQSZvrIpCCpv0Gxg+mrtSZQwZT
 KCOGCP2i8Tie12B+FxDycfOnQb2zX+nsZBMcjoPsiozSlrgbr+ePnyYUm+l00+s0vz4oHU3Eq7C
 8NGSy9s6iMr44vEw=
X-Received: by 2002:a05:600c:a292:b0:3eb:368c:5eb with SMTP id
 hu18-20020a05600ca29200b003eb368c05ebmr5391776wmb.36.1677511538746; 
 Mon, 27 Feb 2023 07:25:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+mVhSlBBNb66QJRMMDxbPwC9kwL8TTXgPhM54cJTkDBX379aOed7zIH2TxdnUNHkX9RuDkhw==
X-Received: by 2002:a05:600c:a292:b0:3eb:368c:5eb with SMTP id
 hu18-20020a05600ca29200b003eb368c05ebmr5391755wmb.36.1677511538399; 
 Mon, 27 Feb 2023 07:25:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:1f00:7816:2307:5967:2228?
 (p200300cbc7031f007816230759672228.dip0.t-ipconnect.de.
 [2003:cb:c703:1f00:7816:2307:5967:2228])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003daf672a616sm9334591wmi.22.2023.02.27.07.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 07:25:37 -0800 (PST)
Message-ID: <0953dc26-da87-65c7-9bba-fec4cfb04999@redhat.com>
Date: Mon, 27 Feb 2023 16:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <369d848fdc86994ca646a5aa4e04c4dc049d04f1.1677274611.git.maciej.szmigiero@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <369d848fdc86994ca646a5aa4e04c4dc049d04f1.1677274611.git.maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 24.02.23 22:41, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This device works like a virtual DIMM stick: it allows inserting extra RAM

All DIMMs in QEMU are virtual. What you want it, a piece of memory that 
doesn not get exposed via ACPI or similar (and doesn't follow the 
traditional "slots" concept).

> into the guest at run time and later removing it without having to
> duplicate all of the address space management logic of TYPE_MEMORY_DEVICE
> in each memory hot-add protocol driver.

... which are these? virtio-mem and virtio-pmem do their own thing for 
good reasons. You're adding it for HV.

I don't think their is demand for a generic device. In fact, I have no 
idea what "HAPVDIMM" should actually mean.

If you really need such a device after we discussed the alternatives, 
please keep it hv-specific.

> 
> This device is not meant to be instantiated or removed by the QEMU user
> directly: rather, the protocol driver is supposed to add and remove it as
> required.

That sounds like the wrong approach to me. More on that below.

> 
> In fact, its very existence is supposed to be an implementation detail,
> transparent to the QEMU user.
> 
> To prevent the user from accidentally manually creating an instance of this
> device the protocol driver is supposed to place the qdev_device_add*() call
> (that is uses to add this device) between hapvdimm_allow_adding() and
> hapvdimm_disallow_adding() calls in order to temporary authorize the
> operation.
> 

The most important part first: the realize function of a device is not 
supposed to assing itself any resources. Calling memory device (un)plug 
functions from the realize function is wrong.

(Hot)plug handlers are the right approach for that. Please refer to how 
we chain hotplug handlers (machine hotplug handler -> bus hotplug 
handler) to implement virtio-mem and virtio-pmem. These hotplug handlers 
would also be the place where to reject a device if created by the user, 
for example.


But before we dive into the details of that, I wonder if you could just 
avoid having a memory device for each block of memory you want to add.


An alternative might be the following:

Have a hv-balloon device be a memory device with a configured maximum 
size and a memory device region container. Let the machine hotplug 
handler assign a contiguous region in the device memory region and map 
the memory device region container (while plugging that hv-balloon 
device), just like we do it for virtio-mem and virtio-pmem.

In essence, you reserve a region in physical address space that way and 
can decide what to (un)map into that memory device region container, you 
do your own placement.

So when instructed to add a new memory backend, you simply assign an 
address in the assigned region yourself, and map the memory backend 
memory region into the device memory region container.

The only catch is that that memory device (hv-balloon) will then consume 
multiple memslots (one for each memory backend), right now we only 
support 1 memslot (e.g., asking if one more slot is free when plugging 
the device).

I'm adding support for that right now to implement a virtio-mem 
extension -- the memory device says how many memslots it requires, and 
these will get reserved for that memory device; the memory device can 
then consume them later without further checks dynamically. That 
approach could be extended to increase/decrease the memslot requirement 
(the device would ask to increase/decrease its limit), if ever required.


-- 
Thanks,

David / dhildenb


