Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1EA516B69
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 09:49:02 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlQnk-0004oN-Gn
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 03:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlQiz-0003cg-El
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlQiw-000708-SP
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651477441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlULaEm71w1FP65s2RVAFsYbiWX/ogUZVHNGT2PtWSY=;
 b=a2s2H1Fox+etoxdSdAmToJhzoePnAidVFhofymaFw0H+pppHaLfDtBXgl1Z8d4gD0wcf85
 SCtI/IQlaK2O+UlwMcguD6LGm/G4Wd/z7lRwLYl3KQGdBkjI2e1eXBTkFmxP5e+LUIR1cz
 C5M+NQzpp4CKqVbgqXY2Ew51CnSVXFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-a7lRkK06PruRSOZYoEbwdw-1; Mon, 02 May 2022 03:43:57 -0400
X-MC-Unique: a7lRkK06PruRSOZYoEbwdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDB2480A0AD;
 Mon,  2 May 2022 07:43:56 +0000 (UTC)
Received: from [10.72.12.86] (ovpn-12-86.pek2.redhat.com [10.72.12.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A126840D2821;
 Mon,  2 May 2022 07:43:48 +0000 (UTC)
Subject: Re: [PATCH v8 0/5] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
References: <20220425032802.365061-1-gshan@redhat.com>
Message-ID: <14265344-9a80-6e6a-2861-f40e27e54ca2@redhat.com>
Date: Mon, 2 May 2022 15:43:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220425032802.365061-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, drjones@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, wangyanan55@huawei.com,
 zhenyzha@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter and maintainers,

On 4/25/22 11:27 AM, Gavin Shan wrote:
> When the CPU-to-NUMA association isn't provided by user, the default NUMA
> node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> the broken CPU topology warning message in Linux guest. This series intends
> to fix the issue.
> 
>    PATCH[1/5] Add cluster-id to CPU instance property
>    PATCH[2/5] Fixes test failure in qtest/numa-test/aarch64_numa_cpu()
>    PATCH[3/5] Uses SMP configuration to populate CPU topology
>    PATCH[4/5] Fixes the broken CPU topology by considering the socket boundary
>               when the default NUMA node ID is given
>    PATCH[5/5] Uses the populated CPU topology to build PPTT table, instead of
>               calculate it again
> 

Could you help to check if it's eligible for 7.1? Thanks a lot
for your comments in advance.

[...]

> 
> Gavin Shan (5):
>    qapi/machine.json: Add cluster-id
>    qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
>    hw/arm/virt: Consider SMP configuration in CPU topology
>    hw/arm/virt: Fix CPU's default NUMA node ID
>    hw/acpi/aml-build: Use existing CPU topology to build PPTT table
> 
>   hw/acpi/aml-build.c        | 111 ++++++++++++++++---------------------
>   hw/arm/virt.c              |  19 ++++++-
>   hw/core/machine-hmp-cmds.c |   4 ++
>   hw/core/machine.c          |  16 ++++++
>   qapi/machine.json          |   6 +-
>   tests/qtest/numa-test.c    |   3 +-
>   6 files changed, 91 insertions(+), 68 deletions(-)
> 

Thanks,
Gavin


