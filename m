Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F31DD270
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 17:56:00 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbnY7-0005hS-BC
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 11:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jbnVf-00039D-Mt
 for qemu-devel@nongnu.org; Thu, 21 May 2020 11:53:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50517
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jbnVd-0002lz-Vo
 for qemu-devel@nongnu.org; Thu, 21 May 2020 11:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590076404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GTysdw6w8yXj+o5SPKnl5d+bCoP94EqSPn+ZTpXwyNg=;
 b=b++Qe2WvV7pW48pLXLINU/2hpgHRz0kW74d5hyUsgCDLat0abUrUNQNzZKYIhi6xwQz2pJ
 dOVRBmeIfJQ2A2TE45NL0ourxQALhOulLnoUKQI3+3k29wHfKftz4BR+kOJFIsrQn5JWew
 r3B+i1+8DfMsPff19Hlv1Dr5mPCCk7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-XeDgx7CFM9KmmFkkHCZNvQ-1; Thu, 21 May 2020 11:53:22 -0400
X-MC-Unique: XeDgx7CFM9KmmFkkHCZNvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB6858005AA;
 Thu, 21 May 2020 15:53:18 +0000 (UTC)
Received: from work-vm (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6816EA38;
 Thu, 21 May 2020 15:53:07 +0000 (UTC)
Date: Thu, 21 May 2020 16:53:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH QEMU v23 10/18] vfio: Add load state functions to
 SaveVMHandlers
Message-ID: <20200521155305.GI2752@work-vm>
References: <1589999088-31477-1-git-send-email-kwankhede@nvidia.com>
 <1589999088-31477-11-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1589999088-31477-11-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, cjia@nvidia.com, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, alex.williamson@redhat.com, changpeng.liu@intel.com,
 eskultet@redhat.com, Ken.Xue@amd.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kirti Wankhede (kwankhede@nvidia.com) wrote:
> Sequence  during _RESUMING device state:
> While data for this device is available, repeat below steps:
> a. read data_offset from where user application should write data.
> b. write data of data_size to migration region from data_offset.
> c. write data_size which indicates vendor driver that data is written in
>    staging buffer.
> 
> For user, data is opaque. User should write data in the same order as
> received.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/migration.c  | 180 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events |   3 +
>  2 files changed, 183 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index d90bd2296afd..b9bbe38e539c 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -270,6 +270,33 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>  
> +static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    uint64_t data;
> +
> +    if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
> +        int ret;
> +
> +        ret = vbasedev->ops->vfio_load_config(vbasedev, f);
> +        if (ret) {
> +            error_report("%s: Failed to load device config space",
> +                         vbasedev->name);
> +            return ret;
> +        }
> +    }
> +
> +    data = qemu_get_be64(f);
> +    if (data != VFIO_MIG_FLAG_END_OF_STATE) {
> +        error_report("%s: Failed loading device config space, "
> +                     "end flag incorrect 0x%"PRIx64, vbasedev->name, data);
> +        return -EINVAL;
> +    }
> +
> +    trace_vfio_load_device_config_state(vbasedev->name);
> +    return qemu_file_get_error(f);
> +}
> +
>  /* ---------------------------------------------------------------------- */
>  
>  static int vfio_save_setup(QEMUFile *f, void *opaque)
> @@ -439,12 +466,165 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>      return ret;
>  }
>  
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret = 0;
> +
> +    if (migration->region.mmaps) {
> +        ret = vfio_region_mmap(&migration->region);
> +        if (ret) {
> +            error_report("%s: Failed to mmap VFIO migration region %d: %s",
> +                         vbasedev->name, migration->region.nr,
> +                         strerror(-ret));
> +            return ret;
> +        }
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
> +                                   VFIO_DEVICE_STATE_RESUMING);
> +    if (ret) {
> +        error_report("%s: Failed to set state RESUMING", vbasedev->name);
> +    }
> +    return ret;
> +}
> +
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    vfio_save_cleanup(opaque);
> +    return 0;
> +}
> +
> +static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret = 0;
> +    uint64_t data, data_size;
> +
> +    data = qemu_get_be64(f);
> +    while (data != VFIO_MIG_FLAG_END_OF_STATE) {
> +
> +        trace_vfio_load_state(vbasedev->name, data);
> +
> +        switch (data) {
> +        case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
> +        {
> +            ret = vfio_load_device_config_state(f, opaque);
> +            if (ret) {
> +                return ret;
> +            }
> +            break;
> +        }
> +        case VFIO_MIG_FLAG_DEV_SETUP_STATE:
> +        {
> +            data = qemu_get_be64(f);
> +            if (data == VFIO_MIG_FLAG_END_OF_STATE) {
> +                return ret;
> +            } else {
> +                error_report("%s: SETUP STATE: EOS not found 0x%"PRIx64,
> +                             vbasedev->name, data);
> +                return -EINVAL;
> +            }
> +            break;
> +        }
> +        case VFIO_MIG_FLAG_DEV_DATA_STATE:
> +        {
> +            VFIORegion *region = &migration->region;
> +            void *buf = NULL;
> +            bool buffer_mmaped = false;
> +            uint64_t data_offset = 0;
> +
> +            data_size = qemu_get_be64(f);
> +            if (data_size == 0) {
> +                break;
> +            }
> +
> +            ret = pread(vbasedev->fd, &data_offset, sizeof(data_offset),
> +                        region->fd_offset +
> +                        offsetof(struct vfio_device_migration_info,
> +                        data_offset));
> +            if (ret != sizeof(data_offset)) {
> +                error_report("%s:Failed to get migration buffer data offset %d",
> +                             vbasedev->name, ret);
> +                return -EINVAL;
> +            }
> +
> +            if (region->mmaps) {
> +                buf = find_data_region(region, data_offset, data_size);
> +            }
> +
> +            buffer_mmaped = (buf != NULL) ? true : false;
> +
> +            if (!buffer_mmaped) {
> +                buf = g_try_malloc0(data_size);
> +                if (!buf) {
> +                    error_report("%s: Error allocating buffer ", __func__);
> +                    return -ENOMEM;
> +                }
> +            }
> +
> +            qemu_get_buffer(f, buf, data_size);
> +
> +            if (!buffer_mmaped) {
> +                ret = pwrite(vbasedev->fd, buf, data_size,
> +                             region->fd_offset + data_offset);
> +                g_free(buf);
> +
> +                if (ret != data_size) {
> +                    error_report("%s: Failed to set migration buffer %d",
> +                                 vbasedev->name, ret);
> +                    return -EINVAL;
> +                }
> +            }
> +
> +            ret = pwrite(vbasedev->fd, &data_size, sizeof(data_size),
> +                         region->fd_offset +
> +                       offsetof(struct vfio_device_migration_info, data_size));
> +            if (ret != sizeof(data_size)) {
> +                error_report("%s: Failed to set migration buffer data size %d",
> +                             vbasedev->name, ret);
> +                if (!buffer_mmaped) {
> +                    g_free(buf);
> +                }
> +                return -EINVAL;
> +            }
> +
> +            trace_vfio_load_state_device_data(vbasedev->name, data_offset,
> +                                              data_size);
> +            break;
> +        }
> +
> +        default:
> +            error_report("%s: Unknown tag 0x%"PRIx64, vbasedev->name, data);
> +            return -EINVAL;
> +        }
> +
> +        ret = qemu_file_get_error(f);
> +        if (ret) {
> +            return ret;
> +        }

You can probably omit this check and just do the one below; other than
that:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +        data = qemu_get_be64(f);
> +        ret = qemu_file_get_error(f);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>  static SaveVMHandlers savevm_vfio_handlers = {
>      .save_setup = vfio_save_setup,
>      .save_cleanup = vfio_save_cleanup,
>      .save_live_pending = vfio_save_pending,
>      .save_live_iterate = vfio_save_iterate,
>      .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .load_setup = vfio_load_setup,
> +    .load_cleanup = vfio_load_cleanup,
> +    .load_state = vfio_load_state,
>  };
>  
>  /* ---------------------------------------------------------------------- */
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 9a1c5e17d97f..4a4bd3ba9a2a 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -157,3 +157,6 @@ vfio_save_device_config_state(const char *name) " (%s)"
>  vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
>  vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
>  vfio_save_complete_precopy(const char *name) " (%s)"
> +vfio_load_device_config_state(const char *name) " (%s)"
> +vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> -- 
> 2.7.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


