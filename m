Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91523387A56
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:44:58 +0200 (CEST)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj01p-0005r3-Jo
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lizy1-0005fo-Gh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lizxz-0006T0-HQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621345258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3VChmy4I/dh5goCmgrs4XM5WFmIqICnPGotTIY11/PQ=;
 b=SfWGUnNX29JrcCYYBFtwX2MWBnhpujbKAiKBo6Ogrq+S4KVKklAD+jZryxQygZD15DhD/n
 ViUyrUOp9MbrOKSQErlUIhBQnSCYgYiYLmWUg+j3btwI3hzWuygSRyjLMprIAlM9sfpth7
 6hYQ7fXseuITUQ53/1PJgxyA7KC0t0c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-6Y6q8isWNiaaAicSI3FoiQ-1; Tue, 18 May 2021 09:40:57 -0400
X-MC-Unique: 6Y6q8isWNiaaAicSI3FoiQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 m18-20020a1709062352b02903d2d831f9baso2380906eja.20
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 06:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3VChmy4I/dh5goCmgrs4XM5WFmIqICnPGotTIY11/PQ=;
 b=Ed/i6JJ62p58spfqh83FH1Pvkw7SF4Orjrq/ICm9Qbd3/sJluYE8g/Qta2UUxsRrpw
 Pt1RbT+eQf0esiN2Iz1iU834SM2Mc1R6Eg2XOYkC4kdTcDcQyXQUoZpaK9z2d2UxCMul
 yu3n7EgIt3ngCuH/CXeg0ZAHSJxXy5Cf6aNy90dvMUNGcxJIP/QPd8dnyq7sfBV2iTjP
 4gbuc8ASrZPn/3KV4OHPo5nwgl0gghQvW6Cof3f3YOX735kBqB60ITeVfsFKGTEE71hA
 4AQf34Yz/VIeQ7JDTBvjxsvkDj1jKkiD3rR64dQibyONBv/BDhRi7NaVnkkCpMVAx2LR
 LL6g==
X-Gm-Message-State: AOAM532JZFMq8g7Xja82dywH+SsrHD8lVZcLbYIxShFVJLnEWR0FiTRe
 XyPn975C4HfMbVgU0aLcduUAukpVeNbmvVTxi/Z1T6ju0uTdxJhNxJOikP949oU27V3aeXmO+sk
 D9MCzSvOz9XgJwRY=
X-Received: by 2002:aa7:cb10:: with SMTP id s16mr7100806edt.313.1621345255961; 
 Tue, 18 May 2021 06:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5kSEgxqPp0KmjgAPuwax0C0hiA5YSYtuDVTAhwhXOSq4aiVToK6o51LxER7fdwgTZysp+qg==
X-Received: by 2002:aa7:cb10:: with SMTP id s16mr7100768edt.313.1621345255759; 
 Tue, 18 May 2021 06:40:55 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id c7sm12965427ede.37.2021.05.18.06.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 06:40:53 -0700 (PDT)
Date: Tue, 18 May 2021 15:40:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
Message-ID: <20210518134045.5enuusitvaho3xv3@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-7-wangyanan55@huawei.com>
 <20210517074256.xjqwejbi4mfsvug2@gator.home>
 <ac1b0f17-523d-adb8-c4f4-aa5c93966726@huawei.com>
 <20210518081550.d3hof7jr5soeuwo5@gator.home>
 <1a0a9dea-cd42-a2e5-6b1c-0055391d439f@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1a0a9dea-cd42-a2e5-6b1c-0055391d439f@huawei.com>
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 07:47:24PM +0800, wangyanan (Y) wrote:
> > > Is there any better alternative way about this?
> > Move the
> > 
> >    if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> >        gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> >    }
> > 
> > into the if (possible_cpus->cpus[i].cpu != NULL) block?
> We can. But this will only ensure that we initialize
> gicc->performance_interrupt
> for enabled GICC entries but not the disabled ones.

I'd write a comment and leave that problem for the hot plug support to
solve.

> > > Can we also update the arch_id at the same time when we change mp_affinity?
> > The proper fix is to send patches to KVM enabling userspace to control
> > MPIDR. Otherwise we can't be sure we don't have inconsistencies in QEMU,
> > since some user of possible_cpus could have made decisions or copied IDs
> > prior to KVM vcpu init time. Now, all that said, I think
> > virt_cpu_mp_affinity() should be generating the same ID as KVM does, so
> > maybe it doesn't matter in practice right now, but we're living with the
> > risk that KVM could change. For now, maybe we should just sanity check
> > that the KVM values match the possible_cpus values and emit warnings if
> > they don't?
> I think it may not so reasonable to emit warnings if they don't match, on
> the contrary we should ensure they will match even when KVM changes.
> 
> Now virt_cpu_mp_affinity() is only called by virt_possible_cpu_arch_ids() to
> initialize possible_cpus, so an idea is that we can move the stuff of
> resetting
> "cpu->mp_affinity" from kvm_arch_init_vcpu() to virt_cpu_mp_affinity() to
> initialize arch_id. So that we can ensure mp_affinity only comes from
> arch_id
> and won't change later. Can it work?

No. virt_cpu_mp_affinity can run way before cpu realize, but
kvm_arch_init_vcpu runs at cpu realize time.

> 
> BTW, I plan to pack patch 4-6 into a separate patchset and repost it until
> we have a mature solution for the probelm, that's also Salil's suggestion.
> Is it appropriate?

Well, you still need to set the enabled flag in the GICC table and you'll
still need to come up with a solution for user input of cpus < maxcpus,
but if your solution to the latter is good, then whatever you like.

Thanks,
drew


