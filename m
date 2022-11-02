Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B14615D83
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:19:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8wV-0001Yf-Sv; Wed, 02 Nov 2022 04:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq8w4-0001Xm-1N
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq8w1-00084T-UT
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667377036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mDc3R7JycEuvYvUdeRtK6r/yA6997Or3GBYNeZkSbc4=;
 b=Hw5tidcatRu4oEyPV1RMuXJK7oU6WSpgHTfaVB1vgLnR9IM6e2eyR5SxmZeVcwM+4yqzgQ
 A3+iA4v/Ts5nIYR2xkPyXtPp+WIR9gRwgODL2aeP2iiejLstFyLWlezLQf1+JDZSVxI+S1
 XoAL7CcrhdrjO+ttjkikQ8oDI4ji9tY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-24MzWchBMHObxzSkeYpysQ-1; Wed, 02 Nov 2022 04:17:13 -0400
X-MC-Unique: 24MzWchBMHObxzSkeYpysQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso1350288wmq.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 01:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mDc3R7JycEuvYvUdeRtK6r/yA6997Or3GBYNeZkSbc4=;
 b=x5n5nbJlgx/hyOR9Su/nhWutHBWbTnG4U8pGEVV3LmzoPCHJ9y8orVa9COUQmBZKuW
 katI5y0ldJMwSlapHmn6n0MFw28+2cMUo5CRB36258++cYwnldHdi0CeKA2+B90WWjBQ
 UASbrpLhx0DxT520fYW2/TfYOXODpeFP3ir/P/R2YVJcUK5ZIb44Z86cW/5SRBkUtKut
 Y3gdTzZTjYHhGQzvWcAdDmgffM+pzu5p+wg5SLiFjoOPlCAjq0UtNQ24hsl6XsaI/hgY
 YhOE1iVR4ctf9mlzD1KBYFIWtBmLyHMwOj8oKjRJmab+aNIqEV0YT5EmKT2F3uikvo/b
 IpSQ==
X-Gm-Message-State: ACrzQf2ZPBg6ScOHFBrchr0SgKI37CnP3+vtG4XfgodtqITIw1B1hOp9
 5NtbG3Z2DuWuJPsCN9wEWb75RDhESjm7DJeIeUcN8fpswdwhGNDmejcvWYXHm+kuw9F7EmhUHee
 lCx+NLX/AH/oLD0w=
X-Received: by 2002:a05:6000:810:b0:236:8a6d:e4e1 with SMTP id
 bt16-20020a056000081000b002368a6de4e1mr14048871wrb.661.1667377032394; 
 Wed, 02 Nov 2022 01:17:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pc3G+FZzurY4C82pPe85gXn0m2B5KvY/n+aVlKwQqC8fXU1sRlMBrL656KNVbyAPYED0cqg==
X-Received: by 2002:a05:6000:810:b0:236:8a6d:e4e1 with SMTP id
 bt16-20020a056000081000b002368a6de4e1mr14048847wrb.661.1667377032161; 
 Wed, 02 Nov 2022 01:17:12 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b003a8434530bbsm1275810wms.13.2022.11.02.01.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 01:17:11 -0700 (PDT)
Date: Wed, 2 Nov 2022 04:17:07 -0400
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
Message-ID: <20221102040935-mutt-send-email-mst@kernel.org>
References: <20221101071048.29553-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101071048.29553-1-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

I think we can classify this as a bugfix and so allow after
the freeze, however, this needs ack from ARM maintainers then.


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


