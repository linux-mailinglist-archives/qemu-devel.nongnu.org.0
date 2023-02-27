Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6776A4392
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:01:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe3b-0008E6-6R; Mon, 27 Feb 2023 09:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWe3P-00081R-6U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:00:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWe3L-0007D4-MQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677506425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJvrv42+8kO1u4baEkFc/s8k2ZLkeR9CHfUVi0nHTHc=;
 b=VXTNslaar9+26vwLqyD1tcf9NVDitWLvhg7rinwNLwg9BdQih+CO41smmVrUIAjOnsvt1K
 LiC5pd1pqkfoAsiVfkCC2fFbUK8TsVMEL5y2S7v/hsSH6FjQrDRcY2m8tma0PwQc2T6l5M
 UiXfBRO8VR0WI7q3mjk/bZG0sFuNKj4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-mWUdJleVNXGBhTk1YGuonA-1; Mon, 27 Feb 2023 09:00:23 -0500
X-MC-Unique: mWUdJleVNXGBhTk1YGuonA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso2919416wms.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJvrv42+8kO1u4baEkFc/s8k2ZLkeR9CHfUVi0nHTHc=;
 b=0BY7jHrcyaGIdQKcnLW4f9GlmeL0FkuntvdLtwyxhF97MnObll3cW8tXxBOaQ3IQkV
 /otIUz6w+kR8GkIhPKiyzj6vPXinFpiNQbMM/fx3xCSO3KCQHyB0s/SIc+BcnjW5cTIy
 gJ3/FBOIZRfAr638YYoEwJ+g1mXtJugmPDRFbPjy+iee8183W2/Ez+UAjbZ7G1dOaQ1J
 9JY8MPTFc7kr83YDVoaVDAbHm1G0Oaz/bNwfkaBHeUWNuZdl1oJJRZXzS+NLIOqYPbS3
 BVRbIOYA6jeFrplDCnOFk4dWxCxoOir9oLRl18GEcx5AJiXJiKXxinDBfEQHANUebh7Q
 1Qrg==
X-Gm-Message-State: AO0yUKWZh/XpDlxwgLJTV1/4UJugtoeCRdnTi/y7bjVE/hV+6NOMbFje
 RwaBZhaYD7S8BqKOVo4CFI9oZyYQ+os9+UOyyKAhWwCqNnvEepMge1aFL3KvJDOS0MwMGlJtYZT
 6G/mDXMxFkTXA+9Y=
X-Received: by 2002:a5d:4642:0:b0:2c7:d575:e8a4 with SMTP id
 j2-20020a5d4642000000b002c7d575e8a4mr7406391wrs.65.1677506422113; 
 Mon, 27 Feb 2023 06:00:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+x3qERT+kFX+PARQu8FHtMg+djDI9i4F1N3cer6PEzyMGpQ5f456gviAU0c/cGGgMrd4XQlw==
X-Received: by 2002:a5d:4642:0:b0:2c7:d575:e8a4 with SMTP id
 j2-20020a5d4642000000b002c7d575e8a4mr7406349wrs.65.1677506421737; 
 Mon, 27 Feb 2023 06:00:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6545000000b002c5501a5803sm7192314wrv.65.2023.02.27.06.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 06:00:21 -0800 (PST)
