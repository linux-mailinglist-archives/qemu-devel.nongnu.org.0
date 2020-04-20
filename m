Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4391B0243
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:36 +0200 (CEST)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQQWk-00075s-Pc
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 03:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jQQVi-0006fQ-6f
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 03:06:30 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jQQVh-00068N-JX
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 03:06:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40502 helo=huawei.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1jQQVg-00061b-UI
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 03:06:29 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 19E58C265E44770DF7F7;
 Mon, 20 Apr 2020 15:06:23 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 20 Apr
 2020 15:05:19 +0800
Subject: Re: [PATCH] migration/rdma: fix a memleak on error path in
 rdma_start_incoming_migration
To: <quintela@redhat.com>, <dgilbert@redhat.com>
References: <20200420102727.17339-1-pannengyuan@huawei.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <6b855882-158c-06e4-5a19-d33558afc0c3@huawei.com>
Date: Mon, 20 Apr 2020 15:05:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200420102727.17339-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:03:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: euler.robot@huawei.com, qemu-devel@nongnu.org,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correcting zhang hailiang's email.

On 4/20/2020 6:27 PM, Pan Nengyuan wrote:
> 'rdma->host' is malloced in qemu_rdma_data_init, but forgot to free on the error
> path in rdma_start_incoming_migration(), this patch fix that.
> 
> The leak stack:
> Direct leak of 2 byte(s) in 1 object(s) allocated from:
>     #0 0x7fb7add18ae8 in __interceptor_malloc (/lib64/libasan.so.5+0xefae8)
>     #1 0x7fb7ad0df1d5 in g_malloc (/lib64/libglib-2.0.so.0+0x531d5)
>     #2 0x7fb7ad0f8b32 in g_strdup (/lib64/libglib-2.0.so.0+0x6cb32)
>     #3 0x55a0464a0f6f in qemu_rdma_data_init /mnt/sdb/qemu/migration/rdma.c:2647
>     #4 0x55a0464b0e76 in rdma_start_incoming_migration /mnt/sdb/qemu/migration/rdma.c:4020
>     #5 0x55a0463f898a in qemu_start_incoming_migration /mnt/sdb/qemu/migration/migration.c:365
>     #6 0x55a0458c75d3 in qemu_init /mnt/sdb/qemu/softmmu/vl.c:4438
>     #7 0x55a046a3d811 in main /mnt/sdb/qemu/softmmu/main.c:48
>     #8 0x7fb7a8417872 in __libc_start_main (/lib64/libc.so.6+0x23872)
>     #9 0x55a04536b26d in _start (/mnt/sdb/qemu/build/x86_64-softmmu/qemu-system-x86_64+0x286926d)
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
>  migration/rdma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index f61587891b..967fda5b0c 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4056,6 +4056,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>      return;
>  err:
>      error_propagate(errp, local_err);
> +    g_free(rdma->host);
>      g_free(rdma);
>      g_free(rdma_return_path);
>  }
> 

