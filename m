Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF534A776C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 19:04:27 +0100 (CET)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJzW-0008Og-Ff
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 13:04:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFIQo-0007hE-57; Wed, 02 Feb 2022 11:24:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFIQh-0006id-2C; Wed, 02 Feb 2022 11:24:27 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212G6kTL003745; 
 Wed, 2 Feb 2022 16:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=OFKzNBBlIP7UlJnFd/LHOIfVu2XYW3ddbPkZeVZuCTA=;
 b=ZlHRNAzfmpXxUk/JqO5kSInPbw6vKnuknHHJ5O+FQ+kZImpt6vvJqUtMGvkl+XsttHqL
 LH51mR48hwab46yyuIamlOYBXPCiGie2ihPrfOtZT1cXKvbLqaB2uiHGeWvl+c+DaKZK
 8lReBZRiJQoQ/87v6EUj5+MlKSHXLkEpp+oL2r/XqrdekRJokCyc2CmXRV4y/hbcsv7E
 7KBY8sYwfeSvgE7rHZMhiepDkJrCsjQwYNDWg+WQPIUss2oVjIal83ewtQhrCxg6YLyk
 Wq7IlRz7xapV/BI5Nq3Q7OOD3l0bfuDu8pUgvqy0VS4Yey2iYcr4b7siMvnWUBEf4REp wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyv0821eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 16:24:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 212GO4h4015370;
 Wed, 2 Feb 2022 16:24:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyv0821e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 16:24:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 212GCMx2030995;
 Wed, 2 Feb 2022 16:24:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3dvvujpy4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 16:24:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 212GNvef43974916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Feb 2022 16:23:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC02A405C;
 Wed,  2 Feb 2022 16:23:57 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E385A405B;
 Wed,  2 Feb 2022 16:23:56 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.6.30])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Feb 2022 16:23:56 +0000 (GMT)
Date: Wed, 2 Feb 2022 17:23:53 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220202172353.65ad8325.pasic@linux.ibm.com>
In-Reply-To: <eccb1d4e-dea1-56b7-98d5-78867970a6d4@gmail.com>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
 <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
 <20220202021547.20dc65c9.pasic@linux.ibm.com>
 <eccb1d4e-dea1-56b7-98d5-78867970a6d4@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3MAkghZPIcAJzFS9uP2-0vrbGt6WHUG4
