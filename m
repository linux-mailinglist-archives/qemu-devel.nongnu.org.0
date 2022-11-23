Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49D63696E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 20:01:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxuye-0003Mv-3Y; Wed, 23 Nov 2022 14:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxuya-0003LJ-Ja
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 14:00:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxuyW-00072K-Ua
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 14:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669229999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JVgTRpAudX7cVh9NpI/uwl3kvPsrNt2EVqFFYtahlks=;
 b=ToE6dVcEuWDF6TvldOd3KPAeoRVyfp0OdKst6pEcBJUPJ1Zb7U9+0PleooPFhnNFnnOdki
 xdcLkNgI71kpe43TtyPw3J6o3FnH+jHHX4Lx75YD+PZLfQe8+eta/ScvgtHISUnhvkNaig
 AvD+6MaoLqHnu3mG0i2gnAe2Vc0bWfw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-BBEyHjhtOhWCXpuP2pcwhg-1; Wed, 23 Nov 2022 13:59:57 -0500
X-MC-Unique: BBEyHjhtOhWCXpuP2pcwhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1434956wmk.3
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 10:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVgTRpAudX7cVh9NpI/uwl3kvPsrNt2EVqFFYtahlks=;
 b=fR9SkmRdlE1Re65eijlq7VjtWz2ipMdBZC36md6ZSq1xUMf4Dbn2s5yijIDxfqcNNe
 Npddwqeb2k13kppA9+iwCuIlVAwEt6ITCaQEnmgefFuH4I7lInxBcTgj6m/4VQ++7AsK
 SbkkM7HPNeTzaoiACCpUrp2owMEiMo/Gc04NUKu4W2dQBhq+6CLaKF8VFwB4eAfuaiBM
 Hii3+HFkhjXajGKjXif7gthWW5CT8yZAM8+V+cGTfJpgXdeCDrYNo9JAzUbfwaEE4pc/
 VPBFVafjUr0hwlHR9zxU1aA0ZaPF2/9qEiJagljtjfqp83M8XszNihxS9qOB7Fvn+0aq
 aGLA==
X-Gm-Message-State: ANoB5pm4r1UhelkfMZIU31Pub29TJ7JQ8oaE9FyMhdMyrdoypPsbHUXn
 iJ1izu+eEpUiPNgcnHg+T5BeyffLpjDxW8VtlDv3OuHLD6HuHEX9Bm/pV2LD4LuD7ySm0h5mNVu
 2TXQfZNCHW7gE1nY=
X-Received: by 2002:a5d:4890:0:b0:22a:f91f:674a with SMTP id
 g16-20020a5d4890000000b0022af91f674amr6577971wrq.214.1669229995742; 
 Wed, 23 Nov 2022 10:59:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf45ZWhhHlJtU2hGS8U86jlQjS/d1XFMtsl01CKM6UGyMs9pk4UbPKjjSNi+qlXIs9CFGKwfNg==
X-Received: by 2002:a5d:4890:0:b0:22a:f91f:674a with SMTP id
 g16-20020a5d4890000000b0022af91f674amr6577940wrq.214.1669229995427; 
 Wed, 23 Nov 2022 10:59:55 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a05600c189400b003c6deb5c1edsm2915606wmp.45.2022.11.23.10.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 10:59:54 -0800 (PST)
Date: Wed, 23 Nov 2022 18:59:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <Y35tp+2Ado3J4NE5@work-vm>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103161620.13120-13-avihaih@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Avihai Horon (avihaih@nvidia.com) wrote:

<snip>

> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
> +    if (!ret) {
> +        trace_vfio_load_state_device_data(vbasedev->name, data_size);
> +
> +    }

I notice you had a few cases like that; I wouldn't bother making that
conditional - just add 'ret' to the trace parameters; that way if it
fails then you can see that in the trace, and it's simpler anyway.

Dave

