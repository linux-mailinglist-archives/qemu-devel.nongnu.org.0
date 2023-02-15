Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F669839B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:42:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMit-0005MA-42; Wed, 15 Feb 2023 13:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSMir-0005Lt-CB
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSMip-0000V2-CG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676486498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arEL5sI0I4IR8XkpdulrJnEzGnCgcsKYKU0P53pmlDE=;
 b=STsOnQQyIcCY8TX/AC3x8Jf0hxiJ7l9FEm/ysKzJv8ynzuRrmFGdYS6jZDFuWzllWAzpFO
 WM//2xkzdhcbAgFZSp5FTMFRb7t7Ra15P9Lir9mnhRA97to7kWxd27u6gTmhEupbvFfvZr
 45WGjQ10GYF9V6kWcGbRckxIPu4ePw4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-w90Mq-3WMe2O92v3y6nY2A-1; Wed, 15 Feb 2023 13:41:36 -0500
X-MC-Unique: w90Mq-3WMe2O92v3y6nY2A-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-4c11ae6ab25so228518887b3.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arEL5sI0I4IR8XkpdulrJnEzGnCgcsKYKU0P53pmlDE=;
 b=4lImHHiyTY0XoSKjYWjf3hQZWNNKAl1QYweGzbAvVX5XtY7qpG4QNYRZMqNRwPLzNa
 PT2qtkHnldQsBhm4ik7obzZnGLwVB5YW1lQkAa7mUXBu+aXC1kbzstAK30MKE2E9ox0B
 mNlACQLsA9fnb/HZ4rjg1Pg8GLREJA4X1KcAfsHnGEPlYtDxlGOivWnxOW0clS2flHu8
 1mFUCkEqeJMwDvH5/BicxaLDzyhNJkFOh64AQsM7kvZ2lMgeaME2YeICCtImaj+ajZCr
 NU/XKSQpNS5mzsV8tbF5Vj4DRXLF+lZlCubnnuU9wgxVffxkcealBOvSaAqtDcamkDGd
 SUvA==
X-Gm-Message-State: AO0yUKUN0IVOCnQ3QsUOsFYg36PY9gVGJKGmQ5WVApHEk0nt1LjhS/vN
 JU+3JcFeJT5GqPGfJE3nYbtO8J9A7HKRkSHbo8FoVKx7qIRL1YpQ1T8dsr2Q2Lmc6uZ7XPhsp2/
 OTICqAtncdA4WH++aPOJy2RCksBx3YUg=
X-Received: by 2002:a5b:e86:0:b0:874:89a9:c09a with SMTP id
 z6-20020a5b0e86000000b0087489a9c09amr266481ybr.148.1676486495985; 
 Wed, 15 Feb 2023 10:41:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+YsCUl7dM5AfF5JOIBuOUYje1YVuP2ih5FgZ7dciN1iedD3EHscW7fn3ifrY7gMUiJ+N3o5WbS6KWSwMm9B4E=
X-Received: by 2002:a5b:e86:0:b0:874:89a9:c09a with SMTP id
 z6-20020a5b0e86000000b0087489a9c09amr266457ybr.148.1676486495677; Wed, 15 Feb
 2023 10:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <a316e830-3bd8-0127-688e-ca1d9a460f90@amd.com>
In-Reply-To: <a316e830-3bd8-0127-688e-ca1d9a460f90@amd.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 15 Feb 2023 19:40:59 +0100
Message-ID: <CAJaqyWfd9sii4a+dEuNBTtTnbCWgE=BcaH=jnx95zekE-wO=wQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Dynamycally switch to vhost shadow virtqueues at
 vdpa net migration
To: Gautam Dawar <gdawar@amd.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson <snelson@pensando.io>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Feb 10, 2023 at 1:58 PM Gautam Dawar <gdawar@amd.com> wrote:
>
> Hi Eugenio,
>
> I've tested this patch series on Xilinx/AMD SN1022 device without
> control vq and VM Live Migration between two hosts worked fine.
>
> Tested-by: Gautam Dawar <gautam.dawar@amd.com>
>

Thanks for the testing!

>
> Here is some minor feedback:
>
> Pls fix the typo (Dynamycally -> Dynamically) in the Subject.
>
> On 2/8/23 15:12, Eugenio P=C3=A9rez wrote:
> > CAUTION: This message has originated from an External Source. Please us=
e proper judgment and caution when opening attachments, clicking links, or =
responding to this email.
> >
> >
> > It's possible to migrate vdpa net devices if they are shadowed from the
> >
> > start.  But to always shadow the dataplane is to effectively break its =
host
> >
> > passthrough, so its not convenient in vDPA scenarios.
> I believe you meant efficient instead of convenient.
> >
> >
> >
> > This series enables dynamically switching to shadow mode only at
> >
> > migration time.  This allows full data virtqueues passthrough all the
> >
> > time qemu is not migrating.
> >
> >
> >
> > In this series only net devices with no CVQ are migratable.  CVQ adds
> >
> > additional state that would make the series bigger and still had some
> >
> > controversy on previous RFC, so let's split it.
> >
> >
> >
> > The first patch delays the creation of the iova tree until it is really=
 needed,
