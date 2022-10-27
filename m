Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1A60F05B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:34:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwSe-0003eE-ON; Thu, 27 Oct 2022 02:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onwSb-0003F5-C4
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onwSY-0002c7-KD
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666852425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27dcz2jFAX7m4ToklbjnaWybIQ0XBEVe00iwTvvhRvQ=;
 b=dWQ+VYrJl/tAujIE1DmguCxSTm+AJMUgv5LwZ16iyxAEAjfoZIaA5+l1MRdq3VQIztHWln
 WdYSeahf8W9tQL+3XLtkodHdc7vNax0RAnl5RAdnMjTTH5KAHEbXPRP3BBmU3RankfiSVV
 AD9NpMn7V8nBejthI1iL6LGDr+ysZ7U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-XTgui6X0PR-TfA5l2QRFag-1; Thu, 27 Oct 2022 02:33:42 -0400
X-MC-Unique: XTgui6X0PR-TfA5l2QRFag-1
Received: by mail-wm1-f71.google.com with SMTP id
 r81-20020a1c4454000000b003c41e9ae97dso2311870wma.6
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27dcz2jFAX7m4ToklbjnaWybIQ0XBEVe00iwTvvhRvQ=;
 b=V4PRQi+v4ohEHVpoNRDn19bNtVw3u3dLhmkxp4NZ0kuRPPbriMOxYmo7Jozh1H3bHQ
 Em+H2KolcLWRHn1kbG6xCWYu4cW5oRZr7zqU1OfVroGg+KeJxo8XKHCWv/K6oOvhLM3p
 L4Lq64JDBapS8/GVG9Ugzvvbwr8UN3xZhLaNydhk5NhZewTRUGybMZmWAVQz3MFEzoYb
 fXTcWNs2qfbXk8TC3yYtVmkF2Bh9Jnsa+HLOYf+sJm6VQJJEz4YRpRBB7QkelSKj8lSr
 Hzxs9wAT0QL9iFFJJA9jj+oCXrygwCylXQEDGLMPkhGjULO2xrA/L/RtYsyxYGNwOH59
 tlBw==
X-Gm-Message-State: ACrzQf1oHWqNOVKWYvouwyLHzVz6YGoCaxC45myMZx+BYSMnLKQEhuM+
 yIWbBFwjWhXKssdDyHqxXldv9kMDEpzl+mXM4dcdcpxgeOMkN+Z5gMJh2lpjLSLuVcLFMGnFiep
 Gs19XFKDLkyYkn74=
X-Received: by 2002:a5d:5983:0:b0:236:7a7e:e62e with SMTP id
 n3-20020a5d5983000000b002367a7ee62emr10265126wri.38.1666852421608; 
 Wed, 26 Oct 2022 23:33:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67R1ZIblEdPqZ9ccA+/0X5f+Ef/bpGFOkMEWUG5yb0ceCTr+YS2HhaDNV22vZ27IIRn2Djdw==
X-Received: by 2002:a5d:5983:0:b0:236:7a7e:e62e with SMTP id
 n3-20020a5d5983000000b002367a7ee62emr10265098wri.38.1666852421353; 
 Wed, 26 Oct 2022 23:33:41 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d60c4000000b0022cce7689d3sm349318wrt.36.2022.10.26.23.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:33:40 -0700 (PDT)
Date: Thu, 27 Oct 2022 02:33:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: peter.maydell@linaro.org, imammedo@redhat.com, ani@anisinha.ca,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org,
 jonathan.cameron@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, prime.zeng@huawei.com,
 hesham.almatary@huawei.com, ionela.voinescu@arm.com,
 darren@os.amperecomputing.com
Subject: Re: [PATCH v2 0/4] Only generate cluster node in PPTT when specified
Message-ID: <20221027023254-mutt-send-email-mst@kernel.org>
References: <20221027032613.18377-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027032613.18377-1-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Thu, Oct 27, 2022 at 11:26:09AM +0800, Yicong Yang wrote:
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
> emulate the topology on these platforms. So in this series improve the
> policy to only generate cluster when the user explicitly want.
> 
> Update the tests and test tables accordingly.
> 
> [*] https://lore.kernel.org/lkml/2c079860-ee82-7719-d3d2-756192f41704@huawei.com/
> 
> Change since v1:
> - Only includes the test tables which is really needed
> - Enrich the commit
> Link: https://lore.kernel.org/qemu-devel/20220922131143.58003-1-yangyicong@huawei.com/


Looks superficually ok. ARM maintainers? Ack? Will you take this
or want me to?

Acked-by: Michael S. Tsirkin <mst@redhat.com>



> Yicong Yang (4):
>   hw/acpi/aml-build: Only generate cluster node in PPTT when specified
>   tests: virt: update expected ACPI tables for virt test
>   tests: acpi: aarch64: add topology test for aarch64
>   tests: acpi: aarch64: add *.topology tables
> 
>  hw/acpi/aml-build.c                |   2 +-
>  hw/core/machine-smp.c              |   3 +++
>  include/hw/boards.h                |   2 ++
>  qemu-options.hx                    |   2 ++
>  tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
>  tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
>  tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
>  tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
>  tests/qtest/bios-tables-test.c     |  22 ++++++++++++++++++++++
>  9 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/APIC.topology
>  create mode 100644 tests/data/acpi/virt/DSDT.topology
>  create mode 100644 tests/data/acpi/virt/PPTT.topology
> 
> -- 
> 2.24.0


