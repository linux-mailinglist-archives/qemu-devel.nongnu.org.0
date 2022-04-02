Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E44EFDC8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 03:34:58 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naSfI-0008SD-Vt
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 21:34:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naSe1-0007lj-KV
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naSdz-0002CU-Qg
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648863215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyHRLNX6AMRjflEyxMoPQlFcm4q8oXAsJwWYmh97rIE=;
 b=MY5+2s+l1dT9VQAuL7nXLmx/WB0ZVE6LLWhnaNprLdvDdfyGum1D86K/94BIvwrw8iy1ZX
 kmaQzt9tastHQsVnYAd+gCXHNtJ30yuA4Kui1TGp6GpqIqMXCC3dp8X+1lMFPyKeDfN6wE
 FrI507m6yKYdbQiqOIVmkSR6FY8rV3k=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395--P0kTxHJPGiFX10ThoK79g-1; Fri, 01 Apr 2022 21:33:34 -0400
X-MC-Unique: -P0kTxHJPGiFX10ThoK79g-1
Received: by mail-lf1-f70.google.com with SMTP id
 w34-20020a0565120b2200b0044adfdd1570so1225897lfu.23
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 18:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QyHRLNX6AMRjflEyxMoPQlFcm4q8oXAsJwWYmh97rIE=;
 b=NkPCZqQbZRIxwkIUn9FS2Cfh1uwU0Sh9TOwQGi+GM6TOmWgkpahPvZFRHG2ajbRmC6
 RnG7+qIJUOuSdOyGNiBbyUYZqXftvcQ8a71RhpE8hIGmkenUMFZPc0K31J3GhPfwx0gt
 5Zf7XfNurCTvrkmAQiM31cTLyKJ2G7lD/COTIZj0NLaIHGoLO+pGFMWHxbDYaEG4Q5XM
 0nj8X/Ktwjm+yH4AA84Yo1aN5APT+3Sphnp0KSghLCE0Tkfytlppa3pGymJf4glXeCmd
 kEDw1y6EuA85TcwdOyWUdjzc2Md40L0meLZr2mftFH02hZ6x/czmPQThU8FlR9XQDlsI
 Xz6A==
X-Gm-Message-State: AOAM530GtJ6mCVbW09I43frDpCT8tBg4VxhlgWD708ftRCZpinfOEKAu
 KIlaqE3zgxOk5dO0gAdcSnZXfJXOSB6uOWStenbxrzHm3BT7oJuWq4WcCBiuGJH4N4Gus/MflJj
 4pxB08bIsHadZRyg+ET2gfwtzm0miU60=
X-Received: by 2002:ac2:4477:0:b0:44a:55c6:155d with SMTP id
 y23-20020ac24477000000b0044a55c6155dmr15337003lfl.376.1648863212518; 
 Fri, 01 Apr 2022 18:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6ueC54Er5UcbNJLJ0pxh0ja9kC+AHSzkQx+JeDjIpmubA+I1aSbrpYziEyhgKEPLhHQMeGkVDRtPM8MMEDDM=
X-Received: by 2002:ac2:4477:0:b0:44a:55c6:155d with SMTP id
 y23-20020ac24477000000b0044a55c6155dmr15336994lfl.376.1648863212233; Fri, 01
 Apr 2022 18:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
 <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
 <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
 <9a7c92a6-4551-48a7-6569-d3bc9d227fe2@redhat.com>
 <CAJaqyWfusKtDiTYuJBidwZGzpq3mQrOyaQOk2WNiiNPgxffgcQ@mail.gmail.com>
 <CACGkMEsk_1rUFBrpBK7QZrT-ye4xbdUA1y1ewL279sY4SzUtUw@mail.gmail.com>
 <f7542e52-6f1a-f964-4e27-361cf752a6fc@oracle.com>
In-Reply-To: <f7542e52-6f1a-f964-4e27-361cf752a6fc@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 09:33:21 +0800
Message-ID: <CACGkMEsbN2WvHhJpL+P2-KXzSJ8OKNuouqob7+95zJagd_g33Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 12:18 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/31/2022 7:39 PM, Jason Wang wrote:
> > On Thu, Mar 31, 2022 at 5:20 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> >> On Thu, Mar 31, 2022 at 10:54 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>
> >>> =E5=9C=A8 2022/3/31 =E4=B8=8B=E5=8D=884:02, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> >>>> On Thu, Mar 31, 2022 at 1:03 AM Si-Wei Liu <si-wei.liu@oracle.com> w=
rote:
> >>>>>
> >>>>> On 3/30/2022 12:01 PM, Eugenio Perez Martin wrote:
> >>>>>> On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com>=
 wrote:
> >>>>>>> The vhost_vdpa_one_time_request() branch in
> >>>>>>> vhost_vdpa_set_backend_cap() incorrectly sends down
> >>>>>>> iotls on vhost_dev with non-zero index. This may
> >>>>>>> end up with multiple VHOST_SET_BACKEND_FEATURES
> >>>>>>> ioctl calls sent down on the vhost-vdpa fd that is
> >>>>>>> shared between all these vhost_dev's.
> >>>>>>>
> >>>>>> Not only that. This means that qemu thinks the device supports iot=
lb
> >>>>>> batching as long as the device does not have cvq. If vdpa does not
> >>>>>> support batching, it will return an error later with no possibilit=
y of
> >>>>>> doing it ok.
> >>>>> I think the implicit assumption here is that the caller should back=
 off
