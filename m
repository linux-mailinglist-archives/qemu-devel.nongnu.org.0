Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A758E68D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 07:07:59 +0200 (CEST)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLdwi-0002qq-Ux
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 01:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLduy-0001FH-Mp
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdut-0006en-EP
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660107962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwooKPZPBkcBHFUYAzv/j8E674NQDeVqeTmGCzXbFJ8=;
 b=al51Xuql5DmGo4f939lqiDyBcuSjmprO/qnovjLVfF4aBiSYRospuFaFVq/Y1cVydZG8hy
 SokAy7vV0fPRILtW2xM5WazSENp+Sabew4JptmlDmXE/tq2vyj4/6+4o9X6Tdi0Zhm7Yg9
 Sg9CaYTG2pr0/+eT15wPyxJWG97KfUI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-vMvOZSweOwWYpYLauOMSow-1; Wed, 10 Aug 2022 01:06:00 -0400
X-MC-Unique: vMvOZSweOwWYpYLauOMSow-1
Received: by mail-lj1-f198.google.com with SMTP id
 z7-20020a2ebe07000000b0025e5c7d6a2eso4078764ljq.20
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 22:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gwooKPZPBkcBHFUYAzv/j8E674NQDeVqeTmGCzXbFJ8=;
 b=nVyHWuQJd4ErTjIRXmuDUxFc77kBsJ6OFkP3HiRSQeLJ5wNJ8k50rft+QcdBkXyuBh
 yvmMU7g899Wy3xBaU+UA5Bm9LXrWVUdIGceXY7QphR1Q54Z6QCSI8ZVo51gDrjN0dn14
 sAwa9egLtiaMpbMukWfPdLVGdeir/a9DEYwA7d7XS1A4iWTi8y9lnKpbqZ+6PLpaJ8Db
 GDbveawajG1QH/OeG9ATXlT4MrwQ+zdTNWIPnlVFyR6th3QodBe0RfrCySzFL7IGw9DL
 xtYgvwmyMRQSXHGAdL9eLQGLSEEWUjh2LVCsQD0HD+pghNWkA3X+IrClOeKPb30GcQP4
 la+A==
X-Gm-Message-State: ACgBeo1JOJ0s/nbGsT4Vvem9o3sxV4L+d+lqZB75MoG5iGOuVsBEsuPF
 2YyshF/lpJtL6Lk8mGWw4unrhagibh0UBB5KtslI++tmygoxORotL/edpq0wazNPyAylMW5asGK
 o/Yh/fJBES5NqoPa7VwEQXPqu2Vl1PiY=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr7577664lfg.411.1660107958590; 
 Tue, 09 Aug 2022 22:05:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6KkeRrco3xT0cIR7qRkfIBUdZXj+4WWy/2LINYcMWcEAlHtmILMckd0eIbibz6i8h2YHQ5+lkO1HPc60qb+k4=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr7577645lfg.411.1660107958345; Tue, 09
 Aug 2022 22:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <20220809173926.1695280-6-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Aug 2022 13:05:47 +0800
Message-ID: <CACGkMEtZQfbDXcCLLky26E9-WxXEgvrXp9TFxsG0DLrHDq6WEQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/12] vhost_net: Add NetClientInfo prepare callback
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 10, 2022 at 1:39 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This is used by the backend to perform actions before the device is
> started.
>
> In particular, vdpa net use it to map CVQ buffers to the device, so it
> can send control commands using them.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---

So the title still calls it "prepare".

Other than this.

Acked-by: Jason Wang <jasowang@redhat.com>

> v8: Rename NetClientInfo prepare callback to start, so it aligns with
>     future "stop"
> ---
>  include/net/net.h  | 2 ++
>  hw/net/vhost_net.c | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 523136c7ac..ad9e80083a 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -44,6 +44,7 @@ typedef struct NICConf {
>
>  typedef void (NetPoll)(NetClientState *, bool enable);
>  typedef bool (NetCanReceive)(NetClientState *);
> +typedef int (NetStart)(NetClientState *);
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
> index ccac5b7a64..2e0baeba26 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -244,6 +244,13 @@ static int vhost_net_start_one(struct vhost_net *net=
,
>      struct vhost_vring_file file =3D { };
>      int r;
>
> +    if (net->nc->info->start) {
> +        r =3D net->nc->info->start(net->nc);
> +        if (r < 0) {
> +            return r;
> +        }
> +    }
> +
>      r =3D vhost_dev_enable_notifiers(&net->dev, dev);
>      if (r < 0) {
>          goto fail_notifiers;
> --
> 2.31.1
>


