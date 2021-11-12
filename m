Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C852A44E754
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 14:29:54 +0100 (CET)
Received: from localhost ([::1]:46192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlWcr-0005Fd-Dn
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 08:29:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlWb1-000412-GZ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlWaz-00010r-1U
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFzVPbMHKlplAqZ9XZ7dRJkRoxUC1hib/gV8XU6YgKs=;
 b=GWW4KmS5GLHtK1skBvOUOBnns+JJBg7wTyr5L61oGYPSO3B/dnze4eaZ8K2SSZjNu1vZcz
 Or5b5bDKZiUVDaqiH2BuvK4UdjmLYClZJdXtJ9v4PWcj44b3UD/ctfK1kMkjLsGEESnVpw
 nxeqTK6jMiEyOCcILKPlONgDMLFz1yQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-y38QPiVdObiKfUTjLd5XDw-1; Fri, 12 Nov 2021 08:27:55 -0500
X-MC-Unique: y38QPiVdObiKfUTjLd5XDw-1
Received: by mail-ed1-f71.google.com with SMTP id
 l15-20020a056402124f00b003e57269ab87so1603004edw.6
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 05:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dFzVPbMHKlplAqZ9XZ7dRJkRoxUC1hib/gV8XU6YgKs=;
 b=Vt6lwoN/xO/jMvgjPNtWYbREZIT5p/tSry97oB5rvoOAbO6cAIjGP0PwfO7adV+Nv/
 3bllbqBKotnUREKHfAPN+iIayU7oBfbv+B1qfzknpsO4aFjNk9HH8ZFzWoHp2wAcYXar
 ak7zdhb8HvX5Kmh2sEt04VCsIjfI/r4hac9R2rUgrpzogVkdktKUTBdja1u9J7FXyZT8
 Hm87WI8hh39E7445cAkxZ8TXqwpmxK9nhqKOsWOk7YIiExtTQhQ82FReR11RlU069ICV
 N5rrL33QZebvkHqNb6d3ueD0rxlP4eGFrjjOYyRstmN/SsZ4wG6lC9+1yIaTDYc5yhWM
 h36w==
X-Gm-Message-State: AOAM531S89iUx+53gGBLLSuB0TiEeWTuZVE8MGugpywoa6QtmpaOELZx
 uX+w8Rfmj/uF5A99rG/SKHFTrtKP75d4IkVGGepKd2jsKOCMCvZ8ZJDySJQSqR9RPuzSaHeX9f9
 K2+YkbISsSCJefEA=
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr18891885ejc.547.1636723673927; 
 Fri, 12 Nov 2021 05:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+CkdwbGCj3itKiwwddb0CjbZm2CsLjeoZlHZQ67i3YzOGlF6n2U4EcDnNa5vRellAznSlOQ==
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr18891853ejc.547.1636723673651; 
 Fri, 12 Nov 2021 05:27:53 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id jg32sm2673956ejc.43.2021.11.12.05.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:27:52 -0800 (PST)
Date: Fri, 12 Nov 2021 14:27:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211112142751.4807ab50@redhat.com>
In-Reply-To: <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
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
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 12:01:11 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 10.11.21 11:33, Igor Mammedov wrote:
> > On Fri, 5 Nov 2021 23:47:37 +1100
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> Hi Drew and Igor,
> >>
> >> On 11/2/21 6:39 PM, Andrew Jones wrote:  
> >>> On Tue, Nov 02, 2021 at 10:44:08AM +1100, Gavin Shan wrote:    
> >>>>
> >>>> Yeah, I agree. I don't have strong sense to expose these empty nodes
> >>>> for now. Please ignore the patch.
> >>>>    
> >>>
> >>> So were describing empty numa nodes on the command line ever a reasonable
> >>> thing to do? What happens on x86 machine types when describing empty numa
> >>> nodes? I'm starting to think that the solution all along was just to
> >>> error out when a numa node has memory size = 0...  
> > 
> > memory less nodes are fine as long as there is another type of device
> > that describes  a node (apic/gic/...).
> > But there is no way in spec to describe completely empty nodes,
> > and I dislike adding out of spec entries just to fake an empty node.
> >   
> 
> There are reasonable *upcoming* use cases for initially completely empty
> NUMA nodes with virtio-mem: being able to expose a dynamic amount of
> performance-differentiated memory to a VM. I don't know of any existing
> use cases that would require that as of now.
> 
> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
> this memory is exposed via cpu-less, special nodes. In contrast to real
> HW, the memory is hotplugged later (I don't think HW supports hotplug
> like that yet, but it might just be a matter of time).

I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
some by MEMORY entries. Or nodes created dynamically like with normal
hotplug memory.


> The same should be true when using DIMMs instead of virtio-mem in this
> example.
> 
> >   
> >> Sorry for the delay as I spent a few days looking into linux virtio-mem
> >> driver. I'm afraid we still need this patch for ARM64. I don't think x86  
> > 
> > does it behave the same way is using pc-dimm hotplug instead of virtio-mem?
> > 
> > CCing David
> > as it might be virtio-mem issue.  
> 
> Can someone share the details why it's a problem on arm64 but not on
> x86-64? I assume this really only applies when having a dedicated, empty
> node -- correct?
> 
> > 
> > PS:
> > maybe for virtio-mem-pci, we need to add GENERIC_AFFINITY entry into SRAT
> > and describe it as PCI device (we don't do that yet if I'm no mistaken).  
> 
> virtio-mem exposes the PXM itself, and avoids exposing it memory via any
> kind of platform specific firmware maps. The PXM gets translated in the
> guest accordingly. For now there was no need to expose this in SRAT --
> the SRAT is really only used to expose the maximum possible PFN to the
> VM, just like it would have to be used to expose "this is a possible node".
> 
> Of course, we could use any other paravirtualized interface to expose
> both information. For example, on s390x, I'll have to introduce a new
> hypercall to query the "device memory region" to detect the maximum
> possible PFN, because existing interfaces don't allow for that. For now
> we're ruinning SRAT to expose "maximum possible PFN" simply because it's
> easy to re-use.
> 
> But I assume that hotplugging a DIMM to an empty node will have similar
> issues on arm64.
> 
> >   
> >> has this issue even though I didn't experiment on X86. For example, I
> >> have the following command lines. The hot added memory is put into node#0
> >> instead of node#2, which is wrong.  
> 
> I assume Linux will always fallback to node 0 if node X is not possible
> when translating the PXM.

I tested how x86 behaves, with pc-dimm, and it seems that
fc43 guest works only sometimes.
cmd:
  -numa node,memdev=mem,cpus=0 -numa node,cpus=1 -numa node -numa node

1: hotplug into the empty last node creates a new node dynamically 
2: hotplug into intermediate empty node (last-1) is broken, memory goes into the first node

We should check if it possible to fix guest instead of adding bogus SRAT entries.


