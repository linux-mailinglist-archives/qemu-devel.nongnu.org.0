Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81B668AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 05:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGBtZ-0008Ui-2Z; Thu, 12 Jan 2023 23:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBtX-0008UW-Dw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:42:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBtW-00067I-44
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673584941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzjMuceZUsuAqTT5Frb+BhVyeW8eQUcC32Zjffvw6wM=;
 b=S4dt/cXk4JN7Y9Kv6Mm/PoSaHZEyOoYBphABCtXIVk9BGzb1wmaR7uWWskc2ZItSI/A0Rf
 BMwmPULtPk/yyeaelKHaLC3aPjcQ+1YWG36pO20nMkxr3wQJcGZKDG2tDlOBrFIfUQxTMr
 f8TxGNrlutXIb1o3xk7+9i1GrrOqTqI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-aJ256XCJNTK02b2X8flf8A-1; Thu, 12 Jan 2023 23:42:19 -0500
X-MC-Unique: aJ256XCJNTK02b2X8flf8A-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-15eeaed3f9fso212801fac.19
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 20:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzjMuceZUsuAqTT5Frb+BhVyeW8eQUcC32Zjffvw6wM=;
 b=VwC0W7KQoTmSLgZWXpY9eOM1ATt7haf/0sp+TtCISQDgMc30GbWlg8lBv3iIN4EThC
 Ng0erFhgfN45cuOcarMtODg+KN0npi+lKqOCBxKMCxP5qPSoJnTSuk7w3n75ENJGDyLs
 M80uowox/EOMvJSHrqpYJkbEh7MwPMEgmxp6N708sD2tqys8NVSspDvKKe9QOlGik3k9
 sMAOwoJpRf5DSLmv2n1AV8LRhJNxhT4aEOwgtgkUw7/zz4OMKZlSY0Cb0qMFqF9D+ZRU
 1Bz5u+KxzwkWlzLUKqr8smRE7fsnK+fq0vANi4Ae8kJORcimTtPR+ZJx9tcoDDLb4hYS
 sMkA==
X-Gm-Message-State: AFqh2krqyl6ynHoJCSF7RtIGWG3gaj/ZQ7uoI5SHZvAXrOB3FSg3jCTk
 OOKy7f6MB0Zb7xxlslb7WPTafj6Vbws/esWX/+wObd+bz0/YXk/ilDdJjnaVJ0tly3+wSP6HP7u
 4PLABrmNPlB/Yr8sw/tPwgGnnoXfyCbs=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1332689oab.280.1673584938931; 
 Thu, 12 Jan 2023 20:42:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9uzNnMob9EY3TEpjN4N69YWjl/NxBxcnh3R4yB2wbw/wqZ6dv8JeiqHjG9xfky21ywgVJB/7TMVml/XNJ1i8=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1332680oab.280.1673584938739; Thu, 12
 Jan 2023 20:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-11-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 12:42:07 +0800
Message-ID: <CACGkMEuykwXk+NyDFk63a=Y+-RMpnNLQ--y1FuXqYd6hSgwvtA@mail.gmail.com>
Subject: Re: [RFC v2 10/13] vdpa net: allow VHOST_F_LOG_ALL
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since some actions move to the start function instead of init, the
> device features may not be the parent vdpa device's, but the one
> returned by vhost backend.  If transition to SVQ is supported, the vhost
> backend will return _F_LOG_ALL to signal the device is migratable.
>
> Add VHOST_F_LOG_ALL.  HW dirty page tracking can be added on top of this
> change if the device supports it in the future.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  net/vhost-vdpa.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2ca93e850a..5d7ad6e4d7 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =3D
>      BIT_ULL(VIRTIO_NET_F_MQ) |
>      BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
>      BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> +    /* VHOST_F_LOG_ALL is exposed by SVQ */
> +    BIT_ULL(VHOST_F_LOG_ALL) |
>      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>      BIT_ULL(VIRTIO_NET_F_STANDBY);
>
> --
> 2.31.1
>


