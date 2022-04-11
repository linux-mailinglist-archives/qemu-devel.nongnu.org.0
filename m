Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5274FB67E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 10:55:01 +0200 (CEST)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndpp6-0006hl-HX
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 04:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ndpkY-0003NB-5e
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 04:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ndpkS-0007gL-Vx
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 04:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649667011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9Vk0ZIT5s19ewxS0/MrOjgb/rhaDGnKtn9a+dkJPrU=;
 b=alw6CXlmgoLBhc0XZNpHyWLFyrfXJxV1M6vRamTg+ogWdG74BXpVpGOfKjKy6xLfqPCUeE
 TNGNp482mZsMxieCpfRLN/w576q7QsDOlMQ9qXT3BeeB+SmIcwzkZiQDp7iuZlP11A46uE
 M1UXsPjlQg3wbFbGL3lYLBTV3193LCI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-58Mb2Q_kOqadH4_kd-IMVQ-1; Mon, 11 Apr 2022 04:50:08 -0400
X-MC-Unique: 58Mb2Q_kOqadH4_kd-IMVQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 a24-20020a2e7f18000000b0024b1ff3b41dso5760152ljd.14
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 01:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h9Vk0ZIT5s19ewxS0/MrOjgb/rhaDGnKtn9a+dkJPrU=;
 b=5AprB8t6TXFbkK20FDs5GkjZtFDrJrRB25LWSdz6YLcFKLgZFydOBH9/nrNvabgs5b
 uzJrQOVqeyUGn3xNJTTWjZO64vQcWHGG5r6hEK0hMSUSkBL1Cdu0xpLkp7SBHz807KA9
 AACJqBHMWYVBL9NY97WVpTaD0NLTLHWoutPX+3ARx0jkoU0pHRJxQDtis1Du7HvMSiJC
 AGhJY7uBe3eayD3HQL2ghZR+MMHlFhg0jRppTpDMzy7b9ax9uuuOzQ7NwKBFS+wW93yJ
 npIc0C9xdBujQmGCoRS5RVVcEfApSOtXRki6o4i7refen/WTAFiVSMF1buzRzq0f8Km0
 ijVg==
X-Gm-Message-State: AOAM530BSgIZXovfSPeMiCZCqalAJYbGSF5bJw7MgrViMx0zr0XtEd5k
 IjYiIvUZGlmf8YjAzr4acPO00seIsCxbwATZFBVr0i4ls2ClB7J6w+2F6/+3PCWeWq2Y6Ypx+Oe
 Ft6Ks7UJ0uNLS/dBRS03LFz/wgfnAhQk=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr19824780ljd.315.1649667006276; 
 Mon, 11 Apr 2022 01:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMn8/8oJ6b9EJaboIa7PZULMVUrBtuOHQsqQmaU9io7C5fRemWJqXEU6dsneAmVfL1/S4X37nYCryzI9gedJg=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr19824759ljd.315.1649667005647; Mon, 11
 Apr 2022 01:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
 <4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com>
 <CACGkMEtsV6e6LOYCfVZb7_-SvSAWRk1XHom+neXR=d3aQQwXmg@mail.gmail.com>
 <b190a762-1d21-4fec-b138-e4c09a949525@oracle.com>
 <CACGkMEv-ddVvrwSXGsvajiVXq5X3ZXy8mM41fvwQTYTGGnyznQ@mail.gmail.com>
 <8f8ea4e4-2398-6d94-88fe-93b2c0f6f9ca@oracle.com>
 <393aebd3-34d3-b196-43fd-47fbd1901a5d@redhat.com>
 <4ee63dfb-d023-ad31-fff8-169e0cbc9d51@oracle.com>
