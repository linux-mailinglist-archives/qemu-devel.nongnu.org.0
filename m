Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AE3D24BF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:39:37 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YvI-0006F3-QS
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6Ytr-0005Xm-Ey
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6Ytp-0000XH-HN
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626961084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CGInPDAxXMb5uvOSqsAZSg4S5cUL3I2K7U6Y4HiuLrs=;
 b=RFMPQoElroR057ycMM4QMVIzPFrF88V4OOKk6RSRuZHurY4BDPJWpLbeVVPOW53PmRimMN
 4OmKgHI01ph7rNebV6tLAtiZ+iLdRwEg+q/LJKU23bUx1Q64LZsoYjeCdgfmP7bQd+QORQ
 EWkVfBC164gz8Y9tfik74Lh7igwgKXI=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-zcQfp9jKMgywfy5DmpyTvA-1; Thu, 22 Jul 2021 09:38:03 -0400
X-MC-Unique: zcQfp9jKMgywfy5DmpyTvA-1
Received: by mail-io1-f70.google.com with SMTP id
 b136-20020a6bb28e0000b0290520c8d13420so4014859iof.19
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CGInPDAxXMb5uvOSqsAZSg4S5cUL3I2K7U6Y4HiuLrs=;
 b=JVbWm2tKxxREhJQa0CB2VY1gJz5b7Rg7KX1K+P9MY3GMctCJJLbP8VJhbMvCY2b96x
 wqc8rBQVr0HtnhTsv/XiB+67D1QZM4F2kl4fBsAaQAfiG42o+wy1H5JS8p0TZzmD9yMr
 L4qapKS4UmVFwnqqbn1SZgnLRNlK54oYfQnaNXfKw4XAMRvDYxgcmfg2gZBx3E13PSWF
 hJdt3Wf28VqqHDqwNFStghlsHcmaLMbOhlEog/pkkioYUDzXDFbaR9o28swk1PrDBzKP
 mRmHNMdDyS4lSM+n3zxl5uH/VDz56vetJTwSs+ABKeWubFvoJGHdJpwOFpRDF4hP9cmL
 vX/Q==
X-Gm-Message-State: AOAM530tYZ2mteDOL+GXVmiJVTcdEWs6+pj0FGLIyfBE+irVwj890NGN
 JYy18RZ4vDx24iMuKJbsJiUO1BuK6iMkEmb2r5H5bJdw4MroCfP3BKAmfhlBRxoGtoV9laiIK41
 TGRsFw8ZOUpXdkyg=
X-Received: by 2002:a05:6638:39cd:: with SMTP id
 o13mr2356926jav.12.1626961082625; 
 Thu, 22 Jul 2021 06:38:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxys2/9vUEP8+5Rsduw/Ksau1ychLJXnlO2gckfEORFlsGOJlewNWAJySm7IsIDXYeo8suglw==
X-Received: by 2002:a05:6638:39cd:: with SMTP id
 o13mr2356904jav.12.1626961082435; 
 Thu, 22 Jul 2021 06:38:02 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id h6sm15693892iop.40.2021.07.22.06.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 06:38:02 -0700 (PDT)
Date: Thu, 22 Jul 2021 15:37:59 +0200
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
Message-ID: <20210722133759.db2kjcoucf6rsz4o@gator>
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87y29y7uon.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 08:02:16AM +0200, Cornelia Huck wrote:
> On Thu, Jul 22 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
> 
> > In the SMP configuration, we should either specify a topology
> > parameter with a reasonable value (equal to or greater than 1)
> > or just leave it omitted and QEMU will calculate its value.
> > Configurations which explicitly specify the topology parameters
> > as zero like "sockets=0" are meaningless, so disallow them.
> >
> > However; the commit 1e63fe685804d
> > (machine: pass QAPI struct to mc->smp_parse) has documented that
> > '0' has the same semantics as omitting a parameter in the qapi
> > comment for SMPConfiguration. So this patch fixes the doc and
> > also adds the corresponding sanity check in the smp parsers.
> 
> Are we expecting any real users to have used that 'parameter=0'
> behaviour? I expect that libvirt and other management software already
> did the right thing; unfortunately, sometimes weird configuration lines
> tend to persist in search results.

I understand this concern. I think the only documentation we had prior to
commit 1e63fe685804 was

DEF("smp", HAS_ARG, QEMU_OPTION_smp,
    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
    "                set the number of CPUs to 'n' [default=1]\n"
    "                maxcpus= maximum number of total cpus, including\n"
    "                offline CPUs for hotplug, etc\n"
    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
    "                threads= number of threads on one CPU core\n"
    "                dies= number of CPU dies on one socket (for PC only)\n"
    "                sockets= number of discrete sockets in the system\n",
        QEMU_ARCH_ALL)
SRST
``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
    are supported. On Sparc32 target, Linux limits the number of usable
    CPUs to 4. For the PC target, the number of cores per die, the
    number of threads per cores, the number of dies per packages and the
    total number of sockets can be specified. Missing values will be
    computed. If any on the three values is given, the total number of
    CPUs n can be omitted. maxcpus specifies the maximum number of
    hotpluggable CPUs.
ERST

This doesn't mention zero inputs and even implies non-zero inputs.

I'm not sure if we need to worry about the odd command line that used zero
for some parameters. What do you think?

Thanks,
drew


> 
> >
> > This patch originly comes form [1], and it was suggested that
> > this patch fixing the doc should be sent for 6.1 to avoid a
> > deprecation process in the future.
> >
> > [1] https://lore.kernel.org/qemu-devel/YPWsThPiZa3mF+zp@redhat.com/
> >
> > Yanan Wang (1):
> >   machine: Disallow specifying topology parameters as zero
> >
> >  hw/core/machine.c | 30 ++++++++++++++++++++++--------
> >  hw/i386/pc.c      | 33 ++++++++++++++++++++++++---------
> >  qapi/machine.json |  6 +++---
> >  3 files changed; 49 insertions(+); 20 deletions(-)
> 


