Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AF536D595
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:17:38 +0200 (CEST)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhGD-0000LR-Q6
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhCC-0005gt-9T
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhC1-0000wr-M5
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n17u2C5vbjDvLBkbAez4FfxnqF4uLwspP0dvWXuPevk=;
 b=DiMEVFb8JxWTFLMoB+O38wuc3jfsXvENHdp5ESe7dYe1qL3qDQ311HBDVj2/BZt7kuHahQ
 tycWh0LveQzp9FfjuVkYh+oABrRuSjI7cZgYs/6VYHe+32ujk57IjFCAJRTQ3kIbkUwgsq
 mfCQxWxN7tt+BYAX7hoMPr28wlBa3EE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-DVQp-_B5OmG8QrXSba8f8g-1; Wed, 28 Apr 2021 06:13:14 -0400
X-MC-Unique: DVQp-_B5OmG8QrXSba8f8g-1
Received: by mail-ed1-f72.google.com with SMTP id
 h13-20020a05640250cdb02903790a9c55acso26504804edb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n17u2C5vbjDvLBkbAez4FfxnqF4uLwspP0dvWXuPevk=;
 b=erpmb9UtKgkCy7bcVT3Za26aSxXHhtehHS8wR/VP6XobxW62JlOZbQlPuVX4pU5AnI
 EULCqN/VU5xKsL2aOKU1kW7cAUvPMZqHaIkF8HJ6htpyU6HW40ukQKYeNqNoKKMJUaCd
 ZZ4nFYTb2zhLkoxeBigwXU4Cs2sKEcRuAmbkNC65rVClUMANiERGxw80BawjEJHy40aJ
 Zi0sim/9sizL+X+KG6ZQU93pmQ+Aj7cdg5zyMuXhZMbF+G8530gARfq9VDYj/1HV/oVx
 VBfXm3YVh/yDCFeY4Ueigeuv5HfUlvrTHg82bqyKyDeiTO2zT5utsoSYJOJbZmf20+Tn
 4T7w==
X-Gm-Message-State: AOAM533WzoNtnRVtdFGMY3fY4kLgzxGh7XNbaC5XWzE9gUFjWtxxMACN
 y2ZzV+pZoWGOWBF6+GK8delXyx/QHs26O52PVF7qfa4NOpsANTsVYXi4ZM1m9M7M3oyf0ryYQRj
 h8SLQZ3x6uHWzFzo=
X-Received: by 2002:a17:906:8a59:: with SMTP id
 gx25mr17797623ejc.63.1619604792997; 
 Wed, 28 Apr 2021 03:13:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6rpCG3cBBCApqGrKUta3plMXEEoUXCmr5pkGMTJotgKe9f+dsOP+U2ksS3ncjLkIqOxXQEQ==
X-Received: by 2002:a17:906:8a59:: with SMTP id
 gx25mr17797598ejc.63.1619604792803; 
 Wed, 28 Apr 2021 03:13:12 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id w19sm763317edd.52.2021.04.28.03.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:13:12 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:13:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
Message-ID: <20210428101310.cwkjm53kftffw3th@gator>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
 <20210427145856.5qaetgzdl6ovnoni@gator.home>
 <f3d5172b-13a5-a8d3-8cdb-03788e43fc52@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f3d5172b-13a5-a8d3-8cdb-03788e43fc52@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 05:36:43PM +0800, wangyanan (Y) wrote:
> 
> On 2021/4/27 22:58, Andrew Jones wrote:
> > On Tue, Apr 13, 2021 at 04:07:45PM +0800, Yanan Wang wrote:
> > > From: Andrew Jones <drjones@redhat.com>
> > > 
> > > The virt machine type has never used the CPU topology parameters, other
> > > than number of online CPUs and max CPUs. When choosing how to allocate
> > > those CPUs the default has been to assume cores. In preparation for
> > > using the other CPU topology parameters let's use an smp_parse that
> > > prefers cores over sockets. We can also enforce the topology matches
> > > max_cpus check because we have no legacy to preserve.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 76 insertions(+)
> > Thanks, this patch matches [1]. Of course, I've always considered this
> > patch to be something of an RFC, though. Is there any harm in defaulting
> > to sockets over cores? If not, I wonder if we shouldn't just leave the
> > default as it is to avoid a mach-virt specific smp parser. The "no
> > topology" compat variable will keep existing machine types from switching
> > from cores to sockets, so we don't need to worry about that.
> > 
> > [1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
> For CPU topology population, ARM64 kernel will firstly try to parse ACPI
> PPTT table
> and then DT in function init_cpu_topology(), if failed it will rely on the
> MPIDR value
> in function store_cpu_topology(). But MPIDR can not be trusted and is
> ignored for
> any topology deduction. And instead, topology of one single socket with
> multiple
> cores is made, which can not represent the real underlying system topology.
> I think this is the reason why VMs will in default prefer cores over sockets
> if no
> topology description is provided.
> 
> With the feature introduced by this series, guest kernel can successfully
> get cpu
> information from one of the two (ACPI or DT) for topology population.
> 
> According to above analysis, IMO, whether the parsing logic is "sockets over
> cores" or
> "cores over sockets", it just provide different topology information and
> consequently
> different scheduling performance. Apart from this, I think there will not
> any harm or
> problems caused.
> 
> So maybe it's fine that we just use the arch-neutral parsing logic?
> How do you think ?

Can you do an experiment where you create a guest with N vcpus, where N is
the number of cores in a single socket. Then, pin each of those vcpus to a
core in a single physical socket. Then, boot the VM with a topology of one
socket and N cores and run some benchmarks. Then, boot the VM again with N
sockets, one core each, and run the same benchmarks.

I'm guessing we'll see the same benchmark numbers (within noise allowance)
for both the runs. If we don't see the same numbers, then that'd be
interesting.

Thanks,
drew


