Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4649E39D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:35:13 +0100 (CET)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4vg-0006hn-34
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:35:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nD4pZ-0004rh-Ki; Thu, 27 Jan 2022 08:28:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nD4pX-0003p0-CA; Thu, 27 Jan 2022 08:28:53 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RDLVIL006403; 
 Thu, 27 Jan 2022 13:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=eDEPkATPQPDL31PXh7ddlSgsEeC+Op6PO0f0B8tkz3Y=;
 b=QH0SOaQBoxZYvaSu/AmQy8RKM9RIOKSChgrkui23EfKR5VoqjLY0in4v44CboLdNn6vV
 ZRUUW2jWt+Y6Re4QcZqtm/qzd4sPik655qj5N1nriizSO3gmW+eFEVTD/3pDzMxZGHki
 i9/cHZll9LAsKfhyCVk5UZhGnOVT09pOWSGwpT+l8TmDROUJqXnkshAzYCDq4kwhS7K2
 +b3WEfu+3tq+cIQLEX5SDIG8wcntqTTNZ1cTGnpSDuLO/n59k5pojVALAMbqoP+c5zIt
 /PjXW6BL4n4fBUeHirv5iYR3fITgEoITgRmjob6j487NyFEGKzfkaO1B1DPCuDuETi/Z lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dutb5as4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 13:28:45 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RDLTVT006265;
 Thu, 27 Jan 2022 13:28:45 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dutb5as3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 13:28:45 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RDSdCf009262;
 Thu, 27 Jan 2022 13:28:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3dr9j9p6b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 13:28:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20RDIQOK49611118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 13:18:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71C152057;
 Thu, 27 Jan 2022 13:28:03 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.77.44])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 7226452050; 
 Thu, 27 Jan 2022 13:28:03 +0000 (GMT)
Date: Thu, 27 Jan 2022 14:28:00 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220127142800.11d8f1be.pasic@linux.ibm.com>
In-Reply-To: <20220125112112.44957075.pasic@linux.ibm.com>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
 <20220125112112.44957075.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -pnxM4WbeS3HGPM8BNZYGww9aQPfBHfi
X-Proofpoint-ORIG-GUID: mhOOv_UvRKFgdtAnjjgJ4a9vuxVAcC0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270079
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping^2

Also adding Brijesh and Daniel, as I believe you guys should be
interested in this, and I'm yet to receive review.

@Brijesh, Daniel: Can you confirm that AMD (SEV) and Power are affected
too, and that the fix works for your platforms as well?

Regards,
Halil

On Tue, 25 Jan 2022 11:21:12 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> ping
> 
> On Mon, 17 Jan 2022 13:02:38 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
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
> > support _F_ACCESS_PLATFORM.
> > 
> > The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> > "device can not access all of the guest RAM" and "iova != gpa, thus
> > device needs to translate iova".
> > 
> > Confidential guest technologies currently rely on the device/hypervisor
> > offering _F_ACCESS_PLATFORM, so that, after the feature has been
> > negotiated, the guest  grants access to the portions of memory the
> > device needs to see. So in for confidential guests, generally,
> > _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> > about the addresses used being something else than guest physical
> > addresses.
> > 
> > This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> > turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> > form the vhost device that does not need it, because on the vhost
> > interface it only means "I/O address translation is needed".
> > 
> > This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> > VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> > situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> > by the device, and thus no device capability is needed. In this
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
> > v1->v2: 
> > * Commit message tweaks. Most notably fixed commit SHA (Michael)
> > 
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
> >  
> >  /* Reset the virtio_bus */
> > 
> > base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32  
> 