In-Reply-To: <4ee63dfb-d023-ad31-fff8-169e0cbc9d51@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 11 Apr 2022 16:49:54 +0800
Message-ID: <CACGkMEuecMSCWdr0P9f=U-8wYAw3M05mmeRo+y6Zmt2TxCUNBg@mail.gmail.com>
Subject: Re: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
To: Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 8, 2022 at 9:02 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 4/7/2022 12:05 AM, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/4/6 =E4=B8=8A=E5=8D=883:18, Si-Wei Liu =E5=86=99=E9=81=
=93:
> >>
> >>
> >> On 4/1/2022 7:00 PM, Jason Wang wrote:
> >>> On Sat, Apr 2, 2022 at 4:37 AM Si-Wei Liu <si-wei.liu@oracle.com>
> >>> wrote:
> >>>>
> >>>>
> >>>> On 3/31/2022 1:36 AM, Jason Wang wrote:
> >>>>> On Thu, Mar 31, 2022 at 12:41 AM Si-Wei Liu
> >>>>> <si-wei.liu@oracle.com> wrote:
> >>>>>>
> >>>>>> On 3/30/2022 2:14 AM, Jason Wang wrote:
> >>>>>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu
> >>>>>>> <si-wei.liu@oracle.com> wrote:
> >>>>>>>> Previous commit prevents vhost-user and vhost-vdpa from using
> >>>>>>>> userland vq handler via disable_ioeventfd_handler. The same
> >>>>>>>> needs to be done for host notifier cleanup too, as the
> >>>>>>>> virtio_queue_host_notifier_read handler still tends to read
> >>>>>>>> pending event left behind on ioeventfd and attempts to handle
> >>>>>>>> outstanding kicks from QEMU userland vq.
> >>>>>>>>
> >>>>>>>> If vq handler is not disabled on cleanup, it may lead to sigsegv
> >>>>>>>> with recursive virtio_net_set_status call on the control vq:
> >>>>>>>>
> >>>>>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
> >>>>>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
> >>>>>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so=
.6
> >>>>>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
> >>>>>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index
> >>>>>>>> (dev=3D<optimized out>, idx=3D<optimized out>) at
> >>>>>>>> ../hw/virtio/vhost-vdpa.c:563
> >>>>>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index
> >>>>>>>> (dev=3D<optimized out>, idx=3D<optimized out>) at
> >>>>>>>> ../hw/virtio/vhost-vdpa.c:558
> >>>>>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask
> >>>>>>>> (hdev=3D0x558f55c01800, vdev=3D0x558f568f91f0, n=3D2, mask=3D<op=
timized
> >>>>>>>> out>) at ../hw/virtio/vhost.c:1557
> >>>>>>> I feel it's probably a bug elsewhere e.g when we fail to start
> >>>>>>> vhost-vDPA, it's the charge of the Qemu to poll host notifier
> >>>>>>> and we
> >>>>>>> will fallback to the userspace vq handler.
> >>>>>> Apologies, an incorrect stack trace was pasted which actually
> >>>>>> came from
> >>>>>> patch #1. I will post a v2 with the corresponding one as below:
> >>>>>>
> >>>>>> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=3D0x0) at
> >>>>>> ../hw/core/qdev.c:376
> >>>>>> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled
> >>>>>> (vdev=3Dvdev@entry=3D0x0) at ../hw/virtio/virtio-bus.c:331
> >>>>>> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=3D<optimized out>=
) at
> >>>>>> ../hw/virtio/vhost.c:318
> >>>>>> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=3D<optimized out>=
,
> >>>>>> buffer=3D0x7fc19bec5240, len=3D2052, is_write=3D1, access_len=3D20=
52) at
> >>>>>> ../hw/virtio/vhost.c:336
> >>>>>> 4  0x000055f800d71867 in vhost_virtqueue_stop
> >>>>>> (dev=3Ddev@entry=3D0x55f8037ccc30, vdev=3Dvdev@entry=3D0x55f8044ec=
590,
> >>>>>> vq=3D0x55f8037cceb0, idx=3D0) at ../hw/virtio/vhost.c:1241
> >>>>>> 5  0x000055f800d7406c in vhost_dev_stop
> >>>>>> (hdev=3Dhdev@entry=3D0x55f8037ccc30,
> >>>>>> vdev=3Dvdev@entry=3D0x55f8044ec590) at ../hw/virtio/vhost.c:1839
> >>>>>> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=3D0x55f8037ccc30,
> >>>>>> dev=3D0x55f8044ec590) at ../hw/net/vhost_net.c:315
> >>>>>> 7  0x000055f800bf0678 in vhost_net_stop
> >>>>>> (dev=3Ddev@entry=3D0x55f8044ec590,
> >>>>>> ncs=3D0x55f80452bae0, data_queue_pairs=3Ddata_queue_pairs@entry=3D=
7,
> >>>>>> cvq=3Dcvq@entry=3D1)
> >>>>>>       at ../hw/net/vhost_net.c:423
> >>>>>> 8  0x000055f800d4e628 in virtio_net_set_status (status=3D<optimize=
d
> >>>>>> out>,
> >>>>>> n=3D0x55f8044ec590) at ../hw/net/virtio-net.c:296
> >>>>>> 9  0x000055f800d4e628 in virtio_net_set_status
> >>>>>> (vdev=3Dvdev@entry=3D0x55f8044ec590, status=3D15 '\017') at
> >>>>>> ../hw/net/virtio-net.c:370
> >>>>> I don't understand why virtio_net_handle_ctrl() call
> >>>>> virtio_net_set_stauts()...
> >>>> The pending request left over on the ctrl vq was a VIRTIO_NET_CTRL_M=
Q
> >>>> command, i.e. in virtio_net_handle_mq():
> >>> Completely forget that the code was actually written by me :\
> >>>
> >>>> 1413     n->curr_queue_pairs =3D queue_pairs;
> >>>> 1414     /* stop the backend before changing the number of queue_pai=
rs
> >>>> to avoid handling a
> >>>> 1415      * disabled queue */
> >>>> 1416     virtio_net_set_status(vdev, vdev->status);
> >>>> 1417     virtio_net_set_queue_pairs(n);
> >>>>
> >>>> Noted before the vdpa multiqueue support, there was never a vhost_de=
v
> >>>> for ctrl_vq exposed, i.e. there's no host notifier set up for the
> >>>> ctrl_vq on vhost_kernel as it is emulated in QEMU software.
> >>>>
> >>>>>> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=3D<optimi=
zed
> >>>>>> out>, iov=3D<optimized out>, cmd=3D0 '\000', n=3D0x55f8044ec590) a=
t
> >>>>>> ../hw/net/virtio-net.c:1408
> >>>>>> 11 0x000055f800d534d8 in virtio_net_handle_ctrl
> >>>>>> (vdev=3D0x55f8044ec590,
> >>>>>> vq=3D0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
> >>>>>> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read
> >>>>>> (vq=3D0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
> >>>>>> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read
> >>>>>> (n=3Dn@entry=3D0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
> >>>>>> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier
> >>>>>> (bus=3D<optimized out>, n=3Dn@entry=3D14) at ../hw/virtio/virtio-b=
us.c:312
> >>>>>> 15 0x000055f800d73106 in vhost_dev_disable_notifiers
> >>>>>> (hdev=3Dhdev@entry=3D0x55f8035b51b0, vdev=3Dvdev@entry=3D0x55f8044=
ec590)
> >>>>>>       at ../../../include/hw/virtio/virtio-bus.h:35
> >>>>>> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=3D0x55f8035b51b0,
> >>>>>> dev=3D0x55f8044ec590) at ../hw/net/vhost_net.c:316
> >>>>>> 17 0x000055f800bf0678 in vhost_net_stop
> >>>>>> (dev=3Ddev@entry=3D0x55f8044ec590,
> >>>>>> ncs=3D0x55f80452bae0, data_queue_pairs=3Ddata_queue_pairs@entry=3D=
7,
> >>>>>> cvq=3Dcvq@entry=3D1)
> >>>>>>       at ../hw/net/vhost_net.c:423
> >>>>>> 18 0x000055f800d4e628 in virtio_net_set_status (status=3D<optimize=
d
> >>>>>> out>,
> >>>>>> n=3D0x55f8044ec590) at ../hw/net/virtio-net.c:296
> >>>>>> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=3D0x55f8044ec=
590,
> >>>>>> status=3D15 '\017') at ../hw/net/virtio-net.c:370
> >>>>>> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=3D0x55f8044ec590,
> >>>>>> val=3D<optimized out>) at ../hw/virtio/virtio.c:1945
> >>>>>> 21 0x000055f800d11d9d in vm_state_notify
> >>>>>> (running=3Drunning@entry=3Dfalse,
> >>>>>> state=3Dstate@entry=3DRUN_STATE_SHUTDOWN) at ../softmmu/runstate.c=
:333
> >>>>>> 22 0x000055f800d04e7a in do_vm_stop
> >>>>>> (state=3Dstate@entry=3DRUN_STATE_SHUTDOWN,
> >>>>>> send_stop=3Dsend_stop@entry=3Dfalse)
> >>>>>> at ../softmmu/cpus.c:262
> >>>>>> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
> >>>>>> 24 0x000055f800d126af in qemu_cleanup () at
> >>>>>> ../softmmu/runstate.c:812
> >>>>>> 25 0x000055f800ad5b13 in main (argc=3D<optimized out>, argv=3D<opt=
imized
> >>>>>> out>, envp=3D<optimized out>) at ../softmmu/main.c:51
> >>>>>>
> >>>>>>    From the trace pending read only occurs in stop path. The
> >>>>>> recursive
> >>>>>> virtio_net_set_status from virtio_net_handle_ctrl doesn't make
> >>>>>> sense to me.
> >>>>> Yes, we need to figure this out to know the root cause.
> >>>> I think it has something to do with the virtqueue unready issue
> >>>> that the
> >>>> vhost_reset_device() refactoring series attempt to fix. If that is
> >>>> fixed
> >>>> we should not see this sigsegv with mlx5_vdpa. However I guess we bo=
th
> >>>> agreed that the vq_unready support would need new uAPI (some flag) t=
o
> >>>> define, hence this fix applies to the situation where uAPI doesn't
> >>>> exist
> >>>> on the kernel or the vq_unready is not supported by vdpa vendor
> >>>> driver.
> >>>>
> >>> Yes.
> >>>
> >>>>> The code should work for the case when vhost-vdp fails to start.
> >>>> Unlike the other datapath queues for net vdpa, the events left
> >>>> behind in
> >>>> the control queue can't be processed by the userspace, as unlike
> >>>> vhost-kernel we don't have a fallback path in the userspace.
> >>> So that's the question, we should have a safe fallback.
> >>>
> >>>> To ignore
> >>>> the pending event and let vhost vdpa process it on resume/start is
> >>>> perhaps the best thing to do. This is even true for datapath queues
> >>>> for
> >>>> other vdpa devices than of network.
> >>>>
> >>>>>> Not sure I got the reason why we need to handle pending host
> >>>>>> notification in userland vq, can you elaborate?
> >>>>> Because vhost-vDPA fails to start, we will "fallback" to a dummy
> >>>>> userspace.
> >>>> Is the dummy userspace working or operational? What's the use case o=
f
> >>>> this "fallback" dummy if what guest user can get is a busted NIC?
> >>> The problem is we can't do better in this case now. Such fallack (e.g
> >>> for vhost-user) has been used for years. Or do you have any better
> >>> ideas?
> >> In my opinion if vhost-vdpa or vhost-user fails to start, maybe we
> >> should try to disable the device via virtio_error(), which would set
> >> broken to true and set NEEDS_RESET in case of VERSION_1. That way the
> >> device won't move forward further and the guest may get the
> >> indication via config interrupt that something had gone wrong
> >> underneath. If device reset is well supported there the guest driver
> >> would retry.
> >
> >
> > Note that the NEEDS_RESET is not implemented in the current Linux
> > drivers.
> Yes, I am aware of that. I think the point to set NEEDS_RESET is to stop
> the device from moving forward, as when it comes to start failure, the
> vhost backend is already bogged down or in a bogus state unable to move
> further. And it's the standardized way to explicitly inform guest of
> failure on the device side, although the corresponding NEEDS_RESET
> handling hadn't been implemented in any Linux driver yet. Of coz
> alternatively, guest can figure it out itself implicitly via watchdog
> timer, as you indicated below.

