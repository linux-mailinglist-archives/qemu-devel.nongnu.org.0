Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1A36E5CA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:19:09 +0200 (CEST)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0x1-0000aZ-Qu
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lc0uQ-0006du-70
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lc0uN-0005QN-5h
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kODNF6sl4laBWmaC+KsVT3MtdFLItz86paGYwOmeB0=;
 b=WnPBd8Fqlj7HuT0KriY4JKy80r1IKyU1n6TT0ozEpuNss5lAEevMnj+HhavypRKg+K7crC
 aI4XJL9tE83TYiBrwz9NQYCSPD3ft+GGmZxR688uqksQ9uXus07kythBcUf4e8VMEFa7An
 Eq5TXXFiSJAHcLUNgCssNOREG9+WGw0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-rUSutEM4PdSeBy8dWREWUA-1; Thu, 29 Apr 2021 03:16:18 -0400
X-MC-Unique: rUSutEM4PdSeBy8dWREWUA-1
Received: by mail-ej1-f70.google.com with SMTP id
 s23-20020a1709069617b02903907023c7c0so2794626ejx.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5kODNF6sl4laBWmaC+KsVT3MtdFLItz86paGYwOmeB0=;
 b=DUEi7a09LmaR0b8x8Sh7ub0PhjdPrmZk7kvgX+np1PQyGC9qnN4oo4875W0ckY0cMt
 OnfDouc5CtUZxua0sMGm2Uvdl4ZKfcYrEHIsmkXt0C5mQAhLCWfCAJwI5SC5Yuk5QGbC
 chpYB2ipkOnN0O61EC42GMdM3wAw5JljHsRYiOKv3Xm8LlKFOoOMVDrRZcvbt3U7FtGO
 sl0l9yvJcbNZbC0LxdMpQmSifRju6TBxtAM2nCOnVg617bcfx+N29OVnLDtbJm+xXdPG
 OrV3tWOF3k+wm2etVeO8nY2fH33TS5IHYKnydXe+VDo0bjIgYNsZn+wdMR1ImcrPIjQQ
 WPHw==
X-Gm-Message-State: AOAM532xQUX1a7cUPc8iGy5QKWa8ZCmvq714HydZOtmoBbvedHjQmm3Y
 uPF0MrYupERR5KlS/V3VdQVNTYyoUQFHwOimVyxgN2lD9lUTE/qhlAYFK2G4sxUqArkruVdonKf
 HNaxp18dzz2Eu4Bk=
X-Received: by 2002:a17:906:9444:: with SMTP id
 z4mr2272424ejx.330.1619680577149; 
 Thu, 29 Apr 2021 00:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7JhX7Y5rx1izAe6pvoI1L22Sxf5XQv4np2zwFFq7KB6C/G40Muqa9YYAVggnf2lDcfaFGGw==
X-Received: by 2002:a17:906:9444:: with SMTP id
 z4mr2272406ejx.330.1619680576952; 
 Thu, 29 Apr 2021 00:16:16 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id nd36sm1252416ejc.21.2021.04.29.00.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 00:16:16 -0700 (PDT)
Date: Thu, 29 Apr 2021 09:16:14 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210429071614.lywpbfpeyclqxnke@gator.home>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
MIME-Version: 1.0
In-Reply-To: <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 10:14:37AM +0800, wangyanan (Y) wrote:
> On 2021/4/28 18:31, Andrew Jones wrote:
> > On Tue, Apr 13, 2021 at 04:31:45PM +0800, Yanan Wang wrote:
> > >           } else if (sockets == 0) {
> > >               threads = threads > 0 ? threads : 1;
> > > -            sockets = cpus / (cores * threads);
> > > +            sockets = cpus / (clusters * cores * threads);
> > >               sockets = sockets > 0 ? sockets : 1;
> > If we initialize clusters to zero instead of one and add lines in
> > 'cpus == 0 || cores == 0' and 'sockets == 0' like
> > 'clusters = clusters > 0 ? clusters : 1' as needed, then I think we can
> > add
> > 
> >   } else if (clusters == 0) {
> >       threads = threads > 0 ? threads : 1;
> >       clusters = cpus / (sockets * cores * thread);
> >       clusters = clusters > 0 ? clusters : 1;
> >   }
> > 
> > here.
> I have thought about this kind of format before, but there is a little bit
> difference between these two ways. Let's chose the better and more
> reasonable one of the two.
> 
> Way A currently in this patch:
> If value of clusters is not explicitly specified in -smp command line, we
> assume
> that users don't want to support clusters, for compatibility we initialized
> the
> value to 1. So that with cmdline "-smp cpus=24, sockets=2, cores=6", we will
> parse out the topology description like below:
> cpus=24, sockets=2, clusters=1, cores=6, threads=2
> 
> Way B that you suggested for this patch:
> Whether value of clusters is explicitly specified in -smp command line or
> not,
> we assume that clusters are supported and calculate the value. So that with
> cmdline "-smp cpus=24, sockets=2, cores=6", we will parse out the topology
> description like below:
> cpus =24, sockets=2, clusters=2, cores=6, threads=1
> 
> But I think maybe we should not assume too much about what users think
> through the -smp command line. We should just assume that all levels of
> cpu topology are supported and calculate them, and users should be more
> careful if they want to get the expected results with not so complete
> cmdline.
> If I'm right, then Way B should be better. :)
>

Hi Yanan,

We're already assuming the user wants to describe clusters to the guest
because we require at least one per socket. If we want the user to have a
choice between using clusters or not, then I guess we need to change the
logic in the PPTT and the cpu-map to only generate the cluster level when
the number of clusters is not zero. And then change this parser to not
require clusters at all.

I'm not a big fan of these auto-calculated values either, but the
documentation says that it'll do that, and it's been done that way
forever, so I think we're stuck with it for the -smp option. Hmm, I was
just about to say that x86 computes all its values, but I see the most
recently added one, 'dies', is implemented the way you're proposing we
implement 'clusters', i.e. default to one and don't calculate it when it's
missing. I actually consider that either a documentation bug or an smp
parsing bug, though.

Another possible option, for Arm, because only the cpus and maxcpus
parameters of -smp have ever worked, is to document, for Arm, that if even
one parameter other than cpus or maxcpus is provided, then all parameters
must be provided. We can still decide if clusters=0 is valid, but we'll
enforce that everything is explicit and that the product (with or without
clusters) matches maxcpus.

Requiring every parameter might be stricter than necessary, though, I
think we're mostly concerned with cpus/maxcpus, sockets, and cores.
clusters can default to one or zero (whatever we choose and document),
threads can default to one, and cpus can default to maxcpus or maxcpus can
default to cpus, but at least one of those must be provided. And, if
sockets are provided, then cores must be provided and vice versa. If
neither sockets nor cores are provided, then nothing else besides cpus and
maxcpus may be provided, and that would mean to not generate any topology
descriptions for the guest.

Thanks,
drew


