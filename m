Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCE52C0E31
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:57:13 +0100 (CET)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDHD-0006mr-MD
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1khDF1-0005Ih-1o
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:54:55 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1khDEy-0005c0-Qq
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:54:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbbcd3c0000>; Mon, 23 Nov 2020 06:54:52 -0800
Received: from [10.40.101.61] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 14:54:48 +0000
Subject: Re: [v2 1/1] vfio: Change default dirty pages tracking behavior
 during migration
To: <alex.williamson@redhat.com>, <cohuck@redhat.com>, <dgilbert@redhat.com>, 
 <cjia@nvidia.com>, <mcrossley@nvidia.com>
References: <1606140531-8362-1-git-send-email-kwankhede@nvidia.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <48f7b22c-f3f9-929f-0cde-cc08768c2f71@nvidia.com>
Date: Mon, 23 Nov 2020 20:24:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1606140531-8362-1-git-send-email-kwankhede@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606143292; bh=KKyxOdzsrwo93Q0vGGgYv1kYCZ5qjNhmn0c9OYxkAaE=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=PNBRuv0oVLmSbwQbAns50U8tClfBJh06IJATLUULLs5pgDIfAUhir2kgNmiMmnCg+
 IfkV2r44IX/vvGDbpTE2WAK4Y/AbzzlDgg27l+la9RISIoPdNz4luG40b2KfP/1hZ0
 tifoXk40WjrhPviQHfhgnEF9vIxUntcew/GcHFT39QnRQ4OrCXlPt/8iUtN2yUkP6Y
 UZiFl2+tPZRThDRxzQyGpMrOpoGBhZrHNFai5POrcYWweMAxwGfYPWi27O4pC4gY9e
 fJfetBFa4pKW9ECPZHqDC9tj3masSaBfBQ/a83O4zgpwaWNoxS+5pnsTDObNANiwcf
 8Z+hRofzIZ3gA==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for spam, resending it again with 'PATCH'in subject.

Kirti.

On 11/23/2020 7:38 PM, Kirti Wankhede wrote:
> By default dirty pages tracking is enabled during iterative phase
> (pre-copy phase).
> Added per device opt-out option 'pre-copy-dirty-page-tracking' to
> disable dirty pages tracking during iterative phase. If the option
> 'pre-copy-dirty-page-tracking=off' is set for any VFIO device, dirty
> pages tracking during iterative phase will be disabled.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>   hw/vfio/common.c              | 11 +++++++----
>   hw/vfio/pci.c                 |  3 +++
>   include/hw/vfio/vfio-common.h |  1 +
>   3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c1fdbf17f2e6..6ff1daa763f8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -311,7 +311,7 @@ bool vfio_mig_active(void)
>       return true;
>   }
>   
> -static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
> +static bool vfio_devices_all_saving(VFIOContainer *container)
>   {
>       VFIOGroup *group;
>       VFIODevice *vbasedev;
> @@ -329,8 +329,11 @@ static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
> -                !(migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
> +                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> +                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +                        return false;
> +                }
>                   continue;
>               } else {
>                   return false;
> @@ -1125,7 +1128,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>           return;
>       }
>   
> -    if (vfio_devices_all_stopped_and_saving(container)) {
> +    if (vfio_devices_all_saving(container)) {
>           vfio_sync_dirty_bitmap(container, section);
>       }
>   }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 58c0ce8971e3..5601df6d6241 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3182,6 +3182,9 @@ static void vfio_instance_init(Object *obj)
>   static Property vfio_pci_dev_properties[] = {
>       DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
>       DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> +    DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
> +                            vbasedev.pre_copy_dirty_page_tracking,
> +                            ON_OFF_AUTO_ON),
>       DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
>                               display, ON_OFF_AUTO_OFF),
>       DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index baeb4dcff102..267cf854bbba 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -129,6 +129,7 @@ typedef struct VFIODevice {
>       unsigned int flags;
>       VFIOMigration *migration;
>       Error *migration_blocker;
> +    OnOffAuto pre_copy_dirty_page_tracking;
>   } VFIODevice;
>   
>   struct VFIODeviceOps {
> 

