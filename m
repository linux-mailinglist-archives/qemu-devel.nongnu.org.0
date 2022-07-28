Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500058371F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 04:43:38 +0200 (CEST)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGtUu-0005Dn-M5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 22:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGtTF-0003ko-96
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 22:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGtTA-0006Vs-6i
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 22:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658976103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKr+tVDaREEKXVWREPfAID7nsCOMeowvnQiV430xTw8=;
 b=FJ47MnkgBOD0Czbi85IfXt/KyWybh3RiYHtKJ40cKbdskQcAxvHxIO+SmgGD6evhN9IoDC
 ebxZ/TA2T11d1rzi8kyBNxShHFh7zlERd/LRCmb4uUa7S6jbdsi6H0Zy95KVS9jQUVEiyJ
 B0QXV7bthVwyZMyvAD9fFXc15yk0XX4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-NGQ5SSYBMyW09sj2c7wuwQ-1; Wed, 27 Jul 2022 22:41:41 -0400
X-MC-Unique: NGQ5SSYBMyW09sj2c7wuwQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 dt17-20020a0565122a9100b0048a878a2a56so230180lfb.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 19:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zKr+tVDaREEKXVWREPfAID7nsCOMeowvnQiV430xTw8=;
 b=GzGYoiMIfJMoTLZPffH79XfqTuKrnAujWztc2DzjpGEivA1MJGmZj6JhI6Li9V5a+m
 iQFIfArJmk+cWs+/2oUEzeGYV4ffvlxndTM9H1KyTbv0QJ77ptlrdWJ5qQwrlX0mpiyw
 1YMSyvKZV0unK0D+SOlBFjJPlhXus/I/nG159Q56XVl7H+nVYXnnWeWT3DwdIEAyysAC
 3ggIUA4WrZvSVFFTDO9c9F5mao13jYreutWtgAeMQOuVjl+CwGM1RC3FfOP+Rrp5OsOu
 kBOE3afbZuSVPUl0XXwsDC2xMq9Z2ChHDHkWaObdNsjiDSlT7/TOVAZ8Jo43w9r8h1oi
 SPgg==
X-Gm-Message-State: AJIora92ORikrcDloJ9UBL292OJTE1TFOfTX6XPvnBLbBoqz78wAtQuR
 0b4ZsA+eu3poHJ36gcfqC7tlT1zFBr27kzSzR+xLq3xZHoR+0RcukaczSBBHt4n9srvDEOMTeCR
 p/CxO6z+AsbEfksf+dWwe+UUHKJiwfjA=
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id
 e23-20020a2e9e17000000b0025d76544c6bmr9013949ljk.130.1658976100039; 
 Wed, 27 Jul 2022 19:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sB0g3u47BGmEkRm4QMI8QhvA0IPgUZ+OXrJTMXq98nuDKZy2EFHVLWm3sOzeSKYFPsRKvLkaWEcNuKF6CGdvc=
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id
 e23-20020a2e9e17000000b0025d76544c6bmr9013945ljk.130.1658976099626; Wed, 27
 Jul 2022 19:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <8bf7574d8e133d3fa7e8b09f4deb59369916774a.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b078fc30-0c8b-b56c-e320-c89e6376fb21@redhat.com>
 <93985df7-7d5f-782e-10ed-7494f0806d22@linux.alibaba.com>
 <CACGkMEsTcoLQYJVxT8J3yDu007zan-3OsExRHFe3DCsZ1_y1=w@mail.gmail.com>
 <810e4f2c-69bb-e2be-1faf-056549063fae@linux.alibaba.com>
In-Reply-To: <810e4f2c-69bb-e2be-1faf-056549063fae@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Jul 2022 10:41:28 +0800
Message-ID: <CACGkMEv_=dsU_-Syw08Nf6FeHrFzf+GXYXcLBDqTNVX9NguJ2w@mail.gmail.com>
Subject: Re: [PATCH 08/16] vhost: add op to enable or disable a single vring
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, hengqi@linux.alibaba.com, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, mst <mst@redhat.com>
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

