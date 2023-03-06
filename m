Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E86ACEC9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 21:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZH0g-0003dO-Fk; Mon, 06 Mar 2023 15:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZH0c-0003cZ-EI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZH0a-0002GV-DY
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678132831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/s93XBm7jSXUIWA3LfSbX2J93cbsVeZsRcB7Kwrxs7I=;
 b=Xrj68IX8ET0WD440Qc0nTG3VoXUxQfcIWDDSOe4ZqN/t3uKZgoOYnVdOEFBNxQ85ae6tyB
 lCXckowZIcsTUfIWQ0RK+d0FOYyuiXZG8GGs/BcHl/ABb1UdjXj1f6PpYJntdR9GpDvcHA
 W3HgZ8pGIacoFVInx+/Qg/pdq/tI8Zg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-OAjtF7RbNZyEo8XX-BmtmQ-1; Mon, 06 Mar 2023 15:00:27 -0500
X-MC-Unique: OAjtF7RbNZyEo8XX-BmtmQ-1
Received: by mail-il1-f197.google.com with SMTP id
 m7-20020a924b07000000b003170cef3f12so6017484ilg.22
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 12:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678132827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/s93XBm7jSXUIWA3LfSbX2J93cbsVeZsRcB7Kwrxs7I=;
 b=oE+GLytcbmpDFSudYPDhH588h4r/49Famy5lpLTjh2R1waRVLOEaOxtshMjL+difeb
 +119RKwUOx5G0LvIra5bnrQXKCPQlGwfvhoMwioC+7qD92n07607zc9D4bpUnun59We+
 SZbZtbkOijP7Tlyulo/NDpuwP6xoMmyiDN0cpsp9amp5UNbUIt1zgw7EVOJD8Rd111Fz
 F8uOLsQYHKAPscj7ozWD0mAzKulaTF9wEGSulMwBt4RNbk9USjkGvGQtYqUS8YDVatWr
 YNcOmfaT+7gbCodmAbzya+zDqxsUrJkwxWbZbtf6aRC0vO9dZD4nRvDEy2et6hyG0T5z
 P93w==
X-Gm-Message-State: AO0yUKUE8asMLcZNUuhPxRdhs5pley+el4LOJ3YqD3tOnjKk5M4djEOS
 TJdrEWanuUpGhGJrRZJZE7MebYM+dslHM+nQzpnGXKDNTm8SxzYYVVvPZkqalyh2Wy0aIB88JR/
 SjATnJ8T5Y8QNiP4=
X-Received: by 2002:a6b:f303:0:b0:74c:d83e:b946 with SMTP id
 m3-20020a6bf303000000b0074cd83eb946mr8182902ioh.19.1678132827154; 
 Mon, 06 Mar 2023 12:00:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/9oPrpKGqKnl1t1aeSjyy7BCpEtj6WA00agvy2ErF/B6DeSJC3/SOu767Ce8N+j7dkOZGpew==
X-Received: by 2002:a6b:f303:0:b0:74c:d83e:b946 with SMTP id
 m3-20020a6bf303000000b0074cd83eb946mr8182888ioh.19.1678132826833; 
 Mon, 06 Mar 2023 12:00:26 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e15-20020a92a00f000000b00316fcbe5544sm3058225ili.29.2023.03.06.12.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:00:26 -0800 (PST)
Date: Mon, 6 Mar 2023 13:00:25 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: Re: [PATCH v3 08/13] vfio/common: Add device dirty page tracking
 start/stop
Message-ID: <20230306130025.4a7ea606.alex.williamson@redhat.com>
In-Reply-To: <6b716cb6-2b75-bf6e-bb8b-907fd17e8040@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-9-joao.m.martins@oracle.com>
 <20230306114228.722419ea.alex.williamson@redhat.com>
 <6b716cb6-2b75-bf6e-bb8b-907fd17e8040@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, 6 Mar 2023 19:39:15 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 06/03/2023 18:42, Alex Williamson wrote:
> > On Sat,  4 Mar 2023 01:43:38 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> Add device dirty page tracking start/stop functionality. This uses the
> >> device DMA logging uAPI to start and stop dirty page tracking by device.
> >>
> >> Device dirty page tracking is used only if all devices within a
> >> container support device dirty page tracking.
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/vfio/common.c              | 166 +++++++++++++++++++++++++++++++++-
> >>  hw/vfio/trace-events          |   1 +
> >>  include/hw/vfio/vfio-common.h |   2 +
> >>  3 files changed, 166 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index d84e5fd86bb4..aa0df0604704 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -453,6 +453,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
> >>      return true;
> >>  }
> >>  
> >> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
> >> +{
> >> +    VFIOGroup *group;
> >> +    VFIODevice *vbasedev;
> >> +
> >> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> >> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> >> +            if (!vbasedev->dirty_pages_supported) {
> >> +                return false;
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return true;
> >> +}
> >> +
> >>  /*
> >>   * Check if all VFIO devices are running and migration is active, which is
> >>   * essentially equivalent to the migration being in pre-copy phase.
> >> @@ -1395,15 +1411,152 @@ static void vfio_dirty_tracking_init(VFIOContainer *container)
> >>      qemu_mutex_destroy(&container->tracking_mutex);
> >>  }
> >>  
> >> +static int vfio_devices_dma_logging_set(VFIOContainer *container,
> >> +                                        struct vfio_device_feature *feature)
> >> +{
> >> +    bool status = (feature->flags & VFIO_DEVICE_FEATURE_MASK) ==
> >> +                  VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> >> +    VFIODevice *vbasedev;
> >> +    VFIOGroup *group;
> >> +    int ret = 0;
> >> +
> >> +    QLIST_FOREACH(group, &container->group_list, container_next) {
> >> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> >> +            if (vbasedev->dirty_tracking == status) {
> >> +                continue;
> >> +            }
> >> +
> >> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
> >> +            if (ret) {
> >> +                ret = -errno;
> >> +                error_report("%s: Failed to set DMA logging %s, err %d (%s)",
> >> +                             vbasedev->name, status ? "start" : "stop", ret,
> >> +                             strerror(errno));
> >> +                goto out;
> >> +            }  
> > 
> > Exiting and returning an error on the first failure when starting dirty
> > tracking makes sense.  Does that behavior still make sense for the stop
> > path?  Maybe since we only support a single device it doesn't really
> > matter, but this needs to be revisited for multiple devices.  Thanks,
> >   
> 
> How about I test for @status and exit earlier based on that?
> (maybe variable should be renamed too) e.g.
> 
> if (ret) {
>   ret = -errno;
>   error_report("%s: Failed to set DMA logging %s, err %d (%s)",
>                vbasedev->name, status ? "start" : "stop", ret,
>                strerror(errno))
>   if (status) {
>       goto out;
>   }
> }

Yep, exit on first error enabling, continue on disabling makes more
sense, but then we need to look at what return code makes sense for the
teardown.  TBH, a teardown function would typically return void, so
it's possible we'd be better off not using this for both.  Thanks,

Alex

PS - no further original comments on v3 from me.

> >> +            vbasedev->dirty_tracking = status;
> >> +        }
> >> +    }
> >> +
> >> +out:
> >> +    return ret;
> >> +}
> >> +
> >> +static int vfio_devices_dma_logging_stop(VFIOContainer *container)
> >> +{
> >> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
> >> +                              sizeof(uint64_t))] = {};
> >> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> >> +
> >> +    feature->argsz = sizeof(buf);
> >> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
> >> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
> >> +
> >> +    return vfio_devices_dma_logging_set(container, feature);
> >> +}
> >> +
> >> +static struct vfio_device_feature *
> >> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
> >> +{
> >> +    struct vfio_device_feature *feature;
> >> +    size_t feature_size;
> >> +    struct vfio_device_feature_dma_logging_control *control;
> >> +    struct vfio_device_feature_dma_logging_range *ranges;
> >> +    VFIODirtyTrackingRange *tracking = &container->tracking_range;
> >> +
> >> +    feature_size = sizeof(struct vfio_device_feature) +
> >> +                   sizeof(struct vfio_device_feature_dma_logging_control);
> >> +    feature = g_try_malloc0(feature_size);
> >> +    if (!feature) {
> >> +        errno = ENOMEM;
> >> +        return NULL;
> >> +    }
> >> +    feature->argsz = feature_size;
> >> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
> >> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> >> +
> >> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
> >> +    control->page_size = qemu_real_host_page_size();
> >> +
> >> +    /*
> >> +     * DMA logging uAPI guarantees to support at least a number of ranges that
> >> +     * fits into a single host kernel base page.
> >> +     */
> >> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
> >> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
> >> +                        control->num_ranges);
> >> +    if (!ranges) {
> >> +        g_free(feature);
> >> +        errno = ENOMEM;
> >> +
> >> +        return NULL;
> >> +    }
> >> +
> >> +    control->ranges = (__aligned_u64)ranges;
> >> +    if (tracking->max32) {
> >> +        ranges->iova = tracking->min32;
> >> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
> >> +        ranges++;
> >> +    }
> >> +    if (tracking->max64) {
> >> +        ranges->iova = tracking->min64;
> >> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
> >> +    }
> >> +
> >> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
> >> +                                           tracking->min32, tracking->max32,
> >> +                                           tracking->min64, tracking->max64);
> >> +
> >> +    return feature;
> >> +}
> >> +
> >> +static void vfio_device_feature_dma_logging_start_destroy(
> >> +    struct vfio_device_feature *feature)
> >> +{
> >> +    struct vfio_device_feature_dma_logging_control *control =
> >> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
> >> +    struct vfio_device_feature_dma_logging_range *ranges =
> >> +        (struct vfio_device_feature_dma_logging_range *)control->ranges;
> >> +
> >> +    g_free(ranges);
> >> +    g_free(feature);
> >> +}
> >> +
> >> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
> >> +{
> >> +    struct vfio_device_feature *feature;
> >> +    int ret = 0;
> >> +
> >> +    vfio_dirty_tracking_init(container);
> >> +    feature = vfio_device_feature_dma_logging_start_create(container);
> >> +    if (!feature) {
> >> +        return -errno;
> >> +    }
> >> +
> >> +    ret = vfio_devices_dma_logging_set(container, feature);
> >> +    if (ret) {
> >> +        vfio_devices_dma_logging_stop(container);
> >> +    }
> >> +
> >> +    vfio_device_feature_dma_logging_start_destroy(feature);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>  static void vfio_listener_log_global_start(MemoryListener *listener)
> >>  {
> >>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> >>      int ret;
> >>  
> >> -    vfio_dirty_tracking_init(container);
> >> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> >> +        ret = vfio_devices_dma_logging_start(container);
> >> +    } else {
> >> +        ret = vfio_set_dirty_page_tracking(container, true);
> >> +    }
> >>  
> >> -    ret = vfio_set_dirty_page_tracking(container, true);
> >>      if (ret) {
> >> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
> >> +                     ret, strerror(-ret));
> >>          vfio_set_migration_error(ret);
> >>      }
> >>  }
> >> @@ -1413,8 +1566,15 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
> >>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> >>      int ret;
> >>  
> >> -    ret = vfio_set_dirty_page_tracking(container, false);
> >> +    if (vfio_devices_all_device_dirty_tracking(container)) {
> >> +        ret = vfio_devices_dma_logging_stop(container);
> >> +    } else {
> >> +        ret = vfio_set_dirty_page_tracking(container, false);
> >> +    }
> >> +
> >>      if (ret) {
> >> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
> >> +                     ret, strerror(-ret));
> >>          vfio_set_migration_error(ret);
> >>      }
> >>  }
> >> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> >> index d97a6de17921..7a7e0cfe5b23 100644
> >> --- a/hw/vfio/trace-events
> >> +++ b/hw/vfio/trace-events
> >> @@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
> >>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
> >>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
> >>  vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
> >> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
> >>  vfio_disconnect_container(int fd) "close container->fd=%d"
> >>  vfio_put_group(int fd) "close group->fd=%d"
> >>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> >> index 96791add2719..1cbbccd91e11 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -154,6 +154,8 @@ typedef struct VFIODevice {
> >>      VFIOMigration *migration;
> >>      Error *migration_blocker;
> >>      OnOffAuto pre_copy_dirty_page_tracking;
> >> +    bool dirty_pages_supported;
> >> +    bool dirty_tracking;
> >>  } VFIODevice;
> >>  
> >>  struct VFIODeviceOps {  
> >   
> 


