Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095E4A6AD2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:16:27 +0100 (CET)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF74D-000635-KD
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:16:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nF4GV-00038P-GY; Tue, 01 Feb 2022 20:16:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62848
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nF4GS-0006yN-0q; Tue, 01 Feb 2022 20:16:54 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211Mt94N014693; 
 Wed, 2 Feb 2022 01:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ftBMUTs5HN3HlXaP9lJGyiR24wFV4IrEqHuQ8m8h/9s=;
 b=QO+ju7QR36Omy0gKcVzbtJH/CNSxrb4daKcogkYf70d+m2MCpUcYvaVeIoFp7Qq/Z06m
 dmXgNG4Ajf48vS7SRq76pFjJlGouEHRkCIIgKSvb1yulgQ9nvL6JM0VzBcm5dRRGHSH9
 j94J7fmEWKDZFR4rhM+PDYc/9B5ght0ES0TfAb2fyEJQvp6mgyCeWxv8IBCJ3Ece+q1N
 IakqBYmc7G69XMRYSVkYmQwmsk75tamQXcukgg3KF+4oNgM1LAT0TW6jjbYiCKApGQ77
 7779gTdu98qJs1TLyf95yKmHhyRs4P+1c8LJHHHlq74gMRCk/lLb3J9nEwA4991zfiNw rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dye31hv3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 01:16:15 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2121CZNk019105;
 Wed, 2 Feb 2022 01:16:14 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dye31hv3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 01:16:14 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2121Cx51031969;
 Wed, 2 Feb 2022 01:16:12 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3dvw79fqeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 01:16:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2121G9Vo45285882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Feb 2022 01:16:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2622311C04C;
 Wed,  2 Feb 2022 01:16:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94C8A11C058;
 Wed,  2 Feb 2022 01:16:08 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.90.234])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Feb 2022 01:16:08 +0000 (GMT)
Date: Wed, 2 Feb 2022 02:15:47 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220202021547.20dc65c9.pasic@linux.ibm.com>
In-Reply-To: <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
 <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rK1bFqLpmKSAQH_8n-Prv5P3hmvdDir5
X-Proofpoint-ORIG-GUID: eWH9UyRoJYC5Z0Nm_W15Npqhw60d0goc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_10,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020002
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 16:31:22 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 2/1/22 15:33, Halil Pasic wrote:
> > On Tue, 1 Feb 2022 12:36:25 -0300
> > Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:
> >   
> >>> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >>>        if (klass->get_dma_as != NULL && has_iommu) {
> >>>            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >>>            vdev->dma_as = klass->get_dma_as(qbus->parent);
> >>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> >>> +            error_setg(errp,
> >>> +                       "iommu_platform=true is not supported by the device");
> >>> +        }  
> >>
> >>  
> >>>        } else {
> >>>            vdev->dma_as = &address_space_memory;
> >>>        }  
> >>
> >>
> >> I struggled to understand what this 'else' clause was doing and I assumed that it was
> >> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
> >> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
> >> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
> >>
> >>
> >> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
> >> 'else' clause explaining that this is the legacy virtio devices condition and those devices
> >> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
> >> myself.  
> > 
> > I do not agree that this is about legacy virtio. In my understanding
> > virtio-ccw simply does not need translation because CCW devices use
> > guest physical addresses as per architecture. It may be considered
> > legacy stuff form PCI perspective, but I don't think it is legacy
> > in general.  
> 
> 
> I wasn't talking about virtio-ccw. I was talking about this piece of code:
> 
> 
>      if (klass->get_dma_as != NULL && has_iommu) {
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
>      } else {
>          vdev->dma_as = &address_space_memory;
>      }
> 
> 
> I suggested something like this:
> 
> 
> 
>      if (klass->get_dma_as != NULL && has_iommu) {
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
>      } else {
>          /*
>           * We don't force VIRTIO_F_IOMMU_PLATFORM for legacy devices, i.e.
>           * devices that don't implement klass->get_dma_as, regardless of
>           * 'has_iommu' setting.
>           */
>          vdev->dma_as = &address_space_memory;
>      }
> 
> 
> At least from my reading of commits 8607f5c3072 and 2943b53f682 this seems to be
> the case. I spent some time thinking that this IF/ELSE was wrong because I wasn't
> aware of this history.

With virtio-ccw we take the else branch because we don't implement
->get_dma_as(). I don't consider all the virtio-ccw to be legacy.

IMHO there are two ways to think about this: 
a) The commit that introduced this needs a fix which implemets
get_dma_as() for virtio-ccw in a way that it simply returns
address_space_memory.
b) The presence of ->get_dma_as() is not indicative of "legacy".

BTW in virtospeak "legacy" has a special meaning: pre-1.0 virtio. Do you
mean that legacy. And if I read the virtio-pci code correctly
->get_dma_as is set for legacy, transitional and modern devices alike.

IMHO the important thing to figure out is what impact that
virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
in the first branch (of the if-else) has. IMHO if one examines the
commits 8607f5c307 ("virtio: convert to use DMA api") and 2943b53f68
("virtio: force VIRTIO_F_IOMMU_PLATFORM") very carefully, one will
probably reach the conclusion that the objective of the latter, is
to prevent the guest form not negotiating the IOMMU_PLATFORM feature
(clearing it as part of the feature negotiation) and trying to use
the device without that feature. In other words, virtio features are
usually optional for the guest for the sake of compatibility, but
IOMMU_PLATFORM is not: for very good reasons. Neither the commit message
nor the patch does mention legacy anywhere. 

In my opinion not forcing the guest to negotiate IOMMU_PLATFORM when
->get_dma_as() is not set is at least unfortunate. Please observe, that
virtio-pci is not affected by this omission because for virtio-pci
devices ->get_dma_as != NULL always holds. And what is the deal for
devices that don't implement get_dma_as() (and don't need address
translation)? If iommu_platform=on is justified (no user error) then
the device does not have access to the entire guest memory. Which
means it more than likely needs cooperation form the guest (driver).
So detecting that the guest does not support IOMMU_PLATFORM and failing
gracefully via virtio_validate_features() instead of carrying on
in good faith and failing in ugly ways when the host attempts to access
guest memory to which it does not have access to. If we assume user
error, that is the host can access at least all the memory it needs
to access to make that device work, then it is probably still a
good idea to fail the device and thus help the user correct his
error.

IMHO the best course of action is
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 34f5a0a664..1d0eb16d1c 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -80,7 +80,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
 
     vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
     if (klass->get_dma_as != NULL && has_iommu) {
-        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as = klass->get_dma_as(qbus->parent);
         if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
             error_setg(errp,
@@ -89,6 +88,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
     } else {
         vdev->dma_as = &address_space_memory;
     }
+    virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
 }

which would be a separate patch, as this is a separate issue. Jason,
Michael, Connie, what do you think?

Regards,
Halil

