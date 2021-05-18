Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E738805E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:15:15 +0200 (CEST)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5BS-00039i-1D
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lj52L-0007Ch-Kv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:05:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lj52I-0007OI-W4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621364745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7TzBgPovcNpObbvKEKQ0BJgkB7MW43xUbKh9QiC5KtA=;
 b=Sd9d+pBIPccduoefY91AyNufdiGPqa1xwP+n5gMF9R36qZBTsj9mD2f0qciCCIkfzZ57+n
 LWXyB99Y5M0Yu5mNcdxhZbQbOwPsNPZmrDqDX4Eep7k8WbsFBDRntzWzcQD646c3JMfaHp
 Oc+k8l4vzEhkiHXYVJXMnDLnOqA3XKw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-KQ2B9iWQPUOxA1W4STOxSg-1; Tue, 18 May 2021 15:05:44 -0400
X-MC-Unique: KQ2B9iWQPUOxA1W4STOxSg-1
Received: by mail-ed1-f69.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so6269532edv.20
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7TzBgPovcNpObbvKEKQ0BJgkB7MW43xUbKh9QiC5KtA=;
 b=tPL7XG8hv13nNcW28VNmICo22s9/Kf3JuFe6LvyScSmarl7Vk2iALR6X4qxjcdAZEY
 zq+bJPcnl89mYl84iPpVZV/NC3gopYhj6W66atz4kuimRLDM1JnMh7HHdClqGJJGYtLQ
 FGGWlnS8Dcu4vPZpNsaaPpvtWoFyprht4e1R5s1IIAbUYAKhwYoMraJZkMIRSF+GRdn6
 QTyeSWOR95MMXOtzFyDqK20aJ89Qmfw++p8TpPnJyJPby9obylFkA86ClpagyaC1r1H4
 gQu86fNXZRwojBzNGwf+DfXmzFPpg9xEBiaThJ0nrUn31YL0hqDAc9A+FDGcZ83ZiQT3
 oPIQ==
X-Gm-Message-State: AOAM530ceX9EHQeb8BnHlYcwqK0T5vH/QFk7nsGsUXnUaDsgWUa/OxGK
 EAUfV1ZsDZSlkLs9WMOyYyuP1NRoS99ge/6e2LT4lFVl1MueSE6G2bJxxWv9QcEJ9szmwaeBpZj
 Y5ziyfLKnFWDUQI8=
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr7411902ejk.381.1621364743012; 
 Tue, 18 May 2021 12:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxncqPKL9mpY7MXGk1U0qavdxxm1WPqBceFXfv27g+jXP7aRhsxSbXSVKmGn3pnh8YS//aFXQ==
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr7411885ejk.381.1621364742813; 
 Tue, 18 May 2021 12:05:42 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id e6sm1768689ejd.31.2021.05.18.12.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:05:41 -0700 (PDT)
Date: Tue, 18 May 2021 21:05:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
MIME-Version: 1.0
In-Reply-To: <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
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

On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
>  Those benefits, when vcpu pinning is used, are the same benefits
> > as for the host, which already use PPTT tables to describe topology, even
> > though hot plug isn't supported.
> 
> yes sure, you mean pinning vcpus according to the cpu topology for performance?

Yup

> 
> > 
> > Now, if you're saying we should only generate tables for smp.cpus, not
> 
> Correct. This is what I thought we must be doing even now
> 
> > smp.maxcpus, because hot plug isn't supported anyway, then I see your
> > point. But, it'd be better to require smp.cpus == smp.maxcpus in our
> > smp_parse function to do that, which we've never done before, so we may
> > have trouble supporting existing command lines.
> 
> I am trying to recall, if the vcpu Hotplug is not supported then can they
> ever be different?
> 
> cpus =  (threads * cores * sockets)
> 
> static void smp_parse(MachineState *ms, QemuOpts *opts)
> {
>      [...]
> 
>         if (sockets * cores * threads != ms->smp.max_cpus) {
>             warn_report("Invalid CPU topology deprecated: "
>                         "sockets (%u) * cores (%u) * threads (%u) "
>                         "!= maxcpus (%u)",
>                         sockets, cores, threads,
>                         ms->smp.max_cpus);
>         }
>      [...]
> }
>   
> Although, above check does not exit(1) and just warns on detecting invalid
> CPU topology. Not sure why?

Hmm, not sure what code you have there. I see this in
hw/core/machine.c:smp_parse

        if (ms->smp.max_cpus < cpus) {
            error_report("maxcpus must be equal to or greater than smp");
            exit(1);
        }

        if (sockets * cores * threads != ms->smp.max_cpus) {
            error_report("Invalid CPU topology: "
                         "sockets (%u) * cores (%u) * threads (%u) "
                         "!= maxcpus (%u)",
                         sockets, cores, threads,
                         ms->smp.max_cpus);
            exit(1);
        }

> 
> Well if you think there are subtleties to support above implementation and
> we cannot do it now then sure it is your call. :)

The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
we're proposing that it should. Maybe we can start erroring out when
cpus != maxcpus until hot plug is supported?

Thanks,
drew


