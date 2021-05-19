Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE13388938
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 10:16:56 +0200 (CEST)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljHNv-0003Oe-8v
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 04:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHMK-0002NM-95
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:15:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHMI-0008Qt-2e
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621412113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d46HRGTwyKe7dHmhQFZugTDR/zUsSqEV5PcCwV2Wb3I=;
 b=Rrga+72Q/SG9mLCuzHCJP7iaHadxqeBs8aFI1ynoR+dYcVOA6CLDo6q0/GITGjHb4LkQNS
 s9sQIZGKujXdWJ4DuQgdduQUk/wRV3xw8DJG3FRmtzq9/Oy40n3iglGcqV9B46b8Y0oLTU
 lvlkXzYz1iW8z+V5iZ0XpkBse/YKkEw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-TOWzgwpgM-SrxRTI57Y3AQ-1; Wed, 19 May 2021 04:15:11 -0400
X-MC-Unique: TOWzgwpgM-SrxRTI57Y3AQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w22-20020a05640234d6b029038d04376b6aso7183160edc.21
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 01:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d46HRGTwyKe7dHmhQFZugTDR/zUsSqEV5PcCwV2Wb3I=;
 b=RKTcJqy5KEprpD5bKEPenP/9vN7O7XfvDxEexC79r8OyCvIqMlZXlWw8x94Whz0WsX
 Dw2bOSeMrTailkG2u1sWBmc8A/R2WMNH+7F99LUHozFJH7mrgVKf4xa7bcWUKjRBWy5g
 vrJlEGTBYeqFbq7jCMUAY7CC4Pq91u94zvpsIT/2Lrr8KZZhAbuX1PQmO39tuA0kfWAy
 XXn8O+NUJ9pxeRzzhsmzsDSWyWwJ083drWurihBVdo2Xxuc78bx26lsYmxVnl6wrW/sb
 hYlovWAcQTqiiGX5EpmNUImfJ5YqUfiFGgRtyNFo04zr2zIeG8AfqZy5LA4R7Ebis/DJ
 QTuw==
X-Gm-Message-State: AOAM533g+HLBBspxoKsgT9rMlHn8GE7PX3LYHvkn5D+IbIT+nUUEZEt/
 8ix5EJiMHsZkeudPNeLTTvFTmOOIAIKACnXLo/nN221x949FjyeFm2mS3m7s7pmF7a/eqPncTnQ
 o4wr1LtpAyhIzVUI=
X-Received: by 2002:a05:6402:35d4:: with SMTP id
 z20mr12868277edc.164.1621412110478; 
 Wed, 19 May 2021 01:15:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUgxb4kdVWntPdBWS7Z2yw85WNUsXmXDdSLmNarZ8XGsA4Z5sCt7TcvM6b/YQUDfSf+gR7iw==
X-Received: by 2002:a05:6402:35d4:: with SMTP id
 z20mr12868240edc.164.1621412110253; 
 Wed, 19 May 2021 01:15:10 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id m16sm2161389edq.56.2021.05.19.01.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:15:09 -0700 (PDT)
Date: Wed, 19 May 2021 10:15:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210519081507.mnk43k77wbekeany@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <b61a7413f98a430685b838eecc2db74f@huawei.com>
 <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
 <f766805215ac439bb988dab02247ec71@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f766805215ac439bb988dab02247ec71@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 07:54:37AM +0000, Salil Mehta wrote:
> > From: wangyanan (Y)
> > Sent: Wednesday, May 19, 2021 4:18 AM
> > 
> > 
> > On 2021/5/19 3:22, Salil Mehta wrote:
> > >> From: Andrew Jones [mailto:drjones@redhat.com]
> > >> Sent: Tuesday, May 18, 2021 8:06 PM
> > >> To: Salil Mehta <salil.mehta@huawei.com>
> > >> Cc: wangyanan (Y) <wangyanan55@huawei.com>; Peter Maydell
> > >> <peter.maydell@linaro.org>; Michael S . Tsirkin <mst@redhat.com>; Wanghaibin
> > >> (D) <wanghaibin.wang@huawei.com>; qemu-devel@nongnu.org; Shannon Zhao
> > >> <shannon.zhaosl@gmail.com>; qemu-arm@nongnu.org; Alistair Francis
> > >> <alistair.francis@wdc.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
> > >> yangyicong <yangyicong@huawei.com>; yuzenghui <yuzenghui@huawei.com>; Igor
> > >> Mammedov <imammedo@redhat.com>; zhukeqian <zhukeqian1@huawei.com>; lijiajie
> > (H)
> > >> <lijiajie11@huawei.com>; David Gibson <david@gibson.dropbear.id.au>;
> > Linuxarm
> > >> <linuxarm@huawei.com>; linuxarm@openeuler.org
> > >> Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
> > >>
> > >> On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
> > >>>   Those benefits, when vcpu pinning is used, are the same benefits
> > >>>> as for the host, which already use PPTT tables to describe topology, even
> > >>>> though hot plug isn't supported.
> > >>> yes sure, you mean pinning vcpus according to the cpu topology for performance?
> > >> Yup
> > > Already Agreed :)
> > >
> > >>>> Now, if you're saying we should only generate tables for smp.cpus, not
> > >>> Correct. This is what I thought we must be doing even now
> > >>>
> > >>>> smp.maxcpus, because hot plug isn't supported anyway, then I see your
> > >>>> point. But, it'd be better to require smp.cpus == smp.maxcpus in our
> > >>>> smp_parse function to do that, which we've never done before, so we may
> > >>>> have trouble supporting existing command lines.
> > >>> I am trying to recall, if the vcpu Hotplug is not supported then can they
> > >>> ever be different?
> > >>>
> > >>> cpus =  (threads * cores * sockets)
> > >>>
> > >>> static void smp_parse(MachineState *ms, QemuOpts *opts)
> > >>> {
> > >>>       [...]
> > >>>
> > >>>          if (sockets * cores * threads != ms->smp.max_cpus) {
> > >>>              warn_report("Invalid CPU topology deprecated: "
> > >>>                          "sockets (%u) * cores (%u) * threads (%u) "
> > >>>                          "!= maxcpus (%u)",
> > >>>                          sockets, cores, threads,
> > >>>                          ms->smp.max_cpus);
> > >>>          }
> > >>>       [...]
> > >>> }
> > >>>
> > >>> Although, above check does not exit(1) and just warns on detecting invalid
> > >>> CPU topology. Not sure why?
> > >> Hmm, not sure what code you have there. I see this in
> > >> hw/core/machine.c:smp_parse
> > >>
> > >>          if (ms->smp.max_cpus < cpus) {
> > >>              error_report("maxcpus must be equal to or greater than smp");
> > >>              exit(1);
> > >>          }
> > >>
> > >>          if (sockets * cores * threads != ms->smp.max_cpus) {
> > >>              error_report("Invalid CPU topology: "
> > >>                           "sockets (%u) * cores (%u) * threads (%u) "
> > >>                           "!= maxcpus (%u)",
> > >>                           sockets, cores, threads,
> > >>                           ms->smp.max_cpus);
> > >>              exit(1);
> > >>          }
> > >>
> > >>> Well if you think there are subtleties to support above implementation and
> > >>> we cannot do it now then sure it is your call. :)
> > Hi Salil, Drew,
> > >> The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
> > >> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
> > >> we're proposing that it should. Maybe we can start erroring out when
> > >> cpus != maxcpus until hot plug is supported?
> > > Agreed, both don't make any sense if hotplug is not supported and ideally should
> > > fail with error. We should block any such topology configuration.
> > In the ARM-specific function virt_smp_parse() (patch 9), there already
> > have been some restrictions for the given -smp configuration.
> > We now only allow:
> > -smp N
> > -smp maxcpus=M
> > -smp N, maxcpus=M
> > 
> > -smp N, sockets=X, cores=Y
> > -smp N, sockets=X, cores=Y, threads=Z
> > 
> > -smp maxcpus=M, sockets=X, cores=Y
> > -smp maxcpus=M, sockets=X, cores=Y, threads=Z
> > 
> > -smp N, maxcpus=M, sockets=X, cores=Y
> > -smp N, maxcpus=M, sockets=X, cores=Y, threads=Z
> > 
> > and disallow the other strange and rare formats that shouldn't be provided.
> > 
> > It's reasonable to block the topology configuration which is not useful
> > currently. I will add the requirement for "cpus==maxcpus" in this fuction
> > if the possible conflict with existing command lines is not a big problem.
> 
> Hi Yanan,
> Makes sense. I did see your other patch-set in which cluster support has been
> added. Are we deferring that too?

The merge of that needs to be deferred, but for a different reason. It
shouldn't impact hot plug, because if hot plug doesn't like clusters,
then one could configure a topology which doesn't have clusters. But,
it can't be merged to QEMU until the kernel has merged its support.

Thanks,
drew


