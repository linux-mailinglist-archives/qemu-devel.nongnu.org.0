Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE65C0022
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:42:56 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0wB-0006FS-48
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ob0nh-0006i9-Rp
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ob0nd-0001hA-NW
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663770842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ymYOZMT6SQ7bStL6s1VzfhTll4XczNDbUKma514bENg=;
 b=Fn+m5/P/VoR88abL28LEqF2HfapbbUEeoREain0cY4iPJEPGdahzDmvKrv68xxJ1Vyk8UR
 Ezfm6k27M44Bcy9VRVbd+KMHkFEs00sxPkis9RDFg+WPA1QdaDSwG3es/bFl+hR0SkyloN
 cdbUfg1oLfRaxoc6PnuRDltAEM+OYTo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-ZbueiR_FMzqmS2uNCjzjTg-1; Wed, 21 Sep 2022 10:33:47 -0400
X-MC-Unique: ZbueiR_FMzqmS2uNCjzjTg-1
Received: by mail-qt1-f197.google.com with SMTP id
 v9-20020a05622a188900b0035cc030ca25so4255427qtc.1
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 07:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ymYOZMT6SQ7bStL6s1VzfhTll4XczNDbUKma514bENg=;
 b=B1d8w+4sC6J4di//YI93AtJXua42bzc6mjsVladl4/QdNrBefJGvDiTDnvsWaDpchG
 k9x2EcQB54MP1uc5qqFqrZ9CampPfQc6LzLlqRSJI/8BzeovvAZc+OKAy2jyzWm+ccyj
 dbjf2rW4OdKws58YIHV8mJLKVoSYxJVJjXvo3YQHocDgZkzk3lmsIFPiicAR2NGE2fAJ
 ynEUk+fBMKv9W8SqVFY5ouWF9Gs6DsO7cmtkpzziiBvlZIvJsey8UgI39Z/mTAI0/jEp
 b9VuhFDAWV+9PAGiaItaf7ZaVAXmBkKu/SVYvTJFLlHD9A5Rus3X7QckI5OOW8eYKyqJ
 RV9Q==
X-Gm-Message-State: ACrzQf0QBWrqWQolJ2TWo3gks2ROOaaf/8FLTTSvh0yNZH0FEK5dy9I4
 Go848w2FkYtwTAI/zNpIrbsqkjUiMFf47ycdA+tl3RhKhcUPKMG3Tr48MEgU7xA5If09Af8Mmfq
 EPQqZpYJbdG+9QQl953tYMZOcg5vxZZc=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr22940877qvk.104.1663770827181; 
 Wed, 21 Sep 2022 07:33:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ydnybWrQS7AupVrO9S4fey1hk5Zg5C+4fsjv/HqQQ6t7lrZMaJlSKYoC6ocRpoY3sTuOKzMa7RJtABfcpNQI=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr22940855qvk.104.1663770826940; Wed, 21
 Sep 2022 07:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220915233302.145926-1-venu.busireddy@oracle.com>
In-Reply-To: <20220915233302.145926-1-venu.busireddy@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 16:33:35 +0200
Message-ID: <CABgObfZyG1FB5yYEzyH01K6Epsv-oivseHdQUO1bn8OE3+B6NA@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, Sep 16, 2022 at 3:44 AM Venu Busireddy
<venu.busireddy@oracle.com> wrote:
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 41f2a5630173..69194c7ae23c 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -608,7 +608,19 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
>
>      req->resp.cmd.response = VIRTIO_SCSI_S_OK;
>      req->resp.cmd.status = r->status;
> -    if (req->resp.cmd.status == GOOD) {
> +    if (req->dev->reported_luns_changed &&
> +            (req->req.cmd.cdb[0] != INQUIRY) &&
> +            (req->req.cmd.cdb[0] != REPORT_LUNS) &&
> +            (req->req.cmd.cdb[0] != REQUEST_SENSE)) {
> +        req->dev->reported_luns_changed = false;
> +        req->resp.cmd.resid = 0;
> +        req->resp.cmd.status_qualifier = 0;
> +        req->resp.cmd.status = CHECK_CONDITION;
> +        sense_len = scsi_build_sense(sense, SENSE_CODE(REPORTED_LUNS_CHANGED));
> +        qemu_iovec_from_buf(&req->resp_iov, sizeof(req->resp.cmd),
> +                            sense, sense_len);
> +        req->resp.cmd.sense_len = virtio_tswap32(vdev, sense_len);
> +    } else if (req->resp.cmd.status == GOOD) {
>          req->resp.cmd.resid = virtio_tswap32(vdev, resid);
>      } else {
>          req->resp.cmd.resid = 0;

Hi,

a unit attention sense must be sent _instead_ of executing the command.

QEMU already has a function scsi_device_set_ua() that handles
everything; you have to call it, if reported_luns_changed is true,
from virtio_scsi_handle_cmd_req_prepare() before scsi_req_new().

It will also skip GET_CONFIGURATION and GET_EVENT_STATUS_NOTIFICATION
commands which are further special-cased in 4.1.6.1 of the MMC
specification.

Thanks,

Paolo


> @@ -956,6 +968,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>          virtio_scsi_push_event(s, sd,
>                                 VIRTIO_SCSI_T_TRANSPORT_RESET,
>                                 VIRTIO_SCSI_EVT_RESET_RESCAN);
> +        s->reported_luns_changed = true;
>          virtio_scsi_release(s);
>      }
>  }
> @@ -973,6 +986,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>          virtio_scsi_push_event(s, sd,
>                                 VIRTIO_SCSI_T_TRANSPORT_RESET,
>                                 VIRTIO_SCSI_EVT_RESET_REMOVED);
> +        s->reported_luns_changed = true;
>          virtio_scsi_release(s);
>      }
>
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index a36aad9c8695..efbcf9ba069a 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -81,6 +81,7 @@ struct VirtIOSCSI {
>      SCSIBus bus;
>      int resetting;
>      bool events_dropped;
> +    bool reported_luns_changed;
>
>      /* Fields for dataplane below */
>      AioContext *ctx; /* one iothread per virtio-scsi-pci for now */
>