X-Proofpoint-ORIG-GUID: kvKRjJtb1PPzXIs_ddd8ODDqbV-VsNtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_07,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202020090
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Jakob Naucke <Jakob.Naucke@ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-stable@nongnu.org, Daniel Henrique Barboza <danielhb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 10:24:51 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 2/1/22 22:15, Halil Pasic wrote:
> > On Tue, 1 Feb 2022 16:31:22 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >   
> >> On 2/1/22 15:33, Halil Pasic wrote:  
> >>> On Tue, 1 Feb 2022 12:36:25 -0300
> >>> Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:
> >>>      
> >>>>> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >>>>>         if (klass->get_dma_as != NULL && has_iommu) {
> >>>>>             virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >>>>>             vdev->dma_as = klass->get_dma_as(qbus->parent);
> >>>>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> >>>>> +            error_setg(errp,
> >>>>> +                       "iommu_platform=true is not supported by the device");
> >>>>> +        }  
> >>>>
> >>>>     
> >>>>>         } else {
> >>>>>             vdev->dma_as = &address_space_memory;
> >>>>>         }  
> >>>>
> >>>>
> >>>> I struggled to understand what this 'else' clause was doing and I assumed that it was
> >>>> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
> >>>> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
> >>>> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
> >>>>
> >>>>
> >>>> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
> >>>> 'else' clause explaining that this is the legacy virtio devices condition and those devices
> >>>> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
> >>>> myself.  
> >>>
> >>> I do not agree that this is about legacy virtio. In my understanding
> >>> virtio-ccw simply does not need translation because CCW devices use
> >>> guest physical addresses as per architecture. It may be considered
> >>> legacy stuff form PCI perspective, but I don't think it is legacy
> >>> in general.  
> >>
> >>
> >> I wasn't talking about virtio-ccw. I was talking about this piece of code:
> >>
> >>
> >>       if (klass->get_dma_as != NULL && has_iommu) {
> >>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >>           vdev->dma_as = klass->get_dma_as(qbus->parent);
> >>       } else {
> >>           vdev->dma_as = &address_space_memory;
> >>       }
> >>
> >>
> >> I suggested something like this:
> >>
> >>
> >>
> >>       if (klass->get_dma_as != NULL && has_iommu) {
> >>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >>           vdev->dma_as = klass->get_dma_as(qbus->parent);
> >>       } else {
> >>           /*
> >>            * We don't force VIRTIO_F_IOMMU_PLATFORM for legacy devices, i.e.
> >>            * devices that don't implement klass->get_dma_as, regardless of
> >>            * 'has_iommu' setting.
> >>            */
> >>           vdev->dma_as = &address_space_memory;
> >>       }
> >>
> >>
> >> At least from my reading of commits 8607f5c3072 and 2943b53f682 this seems to be
> >> the case. I spent some time thinking that this IF/ELSE was wrong because I wasn't
> >> aware of this history.  
> > 
> > With virtio-ccw we take the else branch because we don't implement  
> > ->get_dma_as(). I don't consider all the virtio-ccw to be legacy.  
> > 
> > IMHO there are two ways to think about this:
> > a) The commit that introduced this needs a fix which implemets
> > get_dma_as() for virtio-ccw in a way that it simply returns
> > address_space_memory.
> > b) The presence of ->get_dma_as() is not indicative of "legacy".
> > 
> > BTW in virtospeak "legacy" has a special meaning: pre-1.0 virtio. Do you
> > mean that legacy. And if I read the virtio-pci code correctly  
> > ->get_dma_as is set for legacy, transitional and modern devices alike.  
> 
> 
> Oh ok. I'm not well versed into virtiospeak. My "legacy" comment was a poor choice of
> word for the situation.
> 
> We can ignore the "legacy" bit. My idea/suggestion is to put a comment at that point
> explaining the logic behind into not forcing VIRTIO_F_IOMMU_PLATFORM in devices that
> doesn't implement ->get_dma_as().
> 
> I am assuming that this is an intended design that was introduced by 2943b53f682
> ("virtio: force VIRTIO_F_IOMMU_PLATFORM"), meaning that the implementation of the
> ->get_dma_as is being used as a parameter to force the feature in the device. And with  
> this code:
> 
> 
>      if (klass->get_dma_as != NULL && has_iommu) {
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
>      } else {
>          vdev->dma_as = &address_space_memory;
>      }
> 
> It is possible that we have 2 vdev devices where ->dma_as = &address_space_memory, but one
> of them is sitting in a bus where "klass->get_dma_as(qbus->parent) = &address_space_memory",
> and this device will have VIRTIO_F_IOMMU_PLATFORM forced onto it and the former won't.
> 
> 
> If this is not an intended design I can only speculate how to fix it. Forcing VIRTIO_F_IOMMU_PLATFORM
> in all devices, based only on has_iommu, can break stuff. Setting VIRTIO_F_IOMMU_PLATFORM only
> if "vdev->dma_as != &address_space_memory" make some sense but I am fairly certain it will
> break stuff the other way. Or perhaps the fix is something else entirely.
> 
> 
> 
> 
> > 
> > IMHO the important thing to figure out is what impact that
> > virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> > in the first branch (of the if-else) has. IMHO if one examines the
> > commits 8607f5c307 ("virtio: convert to use DMA api") and 2943b53f68
> > ("virtio: force VIRTIO_F_IOMMU_PLATFORM") very carefully, one will
> > probably reach the conclusion that the objective of the latter, is
> > to prevent the guest form not negotiating the IOMMU_PLATFORM feature
> > (clearing it as part of the feature negotiation) and trying to use
> > the device without that feature. In other words, virtio features are
> > usually optional for the guest for the sake of compatibility, but
> > IOMMU_PLATFORM is not: for very good reasons. Neither the commit message
> > nor the patch does mention legacy anywhere.
> > 
> > In my opinion not forcing the guest to negotiate IOMMU_PLATFORM when  
> > ->get_dma_as() is not set is at least unfortunate. Please observe, that  
> > virtio-pci is not affected by this omission because for virtio-pci
> > devices ->get_dma_as != NULL always holds. And what is the deal for
> > devices that don't implement get_dma_as() (and don't need address
> > translation)? If iommu_platform=on is justified (no user error) then
> > the device does not have access to the entire guest memory. Which
> > means it more than likely needs cooperation form the guest (driver).
> > So detecting that the guest does not support IOMMU_PLATFORM and failing
> > gracefully via virtio_validate_features() instead of carrying on
> > in good faith and failing in ugly ways when the host attempts to access
> > guest memory to which it does not have access to. If we assume user
> > error, that is the host can access at least all the memory it needs
> > to access to make that device work, then it is probably still a
> > good idea to fail the device and thus help the user correct his
> > error.  
> 
> Yeah, this go back on what I've said about 2943b53f682 up there. There are assumptions
> being made on the ->get_dma_as() existence that aren't clear.
> 

I agree. The commit message does not explain.

> 
> > 
> > IMHO the best course of action is
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index 34f5a0a664..1d0eb16d1c 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -80,7 +80,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >   
> >       vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >       if (klass->get_dma_as != NULL && has_iommu) {
> > -        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >           vdev->dma_as = klass->get_dma_as(qbus->parent);
> >           if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> >               error_setg(errp,
> > @@ -89,6 +88,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >       } else {
> >           vdev->dma_as = &address_space_memory;
> >       }
> > +    virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >   }  
> 
> 
> I am fairly confident that forcing VIRTIO_F_IOMMU_PLATFORM all around, based on has_iommu

Yes I should have made that conditional on has_iommu. It was very late
when I finished that email.

> alone, will have consequences all around. This code has been around for almost 5 years and a
> lot of stuff has been developed on top of it.
> 

Do you have any particular examples in mind?

> All that said, if this is the proper way of fixing it I'd say to do it now, document it properly
> and fix the breakages as they come along. The alternative - hacking around and around a codebase
> that might not be solid - is worse in the long run.

IMHO this is a good discussion you triggered. But I see it out of scope
for the bug I'm trying to fix.

I can post a proper patch for "IOMMU_PLATFORM is non-negotiable for
all guests" and we can have proper review and discussion on that. But
I would like the bug I'm working on here fixed first. There are
people that want to use virtiofs with confidential guests, and
we should really make sure they can.

Regards,
Halil

