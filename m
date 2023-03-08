Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD16B071A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 13:31:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZswB-0003u6-3q; Wed, 08 Mar 2023 07:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZsw8-0003tJ-QH
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZsw7-0002j9-3A
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678278625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGRln10sVXB6Xusxw8UEt/bHb6OCph6oyKLmRrGOauw=;
 b=E5doVZZA/nto9VYzhhHQXq9YbpDAafMu3SCx1r4n9X06ZBa1Zy14wSx1uZohn8dRDdSYmU
 AJm+yaAeM1tzwhGK6xMR6YXeP3ON8cUlpOVsZUDXRgBfXSQJntjtTN5z0ptAEm6lceUwwI
 YM4HOFOJrMfenmgWRYK0gVEbckoDhtI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-mkBtajX8MwOfwF2xc5Jf1g-1; Wed, 08 Mar 2023 07:30:24 -0500
X-MC-Unique: mkBtajX8MwOfwF2xc5Jf1g-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso18358784edd.8
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 04:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678278622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGRln10sVXB6Xusxw8UEt/bHb6OCph6oyKLmRrGOauw=;
 b=scKmWafNa6FLaFkWC088Bx1jG6p2J4QE8LY7NQL0w0LU1BMesG9ggixTSmA/aa/p6g
 dNg0K0Bc0ogVkoln8tRNGQSAGqwlme7s9pDQN7w7eBNT5JFAcqgYQ8lz9Ay86MH0vvv9
 s1kDTLC+f0/IC5LLJ67Bg0N6BwO1FjQuF27SPWpXn+WRUPTFY31h2ZAXf6Ao53R+pGrf
 roFngOwJ5GLiZmD4eHS0RzuXMDUBTzQwDg+LNa443HMgw1QmIWv4l4XecZXoWO3BKFf+
 QN3DoWx1uP1NHfUrbxGkZcG/Mch5NG3vHQjyaBznH01yEKwC/v9D/EQca6QlrLKzn27O
 UDOA==
X-Gm-Message-State: AO0yUKVxUgAy6RvWgQGKmnsvdNTmTUWS5nm+2TONdL8QnxW1qX6BunQV
 8Mm3OXz3OiYeOAifsNaoHC+7/R+OQDFH0ZwLEeNcJR0M+hBzEYUv2gEkRiTchUNrVIh5oErxdY9
 xWeBXx3VSjb4LxY71Xmqqo7Q=
X-Received: by 2002:a17:906:274f:b0:87b:3d29:2990 with SMTP id
 a15-20020a170906274f00b0087b3d292990mr19832102ejd.9.1678278622487; 
 Wed, 08 Mar 2023 04:30:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8uwKKwvlncg3O7HdjQnxaB+ilffrJELcv87XhfRCq/4OSkE0L9tq08Qd4SZ/QCZqx+/WL08Q==
X-Received: by 2002:a17:906:274f:b0:87b:3d29:2990 with SMTP id
 a15-20020a170906274f00b0087b3d292990mr19832085ejd.9.1678278622204; 
 Wed, 08 Mar 2023 04:30:22 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 24-20020a170906301800b008f883765c9asm7425671ejz.136.2023.03.08.04.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 04:30:21 -0800 (PST)
Date: Wed, 8 Mar 2023 13:30:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Message-ID: <20230308133020.28aabe98@imammedo.users.ipa.redhat.com>
In-Reply-To: <fad9136f-08d3-3fd9-71a1-502069c000cf@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230307115147.42df4ba0@imammedo.users.ipa.redhat.com>
 <fad9136f-08d3-3fd9-71a1-502069c000cf@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 13:46:36 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 07.03.23 11:51, Igor Mammedov wrote:
> > On Thu, 16 Feb 2023 12:47:51 +0100
> > David Hildenbrand <david@redhat.com> wrote:
> >   
> >> Having multiple devices, some filtering memslots and some not filtering
> >> memslots, messes up the "used_memslot" accounting. If we'd have a device
> >> the filters out less memory sections after a device that filters out more,
> >> we'd be in trouble,

