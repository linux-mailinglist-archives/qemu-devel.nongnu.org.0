Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC236A41EE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:45:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcoy-0005lZ-Hl; Mon, 27 Feb 2023 07:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvaro.karsz@solid-run.com>)
 id 1pWcoA-0005Ij-A7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:40:55 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alvaro.karsz@solid-run.com>)
 id 1pWco5-0001m4-W2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:40:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id ce7so3415649pfb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2jhasNjoy802hJ5uR0TgTEFUPCoR2lDLD3l4YCiU10=;
 b=QW7wHSpafPjwd7TaL6/+tHtP86DxIsIbik99Z/cop3ea1f+RrzBqosm4H3vmFA30lI
 YmsHN6qenC29DXU/HQ3jnGx8SD7JJbXF/Ky/dqmr/dTWDpLd3ZUsMmXwmxAE6W934pmz
 4Qgcuo2iVRLxIGv+g4wcE3qLmpT9gQ4coJTRdnGumpINYXl8mXn+mVrHYE/Y/r53y6wx
 5IzYxpNImD1nXBFXcBeIahdFrH3Zm/S0MmqTDTtHfho8cEGKbthiWVOG6XhMYpUY1Zhi
 Wc78RDevYI5Q7B8869hWX2HaZvvgtlubgAcuQ8i7EPNwxkqcufYKA99vskYotgIAPucW
 kVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2jhasNjoy802hJ5uR0TgTEFUPCoR2lDLD3l4YCiU10=;
 b=VRnZmB83T8pz3qzzRuCLIXUWyBr/yp8TZNRSYOzRGhnXrTV3u/we3KJ+C5iwxSlDTS
 Ts5cvPnX2gjdcM0uRAtz9ofUolLKC8P40rz42l4RwqQ+U921aMDdhT58czm7cXFeu7Dk
 Z01sWhqlOfRw1woN+vzhdWTNbHCm3EbY0X0cRcg73Tv2JvGFj6K7C40fWN+QVMyaPnR1
 voCJC56rm6D+VKLq8lIwG9QXkhuof++bRNXmmucZAbuxkBsWDRetZIzN/5VXZHWyKStf
 H+x0wqsc2HGY9UiTjjoXuB4yDvkoSDDmpXiCesrrEPeH7RJ/ft73c6Eu9gh1GIeCeGF/
 uqfA==
X-Gm-Message-State: AO0yUKV0MqWKaBoyshVq+msQlWEq9N1Yx4qJnw9kzj1xezcFsWRTIcy1
 c7bX0UjoO7APdmVIrca/uZIGigyz5/lrmAZn4OaQEg==
X-Google-Smtp-Source: AK7set/YVkPThBzFKuxa/rdrEXhC1I+scq6HJaE9jiZU7WaOxbb5GKqwj45Rl6til8gIhoy8jWB+6rkrowSffmrJEgg=
X-Received: by 2002:a63:364a:0:b0:4ff:6b33:5a3a with SMTP id
 d71-20020a63364a000000b004ff6b335a3amr5777628pga.2.1677501638125; Mon, 27 Feb
 2023 04:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
In-Reply-To: <20230224155438.112797-1-eperezma@redhat.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Mon, 27 Feb 2023 14:40:01 +0200
Message-ID: <CAJs=3_CirpgqNNXxPNmcHmEpmPn01ef9h-Xcinmd_DDtp3Md4Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] Dynamically switch to vhost shadow virtqueues at
 vdpa net migration
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Jason Wang <jasowang@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=2607:f8b0:4864:20::434;
 envelope-from=alvaro.karsz@solid-run.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

>
> It's possible to migrate vdpa net devices if they are shadowed from the
> start.  But to always shadow the dataplane is to effectively break its ho=
st
> passthrough, so its not efficient in vDPA scenarios.
>
> This series enables dynamically switching to shadow mode only at
> migration time.  This allows full data virtqueues passthrough all the
> time qemu is not migrating.
>
> In this series only net devices with no CVQ are migratable.  CVQ adds
> additional state that would make the series bigger and still had some
> controversy on previous RFC, so let's split it.
>
> Successfully tested with vdpa_sim_net with patch [1] applied and with the=
 qemu
