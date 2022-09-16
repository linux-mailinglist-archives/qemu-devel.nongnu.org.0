Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FA5BAE84
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 15:49:03 +0200 (CEST)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZBiI-0001gF-FA
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 09:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oZBfz-00006I-55
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 09:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oZBfu-0004HG-Vl
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 09:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663335991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVQkxGKCXGgLwSrFgEmMU1bfAwvlcNA9HHORbU/p9Q8=;
 b=bCN7fG9cex0C37OwSuzDxRsdPVvlPMmDpxEV3lYSgPUUhOo2WG2Vi24PfsuQoe9DFiPR9V
 UmBfDs+/dPkEVO3SoTPIO2LsD1Fm80x4lrOUahZNznTZbNMEe/it75MdKfM36eUQazJxc6
 /sj3f7rUIYEHdIte4DGV49RUGo8DLPQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-tg8mYyGBMsGnA3Q9hDFzTg-1; Fri, 16 Sep 2022 09:46:29 -0400
X-MC-Unique: tg8mYyGBMsGnA3Q9hDFzTg-1
Received: by mail-pf1-f197.google.com with SMTP id
 g24-20020a056a00079800b0054b1a110543so987096pfu.2
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 06:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oVQkxGKCXGgLwSrFgEmMU1bfAwvlcNA9HHORbU/p9Q8=;
 b=qmfyCYWjb1PMoFaEMn2bluee17OnZSVCXrGycLwiGPessXVd9KFWUJleXjnKuCbvGZ
 eORfkysqBoHZNgKeFll4Jv/bU3yTFzY9hVhzLrqnfZv4VizamV6bI65Nlq2FZOZwF76G
 41gOLVvsFlMXUsCgxygNp+ZryrsmNqRQ7/ASUbmHPB5nJMI7VtwPTDu6SxJ3xswtGXFt
 ICPL2EWMxNy1VCz8czms3qhpF5CI8dP6DL/epFUF2pid5EY3W4BiTR0zF/+0QtokD3mT
 MNTNZO/IFvJ8EVuvlTzff2OvL2lgowymf9L/yApm2Za9fYv3cjor30GzEbWczzkDVOHk
 cPRg==
X-Gm-Message-State: ACrzQf01IV6ohXqfooqtwbEaX6eL13XsSM/9MeAu2BLuhFOFMbj811sv
 uMtZV1fELeUG5Hr5toMGaWaN33488tRK6+leVsOAGRAbeA32xq+QFjOX8RSpG09dJPZ8xY+pQ6k
 fE7kaezvWksNWeaMGR7O5u82qMsxLZKQ=
X-Received: by 2002:a17:90a:9f96:b0:1fa:b4fb:6297 with SMTP id
 o22-20020a17090a9f9600b001fab4fb6297mr5720961pjp.80.1663335988756; 
 Fri, 16 Sep 2022 06:46:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Y+F/vTVK98SNMRwea80YPgKOc0FC/jCmI9tleCoZQhjtwYnrdinxwY3cgPnRpe9uMlWNCg7BXyQNJD4sxgE0=
X-Received: by 2002:a17:90a:9f96:b0:1fa:b4fb:6297 with SMTP id
 o22-20020a17090a9f9600b001fab4fb6297mr5720919pjp.80.1663335988436; Fri, 16
 Sep 2022 06:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
 <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
 <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
