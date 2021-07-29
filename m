Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FF3DA352
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:46:10 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95QP-0002Ri-AR
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m95PD-0001O6-Vb
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m95PA-0005ll-9s
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627562690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oOCks80nCfUuRJPuJFhztE8jpHWSNsofBSkbUO7a9Q=;
 b=W+djl7LYdVfUP9jYFfF+DwgM4yyxf8KG2VjqPCQThz+U9fsJfeSjP+HImvSS3NHRv1ASEb
 VaxKrwPFbgfCaXmQ8rStBTgO8orA83rK3oyZWVc1cztwYle147yn3TGkWIxb+OH6TDGiSk
 OBUBIZSwASaG6dtUQbPbji/LjSud/Tg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-JSDCFqgRPp6AEvnh-92DYw-1; Thu, 29 Jul 2021 08:44:47 -0400
X-MC-Unique: JSDCFqgRPp6AEvnh-92DYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso2195463wri.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+oOCks80nCfUuRJPuJFhztE8jpHWSNsofBSkbUO7a9Q=;
 b=e/BiPUQe+rvxpN2mX2Cz40Bzibru4DkQCasPMY2NIYXsF6AQWn2lhMtHuB1vqpKt3Z
 +u7Zhnc9hLi6kmrqkeCv39HpEXh90OX/rPtCFQ7AxnAx8g2CFACHCmBxMd8OfaHZsvCg
 Km2BDR+oEfvCl28a9NO0wQsA8DW+fr1LP1pSREJU5EznGsqPv54rJ+6ICjndb2dskRBF
 DBromXOLuC6d+Wszp7ABCHwtY7LiYy3UlEbzLB4iRhhPBc3oWT240vAeRLBzsO81uS+c
 wNPLbNHRd3RRSmwx9gB/G8OevQOSmvQhmtzeKUdTPKL3rOgU0nDmyt7QcR+qOKnt0+he
 ujKg==
X-Gm-Message-State: AOAM531k8qhI3xolAZV84nYq09HnGYQXsXvsqg/HDNnc8xUD1Fsd+Y8n
 82Q++g5Xg6zp14NqWhSwcDkXxx+PSDeM8swn2zYa6+y6dK6qrS5zJSw3zu84YJyiqTMgumqQXiK
 vsnwZJadTWClfmC0=
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
 f12mr4670460wrz.225.1627562686092; 
 Thu, 29 Jul 2021 05:44:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9mKZ1T83yyI+zQhCQC0zZLr8G0Hz/OEkgVOMUhRSX5oAVTsj5ykD9omepfP8lcPeC217TpQ==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
 f12mr4670440wrz.225.1627562685858; 
 Thu, 29 Jul 2021 05:44:45 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n30sm4082218wra.1.2021.07.29.05.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:44:45 -0700 (PDT)
Date: Thu, 29 Jul 2021 14:44:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jingqi Liu <jingqi.liu@intel.com>
Subject: Re: [PATCH v2 1/1] nvdimm: add 'target-node' option
Message-ID: <20210729144444.22104221@redhat.com>
In-Reply-To: <20210719020153.30574-2-jingqi.liu@intel.com>
References: <20210719020153.30574-1-jingqi.liu@intel.com>
 <20210719020153.30574-2-jingqi.liu@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, xiaoguangrong.eric@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 10:01:53 +0800
Jingqi Liu <jingqi.liu@intel.com> wrote:

> Linux kernel version 5.1 brings in support for the volatile-use of
> persistent memory as a hotplugged memory region (KMEM DAX).
> When this feature is enabled, persistent memory can be seen as a
> separate memory-only NUMA node(s). This newly-added memory can be
> selected by its unique NUMA node.
> 
> Add 'target-node' option for 'nvdimm' device to indicate this NUMA
> node. It can be extended to a new node after all existing NUMA nodes.
> 
> The 'node' option of 'pc-dimm' device is to add the DIMM to an
> existing NUMA node. The 'node' should be in the available NUMA nodes.
> For KMEM DAX mode, persistent memory can be in a new separate
> memory-only NUMA node. The new node is created dynamically.
> So users use 'target-node' to control whether persistent memory
> is added to an existing NUMA node or a new NUMA node.
> 
> An example of configuration is as follows.
> 
> Using the following QEMU command:
>  -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
>  -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=2
> 
> To list DAX devices:
>  # daxctl list -u
>  {
>    "chardev":"dax0.0",
>    "size":"3.00 GiB (3.22 GB)",
>    "target_node":2,
>    "mode":"devdax"
>  }
> 
> To create a namespace in Device-DAX mode as a standard memory:
>  $ ndctl create-namespace --mode=devdax --map=mem
> To reconfigure DAX device from devdax mode to a system-ram mode:
>  $ daxctl reconfigure-device dax0.0 --mode=system-ram
> 
> There are two existing NUMA nodes in Guest. After these operations,
> persistent memory is configured as a separate Node 2 and
> can be used as a volatile memory. This NUMA node is dynamically
> created according to 'target-node'.


Well, I've looked at spec and series pointed at v1 thread,
and I don't really see a good reason to add duplicate 'target-node'
property to NVDIMM that for all practical purposes serves the same
purpose as already existing 'node' property.
The only thing that it does on top of existing 'node' property is
facilitate implicit creation of numa nodes on top of user configured
ones.

But what I really dislike, is adding implicit path to create
numa nodes from random place.

It just creates mess and and doesn't really work well because you
will have to plumb into other code to account for implicit nodes
for it to work properly. (1st thing that comes to mind is HMAT
configuration won't accept this implicit nodes, there might be
other places that will not work as expected).
So I suggest to abandon this approach and use already existing
numa CLI options to do what you need.

What you are trying to achieve can be done without this series
as QEMU allows to create memory only nodes and even empty ones
(for future hotplug) just fine.
The only thing is that one shall specify complete planned
numa topology on command line.

Here is an example that works for me:
   -machine q35,nvdimm=on \
   -m 4G,slots=4,maxmem=12G \
   -smp 4,cores=2 \
   -object memory-backend-ram,size=4G,policy=bind,host-nodes=0,id=ram-node0 \
   -numa node,nodeid=0,memdev=ram-node0
# explicitly assign all CPUs
   -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=0,socket-id=1
# and create a cpu-less node for you nvdimm
   -numa node,nodeid=1 

with that you can hotplug nvdimm to with 'node=1' property set
or provide that at startup, like this:
   -object memory-backend-file,id=mem1,share=on,mem-path=nvdimmfile,size=3G,align=2M \
   -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,node=1

after boot numactl -H will show:

available: 1 nodes (0)
node 0 cpus: 0 1 2 3
node 0 size: 3924 MB
node 0 free: 3657 MB
node distances:
node   0 
  0:  10 

and after initializing nvdimm as a dax device and
reconfiguring that to system memory it will show
as 'new' 'memory only' node

available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3
node 0 size: 3924 MB
node 0 free: 3641 MB
node 1 cpus:
node 1 size: 896 MB
node 1 free: 896 MB
node distances:
node   0   1 
  0:  10  20 
  1:  20  10 

> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
[...]


