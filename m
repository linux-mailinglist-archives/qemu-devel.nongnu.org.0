Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C15500995
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:20:54 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neven-000389-KL
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevYQ-0000ew-KN
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevYO-0006PA-Bz
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649927655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qqfr9w0fqLkvayeoKfpadGeVYOkZq8N6c8ihN19NEXA=;
 b=bW2uUFE+3ifT2EoP/fii43qyZPrfKJb/XgshQFd4OpjATl87Ob4CvzNlYQ20MKvXjKiUEJ
 slbVMGi2k+fwjJl74X/ugBRYhS3cnSTM6REMmqQT3JtZbX0cHiMPIKepUbm8ky+895dagd
 q3+rwiUo5eGx3+JCWKFLhOVkePUQ1E4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-1qTyc3vuOD2m6daW6Fh-tQ-1; Thu, 14 Apr 2022 05:14:14 -0400
X-MC-Unique: 1qTyc3vuOD2m6daW6Fh-tQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 y20-20020a197514000000b0046cbe2da153so2064095lfe.19
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 02:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qqfr9w0fqLkvayeoKfpadGeVYOkZq8N6c8ihN19NEXA=;
 b=yfFH2hIOGrUb+HnpIalLHu1LQ9fCQHpbPIBa/5XzNdCcRldPcytzqguDSLys0Wz7Ou
 +o1QOg1cz5r2ry3OHmXf0IUPUtPuS4rXwFKqdTHqHLukPKR/VaNlrcDP30/ZUG0UnX/7
 HITkKinUVl/HiIRfQ8qj90XkKuovoiZMu5vzKwh1wWPg7oQPLsQEc4IL3W1ztFd0kAFJ
 woOOnsA6ULqOWdgOdPKkV44Uy9nKyFB5F0mBL5ea6yJ+VjiaGvvnD0lilV7pY7gg9stZ
 J/XrkU9iwZ8SEaBI2CVJiYXy6C26fSwvvnbCEZ705dsknZJCo+0TeOWebnya1cU2y2Hr
 2Kqw==
X-Gm-Message-State: AOAM532SKtZQw0/1dQ4WSiPFaQak7+s7XY3v9BaLDmPPS5NIYBOFn8c8
 9g3Mty7GKCA1DhV6p9txkqz4oL5brRbHOgT7Bcm5OXl9kRorirvv6BK8tgLCcsCdjOri7RRE7GF
 6DPjO2HehkfTgN0t9WFPcF0WtqqwjbhM=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr1077736ljd.315.1649927652627; 
 Thu, 14 Apr 2022 02:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVO1N+pS4r/uSHmrzd8w5bSW5YF5oLbYZkFx/DYnuOTXzHviOzPm92qzW82VE86gIKyDbc+WWPxqQURbsPc4w=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr1077719ljd.315.1649927652443; Thu, 14
 Apr 2022 02:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-21-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-21-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Apr 2022 17:14:01 +0800
Message-ID: <CACGkMEvpJ5akUfZwcHNbkpa_XhMeNSeYF-23enKJy6+0ApUWaw@mail.gmail.com>
Subject: Re: [RFC PATCH v7 20/25] vdpa: add NetClientState->start() callback
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 12:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> It allows to inject custom code on device success start, right before
> release lock.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/net/net.h  | 2 ++
>  hw/net/vhost_net.c | 4 ++++

I wonder if we can do it in the vhost-vdpa layer.

Thanks

>  2 files changed, 6 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 523136c7ac..2fc3002ab4 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -44,6 +44,7 @@ typedef struct NICConf {
>
>  typedef void (NetPoll)(NetClientState *, bool enable);
>  typedef bool (NetCanReceive)(NetClientState *);
> +typedef void (NetStart)(NetClientState *);
>  typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
>  typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, =
int);
>  typedef void (NetCleanup) (NetClientState *);
> @@ -71,6 +72,7 @@ typedef struct NetClientInfo {
>      NetReceive *receive_raw;
>      NetReceiveIOV *receive_iov;
>      NetCanReceive *can_receive;
> +    NetStart *start;
>      NetCleanup *cleanup;
>      LinkStatusChanged *link_status_changed;
>      QueryRxFilter *query_rx_filter;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2ca4..44a105ec29 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -274,6 +274,10 @@ static int vhost_net_start_one(struct vhost_net *net=
,
>              }
>          }
>      }
> +
> +    if (net->nc->info->start) {
> +        net->nc->info->start(net->nc);
> +    }
>      return 0;
>  fail:
>      file.fd =3D -1;
> --
> 2.27.0
>