> emulated device with vp_vdpa with some restrictions:
> * No CVQ. No feature that didn't work with SVQ previously (packed, ...)
> * VIRTIO_RING_F_STATE patches implementing [2].
> * Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like
>   DPDK.
>
> Previous versions were tested by many vendors. Not carrying Tested-by bec=
ause
> of code changes, so re-testing would be appreciated.
>
> Comments are welcome.
>
> v4:
> - Recover used_idx from guest's vring if device cannot suspend.
> - Fix starting device in the middle of a migration.  Removed some
>   duplication in setting / clearing enable_shadow_vqs and shadow_data
>   members of vhost_vdpa.
> - Fix (again) "Check for SUSPEND in vhost_dev.backend_cap, as
>   .backend_features is empty at the check moment.". It was reverted by
>   mistake in v3.
> - Fix memory leak of iova tree.
> - Properly rewind SVQ as in flight descriptors were still being accounted
>   in vq base.
> - Expand documentation.
>
> v3:
> - Start datapatch in SVQ in device started while migrating.
> - Properly register migration blockers if device present unsupported feat=
ures.
> - Fix race condition because of not stopping the SVQ until device cleanup=
.
> - Explain purpose of iova tree in the first patch message.
> - s/dynamycally/dynamically/ in cover letter.
> - at lore.kernel.org/qemu-devel/20230215173850.298832-14-eperezma@redhat.=
com
>
> v2:
> - Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is emp=
ty at
>   the check moment.
> - at https://lore.kernel.org/all/20230208094253.702672-12-eperezma@redhat=
.com/T/
>
> v1:
> - Omit all code working with CVQ and block migration if the device suppor=
ts
>   CVQ.
> - Remove spurious kick.
> - Move all possible checks for migration to vhost-vdpa instead of the net
>   backend. Move them to init code from start code.
> - Suspend on vhost_vdpa_dev_start(false) instead of in vhost-vdpa net bac=
kend.
> - Properly split suspend after geting base and adding of status_reset pat=
ches.
> - Add possible TODOs to points where this series can improve in the futur=
e.
> - Check the state of migration using migration_in_setup and
>   migration_has_failed instead of checking all the possible migration sta=
tus in
>   a switch.
> - Add TODO with possible low hand fruit using RESUME ops.
> - Always offer _F_LOG from virtio/vhost-vdpa and let migration blockers d=
o
>   their thing instead of adding a variable.
> - RFC v2 at https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg0257=
4.html
>
> RFC v2:
> - Use a migration listener instead of a memory listener to know when
>   the migration starts.
> - Add stuff not picked with ASID patches, like enable rings after
>   driver_ok
> - Add rewinding on the migration src, not in dst
> - RFC v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg0166=
4.html
>
> [1] https://lore.kernel.org/lkml/20230203142501.300125-1-eperezma@redhat.=
com/T/
> [2] https://lists.oasis-open.org/archives/virtio-comment/202103/msg00036.=
html
>
> Eugenio P=C3=A9rez (15):
>   vdpa net: move iova tree creation from init to start
>   vdpa: Remember last call fd set
>   vdpa: stop svq at vhost_vdpa_dev_start(false)
>   vdpa: Negotiate _F_SUSPEND feature
>   vdpa: move vhost reset after get vring base
>   vdpa: add vhost_vdpa->suspended parameter
>   vdpa: add vhost_vdpa_suspend
>   vdpa: rewind at get_base, not set_base
>   vdpa: add vdpa net migration state notifier
>   vdpa: disable RAM block discard only for the first device
>   vdpa net: block migration if the device has CVQ
>   vdpa: block migration if device has unsupported features
>   vdpa: block migration if SVQ does not admit a feature
>   vdpa net: allow VHOST_F_LOG_ALL
>   vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices
>
>  include/hw/virtio/vhost-backend.h  |   4 +
>  include/hw/virtio/vhost-vdpa.h     |   3 +
>  hw/virtio/vhost-shadow-virtqueue.c |   8 +-
>  hw/virtio/vhost-vdpa.c             | 128 +++++++++++++------
>  hw/virtio/vhost.c                  |   3 +
>  net/vhost-vdpa.c                   | 198 ++++++++++++++++++++++++-----
>  hw/virtio/trace-events             |   1 +
>  7 files changed, 273 insertions(+), 72 deletions(-)
>
> --

The migration works with SolidNET DPU.

Tested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>