> >>>>> to where it was if it comes to error i.e. once the first
> >>>>> vhost_dev_set_features call gets an error, vhost_dev_start() will f=
ail
> >>>>> straight.
> >>>> Sorry, I don't follow you here, and maybe my message was not clear e=
nough.
> >>>>
> >>>> What I meant is that your patch fixes another problem not stated in
> >>>> the message: it is not possible to initialize a net vdpa device that
> >>>> does not have cvq and does not support iotlb batches without it. Qem=
u
> >>>> will assume that the device supports batching, so the write of
> >>>> VHOST_IOTLB_BATCH_BEGIN will fail. I didn't test what happens next b=
ut
> >>>> it probably cannot continue.
> >>>
> >>> So you mean we actually didn't call VHOST_SET_BACKEND_CAP in this cas=
e.
> >>> Fortunately, kernel didn't check the backend cap when accepting batch=
ing
> >>> hints.
> >>>
> >>> We are probably fine?
> >>>
> >> We're fine as long as the vdpa driver in the kernel effectively
> >> supports batching. If not, qemu will try to batch, and it will fail.
> >>
> >> It was introduced in v5.9, so qemu has not supported kernel <5.9 since
> >> we introduced multiqueue support (I didn't test). Unless we apply this
> >> patch. That's the reason it should be marked as fixed and backported
> >> to stable IMO.
> > Ok, so it looks to me we have more issues.
> >
> > In vhost_vdpa_set_backend_cap() we fail when
> > VHOST_VDPA_GET_BACKEND_FEATURES fails. This breaks the older kernel
> > since that ioctl is introduced in
> >
> > 653055b9acd4 ("vhost-vdpa: support get/set backend features")
> Yep, the GET/SET_BACKEND ioctl pair got introduced together in this
> exact commit.
> >
> > We should:
> >
> > 1) make it work by not failing the vhost_vdpa_set_backend_cap() and
> > assuming MSG_V2.
> This issue is orthogonal with my fix, which was pre-existing before the
> multiqueue support. I believe there should be another separate patch to
> fix QEMU for pre-GET/SET_BACKEND kernel.

Right.

>
> > 2) check the batching support in vhost_vdpa_listener_begin_batch()
> > instead of trying to set VHOST_IOTLB_BATCH_BEGIN uncondtionally
> This is non-issue since VHOST_BACKEND_F_IOTLB_BATCH is already validated
> in the caller vhost_vdpa_iotlb_batch_begin_once().

Yes, I miss that optimization.

Thanks

>
> -Siwei
> >
> > Thanks
> >
> >> Thanks!
> >>
> >>> Thanks
> >>>
> >>>
> >>>> In that regard, this commit needs to be marked as "Fixes: ...", eith=
er
> >>>> ("a5bd058 vhost-vdpa: batch updating IOTLB mappings") or maybe bette=
r
> >>>> ("4d191cf vhost-vdpa: classify one time request"). We have a
> >>>> regression if we introduce both, or the second one and the support o=
f
> >>>> any other backend feature.
> >>>>
> >>>>> Noted that the VHOST_SET_BACKEND_FEATURES ioctl is not per-vq
> >>>>> and it doesn't even need to. There seems to me no possibility for i=
t to
> >>>>> fail in a way as thought here. The capture is that IOTLB batching i=
s at
> >>>>> least a vdpa device level backend feature, if not per-kernel. Same =
as
> >>>>> IOTLB_MSG_V2.
> >>>>>
> >>>> At this moment it is per-kernel, yes. With your patch there is no ne=
ed
> >>>> to fail because of the lack of _F_IOTLB_BATCH, the code should handl=
e
> >>>> this case ok.
> >>>>
> >>>> But if VHOST_GET_BACKEND_FEATURES returns no support for
> >>>> VHOST_BACKEND_F_IOTLB_MSG_V2, the qemu code will happily send v2
> >>>> messages anyway. This has nothing to do with the patch, I'm just
> >>>> noting it here.
> >>>>
> >>>> In that case, maybe it is better to return something like -ENOTSUP?
> >>>>
> >>>> Thanks!
> >>>>
> >>>>> -Siwei
> >>>>>
> >>>>>>     Some open questions:
> >>>>>>
> >>>>>> Should we make the vdpa driver return error as long as a feature i=
s
> >>>>>> used but not set by qemu, or let it as undefined? I guess we have =
to
> >>>>>> keep the batching at least without checking so the kernel supports=
 old
> >>>>>> versions of qemu.
> >>>>>>
> >>>>>> On the other hand, should we return an error if IOTLB_MSG_V2 is no=
t
> >>>>>> supported here? We're basically assuming it in other functions.
> >>>>>>
> >>>>>>> To fix it, send down ioctl only once via the first
> >>>>>>> vhost_dev with index 0. Toggle the polarity of the
> >>>>>>> vhost_vdpa_one_time_request() test would do the trick.
> >>>>>>>
> >>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >>>>>> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>>>
> >>>>>>> ---
> >>>>>>>     hw/virtio/vhost-vdpa.c | 2 +-
> >>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>>>>> index c5ed7a3..27ea706 100644
> >>>>>>> --- a/hw/virtio/vhost-vdpa.c
> >>>>>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>>>>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct =
vhost_dev *dev)
> >>>>>>>
> >>>>>>>         features &=3D f;
> >>>>>>>
> >>>>>>> -    if (vhost_vdpa_one_time_request(dev)) {
> >>>>>>> +    if (!vhost_vdpa_one_time_request(dev)) {
> >>>>>>>             r =3D vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES=
, &features);
> >>>>>>>             if (r) {
> >>>>>>>                 return -EFAULT;
> >>>>>>> --
> >>>>>>> 1.8.3.1
> >>>>>>>
>


