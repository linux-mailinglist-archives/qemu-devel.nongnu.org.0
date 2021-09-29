Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B341C4E4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 14:41:35 +0200 (CEST)
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVYtw-0004bd-60
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 08:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVYru-0003MX-Vl
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVYrq-000084-Qy
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632919160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xWon0LpdMcSiScxgfTajZ97mtEj41xjp1U3RRgpBMw=;
 b=b1HfUYWSbW0DvsJCe17zDid58VySKarfJjHHaMqPruYV3Npj6QWHjDV/1mcl2MF/MjAYua
 pNZlJxJQoN8E9Vmt3r5ifae6sL0ICYvNrdhkd8jMpv5xLBq0e7W8WAWQGaVzgWWWgxShpJ
 DYC0ZmpggTuvh33migIdXs8DRCETA58=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-BPNghRKHN9Wg2cOjIrw-fA-1; Wed, 29 Sep 2021 08:39:19 -0400
X-MC-Unique: BPNghRKHN9Wg2cOjIrw-fA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so1973340edj.21
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 05:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5xWon0LpdMcSiScxgfTajZ97mtEj41xjp1U3RRgpBMw=;
 b=x5sZIeJZbFd8SSEpyRaCAGNWBgcaVreXAtiLdxFa1r9pgGLE2mtcsA3ThuD+GZrWaQ
 0FCgJVv5cHmE/EJAblcJgoyIUu5JYTMNjr9hdiCdIDLOTVPIp1yiMuQxVeMHJ7GtlQWH
 DhvkOR+fIfZXbVTaVygfcOqzTeLyN4dZLAAk3dyxEpKyKDtr12Op2AMRGNFHbwJPXxRU
 bjyoNQmUXsrvB8hx5CDgRjPk2L7MLSSOvEgE6Vu47qpkCnuLiZ2QSoqdhvOd2q6tcQ+B
 odX8B3t5S32ObRdJAfVGXR6lE8EZ7tjYydqftjxAOVFZ3N0DfXrg7+yd0OE3KYXDszLD
 Gksw==
X-Gm-Message-State: AOAM533Jf09uNgn03NOtDzj9dIxyFVDEEqf+bmHnHovtjlvoiVXyMHQU
 qFb4QfC1JXoQOqjWcnBVdj4Cyc9unJM6UXUWQR9yfUWao/kYFix31rX1jCFOZo0+m4QIUP86ZL9
 fCZFUPCOvOTMyy0M=
X-Received: by 2002:a50:da8d:: with SMTP id q13mr15016725edj.198.1632919158225; 
 Wed, 29 Sep 2021 05:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYcceNQGxsWgzKKxIxa/Z3ZMoRm20E10eDzg1GUTtEE4/GpmUQ1+Bu1P2sT6YU8ZotzjUkyw==
X-Received: by 2002:a50:da8d:: with SMTP id q13mr15016685edj.198.1632919157912; 
 Wed, 29 Sep 2021 05:39:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b5sm1483420edu.13.2021.09.29.05.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 05:39:17 -0700 (PDT)
Message-ID: <83769e14-f85b-26bd-705c-498557b26f57@redhat.com>
Date: Wed, 29 Sep 2021 14:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 00/16] machine: smp parsing fixes and improvement
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/21 04:58, Yanan Wang wrote:
> Hi,
> 
> This is a new version (v12) with minor update suggested by Daniel
> and Philippe. Two new commits (#1 and #16) are added. Thanks!

Queued, thanks!

Paolo

> Summary of v12:
> 1) Specifying a CPU topology parameter as zero was implicitly allowed
> but undocumented before, while now it's explicitly deprecated.
> 
> 2) Refactor/fixes of the smp parsers.
> 
> 3) For consistency, maxcpus is now uniformly used to calculate the
> omitted topology members.
> 
> 4) Improve the error reporting of the parsers.
> 
> 5) It's also suggested that we should start to prefer cores over sockets
> over threads on the newer machine types, which will make the computed
> virtual topology more reflective of the real hardware. Related discussion
> can be found in [1].
> [1] https://lore.kernel.org/qemu-devel/YNIgInK00yNNI4Dy@redhat.com/
> 
> 6) In order to reduce code duplication and ease the code maintenance,
> smp_parse() is converted into a generic enough parser for all arches,
> so that the arch-specific ones (e.g. pc_smp_parse) can be removed.
> It's also convenient to introduce more topology members to the generic
> parser in the future. Related discussions can be found in [2] and [3].
> [2] https://lore.kernel.org/qemu-devel/20210630115602.txmvmfe2jrzu7o67@gator.home/
> [3] https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/
> 
> Changelogs:
> 
> v11->v12:
> - add an extra commit 16/16 to make smp_parse() return a boolean (Philippe)
> - split the machine.json Doc fix out into a separate patch 01/16 (Daniel)
> - add R-bs for the series from Daniel and Philippe, thanks!
> - v11: https://lore.kernel.org/qemu-devel/20210928035755.11684-1-wangyanan55@huawei.com/
> 
> v10->v11:
> - only update patch 11/14
>    use GString APIs to build the cpu topology hierarchy string (Daniel)
>    refine the comments of smp_parse()
> - v10: https://lore.kernel.org/qemu-devel/20210926084541.17352-1-wangyanan55@huawei.com/
> 
> v9->v10:
> - rebased on latest upstream commit 11a1199846.
>    there is no change of the patches in v10, except minor update
>    in 08/14 to resolve merge conflict with master.
> - To make this series more acceptable, drop the last two patches
>    about SMP unit test, since the scalability of the test is not
>    optimally designed after rethinking of it. So I will resend the
>    test related patches separately after refining them.
> - v9: https://lore.kernel.org/qemu-devel/20210910073025.16480-1-wangyanan55@huawei.com/
> 
> Yanan Wang (16):
>    qapi/machine: Fix an incorrect comment of SMPConfiguration
>    machine: Deprecate "parameter=0" SMP configurations
>    machine: Minor refactor/fix for the smp parsers
>    machine: Uniformly use maxcpus to calculate the omitted parameters
>    machine: Set the value of cpus to match maxcpus if it's omitted
>    machine: Improve the error reporting of smp parsing
>    qtest/numa-test: Use detailed -smp CLIs in pc_dynamic_cpu_cfg
>    qtest/numa-test: Use detailed -smp CLIs in test_def_cpu_split
>    machine: Prefer cores over sockets in smp parsing since 6.2
>    machine: Use ms instead of global current_machine in sanity-check
>    machine: Tweak the order of topology members in struct CpuTopology
>    machine: Make smp_parse generic enough for all arches
>    machine: Remove smp_parse callback from MachineClass
>    machine: Move smp_prefer_sockets to struct SMPCompatProps
>    machine: Put all sanity-check in the generic SMP parser
>    machine: Make smp_parse return a boolean
> 
>   docs/about/deprecated.rst  |  15 +++
>   hw/arm/virt.c              |   1 +
>   hw/core/machine.c          | 206 ++++++++++++++++++++++++++-----------
>   hw/i386/pc.c               |  63 +-----------
>   hw/i386/pc_piix.c          |   1 +
>   hw/i386/pc_q35.c           |   1 +
>   hw/ppc/spapr.c             |   1 +
>   hw/s390x/s390-virtio-ccw.c |   1 +
>   include/hw/boards.h        |  23 +++--
>   qapi/machine.json          |   2 +-
>   qemu-options.hx            |  24 +++--
>   tests/qtest/numa-test.c    |   6 +-
>   12 files changed, 201 insertions(+), 143 deletions(-)
> 
> --
> 2.19.1
> 
> 


