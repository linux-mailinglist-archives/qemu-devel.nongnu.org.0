Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F94652CDC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 07:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7sZP-0001x6-5C; Wed, 21 Dec 2022 01:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sZN-0001ws-48
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sZL-0000N0-8w
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671604030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4weW8Sq15Py+MpRI91WxtdhXZY+KtyrWs/FTwrOQnIk=;
 b=T0TjaLZFNBIm1uK3QLTheO+Bsk7/PMf/MFyv+zlNxzoVLvpUCMAEWneaF/A4H6+7mkghNB
 5qvxB9lJcwvhBaBjin/ave8wck8he2FH6CZu334bd5nzcFmluM5z23xD+tfo2dL/SaZFci
 UAEtQA7BAnRq/t9MLdkoU7Zz66b/nFg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-WntbzrbDOc6SqksPeLNlwg-1; Wed, 21 Dec 2022 01:27:08 -0500
X-MC-Unique: WntbzrbDOc6SqksPeLNlwg-1
Received: by mail-qk1-f199.google.com with SMTP id
 l16-20020a05620a28d000b00704af700820so249274qkp.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 22:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4weW8Sq15Py+MpRI91WxtdhXZY+KtyrWs/FTwrOQnIk=;
 b=i1hUbFbZIASicCFf3BmkYN6/32+aVMHzeMRzCfgK7YflPnKGOJTLc8ebY9S8mH9oS2
 SbbMT8pgzieFmEmrIYTEYxkDwAe0J6GPt1+lHoCssnS6A/G7oT9xZPjyfrfQW7l7yY0r
 qWIeWet5Q7bURbB+55Civ7yGSPQrqk3XZi7n6nHC42bYiAaN4OCiSq7Vl5xZoX4vE2HN
 0cOOC68pARY0jtkIgBlvubkflkBnKZrjGKogEkd3oRJUaj40MCPqzZ/fnw7YlkyN1CMl
 BoIdL5Fn4SwTyvDdYE4G/AzUmBF/dEncaf0rTAf6YP3KFM1ifFgFgfe0BF8F2Cq5OlES
 5jdQ==
X-Gm-Message-State: AFqh2kr/MAWTvjlN/p+A+ZUAnByH5KE6iMueuPIT/Nrh3VJh14E8uFyO
 ziL+jXWD++DRPaN6/28cTf8DP4o+0U3bLivShqsPoeUvi5K/RQan1mmJvn9PGI9B6Eei8Obq4xX
 DM42QroKu4UdbtWw=
X-Received: by 2002:ad4:530a:0:b0:4c7:467e:d61c with SMTP id
 y10-20020ad4530a000000b004c7467ed61cmr19430589qvr.18.1671604028311; 
 Tue, 20 Dec 2022 22:27:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJhzmNL5SCJsrUjhF2/Oca8SACOWVFcsqEqHa1sQ156o+RNX+ZeZ0JX8lnI8Pt0Gigq5xAuQ==
X-Received: by 2002:ad4:530a:0:b0:4c7:467e:d61c with SMTP id
 y10-20020ad4530a000000b004c7467ed61cmr19430565qvr.18.1671604028040; 
 Tue, 20 Dec 2022 22:27:08 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 r21-20020ae9d615000000b006fa84082b6dsm10309141qkk.128.2022.12.20.22.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 22:27:07 -0800 (PST)
Date: Wed, 21 Dec 2022 01:27:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: peter.maydell@linaro.org, imammedo@redhat.com, ani@anisinha.ca,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org,
 jonathan.cameron@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, prime.zeng@huawei.com,
 hesham.almatary@huawei.com, ionela.voinescu@arm.com,
 darren@os.amperecomputing.com
Subject: Re: [PATCH v4 0/6] Only generate cluster node in PPTT when specified
Message-ID: <20221221012359-mutt-send-email-mst@kernel.org>
References: <20221101071048.29553-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101071048.29553-1-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 01, 2022 at 03:10:42PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> This series mainly change the policy for building a cluster topology node
> in PPTT. Previously we'll always build a cluster node in PPTT without
> asking the user, after this set the cluster node will be built only the
> the user specify through "-smp clusters=X".
> 
> One problem is related to this but not fully caused by this, see the
> discussion in [*]. When booting the VM with `-smp 8` and 4 numa nodes,
> the linux scheduling domains in the VM misses the NUMA domains. It's
> because the MC level span extends to Cluster level (which is generated
> by the Qemu by default) that spans all the cpus in the system, then the
> scheduling domain building stops at MC level since it already includes all
> the cpus.
> 
> Considering cluster is an optional level and most platforms don't have it,
> they may even don't realize this is built and a always build policy cannot
> emulate the real topology on these platforms. So in this series improve the
> policy to only generate cluster when the user explicitly want it.
> 
> Update the tests and test tables accordingly.

To merge this to master we also need to update the new
tests/data/acpi/virt/PPTT.acpihmatvirt

I could do so myself but I'd rather you did the rebase and verified
the diff manually. If the diff is the same no need to update
commit log just the binaries.

Thanks!



> [*] https://lore.kernel.org/lkml/2c079860-ee82-7719-d3d2-756192f41704@huawei.com/
> 
> Change since v3:
> - Improve and attach the diff of the affected ACPI tables in the commit, and minor cleanups
> Link: https://lore.kernel.org/qemu-devel/20221031090523.34146-1-yangyicong@huawei.com/
> 
> Change since v2:
> - Add tag from Micheal, thanks
> - Handle the tests changes with bios-tables-test-allowed-diff.h, Per Micheal
> - Address the comments per Yanan
> Link: https://lore.kernel.org/qemu-devel/20221027032613.18377-1-yangyicong@huawei.com/
> 
> Change since v1:
> - Only includes the test tables which is really needed
> - Enrich the commit
> Link: https://lore.kernel.org/qemu-devel/20220922131143.58003-1-yangyicong@huawei.com/
> 
> Yicong Yang (6):
>   tests: virt: Allow changes to PPTT test table
>   hw/acpi/aml-build: Only generate cluster node in PPTT when specified
>   tests: virt: Update expected ACPI tables for virt test
>   tests: acpi: Add and whitelist *.topology blobs
>   tests: acpi: aarch64: Add topology test for aarch64
>   tests: acpi: aarch64: Add *.topology tables
> 
>  hw/acpi/aml-build.c                |   2 +-
>  hw/core/machine-smp.c              |   2 ++
>  include/hw/boards.h                |   3 +++
>  qemu-options.hx                    |   3 +++
>  tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
>  tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
>  tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
>  tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
>  tests/qtest/bios-tables-test.c     |  19 +++++++++++++++++++
>  9 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/APIC.topology
>  create mode 100644 tests/data/acpi/virt/DSDT.topology
>  create mode 100644 tests/data/acpi/virt/PPTT.topology
> 
> -- 
> 2.24.0


