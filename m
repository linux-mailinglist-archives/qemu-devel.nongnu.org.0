Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1476FA395
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 11:47:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxQh-0004yV-AF; Mon, 08 May 2023 05:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pvxQd-0004wo-Eh
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:45:11 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pvxQa-0007iH-KU
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:45:11 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0Vi3KeUI_1683539100; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vi3KeUI_1683539100) by smtp.aliyun-inc.com;
 Mon, 08 May 2023 17:45:01 +0800
Message-ID: <1683539043.765612-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Date: Mon, 8 May 2023 17:44:03 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
In-Reply-To: <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

On Mon, 8 May 2023 11:09:46 +0200, Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> On Sat, May 6, 2023 at 4:25=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.=
com> wrote:
> >
> > On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9rez?=
=3D <eperezma@redhat.com> wrote:
> > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enabl=
es
> > > unconditionally vq reset feature as long as the device is emulated.
> > > This makes impossible to actually disable the feature, and it causes
> > > migration problems from qemu version previous than 7.2.
> > >
> > > The entire final commit is unneeded as device system already enable or
> > > disable the feature properly.
> > >
> > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> > > ---
> > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/featur=
es
> > > enabling and disabling queue_reset virtio-net feature and vhost=3Don/=
off
> > > on net device backend.
> >
> > Do you mean that this feature cannot be closed?
> >
> > I tried to close in the guest, it was successful.
> >
>
> I'm not sure what you mean with close. If the device dataplane is
> emulated in qemu (vhost=3Doff), I'm not able to make the device not
> offer it.
>
> > In addition, in this case, could you try to repair the problem instead =
of
> > directly revert.
> >
>
> I'm not following this. The revert is not to always disable the feature.
>
> By default, the feature is enabled. If cmdline states queue_reset=3Don,
> the feature is enabled. That is true both before and after applying
> this patch.
>
> However, in qemu master, queue_reset=3Doff keeps enabling this feature
> on the device. It happens that there is a commit explicitly doing
> that, so I'm reverting it.
>
> Let me know if that makes sense to you.

I got it.

Looks like it's indeed a bug.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Thanks.


>
> Thanks!
>

