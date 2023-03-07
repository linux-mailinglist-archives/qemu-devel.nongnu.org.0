Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D36ADC02
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUcc-0006eq-BV; Tue, 07 Mar 2023 05:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pZUcW-0006ck-Gb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pZUcU-0004rH-5y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678185152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aXnRiOh3M1SzPrYPDP4EGQytN7V6oleRtDBVCqbpuzs=;
 b=NSBPa1A3NC9TrgA4Kb+A7O7QorVQIbtuX+TTjWaZBxMkHguDqhpaB3/p5YbtMvDUQABvqu
 Jvs0hjlq8K8BdRqkaXc1LMYmyiYac440cYu1+rLqiJglWay+YhQy9Dy7NiYBw9NyRFsH8v
 jkfNWHyjuLkaXn0oPNwYg+tndubvY8M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-T-997DhaMqi9n_R_xGU1-A-1; Tue, 07 Mar 2023 05:32:31 -0500
X-MC-Unique: T-997DhaMqi9n_R_xGU1-A-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso18257158edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678185150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aXnRiOh3M1SzPrYPDP4EGQytN7V6oleRtDBVCqbpuzs=;
 b=o09v4MpKEvrvXDJIOv7Oh+LLvBwlkX8SKGkj3COIA+q1TOWyBFb1Ay4QQ910LCbuqO
 sghDEB8RrRpxC4VPWDeySjaUvYweTeG9DQ5LNhbct54j+eZS+sfjKBZAFbGxuXBcYyub
 mKYXA5VG4JcsNCDySut7F0mapIe2SBUzONubNa7xsKuGB/Pf3XV/4nZCkWhJ1pnBhqpm
 bde34+GGdOHXrefM+Jp9aKXtgKtyBnRwHCjZ75ZNY8W3tzISkGg1mcIYznTWWXDNBLNY
 iRDlc9EvK7h7hgSTSKFNADug3gfI1FCoRdMK65JhRD+eZXyGnXpBI8P01z2fKsFwhKPI
 Q2Wg==
X-Gm-Message-State: AO0yUKV8sB7u98MWaQH4gXkWSX9Trwr76Zx6epiltU3WscAzFndtbmFg
 prKWwTiq7VRjZ5I1LvRiYasFpYIET5XY0r+7Xt0PO1xJMVvRk1910Iq/Bq8yQZtITpkZOVz3+jS
 +ywnGfWUoVKMflFgkZ3jkv/GaYYMQvsU=
X-Received: by 2002:a50:d08d:0:b0:4bf:bec0:b865 with SMTP id
 v13-20020a50d08d000000b004bfbec0b865mr7734805edd.3.1678185150283; 
 Tue, 07 Mar 2023 02:32:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/iXpb3NVE4c/u/uovjV/IlrZvvWUZvtTJE0tPg+C8DtAkBeSltT0UykbLCKR2UWtFJ3ISjV0AEjPSRM+RSD9E=
X-Received: by 2002:a50:d08d:0:b0:4bf:bec0:b865 with SMTP id
 v13-20020a50d08d000000b004bfbec0b865mr7734773edd.3.1678185149939; Tue, 07 Mar
 2023 02:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20230303172445.1089785-1-eperezma@redhat.com>
In-Reply-To: <20230303172445.1089785-1-eperezma@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 7 Mar 2023 18:31:53 +0800
Message-ID: <CAPpAL=yeujo8DBySEcNavWTf2_S8oPY_DfBkFkcO=w-NH-VUeA@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] Dynamically switch to vhost shadow virtqueues at
 vdpa net migration
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Shannon Nelson <snelson@pensando.io>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>, 
 si-wei.liu@oracle.com, longpeng2@huawei.com, Jason Wang <jasowang@redhat.com>, 
 alvaro.karsz@solid-run.com, Stefan Hajnoczi <stefanha@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000bad34705f64cede0"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000bad34705f64cede0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

QE tested this series's V5 again. Creating two vdpa_sim device, and boot
two VMs without shadow virtqueues. The migration was successful and
everything worked fine.

