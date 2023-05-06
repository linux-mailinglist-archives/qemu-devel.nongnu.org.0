Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5CC6F8E06
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 04:26:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv7bh-0008Qo-Or; Fri, 05 May 2023 22:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pv7bb-0008Ou-Hy
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:25:03 -0400
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pv7bY-00055X-BR
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:25:03 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VhrSzSM_1683339887; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VhrSzSM_1683339887) by smtp.aliyun-inc.com;
 Sat, 06 May 2023 10:24:48 +0800
Message-ID: <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Date: Sat, 6 May 2023 10:13:36 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
References: <20230504101447.389398-1-eperezma@redhat.com>
In-Reply-To: <20230504101447.389398-1-eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9rez?=3D =
<eperezma@redhat.com> wrote:
> The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
> unconditionally vq reset feature as long as the device is emulated.
> This makes impossible to actually disable the feature, and it causes
> migration problems from qemu version previous than 7.2.
>
> The entire final commit is unneeded as device system already enable or
> disable the feature properly.
>
> This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> ---
> Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
> enabling and disabling queue_reset virtio-net feature and vhost=3Don/off
> on net device backend.

Do you mean that this feature cannot be closed?

I tried to close in the guest, it was successful.

In addition, in this case, could you try to repair the problem instead of
directly revert.

Thanks.

> ---
>  hw/net/virtio-net.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 53e1c32643..4ea33b6e2e 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -805,7 +805,6 @@ static uint64_t virtio_net_get_features(VirtIODevice =
*vdev, uint64_t features,
>      }
>
>      if (!get_vhost_net(nc->peer)) {
> -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
>          return features;
>      }
>
> --
> 2.31.1
>