Right, but I think the guest stuffs is something that is nice to have
but not a must since we don't trust the device always.

>
> >
> >
> >> This can at least give the backend some chance to recover if running
> >> into intermittent error. The worst result would be the device keeps
> >> resetting repeatedly, for which we may introduce tunable to control
> >> the rate if seeing reset occurs too often.. Did this ever get
> >> considered before?
> >
> >
> > I don't know, but we manage to survive with such fallback for years.
> I wonder how vhost-user client may restart in this case i.e. when
> running into transient backend failure. Haven't yet checked the code, do
> you mean there's never error recovery (or error detection at least)
> implemented in the vhost-user client for e.g. DPDK? Or it just tries to
> reconnect if the socket connection gets closed, but never cares about
> any vhost-user backend start failure?

I think we may just get "fallback to userspace" everytime we want to fallba=
ck.

>
> > We can do this, but can virtio_error() fix the issue you describe here?
> It doesn't fix the sigsegv issue for certain. Actually the issue I ran
> into has little to do with error handling, but thinking with the
> assumption of virtio_error() in the start error path we can just live
> without falling back to the dummy userspace or handling any request (as
> all vqs are effectively stopped/disabled). Which is exactly consistent
> with the handling in the stop (success) path: ignore pending event on
> the host notifier. In other word, it doesn't necessarily have to assume
> the existence of dummy userspace fallback, which IMHO does nothing more
> compared to marking NEEDS_RESET with virtio_error(). While on the
> contrary, if there's ever a good use case for the dummy userspace (which
> I might not be aware), I thought the fallback to userspace emulation
> would be even needed for the stop path. But I doubted the need for
> adding such complex code without seeing a convincing case.

