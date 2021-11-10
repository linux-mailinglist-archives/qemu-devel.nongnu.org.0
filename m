Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01844BEE4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:37:30 +0100 (CET)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkyv-0007eF-Br
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:37:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkkuv-00018C-AJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkkuk-0006XG-66
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636540388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RsCjO7orokWZYdZBXF1bTpQG1pj+5G/t//QYJf4puyM=;
 b=elqZ1PDHYRKR7dDb5L65UHk5+fmV6zuWikHb2zlcbwrDEdKTuAxIUveXRp5nvN/72q8bgW
 1+ZGo2+2ETBVRAKL0ZSIqkoM2kbgHECJcWyukZ0GciuwLorm5N34sfxdYCYRAcirJdq9e0
 i8EO29w3JckaaVs2bd+61SHBEC0syNU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-P__zQNoaOvuno_YbEK7UWQ-1; Wed, 10 Nov 2021 05:33:07 -0500
X-MC-Unique: P__zQNoaOvuno_YbEK7UWQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso1939996edj.13
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 02:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsCjO7orokWZYdZBXF1bTpQG1pj+5G/t//QYJf4puyM=;
 b=Na5ccKtVq48PYwiiL/1c85EVcp7lUqu+UGWgUHK72d9K2Gs3QByUBkk5qPkm41C7u8
 FbhrL8yK4bIm+7xcFL7u7bvgPsW5vYkHLJGe7FwZVB3+5MQ/B2lRxcRsAAOlKtS9TanP
 BBV/xkpV3w7z9Nqx1rNI4k6nTz+rkNY/F1mpyPa96FZ/y7pzZStE+Pk73FLYYa38i7Iu
 r9/xqvzLAMwJs/kLkcUm0H/kF5xxdsVKZ6+pqonMMKhoYhZ1ZLAT8qRXqxWKzqKiNESZ
 S+8vpGHJFfh/SKi2Un5vuUz6TTeGm0C6BKpgdVqZ093rH9ljNiQj+PEKIZgkdkb+ZQpH
 KC5g==
X-Gm-Message-State: AOAM530rhXggvskiUsr0bUYCdYMra96Wo8TwBtp9986PDlMluDXIrcQP
 2vUeznbOtUHTAm6ifBK5v6LQNuHUZkqBxxux+Qji848kDP+Td2fUdZBDfluTjnzBnNxQEJ++zxr
 OFdAzqZ+OWzLCsp8=
X-Received: by 2002:a17:906:58c9:: with SMTP id
 e9mr19061918ejs.181.1636540386477; 
 Wed, 10 Nov 2021 02:33:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0jOeC+rNkghEkVsGddTm17JYZpG87zu+O94DKQ8HWnqL4PHXZTcoXwmNApv7cWNAOo26VzA==
X-Received: by 2002:a17:906:58c9:: with SMTP id
 e9mr19061884ejs.181.1636540386185; 
 Wed, 10 Nov 2021 02:33:06 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id ga1sm11436310ejc.100.2021.11.10.02.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:33:05 -0800 (PST)
Date: Wed, 10 Nov 2021 11:33:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211110113304.2d713d4a@redhat.com>
In-Reply-To: <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 ehabkost@redhat.com, David Hildenbrand <david@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Nov 2021 23:47:37 +1100
Gavin Shan <gshan@redhat.com> wrote:

> Hi Drew and Igor,
> 
> On 11/2/21 6:39 PM, Andrew Jones wrote:
> > On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:  
> >>
> >> Yeah, I agree. I don't have strong sense to expose these empty nodes
> >> for now. Please ignore the patch.
> >>  
> > 
> > So were describing empty numa nodes on the command line ever a reasonable
> > thing to do? What happens on x86 machine types when describing empty numa
> > nodes? I'm starting to think that the solution all along was just to
> > error out when a numa node has memory size = 0...

memory less nodes are fine as long as there is another type of device
that describes  a node (apic/gic/...).
But there is no way in spec to describe completely empty nodes,
and I dislike adding out of spec entries just to fake an empty node.


> Sorry for the delay as I spent a few days looking into linux virtio-mem
> driver. I'm afraid we still need this patch for ARM64. I don't think x86

does it behave the same way is using pc-dimm hotplug instead of virtio-mem?

CCing David
as it might be virtio-mem issue.

PS:
maybe for virtio-mem-pci, we need to add GENERIC_AFFINITY entry into SRAT
and describe it as PCI device (we don't do that yet if I'm no mistaken).

> has this issue even though I didn't experiment on X86. For example, I
> have the following command lines. The hot added memory is put into node#0
> instead of node#2, which is wrong.
> 
> There are several bitmaps tracking the node states in Linux kernel. One of
> them is @possible_map, which tracks the nodes available, but don't have to
> be online. @passible_map is sorted out from the following ACPI table.
> 
>    ACPI_SRAT_TYPE_MEMORY_AFFINITY
>    ACPI_SRAT_TYPE_GENERIC_AFFINITY
>    ACPI_SIG_SLIT                          # if it exists when optional distance map
>                                           # is provided on QEMU side.
> 
> Note: Drew might ask why we have node#2 in "/sys/devices/system/node" again.
> hw/arm/virt-acpi-build.c::build_srat() creates additional node in ACPI SRAT
> table and the node's PXM is 3 ((ms->numa_state->num_nodes - 1)) in this case,
> but linux kernel assigns node#2 to it.
> 
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=512M            \
>    -object memory-backend-ram,id=mem1,size=512M            \
>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>    -numa node,nodeid=2 -numa node,nodeid=3                 \
>    -object memory-backend-ram,id=vmem0,size=512M           \
>    -device virtio-mem-pci,id=vm0,memdev=vmem0,node=2,requested-size=0 \
>    -object memory-backend-ram,id=vmem1,size=512M           \
>    -device virtio-mem-pci,id=vm1,memdev=vmem1,node=3,requested-size=0
>       :
>    # ls  /sys/devices/system/node | grep node
>    node0
>    node1
>    node2
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1003104 kB
>    # cat /sys/devices/system/node/node0/meminfo | grep MemTotal\:
>    Node 0 MemTotal: 524288 kB
> 
>    (qemu) qom-set vm0 requested-size 512M
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1527392 kB
>    # cat /sys/devices/system/node/node0/meminfo | grep MemTotal\:
>    Node 0 MemTotal: 1013652 kB
> 
> Try above test after the patch is applied. The hot added memory is
> put into node#2 correctly as the user expected.
> 
>    # ls  /sys/devices/system/node | grep node
>    node0
>    node1
>    node2
>    node3
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1003100 kB
>    # cat /sys/devices/system/node/node2/meminfo | grep MemTotal\:
>    Node 2 MemTotal: 0 kB
> 
>    (qemu) qom-set vm0 requested-size 512M
>    # cat /proc/meminfo | grep MemTotal\:
>    MemTotal:        1527388 kB
>    # cat /sys/devices/system/node/node2/meminfo | grep MemTotal\:
>    Node 2 MemTotal: 524288 kB
> 
> Thanks,
> Gavin
> 
> 
>    
> 


