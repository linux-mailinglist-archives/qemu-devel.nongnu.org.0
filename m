Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1149F0FB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 03:31:55 +0100 (CET)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDH3K-0005e7-13
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 21:31:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nDH1K-0004le-QX; Thu, 27 Jan 2022 21:29:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nDH1H-00012K-RW; Thu, 27 Jan 2022 21:29:50 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20S08h9G006195; 
 Fri, 28 Jan 2022 02:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DZoY6LxH7p/fZXKgqQq8AK+U5c6SDL88scte+ds5zfg=;
 b=RdyjayuJcXLllouKGwhpF8wKQfNI8ADOKKk/VcrzGjDc+wJy950e4FF/oKXGTbniuheX
 ZGUatviJuHB2/jqJKhN0xx5bWXoN6BcHXJkoctpQT06Wq1e768PPJd6B48dXxljMaXuw
 8VkJvVywnebu5JxHcPrkXUyedh1gjsDIoThbvx1eZxGTf6Nf9+oBFQhO82V9usYn5PC3
 rCC8x5rOzOUPYxFYxJcfEs42uXx3jPfRuIsvsgTHI/1AA22PGioL0R9jwBipHqvqnn5+
 zUI4egQza1v3BXn9Dk3i9G+DAIohaFdQU/T0WIDdw3S1wzHTPGNBY91/QgpVc+l5d111 rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv41wbk54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 02:29:43 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20S2QEMn007006;
 Fri, 28 Jan 2022 02:29:43 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv41wbk4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 02:29:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20S2DCVl018922;
 Fri, 28 Jan 2022 02:29:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3dr96k5fbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 02:29:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20S2Tc8r40960296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 02:29:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C73A405C;
 Fri, 28 Jan 2022 02:29:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F21DA4054;
 Fri, 28 Jan 2022 02:29:37 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.77.44])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 28 Jan 2022 02:29:37 +0000 (GMT)
Date: Fri, 28 Jan 2022 03:29:11 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220128032911.440323f1.pasic@linux.ibm.com>
In-Reply-To: <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
 <20220127142800.11d8f1be.pasic@linux.ibm.com>
 <be34f50a-9664-7411-1e9b-2bac4735311d@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oUVHHIPIDzm6ELqshJiaAkrrhE5lMDKQ
X-Proofpoint-ORIG-GUID: mJCK_O8h62mAS6yonKM7cbnBxE4M45ze
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_06,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280007
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 18:34:23 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 1/27/22 10:28, Halil Pasic wrote:
> > ping^2
> > 
> > Also adding Brijesh and Daniel, as I believe you guys should be
> > interested in this, and I'm yet to receive review.
> > 
> > @Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
> > too, and that the fix works for your platforms as well?  
> 
> I failed to find a host that has Power secure execution support. I'll keep looking.
> 
> 
> Meanwhile I have to mention that this patch re-introduced the problem that Kevin's
> commit fixed.
> 
> 
> With current upstream, if you start a regular guest with the following command line:
> 
> qemu-system-ppc64 (....)
> -chardev socket,id=char0,path=/tmp/vhostqemu
> -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on
> 
> i.e. a guest with a vhost-user-fs-pci device that claims to have iommu support,
> but it doesn't, this is the error message:
> 
> 
> qemu-system-ppc64: -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on: iommu_platform=true is not supported by the device
> 
> 
> With this patch, that command line above starts the guest. 
> virtiofsd fails during boot:
> 
> sudo ~/qemu/build/tools/virtiofsd/virtiofsd --socket-path=/tmp/vhostqemu -o source=~/linux-L1
> [sudo] password for danielhb:
> virtio_session_mount: Waiting for vhost-user socket connection...
> virtio_session_mount: Received vhost-user socket connection
> virtio_loop: Entry
> fv_panic: libvhost-user: Invalid vring_addr message
> 
> 
> And inside the guest, if you attempt to mount and use the virtiofs filesystem, the guest
> hangs:
> 
> [root@localhost ~]# mount -t virtiofs myfs /mnt
> [root@localhost ~]# cd /mnt
> 
> (hangs)
> 
> Exiting QEMU throws several vhost related errors:
> 
> 
> QEMU 6.2.50 monitor - type 'help' for more information
> (qemu) quit
> qemu-system-ppc64: Failed to set msg fds.
> qemu-system-ppc64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-ppc64: Failed to set msg fds.
> qemu-system-ppc64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-ppc64: Failed to set msg fds.
> qemu-system-ppc64: vhost_set_vring_call failed: Invalid argument (22)
> qemu-system-ppc64: Failed to set msg fds.
> qemu-system-ppc64: vhost_set_vring_call failed: Invalid argument (22)
> 
> 


Does your VM have an IOMMU and does your guest see it? If yes does
vdev->dma_as != &address_space_memory hold for your virtio device? If no why not?

