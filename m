Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878186D6593
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:39:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhoX-0001FC-Bu; Tue, 04 Apr 2023 10:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjhoT-0001Dy-2R
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjhoQ-0006q8-7m
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680619143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gmO97gAtFYtTbL1S42EXHY21vUfwD059Jzy3RrPu67Q=;
 b=XmvWJcME2iAvqCnnJCQVGtzgkgrP2IUG34M86A/9VOTtoBpn5o2XDPO0ps3Rfy8SizMs4Z
 aacAiP8QKcgvlWv0vrAVJxiVlonakc9d85Xjk0xN8GlyRVbqn+ZndgxlSq7Xvh1n0FOg4E
 vD9xQ9z+YuJ1y+RTCMLXM3/cZ7WV39s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-6rOpCPKpPLatvWwi4fGgXw-1; Tue, 04 Apr 2023 10:39:02 -0400
X-MC-Unique: 6rOpCPKpPLatvWwi4fGgXw-1
Received: by mail-ed1-f69.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso46303776edb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680619139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmO97gAtFYtTbL1S42EXHY21vUfwD059Jzy3RrPu67Q=;
 b=UWXRJH/obxxlelvCainEuBnkn/7AnGSelbyZAyggAGT2XnZzLRGxkDnBXQEzK/BS0E
 z6Nxgw6sXNErkvhJ2IXwYB4ifqHQ4+DkFa+iWm10ngCWfpSr2N9/SdgoI6FPH2fTGLgp
 5ZRtl8NnReLV4WbQ1xSmxSPeK7qU4AlN1RorI7Xi1WJBYGARvpcS7ek1yRqwAhI/YD2C
 f4xNmuGqnou3sKV2RQ8AQWsMXgKNpbdxn4H8Mzx3iopSn6gBMqzAJZzTJiu5GAwMZXwt
 WaM3ivx3kMnPw6OgUxk09xu2OOb5wA2M6ozgSeJGvJ4rKcdRMiPYFwHSmKRb71q+gezW
 yBZA==
X-Gm-Message-State: AAQBX9dIxd1dWrRjo5Qi+VmuDJgb1SRUIPgt6WSkZv2U0bwDylK9dB3b
 eFAQ7fDGoKXhpjuAIHrE/jJDjp/7egjugMFmzYK5QyTrrrlJWUPVI3zHR8CNU9JQ+aBLdrQu3jN
 fH9w2RgK13f1SFH0=
X-Received: by 2002:aa7:cfd5:0:b0:4fa:c17d:8fdd with SMTP id
 r21-20020aa7cfd5000000b004fac17d8fddmr2323134edy.34.1680619139638; 
 Tue, 04 Apr 2023 07:38:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bi2S3wGdfV0YoNjlWz9akfgA+degJejYBD5zzJwJg5OHp4hxP/MX7u3WDswchOrfTPlv4XoQ==
X-Received: by 2002:aa7:cfd5:0:b0:4fa:c17d:8fdd with SMTP id
 r21-20020aa7cfd5000000b004fac17d8fddmr2323108edy.34.1680619139386; 
 Tue, 04 Apr 2023 07:38:59 -0700 (PDT)
Received: from redhat.com ([2.52.129.179]) by smtp.gmail.com with ESMTPSA id
 qb34-20020a1709077ea200b00948f41af90dsm1279385ejc.166.2023.04.04.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:38:58 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:38:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Fam Zheng <fam@euphon.net>, David Woodhouse <dwmw2@infradead.org>,
 Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <20230404103838-mutt-send-email-mst@kernel.org>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403183004.347205-2-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Apr 03, 2023 at 02:29:52PM -0400, Stefan Hajnoczi wrote:
> Only report a transport reset event to the guest after the SCSIDevice
> has been unrealized by qdev_simple_device_unplug_cb().
> 
> qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> to false so that scsi_device_find/get() no longer see it.
> 
> scsi_target_emulate_report_luns() also needs to be updated to filter out
> SCSIDevices that are unrealized.
> 
> These changes ensure that the guest driver does not see the SCSIDevice
> that's being unplugged if it responds very quickly to the transport
> reset event.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge.

> ---
>  hw/scsi/scsi-bus.c    |  3 ++-
>  hw/scsi/virtio-scsi.c | 18 +++++++++---------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index c97176110c..f9bd064833 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -487,7 +487,8 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
>              DeviceState *qdev = kid->child;
>              SCSIDevice *dev = SCSI_DEVICE(qdev);
>  
> -            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
> +            if (dev->channel == channel && dev->id == id && dev->lun != 0 &&
> +                qatomic_load_acquire(&dev->qdev.realized)) {
>                  store_lun(tmp, dev->lun);
>                  g_byte_array_append(buf, tmp, 8);
>                  len += 8;
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 612c525d9d..000961446c 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -1063,15 +1063,6 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>      SCSIDevice *sd = SCSI_DEVICE(dev);
>      AioContext *ctx = s->ctx ?: qemu_get_aio_context();
>  
> -    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> -        virtio_scsi_acquire(s);
> -        virtio_scsi_push_event(s, sd,
> -                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> -                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> -        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> -        virtio_scsi_release(s);
> -    }
> -
>      aio_disable_external(ctx);
>      qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
>      aio_enable_external(ctx);
> @@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>          blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL);
>          virtio_scsi_release(s);
>      }
> +
> +    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> +        virtio_scsi_acquire(s);
> +        virtio_scsi_push_event(s, sd,
> +                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> +                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> +        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> +        virtio_scsi_release(s);
> +    }
>  }
>  
>  static struct SCSIBusInfo virtio_scsi_scsi_info = {
> -- 
> 2.39.2


