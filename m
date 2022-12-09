Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A9648803
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:55:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hZo-0003Ka-8r; Fri, 09 Dec 2022 12:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3hZn-0003KR-8u
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:54:23 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1p3hZl-0005Fp-N9
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:54:22 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1p3hZj-007Oww-1I;
 Fri, 09 Dec 2022 17:54:19 +0000
Date: Fri, 9 Dec 2022 17:54:19 +0000
From: John Levon <levon@movementarian.org>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 16/24] vfio-user: proxy container connect/disconnect
Message-ID: <Y5N2S4hIeIBowYQJ@movementarian.org>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <61dd08e18705b335f8cd02f69698aa8248ebaf96.1667542066.git.john.g.johnson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61dd08e18705b335f8cd02f69698aa8248ebaf96.1667542066.git.john.g.johnson@oracle.com>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 08, 2022 at 03:13:38PM -0800, John Johnson wrote:

> +    /*
> +     * The proxy uses a SW IOMMU in lieu of the HW one
> +     * used in the ioctl() version.  Mascarade as TYPE1
> +     * for maximum capatibility
> +     */

capability

> @@ -3692,12 +3698,18 @@ static void vfio_user_instance_finalize(Object *obj)
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>      VFIODevice *vbasedev = &vdev->vbasedev;
> +    VFIOGroup *group = vbasedev->group;
> +
> +    vfio_bars_finalize(vdev);
> +    g_free(vdev->emulated_config_bits);
> +    g_free(vdev->rom);

These changes seem unrelated to this particular patch?

> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 793ca94..312ef9c 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -94,6 +94,7 @@ typedef struct VFIOContainer {
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
>      unsigned int dma_max_mappings;
> +    VFIOProxy *proxy;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>      QLIST_HEAD(, VFIOGroup) group_list;
> @@ -282,6 +283,11 @@ void vfio_put_group(VFIOGroup *group);
>  int vfio_get_device(VFIOGroup *group, const char *name,
>                      VFIODevice *vbasedev, Error **errp);
>  
> +int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp);
> +VFIOGroup *vfio_user_get_group(VFIOProxy *proxy, AddressSpace *as,
> +                               Error **errp);
> +void vfio_user_put_group(VFIOGroup *group);
> +

Why aren't these in user.h?

regards
john

