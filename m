Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716433AFDB2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:15:31 +0200 (CEST)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvad8-00048W-9q
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvabi-0003Cq-FH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvabc-00028s-Do
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624346035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qrirkiEA2oZJUGUmrQ/3uUaqNn+95O+awrLVh9USrU=;
 b=QyM74/GmHRmhSlt6xEarn7vtGq3wQt2yqgeLQ6Yy2b+Nyo1Fl0YgfdIrGQejc6gFqcbBwD
 Cv0FyAlIzVb2vDKASLgARQRNjgDamW/KBW5mFSPZFIPi/emIeR3fHbqBTfgEyG76a6gMKo
 inKjhxW/TLDKPMO0oEZiYfbW4+9EG64=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-lCZV-VAtP7iZT1mAFT8L9g-1; Tue, 22 Jun 2021 03:13:53 -0400
X-MC-Unique: lCZV-VAtP7iZT1mAFT8L9g-1
Received: by mail-ed1-f69.google.com with SMTP id
 cb4-20020a0564020b64b02903947455afa5so7175974edb.9
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3qrirkiEA2oZJUGUmrQ/3uUaqNn+95O+awrLVh9USrU=;
 b=ETYGXaH9vLF14s/lpqL1/F/XRPBf1Al20uylqPE/rWTxib+6OcoUFgNFjZsKRRnfzg
 tGQ5ZM/+R16YK1eI5RYSd5yVtkBxbv+aX1MEBvGivdrOM6pe1iJ9RjAsjwDACECY1vH9
 /8EMobYPZxNFjLyvIUyIBUL7oD2p/eba4BlPK3hn6Naa8Jt0+iy9LnZTEuW3wjrhZTe/
 DwpYLZKVMlmv6UMiM+APhfrEJdH1lNHu5jM9FAeMrIZT7ozi7TdJv2i/Bc1eGB0LNhl3
 RfsQOtmb7CiGgYacN3zR91CCLNecF9amOwf+fqOdbs4et1vvQArUmTV9VeY/gXPuBTho
 N/VA==
X-Gm-Message-State: AOAM530BsjXuhoH/54/KwmTTL6Dkhowj35GukusVTqGFEdKtf49yf0JD
 xUvwFpLBnkR1S7qi3ztEvJedNFz45CgHRaj8XOV4s4YU9ubMjnUWr+yiM+LEx107HD+euOOoPfu
 E3jFZWmASLSJhYuo=
X-Received: by 2002:a17:906:3b13:: with SMTP id
 g19mr2394390ejf.360.1624346032331; 
 Tue, 22 Jun 2021 00:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywbCA1NMlwHpCM2kjo0ozEfFM05m8UBXNlvqtZi1/NQciuzsqtRWcBaxBz70KPPzCF17hT8A==
X-Received: by 2002:a17:906:3b13:: with SMTP id
 g19mr2394362ejf.360.1624346032074; 
 Tue, 22 Jun 2021 00:13:52 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id b8sm1100013edr.42.2021.06.22.00.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 00:13:51 -0700 (PDT)
Date: Tue, 22 Jun 2021 09:13:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Message-ID: <20210622071349.ibni4btfjrb2v2p2@gator>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
 <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
 <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 06:53:41PM +1000, Gavin Shan wrote:
> Hi Drew,
> 
> On 6/3/21 2:48 PM, Gavin Shan wrote:
> > On 6/2/21 9:36 PM, Andrew Jones wrote:
> > > On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
> > > > On 6/1/21 5:50 PM, Andrew Jones wrote:
> > > > > On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
> > > > > > We possibly populate empty nodes where memory isn't included and might
> > > > > > be hot added at late time. The FDT memory nodes can't be created due
> > > > > > to conflicts on their names if multiple empty nodes are specified.
> > > > > > For example, the VM fails to start with the following error messages.
> > > > > > 
> > > > > >     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
> > > > > >     -accel kvm -machine virt,gic-version=host                        \
> > > > > >     -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
> > > > > >     -object memory-backend-ram,id=mem0,size=512M                     \
> > > > > >     -object memory-backend-ram,id=mem1,size=512M                     \
> > > > > >     -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
> > > > > >     -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
> > > > > >     -numa node,nodeid=2                                              \
> > > > > >     -numa node,nodeid=3                                              \
> > > > > >       :
> > > > > >     -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
> > > > > > 
> > > > > >     qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
> > > > > >                          FDT_ERR_EXISTS
> > > > > > 
> > > > > > This fixes the issue by using NUMA node ID or zero in the memory node
> > > > > > name to avoid the conflicting memory node names. With this applied, the
> > > > > > VM can boot successfully with above command lines.
> > > > > > 
> > > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > > ---
> > > > > >    hw/arm/boot.c | 7 ++++++-
> > > > > >    1 file changed, 6 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > > > > index d7b059225e..3169bdf595 100644
> > > > > > --- a/hw/arm/boot.c
> > > > > > +++ b/hw/arm/boot.c
> > > > > > @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> > > > > >        char *nodename;
> > > > > >        int ret;
> > > > > > -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> > > > > > +    if (numa_node_id >= 0) {
> > > > > > +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
> > > > > > +    } else {
> > > > > > +        nodename = g_strdup("/memory@0");
> > > > > > +    }
> > > > > > +
> > > > > >        qemu_fdt_add_subnode(fdt, nodename);
> > > > > >        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > > > > >        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> 
> [...]
> 
> > 
> > I've sent one separate mail to check with Rob Herring. Hopefully he have
> > ideas as he is maintaining linux FDT subsystem. You have been included to
> > that thread. I didn't find something meaningful to this thread after doing
> > some google search either.
> > 
> > Yes, I agree with you we need to follow the specification strictly. It seems
> > it's uncertain about the 'physical memory map' bus binding requirements.
> > 
> 
> I didn't get expected answers from device-tree experts.

What response did you get? Can you please provide a link to the discussion?

> After rethinking about it,
> I plan to fix this like this way, but please let me know if it sounds sensible
> to you.
> 
> The idea is to assign a (not overlapped) dummy base address to each memory
> node in the device-tree. The dummy is (last_valid_memory_address + NUMA ID).
> The 'length' of the 'reg' property in the device-tree nodes, corresponding
> to empty NUMA nodes, is still zero. This ensures the nodes are still invalid
> until memory is added to these nodes.
> 
> I had the temporary patch for the implementation. It works fine and VM can
> boot up successfully.

I would like to be sure that the kernel developers for NUMA, memory
hotplug, and devicetree specifications are all happy with the approach
before adding it to QEMU.

Thanks,
drew


