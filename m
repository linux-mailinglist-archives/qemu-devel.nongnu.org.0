Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F92C12FD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:25:10 +0100 (CET)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGWT-0003XC-2L
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khGUl-0002gj-CO
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:23:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khGUi-0003rV-Bz
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606155799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0d0fmm6zslM+YEMFXN1M+b5RmhtwNOvZ31X6Fwc4Hw=;
 b=YnqBJMQ2F47pFg/N5ww/krjdtrEQK3+jvZeWPtTCnSAe2IV35Gg9Qm88gr7zOj4MLX8UkO
 dIOU0UdOHX6yVxIgEztx4Sy0dLRob1by7mrtwXR6TSalzXHmS3kKbrxhas6/gn4DAbq6Pf
 RmifuLTn94PXoEzhYoCmTI+I1YM3qH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-YGaiAsyLPJygZ_U0sb5V2Q-1; Mon, 23 Nov 2020 13:23:15 -0500
X-MC-Unique: YGaiAsyLPJygZ_U0sb5V2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5435A1009446;
 Mon, 23 Nov 2020 18:23:13 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92D813470;
 Mon, 23 Nov 2020 18:23:12 +0000 (UTC)
Date: Mon, 23 Nov 2020 11:23:12 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v2 1/1] vfio: Change default dirty pages tracking
 behavior during migration
Message-ID: <20201123112312.2eaf4bff@w520.home>
In-Reply-To: <1606141399-22677-1-git-send-email-kwankhede@nvidia.com>
References: <1606141399-22677-1-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mcrossley@nvidia.com, cohuck@redhat.com, cjia@nvidia.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 19:53:19 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> By default dirty pages tracking is enabled during iterative phase
> (pre-copy phase).
> Added per device opt-out option 'pre-copy-dirty-page-tracking' to
> disable dirty pages tracking during iterative phase. If the option
> 'pre-copy-dirty-page-tracking=off' is set for any VFIO device, dirty
> pages tracking during iterative phase will be disabled.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/common.c              | 11 +++++++----
>  hw/vfio/pci.c                 |  3 +++
>  include/hw/vfio/vfio-common.h |  1 +
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c1fdbf17f2e6..6ff1daa763f8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -311,7 +311,7 @@ bool vfio_mig_active(void)
>      return true;
>  }
>  
> -static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
> +static bool vfio_devices_all_saving(VFIOContainer *container)
>  {
>      VFIOGroup *group;
>      VFIODevice *vbasedev;
> @@ -329,8 +329,11 @@ static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
> -                !(migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
> +                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> +                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +                        return false;
> +                }
>                  continue;
>              } else {
>                  return false;
> @@ -1125,7 +1128,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>          return;
>      }
>  
> -    if (vfio_devices_all_stopped_and_saving(container)) {
> +    if (vfio_devices_all_saving(container)) {
>          vfio_sync_dirty_bitmap(container, section);
>      }
>  }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 58c0ce8971e3..5601df6d6241 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3182,6 +3182,9 @@ static void vfio_instance_init(Object *obj)
>  static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
>      DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> +    DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
> +                            vbasedev.pre_copy_dirty_page_tracking,
> +                            ON_OFF_AUTO_ON),
>      DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
>                              display, ON_OFF_AUTO_OFF),
>      DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index baeb4dcff102..267cf854bbba 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -129,6 +129,7 @@ typedef struct VFIODevice {
>      unsigned int flags;
>      VFIOMigration *migration;
>      Error *migration_blocker;
> +    OnOffAuto pre_copy_dirty_page_tracking;
>  } VFIODevice;
>  
>  struct VFIODeviceOps {

I applied this and sent a pull request because I think it's important
that we set the default correctly, but why use an OnOffAuto rather than
a boolean?  Is the intent that auto might make device specific
decisions?  Thanks,

Alex