Ok, I get you. I think virtio_erorr() could be done in another series.
We can fix the issue crash first and then do virtio_error().

>
> >
> >
> >>
> >> Noted that the dummy userspace can't handle any control vq command
> >> effectively once the vhost backend fails, for e.g. how does it handle
> >> those guest offload, rx mode, MAC or VLAN filter changes without
> >> sending the request down to the backend?
> >
> >
> > It should be no difference compared to the real hardware. The device
> > is just malfunction. The driver can detect this in many ways. E.g in
> > the past I suggest to implement the device watchdog for virtio-net,
> > the prototype is posted but for some reason it was stalled. Maybe we
> > can consider to continue the work.
> Would you mind pointing me to the thread? What was the blocker then?

Something like

https://lore.kernel.org/netdev/20191122013636.1041-1-jcfaracco@gmail.com/

I think it doesn't have any blocker, it's probably because nobody
tries to keep working on that. And a drawback is that it's only used
for the net and only for TX. To have a more general detection of the
buggy device, we need a lot of work done in other places. E.g to
detect a stall in virtio_cread():

https://patchwork.kernel.org/project/qemu-devel/patch/20190611172032.19143-=
1-lvivier@redhat.com/

>
> I feel it might be nice to consider NEEDS_RESET handling for guest
> drivers as it is more relevant here.