My understanding is that your guest wants to do translated addresses,
because it sees the ACCESS_PLATFORM feature, and probably thinks that
your device is indeed behind an IOMMU, from what I assume, at least it
sees that there is an IOMMU. But then I would expect your virtio device
to have its vdev->dma_as set to something different than
&address_space_memory. Conversely if your dma address space is
address_space_memory, then you don't need address translation because
your dma addresses are the same  as your guest physical addresses.

> 
> I made a little experiment with upstream and reverting Kevin's patch and the result is
> the same, meaning that this is the original bug [1] Kevin fixed back then. Note that [1]
> was reported on x86, meaning that this particular issue seems to be arch agnostic.

We don't have this problem on s390, so it ain't entirely arch agnostic.

> 
> 
> My point here is that your patch fixes the situation for s390x, and Brijesh already chimed
> in claiming that it fixed for AMD SEV, but it reintroduced a bug. I believe you should
> include this test case with vhost-user in your testing to figure out a way to fix what
> is needed without adding this particular regression.

Can you help me with this? IMHO the big problem is that iommu_platform
is used for two distinct things. I've described that in the commit
message.

We may be able to differentiate between the two using ->dma_as, but for
that it needs to be set up correctly: whenever you require translation
it should be something different than address_space_memory. The question
is why do you require translation but don't have your ->dma_as set up
properly? It can be a guest thing, i.e. guest just assumes it has to do
bus addresses, while it actually does not have to, or we indeed do have
an IOMMU which polices the devices access to the guest memory, but for
some strange reason we failed to set up ->dma_as to reflect that.

@Michael: what is your opinion?

> 
> 
> In fact, I have a feeling that this is not the first time this kind of situation is discussed
> around here. This reminds me of [2] and a discussion about the order virtiofs features
> are negotiated versus when/how QEMU inits the devices.
> 
> 
> 
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1935019
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05644.html
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> > 
> > Regards,
> > Halil
> > 
> > On Tue, 25 Jan 2022 11:21:12 +0100
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> >> ping
> >>
> >> On Mon, 17 Jan 2022 13:02:38 +0100
> >> Halil Pasic <pasic@linux.ibm.com> wrote:
> >>  
> >>> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> >>> unsupported") claims to fail the device hotplug when iommu_platform
> >>> is requested, but not supported by the (vhost) device. On the first
> >>> glance the condition for detecting that situation looks perfect, but
> >>> because a certain peculiarity of virtio_platform it ain't.
> >>>
> >>> In fact the aforementioned commit introduces a regression. It breaks
> >>> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> >>> or any other confidential guest scenario that relies encrypted guest
> >>> memory.  The same also applies to any other vhost device that does not
> >>> support _F_ACCESS_PLATFORM.
> >>>
> >>> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> >>> "device can not access all of the guest RAM" and "iova != gpa, thus
> >>> device needs to translate iova".
> >>>
> >>> Confidential guest technologies currently rely on the device/hypervisor
> >>> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> >>> negotiated, the guest  grants access to the portions of memory the
> >>> device needs to see. So in for confidential guests, generally,
> >>> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> >>> about the addresses used being something else than guest physical
> >>> addresses.
> >>>
> >>> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> >>> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> >>> form the vhost device that does not need it, because on the vhost
> >>> interface it only means "I/O address translation is needed".
> >>>
> >>> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> >>> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> >>> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> >>> by the device, and thus no device capability is needed. In this
> >>> situation claiming that the device does not support iommu_plattform=on
> >>> is counter-productive. So let us stop doing that!
> >>>
> >>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >>> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> >>> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> >>> unsupported")
> >>> Cc: Kevin Wolf <kwolf@redhat.com>
> >>> Cc: qemu-stable@nongnu.org
> >>>
> >>> ---
> >>>
> >>> v1->v2:
> >>> * Commit message tweaks. Most notably fixed commit SHA (Michael)
> >>>
> >>> ---
> >>>   hw/virtio/virtio-bus.c | 11 ++++++-----
> >>>   1 file changed, 6 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> >>> index d23db98c56..c1578f3de2 100644
> >>> --- a/hw/virtio/virtio-bus.c
> >>> +++ b/hw/virtio/virtio-bus.c
> >>> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >>>           return;
> >>>       }
> >>>   
> >>> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> >>> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> >>> -        return;
> >>> -    }
> >>> -
> >>>       if (klass->device_plugged != NULL) {
> >>>           klass->device_plugged(qbus->parent, &local_err);
> >>>       }
> >>> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >>>       } else {
> >>>           vdev->dma_as = &address_space_memory;
> >>>       }
> >>> +
> >>> +    if (has_iommu && vdev->dma_as != &address_space_memory
> >>> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> >>> +        error_setg(errp, "iommu_platform=true is not supported by the device");
> >>> +        return;
> >>> +    }
> >>>   }
> >>>   
> >>>   /* Reset the virtio_bus */
> >>>
> >>> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32  
> >>  
> > 
> >   
> 


