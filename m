Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECB6E0E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:20:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmwrB-0005Hd-Ov; Thu, 13 Apr 2023 09:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmwr9-0005HO-B1
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmwr6-0003u1-TH
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681391953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vqdy/yLbb+j6J6VQRuK0JrlzwSV/0e8g/1H+BLXY4IU=;
 b=F/AGUby5I+abptyh35Y9adaFPncj4nrWYg7Y01t1HvpL+/NzCtCuVFp5U6Wns4gb8phh3v
 Tf5F9mkxibrV/vXcIA9Emx9MRQMKVOxFOpMxrweXX095XZPQJZJBoJOBGHKaSIYW8dV3Gn
 8wf0byMI4qCKehs2iFkIftXFf7GA3lI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-Usx1Onk3OYi4wH_Fszkbkw-1; Thu, 13 Apr 2023 09:19:12 -0400
X-MC-Unique: Usx1Onk3OYi4wH_Fszkbkw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m7-20020a05600c3b0700b003ee112e6df1so4783412wms.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 06:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681391951; x=1683983951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vqdy/yLbb+j6J6VQRuK0JrlzwSV/0e8g/1H+BLXY4IU=;
 b=XkkacQ0KqtSIYMETHqDjJX0OWRHdRVnom6Qw5vTxxuQYws2/egeO9lgaidBc6deKA6
 5GXw4O3dxYNxTvWohoy7tG9mdDICniLKW3htP/rVmRNMj8YxdBsQzFKFGguKGqapB6h/
 ozNWvNZEF7gFoUCH3blTKmYQPk3Sd2OoiTGSKBf5xr0gW8WjgINemNLc2coHtJo9ISIv
 WKsXzBafbV6Ei0g4UCiCiTiy8VIL8TX8Fjp9P9X9/Iy75oMtxU+IjhKi7vrx9x8aa7rZ
 vE1jYE2cHCdQxN1i0F7jACF7XipFEeFnTpzMleVZcsRe2RhLr6Al8O1P+45OAUp6SEbH
 /elw==
X-Gm-Message-State: AAQBX9fzE3D4o51DbGAt3YEh4ON9fQnQgkzexlKJRnJsCqVikKb36nRe
 Kf/OH3UZFIOrG86Z8LMc73nTccwG9Jf5L8AnbQsHroxr917Zx0EjXpLWRY9g5QzitaZGvKvTccG
 mphuXDAumZjhN0Fc=
X-Received: by 2002:a7b:ca4d:0:b0:3f0:6ada:f445 with SMTP id
 m13-20020a7bca4d000000b003f06adaf445mr1761535wml.33.1681391950964; 
 Thu, 13 Apr 2023 06:19:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350bRud7dGJmb7CDFO1Y5wvvUR5LqCJb89HlJ/G8kYFSpWntK86zZoosuaMxn5qZFLh7HGI5b4Q==
X-Received: by 2002:a7b:ca4d:0:b0:3f0:6ada:f445 with SMTP id
 m13-20020a7bca4d000000b003f06adaf445mr1761516wml.33.1681391950595; 
 Thu, 13 Apr 2023 06:19:10 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003f04f0c5a6fsm1790705wma.26.2023.04.13.06.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 06:19:10 -0700 (PDT)
Date: Thu, 13 Apr 2023 09:19:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
Message-ID: <20230413091728-mutt-send-email-mst@kernel.org>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411150515.14020-2-hreitz@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Apr 11, 2023 at 05:05:12PM +0200, Hanna Czenczek wrote:
> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
> setting the vhost features will set this feature, too.  Doing so
> disables all vrings, which may not be intended.

Hmm not sure I understand: why does it disable vrings?

> For example, enabling or disabling logging during migration requires
> setting those features (to set or unset VHOST_F_LOG_ALL), which will
> automatically disable all vrings.  In either case, the VM is running
> (disabling logging is done after a failed or cancelled migration, and
> only once the VM is running again, see comment in
> memory_global_dirty_log_stop()), so the vrings should really be enabled.
> As a result, the back-end seems to hang.
> 
> To fix this, we must remember whether the vrings are supposed to be
> enabled, and, if so, re-enable them after a SET_FEATURES call that set
> VHOST_USER_F_PROTOCOL_FEATURES.
> 
> It seems less than ideal that there is a short period in which the VM is
> running but the vrings will be stopped (between SET_FEATURES and
> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
> e.g. by introducing a new flag or vhost-user protocol feature to disable
> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
> new functions for setting/clearing singular feature bits (so that
> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
> 
> Even with such a potential addition to the protocol, we still need this
> fix here, because we cannot expect that back-ends will implement this
> addition.
> 
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/hw/virtio/vhost.h | 10 ++++++++++
>  hw/virtio/vhost.c         | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..2fe02ed5d4 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -90,6 +90,16 @@ struct vhost_dev {
>      int vq_index_end;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
> +
> +    /*
> +     * Whether the virtqueues are supposed to be enabled (via
> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
> +     * enabling/disabling logging) will disable all virtqueues if
> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
> +     * re-enable them if this field is set.
> +     */
> +    bool enable_vqs;
> +
>      /**
>       * vhost feature handling requires matching the feature set
>       * offered by a backend which may be a subset of the total
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..cbff589efa 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
>  static QLIST_HEAD(, vhost_dev) vhost_devices =
>      QLIST_HEAD_INITIALIZER(vhost_devices);
>  
> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable);
> +
>  bool vhost_has_free_slot(void)
>  {
>      unsigned int slots_limit = ~0U;
> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
>          }
>      }
>  
> +    if (dev->enable_vqs) {
> +        /*
> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled all
> +         * virtqueues, even if that was not intended; re-enable them if
> +         * necessary.
> +         */
> +        vhost_dev_set_vring_enable(dev, true);
> +    }
> +
>  out:
>      return r;
>  }
> @@ -1896,6 +1907,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>  
>  static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable)
>  {
> +    hdev->enable_vqs = enable;
> +
>      if (!hdev->vhost_ops->vhost_set_vring_enable) {
>          return 0;
>      }
> -- 
> 2.39.1


