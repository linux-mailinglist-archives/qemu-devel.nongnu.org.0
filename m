Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9ED525513
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:43:48 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDmt-0005j6-Mj
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npD3t-0007ru-WE
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npD3r-0001eX-Kl
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/P0ZebC9V1b91TqWsznyyFuu0HV6MC22vsYgswmKhUI=;
 b=ZTPEW1YqsAKCOo8vzsqx/3HgcpNWXI5gqo5thxMb4y4tGipPiadClLM0ekRFANNdL/648x
 xBw9gmEYnhZthRreh7sqB6qibWKDaCfYTxutTUPIeiT504pzToBA/9IzsoXx/29Q2hA/gk
 cTdDPxa/J7rHsR2R1qgh+yrErvKv/Pc=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-0KcGVILrNl6Hsa2b5Gdopw-1; Thu, 12 May 2022 13:57:13 -0400
X-MC-Unique: 0KcGVILrNl6Hsa2b5Gdopw-1
Received: by mail-io1-f69.google.com with SMTP id
 l3-20020a05660227c300b0065a8c141580so3465390ios.19
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=/P0ZebC9V1b91TqWsznyyFuu0HV6MC22vsYgswmKhUI=;
 b=exufAe5Q7qYE1QH/IX2vG24j/fkoy8eg3A6dHhpEjdolPqV28vfPnX1EqLB6tD0H/8
 A89stcVE64KYAonIP6vgq6KIHBfWCHcZDgU6mV0pDLNTL9DIYeo8z9/Tkfk/SfDEgnjW
 snK/fSIRR4MAl6/kUALk7BKQXYd8jBKd0HqYc1FCDtEUT7spyFXHfFmN9Z3fy6eGFMWg
 fIEMTfrAc739yHsI3i8rF5nL3JGWewFpNabWzZ2Rh0Vlz7DTdzOiO4Eb1WDKL4fe9DbC
 IfJU+wKsbLEOiWrPUlVGUTS9+/lSD5bT6Qv2Xk5tWNQzVgLyj/PQ14CT5W8P3LaPGEnW
 PlQg==
X-Gm-Message-State: AOAM5325AXYOt34aR/tKZftzXkzjzBS2q9p+blG+jtQsS3sL0S8GMFTb
 Acq5dj5SFL1fYT4D9/4XYWu3A7J8bSFKlNEGluwlO9rOaWsjOv+ameZdXd0Yc6zFILyt69juo42
 lnBDh99KwCnZx5J0=
X-Received: by 2002:a05:6e02:1b81:b0:2cf:1aa3:679b with SMTP id
 h1-20020a056e021b8100b002cf1aa3679bmr634657ili.266.1652378232323; 
 Thu, 12 May 2022 10:57:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ/ehUfbUf+jDSKm9y5UdP5Y7BNFK70T5y4H354uLLeLp3KLgo+ZkUAG3UywxhWsg25IAMzA==
X-Received: by 2002:a05:6e02:1b81:b0:2cf:1aa3:679b with SMTP id
 h1-20020a056e021b8100b002cf1aa3679bmr634636ili.266.1652378232024; 
 Thu, 12 May 2022 10:57:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h9-20020a02b609000000b0032dee7810cbsm53000jam.45.2022.05.12.10.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:57:11 -0700 (PDT)
Date: Thu, 12 May 2022 11:57:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Cornelia Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "Mark Bloch" <mbloch@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>
Subject: Re: [PATCH 2/9] vfio: Fix compilation errors caused by VFIO
 migration v1 deprecation
Message-ID: <20220512115710.413c7e34.alex.williamson@redhat.com>
In-Reply-To: <20220512154320.19697-3-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-3-avihaih@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 12 May 2022 18:43:13 +0300
Avihai Horon <avihaih@nvidia.com> wrote:

> VFIO migration protocol v1 was deprecated and as part of it some of the
> uAPI definitions were renamed. This caused compilation errors.
> Fix them.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c    |  6 +++---
>  hw/vfio/migration.c | 29 ++++++++++++++++-------------
>  2 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 159f910421..29982c7af8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,7 +355,7 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>              }
>  
>              if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> -                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
>                  return false;
>              }
>          }
> @@ -381,8 +381,8 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
> -                (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
> +                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
>                  continue;
>              } else {
>                  return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index ff6b45de6b..835608cd23 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>      }
>  
>      ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>      if (ret) {
>          error_report("%s: Failed to set state SAVING", vbasedev->name);
>          return ret;
> @@ -531,8 +531,8 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>      uint64_t data_size;
>      int ret;
>  
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
> -                                   VFIO_DEVICE_STATE_SAVING);
> +    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>      if (ret) {
>          error_report("%s: Failed to set state STOP and SAVING",
>                       vbasedev->name);
> @@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
> +    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
>      if (ret) {
>          error_report("%s: Failed to set state STOPPED", vbasedev->name);
>          return ret;
> @@ -609,7 +609,7 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
>      }
>  
>      ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_RESUMING);
> +                                   VFIO_DEVICE_STATE_V1_RESUMING);
>      if (ret) {
>          error_report("%s: Failed to set state RESUMING", vbasedev->name);
>          if (migration->region.mmaps) {
> @@ -717,20 +717,20 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>           * In both the above cases, set _RUNNING bit.
>           */
>          mask = ~VFIO_DEVICE_STATE_MASK;
> -        value = VFIO_DEVICE_STATE_RUNNING;
> +        value = VFIO_DEVICE_STATE_V1_RUNNING;
>      } else {
>          /*
>           * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
>           * _RUNNING bit
>           */
> -        mask = ~VFIO_DEVICE_STATE_RUNNING;
> +        mask = ~VFIO_DEVICE_STATE_V1_RUNNING;
>  
>          /*
>           * When VM state transition to stop for savevm command, device should
>           * start saving data.
>           */
>          if (state == RUN_STATE_SAVE_VM) {
> -            value = VFIO_DEVICE_STATE_SAVING;
> +            value = VFIO_DEVICE_STATE_V1_SAVING;
>          } else {
>              value = 0;
>          }
> @@ -767,9 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
> -        ret = vfio_migration_set_state(vbasedev,
> -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> -                      VFIO_DEVICE_STATE_RUNNING);
> +        ret = vfio_migration_set_state(
> +            vbasedev,
> +            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
> +            VFIO_DEVICE_STATE_V1_RUNNING);

Yikes!  Please follow the line wrapping used elsewhere.  There's no need
to put the first arg on a new line and subsequent wrapped lines should
be indented to match the previous line, or at least to avoid wrapping
itself.  Here we can use something like:

        ret = vfio_migration_set_state(vbasedev,
                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
                                         VFIO_DEVICE_STATE_V1_RESUMING),
                                       VFIO_DEVICE_STATE_V1_RUNNING);

Thanks,
Alex

>          if (ret) {
>              error_report("%s: Failed to set state RUNNING", vbasedev->name);
>          }
> @@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>          goto add_blocker;
>      }
>  
> -    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
> +    ret = vfio_get_dev_region_info(vbasedev,
> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                   &info);
>      if (ret) {
>          goto add_blocker;
>      }