it should say why/when it happens (in example you've provided
it's caused by mix of in kernel vhost and vhost-user devices)

> >> because our memslot checks stop working reliably.
> >> For example, hotplugging a device that filters out less memslots might end
> >> up passing the checks based on max vs. used memslots, but can run out of
> >> memslots when getting notified about all memory sections.  
> > 
> > an hypothetical example of such case would be appreciated
> > (I don't really get how above can happen, perhaps more detailed explanation
> > would help)  
> 
> Thanks for asking! AFAIKT, it's mostly about hot-adding first a vhost devices
> that filters (and messes up used_memslots), and then messing with memslots that
> get filtered out,
> 
> $ sudo rmmod vhost
> $ sudo modprobe vhost max_mem_regions=4
> 
> // startup guest with virtio-net device
> ...
> 
> // hotplug a NVDIMM, resulting in used_memslots=4
> echo "object_add memory-backend-ram,id=mem0,size=128M" | sudo nc -U /var/tmp/mon_src; echo ""
> echo "device_add nvdimm,id=nvdimm0,memdev=mem0" | sudo nc -U /var/tmp/mon_src
> 
> // hotplug vhost-user device that overwrites "used_memslots=3"
> echo "device_add vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs,bus=root" | sudo nc -U /var/tmp/mon_src
> 
> // hotplug another NVDIMM
> echo "object_add memory-backend-ram,id=mem1,size=128M" | sudo nc -U /var/tmp/mon_src; echo ""
> echo "device_add pc-dimm,id=nvdimm1,memdev=mem1" | sudo nc -U /var/tmp/mon_src
> 
> // vvhost will fail to update the memslots
> vhost_set_mem_table failed: Argument list too long (7)
> 
> 
> So we tricked used_memslots to be smaller than it actually has to be, because
> we're ignoring the memslots filtered out by the vhost-user device.
> 
> 
> Now, this is all far from relevant in practice as of now I think, and
> usually would indicate user errors already (memory that's not shared with
> vhost-user?).

well vhost-user device_add should fail if it can't get hands on all RAM
(if it doesn't we have a bug somewhere else)

> 
> It might gets more relevant when virtio-mem dynamically adds/removes memslots and
> relies on precise tracking of used vs. free memslots.
> 
> 
> But maybe I should just ignore that case and live a happy life instead, it's
> certainly hard to even trigger right now :)
> >     
> >> Further, it will be helpful in memory device context in the near future
> >> to know that a RAM memory region section will consume a memslot, and be
> >> accounted for in the used vs. free memslots, such that we can implement
> >> reservation of memslots for memory devices properly. Whether a device
> >> filters this out and would theoretically still have a free memslot is
> >> then hidden internally, making overall vhost memslot accounting easier.
> >>

> >> Let's filter the memslots when creating the vhost memory array,
> >> accounting all RAM && !ROM memory regions as "used_memslots" even if
> >> vhost_user isn't interested in anonymous RAM regions, because it needs
> >> an fd.

that would regress existing setups where it was possible
to start with N DIMMs and after this patch the same VM could fail to
start if N was close to vhost's limit in otherwise perfectly working
configuration. So this approach doesn't seem right. 

Perhaps redoing vhost's used_memslots accounting would be
a better approach, right down to introducing reservations you'd
like to have eventually.

Something like:
  1: s/vhost_has_free_slot/vhost_memory_region_limit/
     and maybe the same for kvm_has_free_slot
  then rewrite memory_device_check_addable() moving all
  used_memslots accounting into memory_device core.

> >> When a device actually filters out regions (which should happen rarely
> >> in practice), we might detect a layout change although only filtered
> >> regions changed. We won't bother about optimizing that for now.
> >>
> >> Note: we cannot simply filter out the region and count them as
> >> "filtered" to add them to used, because filtered regions could get
> >> merged and result in a smaller effective number of memslots. Further,
> >> we won't touch the hmp/qmp virtio introspection output.  
> > What output exactly you are talking about?  
> 
> hw/virtio/virtio-qmp.c:qmp_x_query_virtio_status
> 
> Prints hdev->n_mem_sections and hdev->n_tmp_sections. I won't be
> touching that (debug) output.
> 
> > 
> > PS:
> > If we drop vhost_dev::memm the bulk of this patch would go away  
> 
> Yes, unfortunately we can't I think.
> 
> > 
> > side questions:
> > do we have MemorySection merging on qemu's kvm side?  
> 
> Yes, we properly merge in flatview_simplify(). It's all about handling holes
> in huge pages IIUC.
> 
> > also does KVM merge merge memslots?  
> 
> No, for good reasons not. Mapping more than we're instructed to map via a notifier
> sounds is kind-of hacky already. But I guess there is no easy way around it (e.g., if
> mapping that part of memory doesn't work, we'd have to bounce the reads/writes
> through QEMU instead).
> 


