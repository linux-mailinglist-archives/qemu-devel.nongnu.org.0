Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E12B9604
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:21:24 +0100 (CET)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflkQ-0000mU-Ls
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kflj0-0000FF-0h
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kfliw-00004s-IW
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605799186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELSR5JJGHL1fJmjKmqA2H1va3HtuRL4pxHJ/0P+2NcQ=;
 b=f3GmA0mW5HGOZXXR1cTCX2xnCD4jjaG3hrZKcF3+gEvACX9fnMQOlxm4nItpOJnon8Ejzm
 /XTCHmRZ1s2xjQd8eHfa79GvEyXQvl7InMZpkYm+aaaST/QES0rR2As8tm0QgxmzlS0TWE
 zV5up8bSMntuVOthay6MqIXM98DrmxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-U5uoV-PMPXW2-QLX2QtNvQ-1; Thu, 19 Nov 2020 10:19:44 -0500
X-MC-Unique: U5uoV-PMPXW2-QLX2QtNvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 640DE107ACE8;
 Thu, 19 Nov 2020 15:19:42 +0000 (UTC)
Received: from x1.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D677C63B8C;
 Thu, 19 Nov 2020 15:19:41 +0000 (UTC)
Date: Thu, 19 Nov 2020 08:19:41 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 1/1] vfio: Change default dirty pages tracking behavior
 during migration
Message-ID: <20201119081941.3f861f96@x1.home>
In-Reply-To: <1605759481-23726-1-git-send-email-kwankhede@nvidia.com>
References: <1605759481-23726-1-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Thu, 19 Nov 2020 09:48:01 +0530
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
> index 58c0ce8971e3..5bea4b3e71f5 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3182,6 +3182,9 @@ static void vfio_instance_init(Object *obj)
>  static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
>      DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> +    DEFINE_PROP_ON_OFF_AUTO("pre-copy-dirty-page-tracking", VFIOPCIDevice,
> +                            vbasedev.pre_copy_dirty_page_tracking,
> +                            ON_OFF_AUTO_ON),


Shouldn't this be an experimental option, ie.
x-pre-copy-dirty-page-tracking?  We can always make it a supported
option at a later time, but creating it as a supported option and later
changing our mind would require a deprecation process.  As I see it,
this option limits the device's ability to fully participate in
migration, leading to potentially erroneous downtime estimates and
should therefore, at best, make it an experimental option.  We also
have no data yet as to scenarios and configurations when this option
might be recommended.  Thanks,

Alex

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


