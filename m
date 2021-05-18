Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622238738A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:51:45 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuW0-0004r6-5v
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuUw-0003dP-Cf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuUs-00075H-2R
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621324232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NW4UL0U5sPtzfc4lmGw05bHMRbyTb+TE8EPYexCTqqU=;
 b=VSREbdcO6qM7L034L+lHNFgh6pd/PhtiE0xHMRJF3rrYN3jxz7n6woBdx4tbHGED8e8qy9
 PWY4biFoTsdikJfQbnrG2VMKppttfCK5irAP3A8Dz1G6lPhFNBD2tCIukrRSp0riSZgbNk
 rG/+pKhTI4cH5W1knPvEHo380MqLfqk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-kdXMiQEEPoKBL6MhPHiGUQ-1; Tue, 18 May 2021 03:50:31 -0400
X-MC-Unique: kdXMiQEEPoKBL6MhPHiGUQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso5274912edd.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 00:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NW4UL0U5sPtzfc4lmGw05bHMRbyTb+TE8EPYexCTqqU=;
 b=rDBkcLr+/8HTshkiUynn5cbs9Cq+u+y+7ceqERuoJDE5aNxmvivo7/J2s0hyyPPQny
 rqMR+n2UN+CAXXBXI7yySd1DSEVZW+/8v20tfJ+pD8Nbs8ymxXaNJk7FDknC175Pli3W
 27tCH1rgX11PC94QPKAjNo08WTChXVTQKzcepi1wYawhDEOVgggQ6HK0iUjkJKhdhmuS
 +S+M5l+6s9IU9nnzTyLFS0nk8m+UcZWMOTUjUdob1cQ01Zwybup/CPXlaf60sf0La6G4
 kiYpufU+lshH0DyvrqihKHQTuUgDnJz90S4WTJfQY1HnNM1F1B7v23K1hg50BosW6A+s
 UmGg==
X-Gm-Message-State: AOAM531d6Vy7I0fsYdPMjCoj0Qn0j8mIznutbTbXsTEVDdfy2v9qeKYl
 4v3wxC8dtRhIGPjbWvVOIp4dsumyFwZlIIS2QHYgeUvc2/BtoyjJc5bloqfZLrKFFo0AFF8xM/g
 0lXPJ18LHBPnTa+g=
X-Received: by 2002:a05:6402:2044:: with SMTP id
 bc4mr5610926edb.282.1621324230286; 
 Tue, 18 May 2021 00:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFzMI5v4PnOH/SXzTHlKC/E2yBgzwUMmMGoQmrcpTZlsyGOhJk/7yGYBlnGzMGqecpBbtZew==
X-Received: by 2002:a05:6402:2044:: with SMTP id
 bc4mr5610896edb.282.1621324230081; 
 Tue, 18 May 2021 00:50:30 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d15sm8128909eds.68.2021.05.18.00.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:50:29 -0700 (PDT)
Date: Tue, 18 May 2021 09:50:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Message-ID: <20210518075027.wjpdjvoam7dlzign@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
 <6c8f9c3502384f648f30c7381e87dda9@huawei.com>
 <68883a1b-5303-da13-a051-e909e1d1f71b@huawei.com>
 <6d8b9142e8a34d1390f2f0b4bfb53a00@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6d8b9142e8a34d1390f2f0b4bfb53a00@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 yangyicong <yangyicong@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui <yuzenghui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 07:04:51AM +0000, Salil Mehta wrote:
> > From: wangyanan (Y)
> > Sent: Tuesday, May 18, 2021 5:43 AM
> > 
> > Hi Salil,
> > 
> > On 2021/5/18 4:48, Salil Mehta wrote:
> > >> From: Qemu-arm
> > [mailto:qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org]
> > >> On Behalf Of Yanan Wang
> > >> Sent: Sunday, May 16, 2021 11:29 AM
> > >> To: Peter Maydell <peter.maydell@linaro.org>; Andrew Jones
> > >> <drjones@redhat.com>; Michael S . Tsirkin <mst@redhat.com>; Igor Mammedov
> > >> <imammedo@redhat.com>; Shannon Zhao <shannon.zhaosl@gmail.com>; Alistair
> > >> Francis <alistair.francis@wdc.com>; David Gibson
> > >> <david@gibson.dropbear.id.au>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > >> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; zhukeqian
> > >> <zhukeqian1@huawei.com>; yangyicong <yangyicong@huawei.com>; Zengtao (B)
> > >> <prime.zeng@hisilicon.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> > >> yuzenghui <yuzenghui@huawei.com>; Paolo Bonzini <pbonzini@redhat.com>;
> > >> Philippe Mathieu-Daudé <philmd@redhat.com>
> > >> Subject: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
> > >>
> > >> We create and initialize a cpuobj for each present cpu in
> > >> machvirt_init(). Now we also initialize the cpu member of
> > >> structure CPUArchId for each present cpu in the function.
> > > [...]
> > >
> > >>           qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> > >> +
> > >> +        /*
> > >> +         * As ARM cpu hotplug is not supported yet, we initialize
> > >> +         * the present cpu members here.
> > >> +         */
> > >> +        machine->possible_cpus->cpus[n].cpu = cpuobj;
> > >
> > > when vcpu Hotplug is not supported yet, what necessitates this change now?
> > >
> > The initialization will gives a way to determine whether a CPU is
> > present or not.
> > At least, for now it will be used when generating ACPI tables, e.g.
> > DSDT, MADT.
> > See patch 5 and 6.
> 
> yes,  but why do you require it now as part of the vcpu topology change?
> 
> As-far-as-i-can-see, PPTT table changes(part of patch 5/9) do not require
> this change. Change in Patch 5/9 has also been done in anticipation of
> some future requirement(vcpu Hotplug?).
> 
> Please correct me here if I am wrong?
>

Hi Salil,

The problem is that we've never required smp.cpus == smp.maxcpus, so
a user could have smp.cpus < smp.maxcpus. We want the topology to match
maxcpus, but only enable cpus. However, if you think we should just not
allow cpus < maxcpus until hot plug is sorted out, then we could discuss
a way of trying to enforce cpus == maxcpus, but I'm not sure how we can
without breaking existing command lines.

Thanks,
drew