In-Reply-To: <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 16 Sep 2022 15:45:52 +0200
Message-ID: <CAJaqyWcJ9Ci5=0jw_WcVuY27mG+H7uUq_imkV3+CWycCEt_h8A@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 14, 2022 at 5:44 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 9/14/2022 2:57 PM, Eugenio Perez Martin wrote:
> > On Wed, Sep 14, 2022 at 1:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 9/14/2022 3:20 AM, Jason Wang wrote:
> >>> On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.=
com> wrote:
> >>>> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>>> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>>> On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> >>>>>>> To have enabled vlans at device startup may happen in the destina=
tion of
> >>>>>>> a live migration, so this configuration must be restored.
> >>>>>>>
> >>>>>>> At this moment the code is not accessible, since SVQ refuses to s=
tart if
> >>>>>>> vlan feature is exposed by the device.
> >>>>>>>
> >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>>>> ---
> >>>>>>>    net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++=
++++--
> >>>>>>>    1 file changed, 44 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>>>> index 4bc3fd01a8..ecbfd08eb9 100644
> >>>>>>> --- a/net/vhost-vdpa.c
> >>>>>>> +++ b/net/vhost-vdpa.c
> >>>>>>> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_feature=
s =3D
> >>>>>>>        BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >>>>>>>        BIT_ULL(VIRTIO_NET_F_STANDBY);
> >>>>>>>
> >>>>>>> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> >>>>>>> +
> >>>>>>>    VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >>>>>>>    {
> >>>>>>>        VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>>>>>> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAS=
tate *s,
> >>>>>>>        return *s->status !=3D VIRTIO_NET_OK;
> >>>>>>>    }
> >>>>>>>
> >>>>>>> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> >>>>>>> +                                           const VirtIONet *n,
> >>>>>>> +                                           uint16_t vid)
> >>>>>>> +{
> >>>>>>> +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NE=
T_CTRL_VLAN,
> >>>>>>> +                                                  VIRTIO_NET_CTR=
L_VLAN_ADD,
> >>>>>>> +                                                  &vid, sizeof(v=
id));
> >>>>>>> +    if (unlikely(dev_written < 0)) {
> >>>>>>> +        return dev_written;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> >>>>>>> +        return -EINVAL;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> >>>>>>> +                                    const VirtIONet *n)
> >>>>>>> +{
> >>>>>>> +    uint64_t features =3D n->parent_obj.guest_features;
> >>>>>>> +
> >>>>>>> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> >>>>>>> +        return 0;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> >>>>>>> +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> >>>>>>> +            if (n->vlans[i] & (1U << j)) {
> >>>>>>> +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, =
(i << 5) + j);
> >>>>>> This seems to cause a lot of latency if the driver has a lot of vl=
ans.
> >>>>>>
> >>>>>> I wonder if it's simply to let all vlan traffic go by disabling
> >>>>>> CTRL_VLAN feature at vDPA layer.
> >>>> The guest will not be able to recover that vlan configuration.
> >>> Spec said it's best effort and we actually don't do this for
> >>> vhost-net/user for years and manage to survive.
> >> I thought there's a border line between best effort and do nothing. ;-=
)
> >>
> > I also think it is worth at least trying to migrate it for sure. For
> > MAC there may be too many entries, but VLAN should be totally
> > manageable (and the information is already there, the bitmap is
> > actually being migrated).
> The vlan bitmap is migrated, though you'd still need to add vlan filter
> one by one through ctrl vq commands, correct? AFAIK you can add one
> filter for one single vlan ID at a time via VIRTIO_NET_CTRL_VLAN_ADD.
>
> >
> >> I think that the reason this could survive is really software
> >> implementation specific - say if the backend doesn't start with VLAN
> >> filtering disabled (meaning allow all VLAN traffic to pass) then it
> >> would become a problem. This won't be a problem for almost PF NICs but
> >> may be problematic for vDPA e.g. VF backed VDPAs.
> > I'd say the driver would expect all vlan filters to be cleared after a
> > reset, isn't it?
> If I understand the intended behavior (from QEMU implementation)
> correctly, when VIRTIO_NET_F_CTRL_VLAN is negotiated it would start with
> all VLANs filtered (meaning only untagged traffic can be received and
> traffic with VLAN tag would get dropped). However, if
> VIRTIO_NET_F_CTRL_VLAN is not negotiated, all traffic including untagged
> and tagged can be received.
>
> >   The spec doesn't explicitly say anything about that
> > as far as I see.
> Here the spec is totally ruled by the (software artifact of)
> implementation rather than what a real device is expected to work with
> VLAN rx filters. Are we sure we'd stick to this flawed device
> implementation? The guest driver seems to be agnostic with this broken
> spec behavior so far, and I am afraid it's an overkill to add another
> feature bit or ctrl command to VLAN filter in clean way.
>

I agree with all of the above. So, double checking, all vlan should be
allowed by default at device start? Maybe the spec needs to be more
clear in that regard?

> >
> >>>>> Another idea is to extend the spec to allow us to accept a bitmap o=
f
> >>>>> the vlan ids via a single command, then we will be fine.
> >>>>>
> >>>> I'm not sure if adding more ways to configure something is the answe=
r,
> >>>> but I'd be ok to implement it.
> >>>>
> >>>> Another idea is to allow the sending of many CVQ commands in paralle=
l.
> >>>> It shouldn't be very hard to achieve using exposed buffers as ring
> >>>> buffers, and it will short down the start of the devices with many
> >>>> features.
> >>> In the extreme case, what if guests decide to filter all of the vlans=
?
> >>> It means we need MAX_VLAN commands which may exceeds the size of the
> >>> control virtqueue.
> >> Indeed, that's a case where a single flat device state blob would be
> >> more efficient for hardware drivers to apply than individual control
> >> command messages do.
> >>
> > If we're going that route, being able to set a bitmap for vlan
> > filtering (Jason's proposal) seems to solve more issues in the same
> > shot, doesn't it?
> If I understand correctly about Jason's proposal, it's a spec extension
> already to add multiple VLAN IDs in a row. This seems not much different
> than the device state blob for the resume API idea I just presented in
> the KVM forum (which also needs to extend the spec in another way)?
>
> struct virtio_mig_cfg_net_ctrl_vlan {
>      struct virtio_mig_state_header hdr;
>      le32 vlans[128];
> };
>
> What is additional benefit that makes it able to solve more issues?
>

Maybe I totally misunderstood you.

I don't think the solution to this problem is to create a call from
the VMM to restore all the device state (vlan, mac, stats, ...),
because that would not allow the guest to configure many vlan filters
in one shot and retain all other config.

If your proposal is like Jason's in that regard, I'm totally ok with
it, and I don't have a strong opinion about the layout. Maybe I would
not name it "mig_state", since it would be used by the guest in other
contexts than migration.

In other words, we should handle this outside of the migration scope,
because the guest may use it to set many vlan filters in one shot,
retaining other configuration. No more, no less.

Thanks!