On Wed, Jul 27, 2022 at 3:05 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/27 12:55, Jason Wang =E5=86=99=E9=81=93:
> > On Tue, Jul 26, 2022 at 2:39 PM Kangjie Xu <kangjie.xu@linux.alibaba.co=
m> wrote:
> >>
> >> =E5=9C=A8 2022/7/26 11:49, Jason Wang =E5=86=99=E9=81=93:
> >>> =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >>>> The interface to set enable status for a single vring is lacked in
> >>>> VhostOps, since the vhost_set_vring_enable_op will manipulate all
> >>>> virtqueues in a device.
> >>>>
> >>>> Resetting a single vq will rely on this interface. It requires a
> >>>> reply to indicate that the reset operation is finished, so the
> >>>> parameter, wait_for_reply, is added.
> >>>
> >>> The wait reply seems to be a implementation specific thing. Can we
> >>> hide it?
> >>>
> >>> Thanks
> >>>
> >> I do not hide wait_for_reply here because when stopping the queue, a
> >> reply is needed to ensure that the message has been processed and queu=
e
> >> has been disabled.
> > This needs to be done at vhost-backend level instead of the general vho=
st code.
> >
> > E.g vhost-kernel or vDPA is using ioctl() which is synchronous.
> Yeah, I understand your concerns, will fix it in the next version.
> >> When restarting the queue, we do not need a reply, which is the same a=
s
> >> what qemu does in vhost_dev_start().
> >>
> >> So I add this parameter to distinguish the two cases.
> >>
> >> I think one alternative implementation is to add a interface in
> >> VhostOps: queue_reset(). In this way details can be hidden. What do yo=
u
> >> think of this solution? Does it look better?
> > Let me ask it differently, under which case can we call this function
> > with wait_for_reply =3D false?
> >
> > Thanks
>
> Cases when we do not need to wait until that the reply has been
> processed. Actually in dev_start(), or dev_stop(),

But we don't need to send virtqueue reset requests in those cases?

> they do not wait for
> replies when enabling/disabling vqs.
>
> Specifically, vhost_set_vring_enable() will call it with wait_for_reply
> =3D false.
>
> In our vq reset scenario, it should be synchronous because the driver
> need to modify queues after the device stop using the vq in the backend.
> Undefined errors will occur If the device is still using the queue when
> the driver is making modifications to it,
>
> Back to our implementation, we will not expose this parameter in the
> next version.

Ok.

Thanks

>
> Thanks.
>
> >> Thanks
> >>
> >>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >>>> ---
> >>>>    include/hw/virtio/vhost-backend.h | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/include/hw/virtio/vhost-backend.h
> >>>> b/include/hw/virtio/vhost-backend.h
> >>>> index eab46d7f0b..7bddd1e9a0 100644
> >>>> --- a/include/hw/virtio/vhost-backend.h
> >>>> +++ b/include/hw/virtio/vhost-backend.h
> >>>> @@ -81,6 +81,9 @@ typedef int (*vhost_set_backend_cap_op)(struct
> >>>> vhost_dev *dev);
> >>>>    typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
> >>>>    typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
> >>>>    typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int i=
dx);
> >>>> +typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *d=
ev,
> >>>> +                                                int index, int enab=
le,
> >>>> +                                                bool wait_for_reply=
);
> >>>>    typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> >>>>                                             int enable);
> >>>>    typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
> >>>> @@ -155,6 +158,7 @@ typedef struct VhostOps {
> >>>>        vhost_set_owner_op vhost_set_owner;
> >>>>        vhost_reset_device_op vhost_reset_device;
> >>>>        vhost_get_vq_index_op vhost_get_vq_index;
> >>>> +    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
> >>>>        vhost_set_vring_enable_op vhost_set_vring_enable;
> >>>>        vhost_requires_shm_log_op vhost_requires_shm_log;
> >>>>        vhost_migration_done_op vhost_migration_done;
>


