Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1F189630
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 08:23:43 +0100 (CET)
Received: from localhost ([::1]:46528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jET3H-0001J9-1A
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 03:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jET2X-0000sP-LV
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 03:22:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jET2W-0004S6-Kj
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 03:22:57 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40322 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jET2V-0004B8-Nq
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 03:22:56 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 60E89A8031F6C42C1AC7;
 Wed, 18 Mar 2020 15:22:51 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 18 Mar
 2020 15:22:42 +0800
Subject: Re: [PATCH] hmp-cmd: fix a missing_break warning
To: <dgilbert@redhat.com>
References: <20200318071620.59748-1-pannengyuan@huawei.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <1a0d020b-3fe6-3575-1c2f-1af4a79cf080@huawei.com>
Date: Wed, 18 Mar 2020 15:22:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200318071620.59748-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: euler.robot@huawei.com, zhukeqian1@huawei.com, qemu-devel@nongnu.org,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correcting zhang hailiang's email.

On 3/18/2020 3:16 PM, Pan Nengyuan wrote:
> This fix coverity issues 94417686:
>     1260        break;
>     CID 94417686: (MISSING_BREAK)
>     1261. unterminated_case: The case for value "MIGRATION_PARAMETER_THROTTLE_TRIGGER_THRESHOLD" is not terminated by a 'break' statement.
>     1261    case MIGRATION_PARAMETER_THROTTLE_TRIGGER_THRESHOLD:
>     1262        p->has_throttle_trigger_threshold = true;
>     1263        visit_type_int(v, param, &p->throttle_trigger_threshold, &err);
>     1264    case MIGRATION_PARAMETER_CPU_THROTTLE_INITIAL:
> 
> Fixes: dc14a470763c96fd9d360e1028ce38e8c3613a77
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Cc: zhukeqian1@huawei.com
> ---
>  monitor/hmp-cmds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 58724031ea..c882c9f3cc 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1261,6 +1261,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>      case MIGRATION_PARAMETER_THROTTLE_TRIGGER_THRESHOLD:
>          p->has_throttle_trigger_threshold = true;
>          visit_type_int(v, param, &p->throttle_trigger_threshold, &err);
> +        break;
>      case MIGRATION_PARAMETER_CPU_THROTTLE_INITIAL:
>          p->has_cpu_throttle_initial = true;
>          visit_type_int(v, param, &p->cpu_throttle_initial, &err);
> 

