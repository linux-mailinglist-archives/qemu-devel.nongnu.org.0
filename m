Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F06ADF09
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:47:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWij-0002O0-Mq; Tue, 07 Mar 2023 07:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZWiR-0002NV-O5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZWiH-0003k0-QQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678193200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3VggtoNgBJJ7f1/6g47sDR9LNlh45zModSWyn5pvBk=;
 b=YAtB13PNxiYddNCUqk4WC06gl2KJUcd/3+2yll180HzPwuk3NVqMr160eANpzQpePsdMW5
 jrJxDKXFsZLJJ2EzpdvWTTthQVyfLQeB4bK95yaQwPoSy0U7g28/4WA7taT/gEe3mnIBt2
 DPj8REPTWsBwZWXOl2qXEsTLgK5B5js=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-sEeLeNOhPdKjHzhwuso0bA-1; Tue, 07 Mar 2023 07:46:39 -0500
X-MC-Unique: sEeLeNOhPdKjHzhwuso0bA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so8213357wma.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678193198;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3VggtoNgBJJ7f1/6g47sDR9LNlh45zModSWyn5pvBk=;
 b=d1eQE8SCy51+HD2sZjs+QoGkjR9nidPy0TchxMRjANKd8kFEkaJEtxk+Ejv/nJiy6b
 McClY5daDuZvROQRMcjM5f9PyuUoiVJ9h9QvCaHpbs5bNEaau9X+h1nPbMDsHP4S557g
 ChW8nDyH8KxUmZJV/eQLFSMsfTwshREzSIlUgX6Vk5JE6PxOpol082asN8XZfzFB4unh
 RIPVg4nM+NK4oWtPYX0GGhJ35lJh5v4GA80fu6Rd0E6L1MEm1+6F1aj5eyDc2srypgL6
 cyaoO4fgCiepPG9mETpuR7y5buVn43gyDS7XyjF+Wnddwo1MszeToLqXDr1Z/vynm40L
 qfSw==
X-Gm-Message-State: AO0yUKUACP9D2Sgqi6/oag6bdqKmXrqcnJuvFbP2XBTV1ybRvgaDFqTH
 pbrmyDceju7jwYd3YfLW/0wNWY8hLcE59w75AZZcBkR1BH10eMVY2Z4DqO6qsPSEdLtXh+/KidW
 B/AC2lYS/O6dx+48=
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr12784647wmq.20.1678193198081; 
 Tue, 07 Mar 2023 04:46:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9K8gv/CNbGJK4WWH1CEE71HIEZ4y7tg0jGcJ7Vvc9wqKy7DBZ94VRMIPPF6Q/031bDsufYew==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr12784622wmq.20.1678193197631; 
 Tue, 07 Mar 2023 04:46:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:a100:e20:41da:c49b:8974?
 (p200300cbc707a1000e2041dac49b8974.dip0.t-ipconnect.de.
 [2003:cb:c707:a100:e20:41da:c49b:8974])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c170a00b003db0bb81b6asm12696486wmn.1.2023.03.07.04.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:46:37 -0800 (PST)
Message-ID: <fad9136f-08d3-3fd9-71a1-502069c000cf@redhat.com>
Date: Tue, 7 Mar 2023 13:46:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230307115147.42df4ba0@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
In-Reply-To: <20230307115147.42df4ba0@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07.03.23 11:51, Igor Mammedov wrote:
> On Thu, 16 Feb 2023 12:47:51 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Having multiple devices, some filtering memslots and some not filtering
>> memslots, messes up the "used_memslot" accounting. If we'd have a device
>> the filters out less memory sections after a device that filters out more,
>> we'd be in trouble, because our memslot checks stop working reliably.
>> For example, hotplugging a device that filters out less memslots might end
>> up passing the checks based on max vs. used memslots, but can run out of
>> memslots when getting notified about all memory sections.
> 
> an hypothetical example of such case would be appreciated
> (I don't really get how above can happen, perhaps more detailed explanation
> would help)

Thanks for asking! AFAIKT, it's mostly about hot-adding first a vhost devices
that filters (and messes up used_memslots), and then messing with memslots that
get filtered out,

$ sudo rmmod vhost
$ sudo modprobe vhost max_mem_regions=4

// startup guest with virtio-net device
...

// hotplug a NVDIMM, resulting in used_memslots=4
echo "object_add memory-backend-ram,id=mem0,size=128M" | sudo nc -U /var/tmp/mon_src; echo ""
echo "device_add nvdimm,id=nvdimm0,memdev=mem0" | sudo nc -U /var/tmp/mon_src

// hotplug vhost-user device that overwrites "used_memslots=3"
echo "device_add vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs,bus=root" | sudo nc -U /var/tmp/mon_src

// hotplug another NVDIMM
echo "object_add memory-backend-ram,id=mem1,size=128M" | sudo nc -U /var/tmp/mon_src; echo ""
echo "device_add pc-dimm,id=nvdimm1,memdev=mem1" | sudo nc -U /var/tmp/mon_src

// vvhost will fail to update the memslots
vhost_set_mem_table failed: Argument list too long (7)


So we tricked used_memslots to be smaller than it actually has to be, because
we're ignoring the memslots filtered out by the vhost-user device.


Now, this is all far from relevant in practice as of now I think, and
usually would indicate user errors already (memory that's not shared with
vhost-user?).

It might gets more relevant when virtio-mem dynamically adds/removes memslots and
relies on precise tracking of used vs. free memslots.


But maybe I should just ignore that case and live a happy life instead, it's
certainly hard to even trigger right now :)

>   
>> Further, it will be helpful in memory device context in the near future
>> to know that a RAM memory region section will consume a memslot, and be
>> accounted for in the used vs. free memslots, such that we can implement
>> reservation of memslots for memory devices properly. Whether a device
>> filters this out and would theoretically still have a free memslot is
>> then hidden internally, making overall vhost memslot accounting easier.
>>
>> Let's filter the memslots when creating the vhost memory array,
>> accounting all RAM && !ROM memory regions as "used_memslots" even if
>> vhost_user isn't interested in anonymous RAM regions, because it needs
>> an fd.
>>
>> When a device actually filters out regions (which should happen rarely
>> in practice), we might detect a layout change although only filtered
>> regions changed. We won't bother about optimizing that for now.
>>
>> Note: we cannot simply filter out the region and count them as
>> "filtered" to add them to used, because filtered regions could get
>> merged and result in a smaller effective number of memslots. Further,
>> we won't touch the hmp/qmp virtio introspection output.
> What output exactly you are talking about?

hw/virtio/virtio-qmp.c:qmp_x_query_virtio_status

Prints hdev->n_mem_sections and hdev->n_tmp_sections. I won't be
touching that (debug) output.

> 
> PS:
> If we drop vhost_dev::memm the bulk of this patch would go away

Yes, unfortunately we can't I think.

> 
> side questions:
> do we have MemorySection merging on qemu's kvm side?

Yes, we properly merge in flatview_simplify(). It's all about handling holes
in huge pages IIUC.

> also does KVM merge merge memslots?

No, for good reasons not. Mapping more than we're instructed to map via a notifier
sounds is kind-of hacky already. But I guess there is no easy way around it (e.g., if
mapping that part of memory doesn't work, we'd have to bounce the reads/writes
through QEMU instead).

-- 
Thanks,

David / dhildenb


