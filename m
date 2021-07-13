Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C060F3C6BB8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:51:23 +0200 (CEST)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3DCM-0002po-RT
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m3DAL-0000OM-TE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:49:17 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m3DAI-0003JX-Eu
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:49:17 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GPCLF1hVnz1CJDy;
 Tue, 13 Jul 2021 15:43:33 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 15:49:09 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 15:49:08 +0800
Subject: Re: [RFC PATCH 4/6] machine: Uniformly use maxcpus to calculate the
 missing values
To: Andrew Jones <drjones@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-5-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <1b76cfaa-a259-7ed4-635e-173bc3aa018c@huawei.com>
Date: Tue, 13 Jul 2021 15:49:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-5-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/2 18:07, Yanan Wang wrote:
> We are currently using maxcpus to calculate value of sockets but using
> cpus to calculate value of cores/threads. This makes cmdlines like
> "-smp 8,maxcpus=12,cores=4" work while "-smp 8,maxcpus=12,sockets=3"
> break the invalid cpu topology check.
>
> This patch allows us to uniformly use maxcpus to calculate the missing
> values. Also the if branch of "cpus == 0 || sockets == 0" was splited
> into branches of "cpus == 0" and "sockets == 0" so that we can clearly
> figure out that we are parsing -smp cmdlines with a preference of cpus
> over sockets over cores over threads.
BTW, after this patch, configs like:
-smp maxcpus=16 --> -smp 1,sockets=1,cores=1,threads=1,maxcpus=16
-smp sockets=2,maxcpus=16 --> -smp 2,sockets=2,cores=1,threads=1,maxcpus=16
......
still can not work. So I suggest to use the parameters computed by 
maxcpus to calculate
the value of cpus if it's omitted. The diff based on this patch is:

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 93c5227920..924c48fd43 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -757,13 +757,7 @@ static void smp_parse(MachineState *ms, 
SMPConfiguration *config, Error **errp)
      /* compute missing values, prefer sockets over cores over threads */
      maxcpus = maxcpus > 0 ? maxcpus : cpus;

-    if (cpus == 0) {
-        sockets = sockets > 0 ? sockets : 1;
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        cpus = sockets * cores * threads;
-        maxcpus = maxcpus > 0 ? maxcpus : cpus;
-    } else if (sockets == 0) {
+    if (sockets == 0) {
          cores = cores > 0 ? cores : 1;
          threads = threads > 0 ? threads : 1;
          sockets = maxcpus / (cores * threads);
@@ -777,6 +771,9 @@ static void smp_parse(MachineState *ms, 
SMPConfiguration *config, Error **errp)
          threads = threads > 0 ? threads : 1;
      }

+    cpus = cpus > 0 ? cpus : sockets * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
      if (sockets * cores * threads < cpus) {
          error_setg(errp, "cpu topology: "
                     "sockets (%u) * cores (%u) * threads (%u) < "


Thanks,
Yanan
.
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/core/machine.c | 36 +++++++++++++++++++-----------------
>   hw/i386/pc.c      | 37 +++++++++++++++++++------------------
>   2 files changed, 38 insertions(+), 35 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1e194677cd..58882835be 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -752,34 +752,36 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>       }
>   
>       /* compute missing values, prefer sockets over cores over threads */
> -    if (cpus == 0 || sockets == 0) {
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +
> +    if (cpus == 0) {
> +        sockets = sockets > 0 ? sockets : 1;
>           cores = cores > 0 ? cores : 1;
>           threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (cores * threads);
> -            sockets = sockets > 0 ? sockets : 1;
> -        }
> +        cpus = sockets * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (cores * threads);
> +        sockets = sockets > 0 ? sockets : 1;
>       } else if (cores == 0) {
>           threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * threads);
> +        cores = maxcpus / (sockets * threads);
>           cores = cores > 0 ? cores : 1;
>       } else if (threads == 0) {
> -        threads = cpus / (cores * sockets);
> +        threads = maxcpus / (sockets * cores);
>           threads = threads > 0 ? threads : 1;
> -    } else if (sockets * cores * threads < cpus) {
> +    }
> +
> +    if (sockets * cores * threads < cpus) {
>           error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> +                   "sockets (%u) * cores (%u) * threads (%u) "
> +                   "< smp_cpus (%u)",
>                      sockets, cores, threads, cpus);
>           return;
>       }
>   
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>       if (maxcpus < cpus) {
>           error_setg(errp, "maxcpus must be equal to or greater than smp");
>           return;
> @@ -795,9 +797,9 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>       }
>   
>       ms->smp.cpus = cpus;
> +    ms->smp.sockets = sockets;
>       ms->smp.cores = cores;
>       ms->smp.threads = threads;
> -    ms->smp.sockets = sockets;
>       ms->smp.max_cpus = maxcpus;
>   }
>   
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 93d1f12a49..1812f33ab1 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -721,35 +721,36 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>   
>       /* compute missing values, prefer sockets over cores over threads */
>       dies = dies > 0 ? dies : 1;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>   
> -    if (cpus == 0 || sockets == 0) {
> +    if (cpus == 0) {
> +        sockets = sockets > 0 ? sockets : 1;
>           cores = cores > 0 ? cores : 1;
>           threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * dies * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (dies * cores * threads);
> -            sockets = sockets > 0 ? sockets : 1;
> -        }
> +        cpus = sockets * dies * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (dies * cores * threads);
> +        sockets = sockets > 0 ? sockets : 1;
>       } else if (cores == 0) {
>           threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * dies * threads);
> +        cores = maxcpus / (sockets * dies * threads);
>           cores = cores > 0 ? cores : 1;
>       } else if (threads == 0) {
> -        threads = cpus / (cores * dies * sockets);
> +        threads = maxcpus / (sockets * dies * cores);
>           threads = threads > 0 ? threads : 1;
> -    } else if (sockets * dies * cores * threads < cpus) {
> +    }
> +
> +    if (sockets * dies * cores * threads < cpus) {
>           error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> +                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> +                   "< smp_cpus (%u)",
>                      sockets, dies, cores, threads, cpus);
>           return;
>       }
>   
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>       if (maxcpus < cpus) {
>           error_setg(errp, "maxcpus must be equal to or greater than smp");
>           return;
> @@ -765,10 +766,10 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>       }
>   
>       ms->smp.cpus = cpus;
> -    ms->smp.cores = cores;
> -    ms->smp.threads = threads;
>       ms->smp.sockets = sockets;
>       ms->smp.dies = dies;
> +    ms->smp.cores = cores;
> +    ms->smp.threads = threads;
>       ms->smp.max_cpus = maxcpus;
>   }
>   


