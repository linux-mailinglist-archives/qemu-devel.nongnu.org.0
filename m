Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80237F347
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 08:56:49 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh5H6-0006UV-9Y
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 02:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Fz-0005Ut-Ir
 for qemu-devel@nongnu.org; Thu, 13 May 2021 02:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Fx-0000Ek-Gc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 02:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620888936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plF+zJiGKDGafF7xXehxEl6fkDBYfKllnjd3TCDpng8=;
 b=hEgHBuYRIz7gtbjx8eJcxzAZF9NiKXjx1VKWYW7u/qx3ESMEe/gxWO+o4aWfPxMvhn06VA
 YDQgeitHS6BWPRNgn9/R3AWmlupskHmrCHDxYM23AqizX8E3PitI92YzZmaH4nOfPR1Qh8
 nhXVqXflXDYWz9CWtC/BD1uExEgTRgI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-M1z10LCANt-PwH1ife7L3A-1; Thu, 13 May 2021 02:55:35 -0400
X-MC-Unique: M1z10LCANt-PwH1ife7L3A-1
Received: by mail-ed1-f71.google.com with SMTP id
 x3-20020a50ba830000b029038caed0dd2eso3032849ede.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 23:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=plF+zJiGKDGafF7xXehxEl6fkDBYfKllnjd3TCDpng8=;
 b=ncFUMC88O12k1pVZtJwspE/tRvFiAtv7wb2fOQcdXVEcIjhl+3Nk/rK9aHk9nLTpp4
 diFxjXN53Y+ZsHIeYEc9lAweag4Dc+n5Y4PQl2mpQVw+QReSCJU2UXDd4i9hCOSnsDab
 SbqVFlJ7v5Fm/+r4rLos4IRF9gvP7TtCWJ+c7A8rIHuUF+ashjrwKwYErLk6rCKzVChZ
 1QyOx9YQdjpJMNpEpQuWsLRpdhNLnjN5QP8617TO/g2H9tHt4drQfwyVBwd6qv0+bfAe
 p5MPAlakAdO/s1De+ZIaqq3l0+CYZWgtJ2xN0rv7EJLKtLl3Q0fGomcVP/DIymLoTquL
 T4iQ==
X-Gm-Message-State: AOAM532t6c9T66WdSPLWXth2GLOsBU2yFs+nhcWCFflb/BVo4hU2utMn
 HwoTo9rP/BK251x5ydbDoRPT0HvBVXidg1/9sxuYMBfEiCrorRspuOePTANOc9eFN9Dh9YbL/ti
 PBA9JaLsBm8hSmYE=
X-Received: by 2002:a50:ee85:: with SMTP id f5mr49123905edr.8.1620888933902;
 Wed, 12 May 2021 23:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRMtYTmSJDcq/IjDNhPJgZy7P3TKqjhBRpMzb3G8I9KmxDqZ0lwg052CUuNlPmDXH0h4bMiA==
X-Received: by 2002:a50:ee85:: with SMTP id f5mr49123875edr.8.1620888933660;
 Wed, 12 May 2021 23:55:33 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id z22sm1885316edm.57.2021.05.12.23.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 23:55:32 -0700 (PDT)
Date: Thu, 13 May 2021 08:55:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210513065525.btpewwjuxidrhinf@gator>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 01:10:10PM +0800, wangyanan (Y) wrote:
> >   /* GTDT */
> >   static void
> >   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >       acpi_add_table(table_offsets, tables_blob);
> >       build_madt(tables_blob, tables->linker, vms);
> > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> I'm not really sure why we need to care about "ms->smp.cpus > 1" here?
> 
> IMO, just like MADT in which we create both ENABLED and DISABLED
> gicc nodes no matter of number of ENABLED nodes is one or not, we
> should create PPTT table for all the possible cpus and not care about
> number of smp cpus, too. This will be more consistent with the ACPI
> specification and the PPTT table will be used for ACPI cpu hotplug in
> the future even with  "smp.cpus == 1".
> 
> Care of "smp.cpus > 1" in the DT cpu-map part makes sense to me,
> because we are required to only add present cpu nodes to the DT and
> Linux Doc says that a cpu-map is not needed for uniprocessor systems.
> 

Hi Yanan,

You're right. Let's just always generate the PPTT.

Thanks,
drew