Yes, but notice that they're a little bit different:

1) NEEDS_RESET, the device knows something is wrong and it can't be
recovered without a reset
2) watchdog, the device don't know there a bug inside itself

2) looks more robust at first glance.

>
> >
> >
> >> This could easily get inconsistent state to the guest if somehow we
> >> are able to resume the virtqueue without a reset. Even so, I suspect
> >> the device reset eventually is still needed on the other part, which
> >> is subject to the specific failure. It looks to me at least for
> >> vhost-vdpa, it might be the safest fallback so far to ignore pending
> >> event in ctrl_vq, and disable the device from moving forward in case
> >> of backend start failure.
> >
> >
> > I don't get here, if we fail to start vhost-vdpa, the Qemu should do a
> > safe rewind otherwise it would be a bug.
> In the ideal world, yes QEMU should back off to where it was. However, I
> worried that not all of the operations has a corresponding undo op
> symmetrically, for e.g. there's no unready op for vq_ready(),
> reset_owner() contains device reset internally to undo what set_owner()
> effects.

Note that as we discussed in another thread, the reset_owner() is
really confusing and may lead to a buggy device.

Actually, I don't see any real issues caused by the above rewind you
mentioned if we fallback to a device that doesn't send and receive
anything.

> It would be easier to just reset as a safe fallback in this case.

