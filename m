Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B6151F2CB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 05:09:15 +0200 (CEST)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nntlq-00059Y-Cm
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 23:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nntl2-0004Sr-Dd
 for qemu-devel@nongnu.org; Sun, 08 May 2022 23:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nntkz-0006UN-6Z
 for qemu-devel@nongnu.org; Sun, 08 May 2022 23:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652065699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+EWyjWnry1v/wLWfDQHG3KxEGhTcsqwxlDHy97Dwjw=;
 b=F10rM+X+mrzHAGMfeUZZMJAnORkJRKwKvLQqbP4nDPQWUrZak1aJ4Ycb52IkkjSrCxqIsI
 i7OxSYshJFJUuVD+lGz2ycfEFPsvlFa6YsNwzyXIhBefOUvcG9UK67z7RJmUfoOSUlkDH8
 aI3igE5/TmZz8Ardq/PCoUGT4LVIMv4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-6vQN5ayfMcSG9WYF5CN0Fg-1; Sun, 08 May 2022 23:08:18 -0400
X-MC-Unique: 6vQN5ayfMcSG9WYF5CN0Fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A375838149B5;
 Mon,  9 May 2022 03:08:17 +0000 (UTC)
Received: from [10.72.13.160] (ovpn-13-160.pek2.redhat.com [10.72.13.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5EB40CFD06;
 Mon,  9 May 2022 03:08:08 +0000 (UTC)
Subject: Re: [PATCH v9 0/6] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20220503140304.855514-1-gshan@redhat.com>
Message-ID: <74e4fdf6-c8bf-92ad-0c3b-0eb759a1df0c@redhat.com>
Date: Mon, 9 May 2022 11:08:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220503140304.855514-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter and maintainers,

On 5/3/22 10:02 PM, Gavin Shan wrote:
> When the CPU-to-NUMA association isn't provided by user, the default NUMA
> node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> the broken CPU topology warning message in Linux guest. This series intends
> to fix the issue by populating full CPU toplogy on arm/virt machine.
> 
>    PATCH[1/6] Add cluster-id to CPU instance property
>    PATCH[2/6] Fixes test failure in qtest/numa-test/aarch64_numa_cpu()
>    PATCH[3/6] Uses SMP configuration to populate CPU topology
>    PATCH[4/6] Corrects CPU/NUMA association in qtest/numa-test/aarch64_numa_cpu()
>    PATCH[5/6] Fixes the broken CPU topology by considering the socket boundary
>               when the default NUMA node ID is given
>    PATCH[6/6] Uses the populated CPU topology to build PPTT table, instead of
>               calculate it again
> 
> Changelog
> =========
> v9:
>     * Fix typo by replacing 'thrad-id' with 'thread-id' in
>       PATCH[v9 2/6]'s commit log                                 (Igor)
>     * Added PATCH[v9 4/6] to make CPU-to-NUMA association
>       real                                                       (Igor)

[...]

> Gavin Shan (6):
>    qapi/machine.json: Add cluster-id
>    qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
>    hw/arm/virt: Consider SMP configuration in CPU topology
>    qtest/numa-test: Correct CPU and NUMA association in
>      aarch64_numa_cpu()
>    hw/arm/virt: Fix CPU's default NUMA node ID
>    hw/acpi/aml-build: Use existing CPU topology to build PPTT table
> 
>   hw/acpi/aml-build.c        | 111 ++++++++++++++++---------------------
>   hw/arm/virt.c              |  19 ++++++-
>   hw/core/machine-hmp-cmds.c |   4 ++
>   hw/core/machine.c          |  16 ++++++
>   qapi/machine.json          |   6 +-
>   tests/qtest/numa-test.c    |  19 +++++--
>   6 files changed, 102 insertions(+), 73 deletions(-)
> 

I think this series is ready to be merged. Could you help to see how it
can be merged to QEMU 7.1?

Thanks,
Gavin


