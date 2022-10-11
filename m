Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB185FAA3A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 03:43:00 +0200 (CEST)
Received: from localhost ([::1]:50426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi4IN-0005Om-7F
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 21:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liulongfang@huawei.com>)
 id 1oi4HD-000412-On
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 21:41:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liulongfang@huawei.com>)
 id 1oi4HA-00039r-Ee
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 21:41:47 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mmdfc3R45zHv1n;
 Tue, 11 Oct 2022 09:36:24 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 09:41:04 +0800
Received: from [10.67.103.158] (10.67.103.158) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 09:41:03 +0800
Subject: Re: [PATCH v2 09/11] vfio/migration: Reset device if setting recover
 state fails
To: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>, Cornelia Huck
 <cohuck@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-10-avihaih@nvidia.com>
Message-ID: <6e83765a-cbae-781f-5bd0-b7a34c477740@huawei.com>
Date: Tue, 11 Oct 2022 09:41:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20220530170739.19072-10-avihaih@nvidia.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.158]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=liulongfang@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  liulongfang <liulongfang@huawei.com>
From:  liulongfang via <qemu-devel@nongnu.org>

On 2022/5/31 1:07, Avihai Horon wrote:
> If vfio_migration_set_state() fails to set the device in the requested
> state it tries to put it in a recover state. If setting the device in
> the recover state fails as well, hw_error is triggered and the VM is
> aborted.
> 
> To improve user experience and avoid VM data loss, reset the device with
> VFIO_RESET_DEVICE instead of aborting the VM.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/migration.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 852759e6ca..6c34502611 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -89,8 +89,16 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
>          /* Try to put the device in some good state */
>          mig_state->device_state = recover_state;
>          if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> -            hw_error("%s: Device in error state, can't recover",
> -                     vbasedev->name);
> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
> +                hw_error("%s: Device in error state, can't recover",
> +                         vbasedev->name);
> +            }
> +
> +            error_report(
> +                "%s: Device was reset due to failure in changing device state to recover state %s",
> +                vbasedev->name, mig_state_to_str(recover_state));
> +
> +            return -1;
>          }
> 

When I used the qemu 7.1.50 version compiled with this set of patches,
I found that after the migration failed due to disconnecting the destination VM
during the live migration process, when I exited the source qemu, the
following error would appear:

[100337.287047] BUG: Bad page state in process qemu-system-aar  pfn:82199518
[100337.295815] page:00000000356de4da refcount:-2 mapcount:0 mapping:00000000000
00000 index:0x0 pfn:0x82199518
[100337.306403] flags: 0xbfff80000000000(node=0|zone=2|lastcpupid=0x7fff)
[100337.314091] raw: 0bfff80000000000 dead000000000100 dead000000000122 00000000
00000000
[100337.322589] raw: 0000000000000000 0000000000000000 fffffffeffffffff 00000000
00000000
[100337.330630] page dumped because: nonzero _refcount
[100337.335840] Modules linked in: hisi_acc_vfio_pci hisi_sec2 hisi_zip hisi_hpr
e hisi_qm uacce vfio_iommu_type1 vfio_pci vfio_pci_core vfio_virqfd vfio pv680_m
ii(O) [last unloaded: hisi_sec2]
[100337.354564] CPU: 1 PID: 786 Comm: qemu-system-aar Tainted: G    B      O
   6.0.0-rc4+ #1
[100337.377378] Call trace:
[100337.380382]  dump_backtrace.part.0+0xc4/0xd0
[100337.385791]  show_stack+0x24/0x40
[100337.389478]  dump_stack_lvl+0x68/0x84
[100337.394155]  dump_stack+0x18/0x34
[100337.398006]  bad_page+0xf0/0x120
[100337.401796]  check_free_page_bad+0x84/0x90
[100337.406404]  free_pcppages_bulk+0x1bc/0x2b0
[100337.411126]  free_unref_page_commit+0x120/0x15c
[100337.416935]  free_unref_page+0x15c/0x254
[100337.421436]  free_compound_page+0x6c/0x100
[100337.425868]  free_transhuge_page+0xd4/0x140
[100337.430535]  destroy_large_folio+0x30/0x40
[100337.434953]  release_pages+0x1bc/0x4d0
[100337.439268]  free_pages_and_swap_cache+0x68/0x80
[100337.444224]  tlb_batch_pages_flush+0x5c/0x94
[100337.448976]  tlb_flush_mmu+0x4c/0xd4
[100337.453062]  unmap_page_range+0x8d0/0xbd0
[100337.457432]  unmap_single_vma+0x90/0x12c
[100337.461673]  unmap_vmas+0x84/0xfc
[100337.465354]  exit_mmap+0x88/0x1b0
[100337.469008]  __mmput+0x48/0x134
[100337.472637]  mmput+0x44/0x50
[100337.475857]  do_exit+0x2b8/0x970
[100337.479641]  do_group_exit+0x40/0xac
[100337.484079]  get_signal+0x8c0/0x934
[100337.488215]  do_notify_resume+0x1d0/0x1570
[100337.492795]  el0_svc+0xa8/0xc0
[100337.496452]  el0t_64_sync_handler+0x1ac/0x1b0
[100337.501187]  el0t_64_sync+0x19c/0x1a0

Can anyone see what is causing this error?

>          error_report("%s: Failed changing device state to %s", vbasedev->name,
> 
Thanks
Longfang.