The problem is that we should have a way to work for the old guest. A
reset here may break existing virtio drivers since it was noticed by
the guest.

>
> >
> >
> >>
> >>>
> >>> It doesn't differ too much of the two approaches:
> >>>
> >>> 1) dummy fallback which can do even cvq
> >>>
> >>> and
> >>>
> >>> 2) disable host notifiers
> >>>
> >>> Especially consider 2) requires more changes.
> >> I'm not clear if 2) really needs more changes, as it seems to me that
> >> it would take more unwarranted changes to make dummy fallback to work
> >> on cvq? And suppose we can fallback to disabling device via
> >> virtio_error(), we don't even need to change any code on cvq?
> >
> >
> > So let me explain my points:
> >
> > 1) we use dummy receive as a fallback as vhost-user
> >
> > 2) the code should safely fallback to that otherwise it could be a bug
> > elsewhere
> >
> > 3) if we think the dummy fallback doesn't make sense, we can improve,
> > but we need to figure out why we can crash for 2) since the code could
> > be used in other path.
> I think we may either ignore pending request left behind on the vhost
> host notifier or even flush the queue in the stop path, since when
> reaching to this point all of the data vqs have been effectively stopped
> via vhost_dev_stop() and vhost_dev_disable_notifiers(). It looks that's
> what the dummy fallback did on the data vqs, too? i.e. receive_disabled
> is set until queues for the dummy backend are eventually flushed when
> device is fully stopped.
>
> What "could be used in other path" is the key question to answer in my
> opinion. Without knowing the (potential) use cases, it'd be hard to
> imagine what level of emulation needs to be done. I hope we don't have
> to involve complex code change to emulate changing the no. of queues
> when it's known all the heavy lifting done earlier will be effectively
> destroyed with a follow-up reset in the stop path.

That's my feeling as well.

>
> As said, I'm fine with not touching the dummy fallback part, but at
> least we should figure out a simple way to fix the vhost-vdpa control vq
> issue.

Right, that's my point, we can do any other things on top (since we
need a fix for -stable which should not be instructive). For the case
of control vq, I think we should make it as simple as falling back to
let Qemu to poll the ioeventfd, then it can safely fallback to the
userspace virtio_net_handle_ctrl()?

>
> >
> >
> >>
> >> On the other hand, for the specific code path this patch tries to
> >> fix, it is not due to failure to start vhost-vdpa backend, but more
> >> of a control flow flaw in the stop path due to lack of VQ stop uAPI.
> >> Let alone dummy or host notifier, considering currently it's in the
> >> stop path followed by a reset, I feel it should be pretty safe to
> >> just ignore the pending event on the control vq rather than process
> >> it prematurely in userspace. What do you think? I can leave without
> >> the host notifier handler change for sure.
> >
> >
> > I wonder how vhost-user deal with this.
> vhost-user doesn't expose host notifier for control vq. This path is not
> even involved. All requests on the control vq are handled by the
> emulated virtio_net_handle_ctrl handler in the QEMU process.

Right, but what I meant is that cvq should not differ from data vq in
this case. (Letting qemu to poll the ioeventfd and use
virtio_net_handle_cvq()).

