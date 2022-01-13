Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871348DEC3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:19:28 +0100 (CET)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86ZD-0000VU-G3
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n86Bj-0003uN-4f; Thu, 13 Jan 2022 14:55:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n86Bf-0000En-8n; Thu, 13 Jan 2022 14:55:10 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DJpj8B018025; 
 Thu, 13 Jan 2022 19:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=gLxxVkEuwOfa1uiWA+WF4AetZ5iwEFLZOSeEsGduc7I=;
 b=Jb1TWtcqieTiheXfIgM/sIe+TQEmQkQ6hE67ozDI5AAhW+cQkVRAytg96PHlkS1m6wJd
 LFDTs1qqZAn7W1jA8kTMtRfD8ILqprWz5TnpburmeQFBGfNPBr68oHiqQUMLu+Ao9GpT
 tlJA7Qgdh85xi5CNrJJ/k0vBwnYM3HU45xuIL5aYSZ+ClxBO37/GlqeCy9EO6lWC2xng
 k22xx/J08ieDP7MmetuLeztVFtweG+K5sp7jdPWs8bpMxyAN4u0GPxmWg83cKZH1D2We
 kvOaBbsdsUtzFuGzH4zc4Xr5Xf3YDrrVCFXYiVP7CxD7XysAe4SvMAK9WfAl3LccPljW TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djtm2r19p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 19:55:04 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DJt4dq031070;
 Thu, 13 Jan 2022 19:55:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djtm2r18s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 19:55:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DJqSq1027416;
 Thu, 13 Jan 2022 19:55:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjqxa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 19:55:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DJsxVb37617942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 19:54:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6667A4053;
 Thu, 13 Jan 2022 19:54:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 846CAA406D;
 Thu, 13 Jan 2022 19:54:58 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.15.51])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 13 Jan 2022 19:54:58 +0000 (GMT)
Date: Thu, 13 Jan 2022 20:54:52 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220113205452.4443ee4e.pasic@linux.ibm.com>
In-Reply-To: <20220113115617-mutt-send-email-mst@kernel.org>
References: <20220113165131.1057714-1-pasic@linux.ibm.com>
 <20220113115617-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3JLX9GHxmHvYm8qjm6z3Gx-bEgMEERhU
X-Proofpoint-ORIG-GUID: giupPGG0E8rpJFru3Uu7IDvwjtGszRJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_09,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130119
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-stable@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 12:11:42 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jan 13, 2022 at 05:51:31PM +0100, Halil Pasic wrote:
> > The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > unsupported") claims to fail the device hotplug when iommu_platform
> > is requested, but not supported by the (vhost) device. On the first
> > glance the condition for detecting that situation looks perfect, but
> > because a certain peculiarity of virtio_platform it ain't.
> > 
> > In fact the aforementioned commit introduces a regression. It breaks
> > virtio-fs support for Secure Execution, and most likely also for AMD SEV
> > or any other confidential guest scenario that relies encrypted guest
> > memory.  The same also applies to any other vhost device that does not
> > negotiate _F_ACCESS_PLATFORM.
> > 
> > The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> > "device can not access all of the guest ram" and "iova != gpa, thus
> > device needs to translate iova".
> > 
> > Confidential guest technologies currently rely on the device/hypervisor
> > offering _F_ACCESS_PLATFORM to grant access to whatever the device needs
> > to see, because of the first. But, generally, they don't care for the
> > second.
> > 
> > This is the very reason for which commit 7ef7e6e3b ("vhost: correctly
> > turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> > form the vhost device that does not need it, because on the vhost
> > interface it only means "I/O address translation is needed".
> > 
> > This patch takes inspiration from 7ef7e6e3b ("vhost: correctly turn on
> > VIRTIO_F_IOMMU_PLATFORM"),  
> 
> Strange, I could not find this commit. Did you mean f7ef7e6e3b?
> 

Right! Copy-paste error.


 
 static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
@@ -765,6 +772,9 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
     if (enable_log) {
         features |= 0x1ULL << VHOST_F_LOG_ALL;
     }
+    if (!vhost_dev_has_iommu(dev)) {
+        features &= ~(0x1ULL << VIRTIO_F_IOMMU_PLATFORM);
+    }
     r = dev->vhost_ops->vhost_set_features(dev, features);
     if (r < 0) {
         VHOST_OPS_DEBUG("vhost_set_features failed");

> > and uses the same condition for detecting the
> > situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> > by the device, and thus no device capability is needed.
> >
> > In this
> > situation claiming that the device does not support iommu_plattform=on
> > is counter-productive. So let us stop doing that!
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> > Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> > unsupported")
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: qemu-stable@nongnu.org
> > 
> > ---
> > 
> > @Kevin: Can you please verify, that I don't break your fix?  
> 
> So which configurations did you test for this?

I tested it with virtio-fs and qemu-system-s390x with -device
vhost-user-fs-ccw,iommu_platform=on,...

Regards,
Halil

> 
> > ---
> >  hw/virtio/virtio-bus.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index d23db98c56..c1578f3de2 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >          return;
> >      }
> >  
> > -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > -        error_setg(errp, "iommu_platform=true is not supported by the device");
> > -        return;
> > -    }
> > -
> >      if (klass->device_plugged != NULL) {
> >          klass->device_plugged(qbus->parent, &local_err);
> >      }
> > @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >      } else {
> >          vdev->dma_as = &address_space_memory;
> >      }
> > +
> > +    if (has_iommu && vdev->dma_as != &address_space_memory
> > +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > +        error_setg(errp, "iommu_platform=true is not supported by the device");
> > +        return;
> > +    }
> >  }
> >  /* Reset the virtio_bus */
> > 
> > base-commit: f8d75e10d3e0033a0a29a7a7e4777a4fbc17a016
> > -- 
> > 2.32.0  
> 
> 