Message-ID: <c41ca0c4-3e38-1afa-f113-9f5cb5313995@redhat.com>
Date: Mon, 27 Feb 2023 15:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 00/11] s390x: CPU Topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230222142105.84700-1-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/02/2023 15.20, Pierre Morel wrote:
> Hi,
> 
> No big changes here, some bug corrections and comments modifications
> following Thomas and Nina comments and Daniel and Markus reommandations.
> 
> Implementation discussions
> ==========================
> 
> CPU models
> ----------
> 
> Since the facility 11, S390_FEAT_CONFIGURATION_TOPOLOGY is already
> in the CPU model for old QEMU we could not activate it as usual from
> KVM but needed a KVM capability: KVM_CAP_S390_CPU_TOPOLOGY.
> Checking and enabling this capability enables facility 11,
> S390_FEAT_CONFIGURATION_TOPOLOGY.
> 
> It is the responsibility of the admin to ensure the same CPU
> model for source and target host in a migration.
> 
> Migration
> ---------
> 
> When the target guest is started, the Multi-processor Topology Change
> Report (MTCR) bit is set during the creation of the vCPU by KVM.
> We do not need to migrate its state, in the worst case, the target
> guest will see the MTCR and actualize its view of the topology
> without necessity, but this will be done only one time.
> 
> Reset
> -----
> 
> Reseting the topology is done during subsystem reset, the
> polarization is reset to horizontal polarization.
> 
> Topology attributes
> -------------------
> 
> The topology attributes are carried by the CPU object and defined
> on object creation.
> In the case the new attributes, socket, book, drawer, dedicated,
> polarity are not provided QEMU provides defaults values.
> 
> - Geometry defaults
>    The geometry default are based on the core-id of the core to
>    fill the geometry in a monotone way starting with drawer 0,
>    book 0, and filling socket 0 with the number of cores per socket,
>    then filling socket 1, socket 2 ... etc until the book is complete
>    and all books until the first drawer is complete before starting with
>    the next drawer.
> 
>    This allows to keep existing start scripts and Libvirt existing
>    interface until it is extended.
> 
> - Modifiers defaults
>    Default polarization is horizontal
>    Default dedication is not dedicated.
> 
> Dynamic topology modification
> -----------------------------
> 
> QAPI interface is extended with:
> - a command: 'x-set-cpu-topology'
> - a query: extension of 'query-cpus-fast'
> - an event: 'CPU_POLARITY_CHANGE'
> 
> The admin may use query-cpus-fast to verify the topology provided
> to the guest and x-set-cpu-topology to modify it.
> 
> The event CPU_POLARITY_CHANGE is sent when the guest successfuly
> uses the PTF(2) instruction to request a polarization change.
> In that case, the admin is supposed to modify the CPU provisioning
> accordingly.
> 
> Testing
> =======
> 
> To use the QEMU patches, you will need Linux V6-rc1 or newer,
> or use the following Linux mainline patches:
> 
> f5ecfee94493 2022-07-20 KVM: s390: resetting the Topology-Change-Report
> 24fe0195bc19 2022-07-20 KVM: s390: guest support for topology function
> 0130337ec45b 2022-07-20 KVM: s390: Cleanup ipte lock access and SIIF fac..
> 
> Currently this code is for KVM only, I have no idea if it is interesting
> to provide a TCG patch. If ever it will be done in another series.
> 
> Documentation
> =============
> 
> To have a better understanding of the S390x CPU Topology and its
> implementation in QEMU you can have a look at the documentation in the
> last patch of this series.
> 
> The admin will want to match the host and the guest topology, taking
> into account that the guest does not recognize multithreading.
> Consequently, two vCPU assigned to threads of the same real CPU should
> preferably be assigned to the same socket of the guest machine.
> 
> 
> Regards,
> Pierre
> 
> Pierre Morel (11):
>    s390x/cpu topology: add s390 specifics to CPU topology
>    s390x/cpu topology: add topology entries on CPU hotplug
>    target/s390x/cpu topology: handle STSI(15) and build the SYSIB
>    s390x/sclp: reporting the maximum nested topology entries
>    s390x/cpu topology: resetting the Topology-Change-Report
>    s390x/cpu topology: interception of PTF instruction
>    target/s390x/cpu topology: activating CPU topology
>    qapi/s390x/cpu topology: set-cpu-topology monitor command
>    machine: adding s390 topology to query-cpu-fast
>    qapi/s390x/cpu topology: CPU_POLARIZATION_CHANGE qapi event
>    docs/s390x/cpu topology: document s390x cpu topology
> 
>   docs/system/s390x/cpu-topology.rst | 378 ++++++++++++++++++++
>   docs/system/target-s390x.rst       |   1 +
>   qapi/machine-target.json           |  81 +++++
>   qapi/machine.json                  |  37 +-
>   include/hw/boards.h                |  10 +-
>   include/hw/s390x/cpu-topology.h    |  78 +++++
>   include/hw/s390x/s390-virtio-ccw.h |   6 +
>   include/hw/s390x/sclp.h            |   4 +-
>   include/monitor/hmp.h              |   1 +
>   target/s390x/cpu.h                 |  78 +++++
>   target/s390x/kvm/kvm_s390x.h       |   1 +
>   hw/core/machine-qmp-cmds.c         |   2 +
>   hw/core/machine-smp.c              |  48 ++-
>   hw/core/machine.c                  |   4 +
>   hw/s390x/cpu-topology.c            | 534 +++++++++++++++++++++++++++++
>   hw/s390x/s390-virtio-ccw.c         |  27 +-
>   hw/s390x/sclp.c                    |   5 +
>   softmmu/vl.c                       |   6 +
>   target/s390x/cpu-sysemu.c          |  13 +
>   target/s390x/cpu.c                 |   7 +
>   target/s390x/cpu_models.c          |   1 +
>   target/s390x/kvm/cpu_topology.c    | 312 +++++++++++++++++
>   target/s390x/kvm/kvm.c             |  42 ++-
>   hmp-commands.hx                    |  17 +
>   hw/s390x/meson.build               |   1 +
>   qemu-options.hx                    |   7 +-
>   target/s390x/kvm/meson.build       |   3 +-
>   27 files changed, 1685 insertions(+), 19 deletions(-)
>   create mode 100644 docs/system/s390x/cpu-topology.rst
>   create mode 100644 include/hw/s390x/cpu-topology.h
>   create mode 100644 hw/s390x/cpu-topology.c
>   create mode 100644 target/s390x/kvm/cpu_topology.c

Any chance that you could also add some qtests for checking that the 
topology works as expected? I.e. set some topology via the command line, 
then use QMP to check whether all CPUs got the right settings?

  Thomas