>
> >
> >
> >>
> >>>
> >>>> I
> >>>> think this is very different from the vhost-kernel case in that once
> >>>> vhost fails, we can fallback to userspace to emulate the network
> >>>> through
> >>>> the tap fd in a good way. However, there's no equivalent yet for
> >>>> vhost-vdpa...
> >>>>
> >>> As said previously, technically we can have vhost-vDPA network backen=
d
> >>> as a fallback.
> >> But this is working as yet. And how do you envision the datapath may
> >> work given that we don't have a fallback tap fd?
> >
> >
> > I mean we can treat vhost-vdpa as a kind of general networking backend
> > that could be used by all NIC model like e1000e. Then we can use that
> > as a fallback.
> >
> > But I'm not sure it's worth to bother.
> Well, perhaps that's another story. I think to support that it would
> need more code refactoring than just the ioeventfd handler change alone..=
.

Right.

Thanks

>
> Thanks,
> -Siwei
>
> >
> > Thanks
> >
> >
> >>
> >> -Siwei
> >>
> >>
> >>>   (So did for vhost-user).
> >>>
> >>> Thanks
> >>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>
> >>>>> Thanks
> >>>>>
> >>>>>> Thanks,
> >>>>>> -Siwei
> >>>>>>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier
> >>>>>>>> (d=3Dd@entry=3D0x558f568f0f60, n=3Dn@entry=3D2,
> >>>>>>>> assign=3Dassign@entry=3Dtrue, with_irqfd=3Dwith_irqfd@entry=3Dfa=
lse)
> >>>>>>>>       at ../hw/virtio/virtio-pci.c:974
> >>>>>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers
> >>>>>>>> (d=3D0x558f568f0f60, nvqs=3D3, assign=3Dtrue) at
> >>>>>>>> ../hw/virtio/virtio-pci.c:1019
> >>>>>>>> 9  0x0000558f52bf091d in vhost_net_start
> >>>>>>>> (dev=3Ddev@entry=3D0x558f568f91f0, ncs=3D0x558f56937cd0,
> >>>>>>>> data_queue_pairs=3Ddata_queue_pairs@entry=3D1, cvq=3Dcvq@entry=
=3D1)
> >>>>>>>>       at ../hw/net/vhost_net.c:361
> >>>>>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status
> >>>>>>>> (status=3D<optimized out>, n=3D0x558f568f91f0) at
> >>>>>>>> ../hw/net/virtio-net.c:289
> >>>>>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status
> >>>>>>>> (vdev=3D0x558f568f91f0, status=3D15 '\017') at
> >>>>>>>> ../hw/net/virtio-net.c:370
> >>>>>>>> 12 0x0000558f52d6c4b2 in virtio_set_status
> >>>>>>>> (vdev=3Dvdev@entry=3D0x558f568f91f0, val=3Dval@entry=3D15 '\017'=
) at
> >>>>>>>> ../hw/virtio/virtio.c:1945
> >>>>>>>> 13 0x0000558f52c69eff in virtio_pci_common_write
> >>>>>>>> (opaque=3D0x558f568f0f60, addr=3D<optimized out>, val=3D<optimiz=
ed
> >>>>>>>> out>, size=3D<optimized out>) at ../hw/virtio/virtio-pci.c:1292
> >>>>>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor
> >>>>>>>> (mr=3D0x558f568f19d0, addr=3D20, value=3D<optimized out>, size=
=3D1,
> >>>>>>>> shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...)
> >>>>>>>>       at ../softmmu/memory.c:492
> >>>>>>>> 15 0x0000558f52d127de in access_with_adjusted_size
> >>>>>>>> (addr=3Daddr@entry=3D20, value=3Dvalue@entry=3D0x7f8cdbffe748,
> >>>>>>>> size=3Dsize@entry=3D1, access_size_min=3D<optimized out>,
> >>>>>>>> access_size_max=3D<optimized out>, access_fn=3D0x558f52d15cf0
> >>>>>>>> <memory_region_write_accessor>, mr=3D0x558f568f19d0, attrs=3D...=
)
> >>>>>>>> at ../softmmu/memory.c:554
> >>>>>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write
> >>>>>>>> (mr=3Dmr@entry=3D0x558f568f19d0, addr=3D20, data=3D<optimized ou=
t>,
> >>>>>>>> op=3D<optimized out>, attrs=3Dattrs@entry=3D...)
> >>>>>>>>       at ../softmmu/memory.c:1504
> >>>>>>>> 17 0x0000558f52d078e7 in flatview_write_continue
> >>>>>>>> (fv=3Dfv@entry=3D0x7f8accbc3b90, addr=3Daddr@entry=3D10307921512=
4,
> >>>>>>>> attrs=3D..., ptr=3Dptr@entry=3D0x7f8ce6300028, len=3Dlen@entry=
=3D1,
> >>>>>>>> addr1=3D<optimized out>, l=3D<optimized out>, mr=3D0x558f568f19d=
0) at
> >>>>>>>> ../../../include/qemu/host-utils.h:165
> >>>>>>>> 18 0x0000558f52d07b06 in flatview_write (fv=3D0x7f8accbc3b90,
> >>>>>>>> addr=3D103079215124, attrs=3D..., buf=3D0x7f8ce6300028, len=3D1)=
 at