Tested-by: Lei Yang <leiyang@redhat.com>

Eugenio P=C3=A9rez <eperezma@redhat.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=884=
=E6=97=A5=E5=91=A8=E5=85=AD 01:24=E5=86=99=E9=81=93=EF=BC=9A

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
> Successfully tested with vdpa_sim_net with patch [1] applied and with the
> qemu
> emulated device with vp_vdpa with some restrictions:
> * No CVQ. No feature that didn't work with SVQ previously (packed, ...)
> * VIRTIO_RING_F_STATE patches implementing [2].
>
> Previous versions were tested by many vendors. Not carrying Tested-by
> because
> of code changes, so re-testing would be appreciated.
>
> A ready to clone tag named vdpa.d/stop-nocvq-v5 with this version of the
> series
> is available at https://gitlab.com/eperezmartin/qemu-kvm.git, with the
> commit
> 863d54ff00c558ffe54ed2c7ee148ab7f89d4864 ("vdpa: return VHOST_F_LOG_ALL i=
n
> vhost-vdpa devices").
>
> Comments are welcome.
>
> v5:
> - Reverse SUSPEND polarity check, as qemu was never suspending devices wi=
th
>   suspend capability.
> - Reorder suspend patch so it comes before the reset reorder after
>   get_vring_base.
> - Remove patch to stop SVQ at vdpa stop, already present in staging
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
> - Properly register migration blockers if device present unsupported
> features.
> - Fix race condition because of not stopping the SVQ until device cleanup=
.
> - Explain purpose of iova tree in the first patch message.
> - s/dynamycally/dynamically/ in cover letter.
> - at
> lore.kernel.org/qemu-devel/20230215173850.298832-14-eperezma@redhat.com
>
> v2:
> - Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is
> empty at
>   the check moment.
> - at
> https://lore.kernel.org/all/20230208094253.702672-12-eperezma@redhat.com/=
T/
>
> v1:
> - Omit all code working with CVQ and block migration if the device suppor=
ts
>   CVQ.
> - Remove spurious kick.
> - Move all possible checks for migration to vhost-vdpa instead of the net
>   backend. Move them to init code from start code.
> - Suspend on vhost_vdpa_dev_start(false) instead of in vhost-vdpa net
> backend.
> - Properly split suspend after geting base and adding of status_reset
> patches.
> - Add possible TODOs to points where this series can improve in the futur=
e.
> - Check the state of migration using migration_in_setup and
>   migration_has_failed instead of checking all the possible migration
> status in
>   a switch.
> - Add TODO with possible low hand fruit using RESUME ops.
> - Always offer _F_LOG from virtio/vhost-vdpa and let migration blockers d=
o
>   their thing instead of adding a variable.
> - RFC v2 at
> https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02574.html
>
> RFC v2:
> - Use a migration listener instead of a memory listener to know when
>   the migration starts.
> - Add stuff not picked with ASID patches, like enable rings after
>   driver_ok
> - Add rewinding on the migration src, not in dst
> - RFC v1 at
> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.html
>
> [1]
> https://lore.kernel.org/lkml/20230203142501.300125-1-eperezma@redhat.com/=
T/
> [2]
> https://lists.oasis-open.org/archives/virtio-comment/202103/msg00036.html
>
> Eugenio P=C3=A9rez (14):
>   vdpa net: move iova tree creation from init to start
>   vdpa: Remember last call fd set
>   vdpa: Negotiate _F_SUSPEND feature
>   vdpa: rewind at get_base, not set_base
>   vdpa: add vhost_vdpa->suspended parameter
>   vdpa: add vhost_vdpa_suspend
>   vdpa: move vhost reset after get vring base
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
>  hw/virtio/vhost-vdpa.c             | 126 ++++++++++++------
>  hw/virtio/vhost.c                  |   3 +
>  net/vhost-vdpa.c                   | 198 ++++++++++++++++++++++++-----
>  hw/virtio/trace-events             |   1 +
>  7 files changed, 272 insertions(+), 71 deletions(-)
>
> --
> 2.31.1
>
>
>

--000000000000bad34705f64cede0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">QE tested this series&#39;s V5 again. Creating=C2=A0two vd=
pa_sim device, and boot two VMs without shadow virtqueues. The migration wa=
s successful and everything worked fine.<div><br></div><div>Tested-by: Lei =
Yang &lt;<a href=3D"mailto:leiyang@redhat.com">leiyang@redhat.com</a>&gt;<b=
r><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Euge=
nio P=C3=A9rez &lt;<a href=3D"mailto:eperezma@redhat.com" target=3D"_blank"=
>eperezma@redhat.com</a>&gt; =E4=BA=8E2023=E5=B9=B43=E6=9C=884=E6=97=A5=E5=
=91=A8=E5=85=AD 01:24=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">It&#39;s possible to migrate vdpa net devi=
ces if they are shadowed from the<br>
start.=C2=A0 But to always shadow the dataplane is to effectively break its=
 host<br>
passthrough, so its not efficient in vDPA scenarios.<br>
<br>
This series enables dynamically switching to shadow mode only at<br>
migration time.=C2=A0 This allows full data virtqueues passthrough all the<=
br>
time qemu is not migrating.<br>
<br>
In this series only net devices with no CVQ are migratable.=C2=A0 CVQ adds<=
br>
additional state that would make the series bigger and still had some<br>
controversy on previous RFC, so let&#39;s split it.<br>
<br>
Successfully tested with vdpa_sim_net with patch [1] applied and with the q=
emu<br>
emulated device with vp_vdpa with some restrictions:<br>
* No CVQ. No feature that didn&#39;t work with SVQ previously (packed, ...)=
<br>
* VIRTIO_RING_F_STATE patches implementing [2].<br>
<br>
Previous versions were tested by many vendors. Not carrying Tested-by becau=
se<br>
of code changes, so re-testing would be appreciated.<br>
<br>
A ready to clone tag named vdpa.d/stop-nocvq-v5 with this version of the se=
ries<br>
is available at <a href=3D"https://gitlab.com/eperezmartin/qemu-kvm.git" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/eperezmartin/qemu-kvm=
.git</a>, with the commit<br>
863d54ff00c558ffe54ed2c7ee148ab7f89d4864 (&quot;vdpa: return VHOST_F_LOG_AL=
L in<br>
vhost-vdpa devices&quot;).<br>
<br>
Comments are welcome.<br>
<br>
v5:<br>
- Reverse SUSPEND polarity check, as qemu was never suspending devices with=
<br>
=C2=A0 suspend capability.<br>
- Reorder suspend patch so it comes before the reset reorder after<br>
=C2=A0 get_vring_base.<br>
- Remove patch to stop SVQ at vdpa stop, already present in staging<br>
<br>
v4:<br>
- Recover used_idx from guest&#39;s vring if device cannot suspend.<br>
- Fix starting device in the middle of a migration.=C2=A0 Removed some<br>
=C2=A0 duplication in setting / clearing enable_shadow_vqs and shadow_data<=
br>
=C2=A0 members of vhost_vdpa.<br>
- Fix (again) &quot;Check for SUSPEND in vhost_dev.backend_cap, as<br>
=C2=A0 .backend_features is empty at the check moment.&quot;. It was revert=
ed by<br>
=C2=A0 mistake in v3.<br>
- Fix memory leak of iova tree.<br>
- Properly rewind SVQ as in flight descriptors were still being accounted<b=
r>
=C2=A0 in vq base.<br>
- Expand documentation.<br>
<br>
v3:<br>
- Start datapatch in SVQ in device started while migrating.<br>
- Properly register migration blockers if device present unsupported featur=
es.<br>
- Fix race condition because of not stopping the SVQ until device cleanup.<=
br>
- Explain purpose of iova tree in the first patch message.<br>
- s/dynamycally/dynamically/ in cover letter.<br>
- at <a href=3D"http://lore.kernel.org/qemu-devel/20230215173850.298832-14-=
eperezma@redhat.com" rel=3D"noreferrer" target=3D"_blank">lore.kernel.org/q=
emu-devel/20230215173850.298832-14-eperezma@redhat.com</a><br>
<br>
v2:<br>
- Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is empty=
 at<br>
=C2=A0 the check moment.<br>
- at <a href=3D"https://lore.kernel.org/all/20230208094253.702672-12-eperez=
ma@redhat.com/T/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/all/20230208094253.702672-12-eperezma@redhat.com/T/</a><br>
<br>
v1:<br>
- Omit all code working with CVQ and block migration if the device supports=
<br>
=C2=A0 CVQ.<br>
- Remove spurious kick.<br>
- Move all possible checks for migration to vhost-vdpa instead of the net<b=
r>
=C2=A0 backend. Move them to init code from start code.<br>
- Suspend on vhost_vdpa_dev_start(false) instead of in vhost-vdpa net backe=
nd.<br>
- Properly split suspend after geting base and adding of status_reset patch=
es.<br>
- Add possible TODOs to points where this series can improve in the future.=
<br>
- Check the state of migration using migration_in_setup and<br>
=C2=A0 migration_has_failed instead of checking all the possible migration =
status in<br>
=C2=A0 a switch.<br>
- Add TODO with possible low hand fruit using RESUME ops.<br>
- Always offer _F_LOG from virtio/vhost-vdpa and let migration blockers do<=
br>
=C2=A0 their thing instead of adding a variable.<br>
- RFC v2 at <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-0=
1/msg02574.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org=
/archive/html/qemu-devel/2023-01/msg02574.html</a><br>
<br>
RFC v2:<br>
- Use a migration listener instead of a memory listener to know when<br>
=C2=A0 the migration starts.<br>
- Add stuff not picked with ASID patches, like enable rings after<br>
=C2=A0 driver_ok<br>
- Add rewinding on the migration src, not in dst<br>
- RFC v1 at <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-0=
8/msg01664.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org=
/archive/html/qemu-devel/2022-08/msg01664.html</a><br>
<br>
[1] <a href=3D"https://lore.kernel.org/lkml/20230203142501.300125-1-eperezm=
a@redhat.com/T/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.o=
rg/lkml/20230203142501.300125-1-eperezma@redhat.com/T/</a><br>
[2] <a href=3D"https://lists.oasis-open.org/archives/virtio-comment/202103/=
msg00036.html" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-ope=
n.org/archives/virtio-comment/202103/msg00036.html</a><br>
<br>
Eugenio P=C3=A9rez (14):<br>
=C2=A0 vdpa net: move iova tree creation from init to start<br>
=C2=A0 vdpa: Remember last call fd set<br>
=C2=A0 vdpa: Negotiate _F_SUSPEND feature<br>
=C2=A0 vdpa: rewind at get_base, not set_base<br>
=C2=A0 vdpa: add vhost_vdpa-&gt;suspended parameter<br>
=C2=A0 vdpa: add vhost_vdpa_suspend<br>
=C2=A0 vdpa: move vhost reset after get vring base<br>
=C2=A0 vdpa: add vdpa net migration state notifier<br>
=C2=A0 vdpa: disable RAM block discard only for the first device<br>
=C2=A0 vdpa net: block migration if the device has CVQ<br>
=C2=A0 vdpa: block migration if device has unsupported features<br>
=C2=A0 vdpa: block migration if SVQ does not admit a feature<br>
=C2=A0 vdpa net: allow VHOST_F_LOG_ALL<br>
=C2=A0 vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices<br>
<br>
=C2=A0include/hw/virtio/vhost-backend.h=C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0include/hw/virtio/vhost-vdpa.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<b=
r>
=C2=A0hw/virtio/vhost-shadow-virtqueue.c |=C2=A0 =C2=A08 +-<br>
=C2=A0hw/virtio/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 126 ++++++++++++------<br>
=C2=A0hw/virtio/vhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0net/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 198 ++++++++++++++++++++++++-----<br>
=C2=A0hw/virtio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A07 files changed, 272 insertions(+), 71 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000bad34705f64cede0--


