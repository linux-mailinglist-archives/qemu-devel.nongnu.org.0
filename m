Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416FA699489
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:40:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdXf-0000x3-Sc; Thu, 16 Feb 2023 07:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSdXb-0000wc-Pn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSdXZ-0006He-SP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676551148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvszT7DxZZG5tQMRADf95tl/FhwGrCrntku8B3esGLs=;
 b=PmHnc4CpuMikIh7ydTIoy1E8W5F5b8qJQWDxU4z3BfA0yXAGXCUNgX1u3l+JgMY/5nfZny
 J9eGBwiZyJXzVB6csQMLeHLaAz4drzH7hfEHE0jLDljwxltMYNxrSkTPsptWTJp49n56ry
 O1R+inJRzxXRfSABY1lBuMPomSJ1tIw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-d6FsH_fsNl2K05algwoW3A-1; Thu, 16 Feb 2023 07:39:05 -0500
X-MC-Unique: d6FsH_fsNl2K05algwoW3A-1
Received: by mail-wr1-f72.google.com with SMTP id
 y3-20020adfee03000000b002c59b266371so75594wrn.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GvszT7DxZZG5tQMRADf95tl/FhwGrCrntku8B3esGLs=;
 b=2p+A2tNstKQ7tILv9mM+5wV+l+YLmy2PvliTn02MeyotTDk3OHQZ2ZOMbIVzMDp2Ee
 hJXOLMsjpXP6kmBtw406nScNl5PsW93PGao+uDBppFntKrcu8hNMBX9rquufTGyaW5JX
 7Uc+ETPqA9cCxkN1KVIQDBSjqREtwGRMKu8d6RD15XNMq/UMRbT2jzlWczlxh9WbP+Oc
 yerPD+gND4SXeUFHUPHbPsOkS+OzcDpVe2Bvb2vh22CrKdUc4cW0EBYzAbU7RFX9tyt2
 I2/SbqqtxMxlHk8nXd1/wqd37/XL39aZt/uRs+oqMdGg+mI/9v/bk5Rs/fQkHHLXBsBD
 8q9g==
X-Gm-Message-State: AO0yUKWolrcag6wl5aqoiuRzRC0vYIFrJfKGiH7S3BSrV+bEAjQich1R
 el4L7mUA2I8u2YdIoE61Ck2HZ66l4rJTKj1IPOP7SuMn8hoHv+U0VJ0nmy+/JPO22clmX//1rr5
 KbV9Gl8CBtivGa5U=
X-Received: by 2002:a05:600c:a691:b0:3df:fa56:7a33 with SMTP id
 ip17-20020a05600ca69100b003dffa567a33mr4950379wmb.26.1676551144600; 
 Thu, 16 Feb 2023 04:39:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/BkB+rExbHMTm8xws2up5O2YN0cmfcJui0k6Kypb325U9kxWRL7rSHIDwnacPPRSSLaE2Siw==
X-Received: by 2002:a05:600c:a691:b0:3df:fa56:7a33 with SMTP id
 ip17-20020a05600ca69100b003dffa567a33mr4950364wmb.26.1676551144248; 
 Thu, 16 Feb 2023 04:39:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a?
 (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de.
 [2003:cb:c708:bc00:2acb:9e46:1412:686a])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b003dd8feea827sm5271973wmr.4.2023.02.16.04.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:39:03 -0800 (PST)
Message-ID: <39cd02b6-5237-1b5e-87af-523f7ff46b80@redhat.com>
Date: Thu, 16 Feb 2023 13:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230216070037-mutt-send-email-mst@kernel.org>
 <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
 <20230216072002-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230216072002-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16.02.23 13:21, Michael S. Tsirkin wrote:
> On Thu, Feb 16, 2023 at 01:10:54PM +0100, David Hildenbrand wrote:
>> On 16.02.23 13:04, Michael S. Tsirkin wrote:
>>> On Thu, Feb 16, 2023 at 12:47:51PM +0100, David Hildenbrand wrote:
>>>> Having multiple devices, some filtering memslots and some not filtering
>>>> memslots, messes up the "used_memslot" accounting. If we'd have a device
>>>> the filters out less memory sections after a device that filters out more,
>>>> we'd be in trouble, because our memslot checks stop working reliably.
>>>> For example, hotplugging a device that filters out less memslots might end
>>>> up passing the checks based on max vs. used memslots, but can run out of
>>>> memslots when getting notified about all memory sections.
>>>>
>>>> Further, it will be helpful in memory device context in the near future
>>>> to know that a RAM memory region section will consume a memslot, and be
>>>> accounted for in the used vs. free memslots, such that we can implement
>>>> reservation of memslots for memory devices properly. Whether a device
>>>> filters this out and would theoretically still have a free memslot is
>>>> then hidden internally, making overall vhost memslot accounting easier.
>>>>
>>>> Let's filter the memslots when creating the vhost memory array,
>>>> accounting all RAM && !ROM memory regions as "used_memslots" even if
>>>> vhost_user isn't interested in anonymous RAM regions, because it needs
>>>> an fd.
>>>>
>>>> When a device actually filters out regions (which should happen rarely
>>>> in practice), we might detect a layout change although only filtered
>>>> regions changed. We won't bother about optimizing that for now.
>>>
>>> That caused trouble in the past when using VGA because it is playing
>>> with mappings in weird ways.
>>> I think we have to optimize it, sorry.
>>
>> We still filter them out, just later.
> 
> 
> The issue is sending lots of unnecessary system calls to update the kernel which
> goes through a slow RCU.

I don't think this is the case when deferring the device-specific 
filtering. As discussed, the generic filtering (ignore !ram, ignore rom, 
ignore VMA) remains in place because that is identical for all devices.

> 
>>>> Note: we cannot simply filter out the region and count them as
>>>> "filtered" to add them to used, because filtered regions could get
>>>> merged and result in a smaller effective number of memslots. Further,
>>>> we won't touch the hmp/qmp virtio introspection output.
>>>>
>>>> Fixes: 988a27754bbb ("vhost: allow backends to filter memory sections")
>>>> Cc: Tiwei Bie <tiwei.bie@intel.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>
>>> I didn't review this yet but maybe you can answer:
>>> will this create more slots for the backend?
>>> Because some backends are limited in # of slots and breaking them is
>>> not a good idea.
>>
>> It restores the handling we had before 988a27754bbb. RAM without an fd
>> should be rare for vhost-user setups (where we actually filter) I assume?
> 
> Hmm, I guess so.

At least on simplistic QEMU invocations with vhost-user (and proper 
shared memory as backend) I don't see any such filtering happening, 
because everything that is RAM is proper fd-based.

IMHO the chance of braking a sane VM setup are very small.

-- 
Thanks,

David / dhildenb