> >>>>>>>> ../softmmu/physmem.c:2822
> >>>>>>>> 19 0x0000558f52d0b36b in address_space_write (as=3D<optimized
> >>>>>>>> out>, addr=3D<optimized out>, attrs=3D...,
> >>>>>>>> buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<optimized out>)
> >>>>>>>>       at ../softmmu/physmem.c:2914
> >>>>>>>> 20 0x0000558f52d0b3da in address_space_rw (as=3D<optimized out>,
> >>>>>>>> addr=3D<optimized out>, attrs=3D...,
> >>>>>>>>       attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028,
> >>>>>>>> len=3D<optimized out>, is_write=3D<optimized out>) at
> >>>>>>>> ../softmmu/physmem.c:2924
> >>>>>>>> 21 0x0000558f52dced09 in kvm_cpu_exec
> >>>>>>>> (cpu=3Dcpu@entry=3D0x558f55c2da60) at ../accel/kvm/kvm-all.c:290=
3
> >>>>>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn
> >>>>>>>> (arg=3Darg@entry=3D0x558f55c2da60) at ../accel/kvm/kvm-accel-ops=
.c:49
> >>>>>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=3D<optimized
> >>>>>>>> out>) at ../util/qemu-thread-posix.c:556
> >>>>>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so=
.0
> >>>>>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
> >>>>>>>>
> >>>>>>>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
> >>>>>>>> Cc: Jason Wang <jasowang@redhat.com>
> >>>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >>>>>>>> ---
> >>>>>>>>     hw/virtio/virtio-bus.c | 3 ++-
> >>>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> >>>>>>>> index 0f69d1c..3159b58 100644
> >>>>>>>> --- a/hw/virtio/virtio-bus.c
> >>>>>>>> +++ b/hw/virtio/virtio-bus.c
> >>>>>>>> @@ -311,7 +311,8 @@ void
> >>>>>>>> virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
> >>>>>>>>         /* Test and clear notifier after disabling event,
> >>>>>>>>          * in case poll callback didn't have time to run.
> >>>>>>>>          */
> >>>>>>>> -    virtio_queue_host_notifier_read(notifier);
> >>>>>>>> +    if (!vdev->disable_ioeventfd_handler)
> >>>>>>>> +        virtio_queue_host_notifier_read(notifier);
> >>>>>>>>         event_notifier_cleanup(notifier);
> >>>>>>>>     }
> >>>>>>>>
> >>>>>>>> --
> >>>>>>>> 1.8.3.1
> >>>>>>>>
> >>
> >
>