> >
> > and makes it easier to dynamically move from and to SVQ mode.
> It would help adding some detail on the iova tree being referred to here.
> >
> >
> >
> > Next patches from 02 to 05 handle the suspending and getting of vq stat=
e (base)
> >
> > of the device at the switch to SVQ mode.  The new _F_SUSPEND feature is
> >
> > negotiated and stop device flow is changed so the state can be fetched =
trusting
> >
> > the device will not modify it.
> >
> >
> >
> > Since vhost backend must offer VHOST_F_LOG_ALL to be migratable, last p=
atches
> >
> > but the last one add the needed migration blockers so vhost-vdpa can of=
fer it
>
> "last patches but the last one"?
>

I think I solved all of the above in v3, thanks for notifying them!

Would it be possible to test with v3 too?

> Thanks.
>
> >
> > safely.  They also add the handling of this feature.
> >
> >
> >
> > Finally, the last patch makes virtio vhost-vdpa backend to offer
> >
> > VHOST_F_LOG_ALL so qemu migrate the device as long as no other blocker =
has been
> >
> > added.
> >
> >
> >
> > Successfully tested with vdpa_sim_net with patch [1] applied and with t=
he qemu
> >
> > emulated device with vp_vdpa with some restrictions:
> >
> > * No CVQ. No feature that didn't work with SVQ previously (packed, ...)
> >
> > * VIRTIO_RING_F_STATE patches implementing [2].
> >
> > * Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like
> >
> >    DPDK.
> >
> >
> >
> > Comments are welcome.
> >
> >
> >
> > v2:
> >
> > - Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is e=
mpty at
> >
> >    the check moment.
> >
> >
> >
> > v1:
> >
> > - Omit all code working with CVQ and block migration if the device supp=
orts
> >
> >    CVQ.
> >
> > - Remove spurious kick.
> Even with the spurious kick, datapath didn't resume at destination VM
> after LM as kick happened before DRIVER_OK. So IMO, it will be required
> that the vdpa parent driver simulates a kick after creating/starting HW
> rings.

Right, it did not solve the issue.

If I'm not wrong all vdpa drivers are moving to that model, checking
for new avail descriptors right after DRIVER_OK. Maybe it is better to
keep this discussion at patch 12/13 on RFC v2?

Thanks!

> >
> > - Move all possible checks for migration to vhost-vdpa instead of the n=
et
> >
> >    backend. Move them to init code from start code.
> >
> > - Suspend on vhost_vdpa_dev_start(false) instead of in vhost-vdpa net b=
ackend.
> >
> > - Properly split suspend after geting base and adding of status_reset p=
atches.
> >
> > - Add possible TODOs to points where this series can improve in the fut=
ure.
> >
> > - Check the state of migration using migration_in_setup and
> >
> >    migration_has_failed instead of checking all the possible migration =
status in
> >
> >    a switch.
> >
> > - Add TODO with possible low hand fruit using RESUME ops.
> >
> > - Always offer _F_LOG from virtio/vhost-vdpa and let migration blockers=
 do
> >
> >    their thing instead of adding a variable.
> >
> > - RFC v2 at https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02=
574.html
> >
> >
> >
> > RFC v2:
> >
> > - Use a migration listener instead of a memory listener to know when
> >
> >    the migration starts.
> >
> > - Add stuff not picked with ASID patches, like enable rings after
> >
> >    driver_ok
> >
> > - Add rewinding on the migration src, not in dst
> >
> > - RFC v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01=
664.html
> >
> >
> >
> > [1] https://lore.kernel.org/lkml/20230203142501.300125-1-eperezma@redha=
t.com/T/
> >
> > [2] https://lists.oasis-open.org/archives/virtio-comment/202103/msg0003=
6.html
> >
> >
> >
> > Eugenio P=C3=A9rez (13):
> >
> >    vdpa net: move iova tree creation from init to start
> >
> >    vdpa: Negotiate _F_SUSPEND feature
> >
> >    vdpa: add vhost_vdpa_suspend
> >
> >    vdpa: move vhost reset after get vring base
> >
> >    vdpa: rewind at get_base, not set_base
> >
> >    vdpa net: allow VHOST_F_LOG_ALL
> >
> >    vdpa: add vdpa net migration state notifier
> >
> >    vdpa: disable RAM block discard only for the first device
> >
> >    vdpa net: block migration if the device has CVQ
> >
> >    vdpa: block migration if device has unsupported features
> >
> >    vdpa: block migration if dev does not have _F_SUSPEND
> >
> >    vdpa: block migration if SVQ does not admit a feature
> >
> >    vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices
> >
> >
> >
> >   include/hw/virtio/vhost-backend.h |   4 +
> >
> >   hw/virtio/vhost-vdpa.c            | 126 +++++++++++++++-----
> >
> >   hw/virtio/vhost.c                 |   3 +
> >
> >   net/vhost-vdpa.c                  | 192 +++++++++++++++++++++++++----=
-
> >
> >   hw/virtio/trace-events            |   1 +
> >
> >   5 files changed, 267 insertions(+), 59 deletions(-)
> >
> >
> >
> > --
> >
> > 2.31.1
> >
> >
> >
> >
>


