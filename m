Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D19F610775
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 03:52:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEWM-00005B-GJ; Thu, 27 Oct 2022 21:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEWK-0008Vr-Bz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEWI-00011q-A5
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666921849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuZkM/p5osti0oZnlI6uZwanJCKS/JfzrjjrCDR5zPM=;
 b=LnFGiR9JclhJz4ezP3wMb/1i2NnNbl/DI+ny6CHyLtjIWKFuRZruLomnS4v7Ao0Yjz2fx1
 yECNC9mZzN+Y7V+yxqYyJ1g6mDkV3VS55mF2BFffzHyMS1rwdKV3UOHoKZfFjhPS+9AHA0
 G0GIm684HoWJDKnNQxaZ4A1ncSEHlHs=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-9Hi-wxWiPRS6-pBWC_o7nQ-1; Thu, 27 Oct 2022 21:50:48 -0400
X-MC-Unique: 9Hi-wxWiPRS6-pBWC_o7nQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 bi20-20020a056808189400b00359c967561aso1311951oib.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 18:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CuZkM/p5osti0oZnlI6uZwanJCKS/JfzrjjrCDR5zPM=;
 b=vKH+L/zBsUaRwdfOFMOceVE7HVvAFxhY9praB795MOZllL7vkzaitIuYYYnyJoBI4D
 Dgt4QDrbmdQZwQbDKo9RI7q3jQsOgpJr0YQLrypYRE9o7mBecdHXlESwfUdcK+05AINJ
 C5qNl4AeCmo4sYpZeaptMSEZwpPjWhWXiRVu1IZGC5Pb8SOyP4c75Mq8uuqdwCZAtgML
 eVsMow8hzosxkGtRViNbsnkoiwaVtT0mgpgYmVOGpGjBiV/so3iHf7mSUBPZDb63cDbO
 rBgEOy30ZlNp0YC7DqB1MJSXWIveI4qvhZbkseBdrreko98yJtNzWO6ZZh1cmUk46i6M
 W25g==
X-Gm-Message-State: ACrzQf2tr/tF6qB/Du4qZHLkMP2+7ArbOXzsRNGCX+1xVoYYxkob7Pms
 U8sQ+lLKCc76qN9z6fMO941EdnBbR33oKCOIVG1UmL1OZV0K94CGjIObXGTA0qG/rqRBqZkvJX+
 9PWOpn87dadKw+RdMuuAxIz77NuMwwTU=
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr25730837otg.237.1666921847657; 
 Thu, 27 Oct 2022 18:50:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vQ/IvfGNoxjZv/6N04UMcjFfWv6t7sWJSWtgVcXhAz8O8uy3D/xVkKWV9+Fm4OyEKHbZTfrUK/+lPcPE/LIc=
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr25730822otg.237.1666921847365; Thu, 27
 Oct 2022 18:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
 <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
 <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
 <6310b693-b885-3242-9579-92f189f0d1b5@redhat.com>
 <d625202e-9729-a050-db31-da2a5d89d58c@oracle.com>
 <dca26485-162a-6c61-33af-94e062503e11@oracle.com>
In-Reply-To: <dca26485-162a-6c61-33af-94e062503e11@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Oct 2022 09:50:35 +0800
Message-ID: <CACGkMEujkyvGX4Vbq=z1J=o4pU6UkoXzE-oUNmscmDyt6GTqvQ@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com, 
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>,
 Shuo Wang <shuo.s.wang@oracle.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 5:56 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> Hi Jason,
>
> Sorry for top posting, but are you going to queue this patch? It looks
> like the discussion has been settled and no further comment I got for 2
> weeks for this patch.

Yes, I've queued this.

Thanks

