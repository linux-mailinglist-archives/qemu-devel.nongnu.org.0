Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D225F395
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 09:06:31 +0200 (CEST)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFBEU-0007kP-JF
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 03:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFBD8-00075J-BW
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 03:05:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28146
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFBD4-0007pG-UD
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 03:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599462301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UK/ids7mw1ePw3nMRLBxB94xGAwlMda27/3iuNIjppQ=;
 b=foR2vZvLfHuyAJh8BxLe3mi2VU1GGiwX4yxwpe5QUJOHkACZsTT7bBrq5JqeoeHpNSrxOT
 Cc3enYoSfaxjh3wRyiV8FSNkqZG+FevQ/zrDU4e4ccc1CUgNBWfj58KhYbhoTcgYZW4hQc
 28pHenhnZWoLahElBpNK04G2vgbhwk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-R1Lkp_7gPa6_mYC_hJ1AHg-1; Mon, 07 Sep 2020 03:04:58 -0400
X-MC-Unique: R1Lkp_7gPa6_mYC_hJ1AHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8B510066FB;
 Mon,  7 Sep 2020 07:04:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 252BB19C4F;
 Mon,  7 Sep 2020 07:04:55 +0000 (UTC)
Date: Mon, 7 Sep 2020 09:04:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/5] hw/arm/virt: Introduce kvm-steal-time
Message-ID: <20200907070452.g4y52iqjgvop6rt2@kamzik.brq.redhat.com>
References: <20200805091640.11134-1-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805091640.11134-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


FYI, the new KVM cap is on its way into the kernel and Peter has submit
patches to remove kvm32 from qemu. So I'll be refreshing this series to
incorporate both those changes.

Thanks,
drew


On Wed, Aug 05, 2020 at 11:16:35AM +0200, Andrew Jones wrote:
> v2:
>   - Changed the introduction of the feature to 5.2 from 5.1
>     (The 5.2 machine type patch posted by Cornelia was thrown
>      in for completeness, but I suppose that'll get picked up
>      separately.)
>   - Added a patch adding g_assert_not_reached() to many KVM
>     stubs. (This isn't exactly related to the series, but the
>     series does add two more stubs that can now be added in
>     the same way.)
>   - Fixed a patch that wasn't suppose to have a functional
>     change, but did (fdt_add_gic_node() shouldn't generate
>     the node without the PMU) [Peter]
>   - Pass sysmem to virt_cpu_post_init() [Peter]
>   - Introduced a define for the pvtime struct size
>   - Calculate the pvtime memory region size based on max-cpus
>     and host-page-size [Beata]
>   - Renamed kvm_no_steal_time to no_kvm_steal_time [Peter]
>   - Fixed a parameter misordering with object_property_set_bool()
>   - Added a comment explaining why the feature isn't supported
>     for AArch32 guests
>   - Changed a !kvm_steal_time to a kvm_steal_time == ON_OFF_AUTO_OFF
>     as it should be
>   - Picked up one r-b from Peter
> 
> 
> KVM supports the ability to publish the amount of time that VCPUs
> were runnable, but not running due to other host threads running
> instead, to the guest. The guest scheduler may use that information
> when making decisions and the guest may expose it to its userspace
> (Linux publishes this information in /proc/stat). This feature is
> called "steal time" as it represents the amount of time stolen from
> a guest by scheduling out its VCPUs. To enable this feature KVM
> userspace must provide a memory region that will be used to publish
> the information to the guest. The memory region is typical migratable
> region. The GPA of the region is given to KVM through a VCPU device
> ioctl interface. This feature is only available for 64-bit hosts
> running 64-bit guests.
> 
> This series provides the QEMU support of this feature. It will
> be enabled by default for 5.2 machine types and later, but may
> be disabled with a new CPU property "kvm-steal-time".
> 
> While testing migration it was observed that the amount of
> steal time as viewed by the guest was getting reset on each
> migration. Patch 4/6 of a pvtime fix series posted[*] for KVM
> should fix that. Also, we may still want to change the way we
> probe KVM for the feature in this QEMU series to the new KVM
> cap proposed in that KVM series.
> 
> Migration testing:
> 
> * virt-5.1 can migrate as usual, no steal-time enabled
> 
> * virt-5.2 can migrate between hosts with steal-time enabled
>   (the default) and disabled when both hosts support steal-time
> 
> * virt-5.2 with steal-time disabled can migrate to a host that
>   does not support steal-time
> 
> * virt-5.2 with steal-time enabled will cleanly fail when migrating
>   to a host that does not support steal-time
> 
> * virt-5.2 without the kvm-steal-time property specified can
>   boot on a host that does not support the feature - the feature
>   will be disabled. However, if the guest is migrated to a host
>   that does support the feature, then after the guest has reboot
>   the feature will become available with the guest kernel supports
>   it (this is the nature of migrating guests that use '-cpu host').
>   Additionally, once this guest has been migrated to a host that
>   does have the feature, then it will fail (cleanly) to migrate to
>   a host that does not have the feature. If this behavior isn't
>   desired, then the user should explicitly disable steal-time with
>   the kvm-steal-time property if they want to boot a 5.2 guest on
>   a host that doesn't support steal-time.
> 
> [*] https://lists.cs.columbia.edu/pipermail/kvmarm/2020-August/041823.html
> 
> Thanks,
> drew
> 
> 
> Andrew Jones (4):
>   target/arm/kvm: Make uncalled stubs explicitly unreachable
>   hw/arm/virt: Move post cpu realize check into its own function
>   hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
>   hw/arm/virt: Implement kvm-steal-time
> 
> Cornelia Huck (1):
>   hw: add compat machines for 5.2
> 
>  docs/system/arm/cpu-features.rst |  11 +++
>  hw/arm/virt.c                    | 119 +++++++++++++++++++++++--------
>  hw/core/machine.c                |   3 +
>  hw/i386/pc.c                     |   6 +-
>  hw/i386/pc_piix.c                |  14 +++-
>  hw/i386/pc_q35.c                 |  13 +++-
>  hw/ppc/spapr.c                   |  15 +++-
>  hw/s390x/s390-virtio-ccw.c       |  14 +++-
>  include/hw/arm/virt.h            |   5 ++
>  include/hw/boards.h              |   3 +
>  include/hw/i386/pc.h             |   3 +
>  target/arm/cpu.c                 |  10 +++
>  target/arm/cpu.h                 |   4 ++
>  target/arm/kvm.c                 |  20 ++++++
>  target/arm/kvm32.c               |   5 ++
>  target/arm/kvm64.c               |  77 ++++++++++++++++++--
>  target/arm/kvm_arm.h             |  74 ++++++++++++++-----
>  target/arm/monitor.c             |   2 +-
>  tests/qtest/arm-cpu-features.c   |  25 +++++--
>  19 files changed, 358 insertions(+), 65 deletions(-)
> 
> -- 
> 2.25.4
> 