> +
> +    return ret;
> +}
> +
>  static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>                                 uint64_t data_size)
>  {
> @@ -394,6 +484,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>  
> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    close(migration->data_fd);
> +    migration->data_fd = -1;
> +}
> +
>  static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
> @@ -405,6 +503,18 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>  
>  /* ---------------------------------------------------------------------- */
>  
> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    trace_vfio_save_setup(vbasedev->name);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +
> +    return qemu_file_get_error(f);
> +}
> +
>  static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -448,6 +558,14 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> +static void vfio_save_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_save_cleanup(vbasedev->name);
> +}
> +
>  static void vfio_v1_save_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -456,6 +574,23 @@ static void vfio_v1_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>  
> +#define VFIO_MIG_PENDING_SIZE (512 * 1024 * 1024)
> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
> +                              uint64_t *res_precopy, uint64_t *res_postcopy)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    /*
> +     * VFIO migration protocol v2 currently doesn't have an API to get pending
> +     * device state size. Until such API is introduced, report some big
> +     * arbitrary pending size so the device will be taken into account for
> +     * downtime limit calculations.
> +     */
> +    *res_postcopy += VFIO_MIG_PENDING_SIZE;
> +
> +    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
> +}
> +
>  static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>                                   uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
> @@ -520,6 +655,67 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> +{
> +    ssize_t data_size;
> +
> +    data_size = read(migration->data_fd, migration->data_buffer,
> +                     migration->data_buffer_size);
> +    if (data_size < 0) {
> +        return -1;
> +    }
> +    if (data_size == 0) {
> +        return 1;
> +    }
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> +    qemu_put_be64(f, data_size);
> +    qemu_put_buffer(f, migration->data_buffer, data_size);
> +    bytes_transferred += data_size;
> +
> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
> +
> +    return qemu_file_get_error(f);
> +}
> +
> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP only */
> +    recover_state = VFIO_DEVICE_STATE_STOP;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret = vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +    ret = qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    recover_state = VFIO_DEVICE_STATE_ERROR;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> +                                   recover_state);
> +    if (!ret) {
> +        trace_vfio_save_complete_precopy(vbasedev->name);
> +    }
> +
> +    return ret;
> +}
> +
>  static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -589,6 +785,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>      }
>  }
>  
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
> +                                   vbasedev->migration->device_state);
> +}
> +
>  static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -616,6 +820,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>      return ret;
>  }
>  
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_load_cleanup(vbasedev->name);
> +
> +    return 0;
> +}
> +
>  static int vfio_v1_load_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -658,7 +872,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>              uint64_t data_size = qemu_get_be64(f);
>  
>              if (data_size) {
> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                if (vbasedev->migration->v2) {
> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
> +                } else {
> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                }
>                  if (ret < 0) {
>                      return ret;
>                  }
> @@ -679,6 +897,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>      return ret;
>  }
>  
> +static const SaveVMHandlers savevm_vfio_handlers = {
> +    .save_setup = vfio_save_setup,
> +    .save_cleanup = vfio_save_cleanup,
> +    .save_live_pending = vfio_save_pending,
> +    .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_state = vfio_save_state,
> +    .load_setup = vfio_load_setup,
> +    .load_cleanup = vfio_load_cleanup,
> +    .load_state = vfio_load_state,
> +};
> +
>  static SaveVMHandlers savevm_vfio_v1_handlers = {
>      .save_setup = vfio_v1_save_setup,
>      .save_cleanup = vfio_v1_save_cleanup,
> @@ -693,6 +922,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>  
>  /* ---------------------------------------------------------------------- */
>  
> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state new_state;
> +    int ret;
> +
> +    if (running) {
> +        new_state = VFIO_DEVICE_STATE_RUNNING;
> +    } else {
> +        new_state = VFIO_DEVICE_STATE_STOP;
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, new_state,
> +                                   VFIO_DEVICE_STATE_ERROR);
> +    if (ret) {
> +        /*
> +         * Migration should be aborted in this case, but vm_state_notify()
> +         * currently does not support reporting failures.
> +         */
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
> +    }
> +
> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> +                              mig_state_to_str(new_state));
> +}
> +
>  static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -766,12 +1023,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
> -        ret = vfio_migration_v1_set_state(vbasedev,
> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
> -        if (ret) {
> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +        if (migration->v2) {
> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                     VFIO_DEVICE_STATE_ERROR);
> +        } else {
> +            ret = vfio_migration_v1_set_state(vbasedev,
> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
> +            if (ret) {
> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +            }
>          }
>      }
>  }
> @@ -780,12 +1042,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
>  
> -    vfio_region_exit(&migration->region);
> -    vfio_region_finalize(&migration->region);
> +    if (migration->v2) {
> +        g_free(migration->data_buffer);
> +    } else {
> +        vfio_region_exit(&migration->region);
> +        vfio_region_finalize(&migration->region);
> +    }
>      g_free(vbasedev->migration);
>      vbasedev->migration = NULL;
>  }
>  
> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                                  sizeof(struct vfio_device_feature_migration),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (void *)buf;
> +    struct vfio_device_feature_migration *mig = (void *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        return -EOPNOTSUPP;
> +    }
> +
> +    *mig_flags = mig->flags;
> +
> +    return 0;
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev)
>  {
>      int ret;
> @@ -794,6 +1079,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      char id[256] = "";
>      g_autofree char *path = NULL, *oid = NULL;
>      struct vfio_region_info *info = NULL;
> +    uint64_t mig_flags;
>  
>      if (!vbasedev->ops->vfio_get_object) {
>          return -EINVAL;
> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>          return -EINVAL;
>      }
>  
> -    ret = vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                   &info);
> -    if (ret) {
> -        return ret;
> -    }
> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> +    if (!ret) {
> +        /* Migration v2 */
> +        /* Basic migration functionality must be supported */
> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> +            return -EOPNOTSUPP;
> +        }
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
> +        vbasedev->migration->data_buffer =
> +            g_malloc0(vbasedev->migration->data_buffer_size);
> +        vbasedev->migration->data_fd = -1;
> +        vbasedev->migration->v2 = true;
> +    } else {
> +        /* Migration v1 */
> +        ret = vfio_get_dev_region_info(vbasedev,
> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                       &info);
> +        if (ret) {
> +            return ret;
> +        }
>  
> -    vbasedev->migration = g_new0(VFIOMigration, 1);
> -    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
> -    vbasedev->migration->vm_running = runstate_is_running();
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
> +        vbasedev->migration->vm_running = runstate_is_running();
>  
> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> -                            info->index, "migration");
> -    if (ret) {
> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
> -                     vbasedev->name, info->index, strerror(-ret));
> -        goto err;
> -    }
> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> +                                info->index, "migration");
> +        if (ret) {
> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
> +                         vbasedev->name, info->index, strerror(-ret));
> +            goto err;
> +        }
>  
> -    if (!vbasedev->migration->region.size) {
> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
> -                     vbasedev->name, info->index);
> -        ret = -EINVAL;
> -        goto err;
> -    }
> +        if (!vbasedev->migration->region.size) {
> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
> +                         vbasedev->name, info->index);
> +            ret = -EINVAL;
> +            goto err;
> +        }
>  
> -    g_free(info);
> +        g_free(info);
> +    }
>  
>      migration = vbasedev->migration;
>      migration->vbasedev = vbasedev;
> @@ -844,11 +1147,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      }
>      strpadcpy(id, sizeof(id), path, '\0');
>  
> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                         &savevm_vfio_v1_handlers, vbasedev);
> +    if (migration->v2) {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
> +    } else {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_v1_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
> +    }
>  
> -    migration->vm_state = qdev_add_vm_change_state_handler(
> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);
>      return 0;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index d88d2b4053..9ef84e24b2 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -149,7 +149,9 @@ vfio_display_edid_write_error(void) ""
>  
>  # migration.c
>  vfio_migration_probe(const char *name) " (%s)"
> +vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
>  vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
> +vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
>  vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>  vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
>  vfio_save_setup(const char *name) " (%s)"
> @@ -163,6 +165,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
>  vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>  vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>  vfio_load_cleanup(const char *name) " (%s)"
>  vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>  vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index bbaf72ba00..2ec3346fea 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>      int vm_running;
>      Notifier migration_state;
>      uint64_t pending_bytes;
> +    enum vfio_device_mig_state device_state;
> +    int data_fd;
> +    void *data_buffer;
> +    size_t data_buffer_size;
> +    bool v2;
>  } VFIOMigration;
>  
>  typedef struct VFIOAddressSpace {
> -- 
> 2.21.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