>
> Thanks,
> -Siwei
>
> On 10/13/2022 4:12 PM, Si-Wei Liu wrote:
> > Jason,
> >
> > On 10/12/2022 10:02 PM, Jason Wang wrote:
> >>
> >> =E5=9C=A8 2022/10/12 13:59, Si-Wei Liu =E5=86=99=E9=81=93:
> >>>
> >>>
> >>> On 10/11/2022 8:09 PM, Jason Wang wrote:
> >>>> On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<si-wei.liu@oracle.com>
> >>>> wrote:
> >>>>> On 10/8/2022 10:43 PM, Jason Wang wrote:
> >>>>>
> >>>>> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com>
> >>>>> wrote:
> >>>>>
> >>>>> Similar to other vhost backends, vhostfd can be passed to vhost-vdp=
a
> >>>>> backend as another parameter to instantiate vhost-vdpa net client.
> >>>>> This would benefit the use case where only open file descriptors, a=
s
> >>>>> opposed to raw vhost-vdpa device paths, are accessible from the QEM=
U
> >>>>> process.
> >>>>>
> >>>>> (qemu) netdev_add type=3Dvhost-vdpa,vhostfd=3D61,id=3Dvhost-vdpa1
> >>>>>
> >>>>> Adding Cindy.
> >>>>>
> >>>>> This has been discussed before, we've already had
> >>>>> vhostdev=3D/dev/fdset/$fd which should be functional equivalent to =
what
> >>>>> has been proposed here. (And this is how libvirt works if I
> >>>>> understand
> >>>>> correctly).
> >>>>>
> >>>>> Yes, I was aware of that discussion. However, our implementation
> >>>>> of the management software is a bit different from libvirt, in
> >>>>> which the paths in /dev/fdset/NNN can't be dynamically passed to
> >>>>> the container where QEMU is running. By using a specific vhostfd
> >>>>> property with existing code, it would allow our mgmt software
> >>>>> smooth adaption without having to add too much infra code to
> >>>>> support the /dev/fdset/NNN trick.
> >>>> I think fdset has extra flexibility in e.g hot-plug to allow the fil=
e
> >>>> descriptor to be passed with SCM_RIGHTS.
> >>> Yes, that's exactly the use case we'd like to support. Though the
> >>> difference in our mgmt software stack from libvirt is that any
> >>> dynamic path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ)
> >>> can't be allowed to get passed through to the container running QEMU
> >>> on the fly for security reasons. fd passing is allowed, though, with
> >>> very strict security checks.
> >>
> >>
> >> Interesting, any reason for disallowing fd passing?
> > For our mgmt software stack, QEMU is running in a secured container
> > with its own namespace(s) with minimally well known and trusted
> > devices from root ns exposed (only) at the time when QEMU is being
> > started.  Direct fd passing via SCM_RIGHTS is allowed, but fdset
> > device node exposure is not allowed and not even considered useful to
> > us, as it adds an unwarranted attack surface to the QEMU's secured
> > container unnecessarily. This has been the case and our security model
> > for a while now w.r.t hot plugging vhost-net/tap and vhost-scsi
> > devices, so will do for vhost-vdpa with vhostfd. It's not an open
> > source project, though what I can share is that it's not a simple
> > script that can be easily changed, and allow passing extra devices
> > e.g. fdset especially on the fly is not even in consideration per
> > suggested security guideline. I think we don't do anything special
> > here as with other secured containers that disallow dynamic device
> > injection on the fly.
> >
> >> I'm asking since it's the way that libvirt work and it seems to me we
> >> don't get any complaints in the past.
> > I guess it was because libvirt doesn't run QEMU in a container with
> > very limited device exposure, otherwise this sort of constraints would
> > pop up. Anyway the point and the way I see it is that passing vhostfd
> > is proved to be working well and secure with other vhost devices, I
> > don't see why vhost-vdpa is treated special here that would need to
> > enforce the fdset usage. It's an edge case for libvirt maybe, but
> > supporting QEMU's vhost-vdpa device to run in a securely contained
> > environment with no dynamic device injection shouldn't be an odd or
> > bizarre use case.
> >
> >
> > Thanks,
> > -Siwei
> >
> >>
> >>
> >>> That's the main motivation for this direct vhostfd passing support
> >>> (noted fdset doesn't need to be used along with /dev/fdset node).
> >>>
> >>> Having it said, I found there's also nuance in the
> >>> vhostdev=3D/dev/fdset/XyZ interface besides the /dev node limitation:
> >>> the fd to open has to be dup'ed from the original one passed via
> >>> SCM_RIGHTS. This also has implication on security that any ioctl
> >>> call from QEMU can't be audited through the original fd.
> >>
> >>
> >> I'm not sure I get this, but management layer can enforce a ioctl
> >> whiltelist for safety.
> >>
> >> Thanks
> >>
> >>
> >>> With this regard, I think vhostfd offers more flexibility than work
> >>> around those qemu_open() specifics. Would these justify the use case
> >>> of concern?
> >>>
> >>> Thanks,
> >>> -Siwei
> >>>
> >>>>   It would still be good to add
> >>>> the support.
> >>>>
> >>>>> On the other hand, the other vhost backends, e.g. tap (via
> >>>>> vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as
> >>>>> parameter to instantiate device, although the /dev/fdset trick
> >>>>> also works there. I think vhost-vdpa is not  unprecedented in this
> >>>>> case?
> >>>> Yes.
> >>>>
> >>>> Thanks
> >>>>
> >>>>> Thanks,
> >>>>> -Siwei
> >>>>>
> >>>>>
> >>>>>
> >>>>> Thanks
> >>>>>
> >>>>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
> >>>>> Acked-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> >>>>>
> >>>>> ---
> >>>>> v2:
> >>>>>    - fixed typo in commit message
> >>>>>    - s/fd's/file descriptors/
> >>>>> ---
> >>>>>   net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
> >>>>>   qapi/net.json    |  3 +++
> >>>>>   qemu-options.hx  |  6 ++++--
> >>>>>   3 files changed, 27 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>> index 182b3a1..366b070 100644
> >>>>> --- a/net/vhost-vdpa.c
> >>>>> +++ b/net/vhost-vdpa.c
> >>>>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev
> >>>>> *netdev, const char *name,
> >>>>>
> >>>>>       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>>>>       opts =3D &netdev->u.vhost_vdpa;
> >>>>> -    if (!opts->vhostdev) {
> >>>>> -        error_setg(errp, "vdpa character device not specified
> >>>>> with vhostdev");
> >>>>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
> >>>>> +        error_setg(errp,
> >>>>> +                   "vhost-vdpa: neither vhostdev=3D nor vhostfd=3D
> >>>>> was specified");
> >>>>>           return -1;
> >>>>>       }
> >>>>>
> >>>>> -    vdpa_device_fd =3D qemu_open(opts->vhostdev, O_RDWR, errp);
> >>>>> -    if (vdpa_device_fd =3D=3D -1) {
> >>>>> -        return -errno;
> >>>>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
> >>>>> +        error_setg(errp,
> >>>>> +                   "vhost-vdpa: vhostdev=3D and vhostfd=3D are
> >>>>> mutually exclusive");
> >>>>> +        return -1;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (opts->has_vhostdev) {
> >>>>> +        vdpa_device_fd =3D qemu_open(opts->vhostdev, O_RDWR, errp)=
;
> >>>>> +        if (vdpa_device_fd =3D=3D -1) {
> >>>>> +            return -errno;
> >>>>> +        }
> >>>>> +    } else if (opts->has_vhostfd) {
> >>>>> +        vdpa_device_fd =3D monitor_fd_param(monitor_cur(),
> >>>>> opts->vhostfd, errp);
> >>>>> +        if (vdpa_device_fd =3D=3D -1) {
> >>>>> +            error_prepend(errp, "vhost-vdpa: unable to parse
> >>>>> vhostfd: ");
> >>>>> +            return -1;
> >>>>> +        }
> >>>>>       }
> >>>>>
> >>>>>       r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp=
);
> >>>>> diff --git a/qapi/net.json b/qapi/net.json
> >>>>> index dd088c0..926ecc8 100644
> >>>>> --- a/qapi/net.json
> >>>>> +++ b/qapi/net.json
> >>>>> @@ -442,6 +442,8 @@
> >>>>>   # @vhostdev: path of vhost-vdpa device
> >>>>>   #            (default:'/dev/vhost-vdpa-0')
> >>>>>   #
> >>>>> +# @vhostfd: file descriptor of an already opened vhost vdpa device
> >>>>> +#
> >>>>>   # @queues: number of queues to be created for multiqueue vhost-vd=
pa
> >>>>>   #          (default: 1)
> >>>>>   #
> >>>>> @@ -456,6 +458,7 @@
> >>>>>   { 'struct': 'NetdevVhostVDPAOptions',
> >>>>>     'data': {
> >>>>>       '*vhostdev':     'str',
> >>>>> +    '*vhostfd':      'str',
> >>>>>       '*queues':       'int',
> >>>>>       '*x-svq':        {'type': 'bool', 'features' : [ 'unstable']
> >>>>> } } }
> >>>>>
> >>>>> diff --git a/qemu-options.hx b/qemu-options.hx
> >>>>> index 913c71e..c040f74 100644
> >>>>> --- a/qemu-options.hx
> >>>>> +++ b/qemu-options.hx
> >>>>> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
> >>>>>       "                configure a vhost-user network, backed by a
> >>>>> chardev 'dev'\n"
> >>>>>   #endif
> >>>>>   #ifdef __linux__
> >>>>> -    "-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"
> >>>>> +    "-netdev
> >>>>> vhost-vdpa,id=3Dstr[,vhostdev=3D/path/to/dev][,vhostfd=3Dh]\n"
> >>>>>       "                configure a vhost-vdpa network,Establish a
> >>>>> vhost-vdpa netdev\n"
> >>>>> +    "                use 'vhostdev=3D/path/to/dev' to open a vhost
> >>>>> vdpa device\n"
> >>>>> +    "                use 'vhostfd=3Dh' to connect to an already
> >>>>> opened vhost vdpa device\n"
> >>>>>   #endif
> >>>>>   #ifdef CONFIG_VMNET
> >>>>>       "-netdev vmnet-host,id=3Dstr[,isolated=3Don|off][,net-uuid=3D=
uuid]\n"
> >>>>> @@ -3280,7 +3282,7 @@ SRST
> >>>>>                -netdev type=3Dvhost-user,id=3Dnet0,chardev=3Dchr0 \
> >>>>>                -device virtio-net-pci,netdev=3Dnet0
> >>>>>
> >>>>> -``-netdev vhost-vdpa,vhostdev=3D/path/to/dev``
> >>>>> +``-netdev vhost-vdpa[,vhostdev=3D/path/to/dev][,vhostfd=3Dh]``
> >>>>>       Establish a vhost-vdpa netdev.
> >>>>>
> >>>>>       vDPA device is a device that uses a datapath which complies
> >>>>> with
> >>>>> --
> >>>>> 1.8.3.1
> >>>>>
> >>>>>
> >>>
> >>
> >
>


