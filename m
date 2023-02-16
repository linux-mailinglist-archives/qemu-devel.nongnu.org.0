Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EB698FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:32:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSacB-00020y-H2; Thu, 16 Feb 2023 04:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSabz-0001to-Ra
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:31:32 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSabx-00006Q-47
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:31:31 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PHV2749dlzFqSk;
 Thu, 16 Feb 2023 17:26:39 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Thu, 16 Feb 2023 17:31:11 +0800
Message-ID: <38f00a43-dc24-0a5b-e197-536c414354e7@huawei.com>
Date: Thu, 16 Feb 2023 17:31:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 12/52] hw/acpi: Replace MachineState.smp access with
 topology helpers
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-13-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-13-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Zhao,

在 2023/2/13 17:49, Zhao Liu 写道:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> At present, in QEMU only arm needs PPTT table to build cpu topology.
>
> Before QEMU's arm supports hybrid architectures, it's enough to limit
> the cpu topology of PPTT to smp type through the explicit smp interface
> (machine_topo_get_smp_threads()).
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/acpi/aml-build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d131..693bd8833d10 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2044,7 +2044,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>               cluster_offset = socket_offset;
>           }
>   
> -        if (ms->smp.threads == 1) {
> +        if (machine_topo_get_smp_threads(ms) == 1) {
>               build_processor_hierarchy_node(table_data,
>                   (1 << 1) | /* ACPI Processor ID valid */
>                   (1 << 3),  /* Node is a Leaf */
ACPI PPTT table is designed to also support the hybrid CPU topology
case where nodes on the same CPU topology level can have different
number of child nodes.

So to be general, the diff should be:
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ea331a20d1..dfded95bbc 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2044,7 +2044,7 @@ void build_pptt(GArray *table_data, BIOSLinker 
*linker, MachineState *ms,
              cluster_offset = socket_offset;
          }

-        if (ms->smp.threads == 1) {
+        if (machine_topo_get_threads_by_idx(n) == 1) {
              build_processor_hierarchy_node(table_data,
                  (1 << 1) | /* ACPI Processor ID valid */
                  (1 << 3),  /* Node is a Leaf */

Actually I'm recently working on ARM hmp virtualization which relys on
PPTT for topology representation, so we will also need PPTT to be general
for hybrid case anyway.

Thanks,
Yanan

