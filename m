Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D34B0B5E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:50:12 +0100 (CET)
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI71f-0008FS-Ac
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nI6lG-0002YJ-Lj
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 05:33:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nI6lE-0002d5-GR
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 05:33:14 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A9pwlG000711; 
 Thu, 10 Feb 2022 10:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Wz6d8ZWaJYWHjja0dFZjRm7UvYZAqF/9FP0BEyCDkUY=;
 b=pWGnm+B2wywSLO4lGcW1gwA8/SA8yj9WxAY7XmitJ2gTKyeZDW3PopPqBUJilwpwn8Bc
 AJKjZldreBLZJgAAruiA4b9MhiHKk34s8ee95BPpRuOJvgcLL/AFbt9gfu0XhmqtpnKa
 LjA/vzVyHamGE9dpgFZb8pOHpzpZof4/fR8p960T+a183hLGlZ0i55ReLk5dT/peyX9J
 6ppfPG8AOwl37AmCiZjfXFBMCWnTw5Nz90gihczENOehDxTt9+jUNKtlomQ7Xm+UjG2r
 qtEyFF95kFCif29sMaTMbnf9xWbaOhFDYxraccfPS452V2qF1YljDZo+K3sX/+6gAQs+ Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4r7jk951-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 10:33:07 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21AAQ5O3016737;
 Thu, 10 Feb 2022 10:33:07 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4r7jk94d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 10:33:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21AAS0u2002605;
 Thu, 10 Feb 2022 10:33:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3e2ygqkwun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 10:33:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AAX1FT37945642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:33:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C264E11C083;
 Thu, 10 Feb 2022 10:33:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D59811C084;
 Thu, 10 Feb 2022 10:33:01 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.232])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 10:33:01 +0000 (GMT)
Date: Thu, 10 Feb 2022 11:32:58 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220210113258.1e90af05.pasic@linux.ibm.com>
In-Reply-To: <87fsort5a6.fsf@redhat.com>
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
 <87leykt0k7.fsf@redhat.com>
 <20220209212750.25ddcebe.pasic@linux.ibm.com>
 <87fsort5a6.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: unjMfheQesd-FOV_uJZiEJKKodkvwIUX
X-Proofpoint-ORIG-GUID: IMOGBkp8LnMoP_7l0ryFxtbOAud0s-qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_03,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100057
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 10:55:13 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, Feb 09 2022, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Wed, 09 Feb 2022 18:24:56 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >  
> >> On Wed, Feb 09 2022, Halil Pasic <pasic@linux.ibm.com> wrote:  
> >> > @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >> >          return;
> >> >      }
> >> >  
> >> > -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >> > -    if (klass->get_dma_as != NULL && has_iommu) {
> >> > +    vdev->dma_as = &address_space_memory;
> >> > +    if (has_iommu) {
> >> > +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >> > +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */    
> >> 
> >> I must admit that the more I stare at this code, the more confused I
> >> get. We run this function during device realization, and the reason that
> >> the feature bit might have gotten lost is that the ->get_features()
> >> device callback dropped it. This happens before the driver is actually
> >> involved; the check whether the *driver* dropped the feature is done
> >> during feature validation, which is another code path.   
> > [moved text from here]  
> >>   
> >> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM); [Mark 1]  
> >
> >
> > Let us have a look at 
> > static int virtio_validate_features(VirtIODevice *vdev)                         
> > {                                                                               
> >     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);                       
> >                                                                                 
> >     if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&               
> >         !virtio_vdev_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {              
> >         return -EFAULT;                                                         [Mark 2]                  
> >     }                                                                           
> > [..]
> >
> > So were it not of the [Mark 1] we could not hit [Mark 2] if the feature
> > bit was lost because the ->get_features() callback dropped it. Yes,
> > feature negotiation is another code path, but the two are interdependent
> > in a non-trivial way. That is why I added that comment.  
> 
> Yes, of course we need to offer the bit to the driver in the first
> place. My point is that the code here is not what makes us fail
> FEATURES_OK; we won't even get to that point because the device will
> fail realization.

I disagree! Have you tested your hypothesis? Which line of code does
cause the device realization to fail? Where is that check?

> 
> >
> > [moved here]  
> >> So what we do
> >> here is failing device realization if a backend doesn't support
> >> IOMMU_PLATFORM, isn't it?  
> >
> > Not really. We fail the device realization if !vdev_has_iommu &&
> > vdev->dma_as != &address_space_memory, that is the device does not
> > support address translation, but we need it to support address
> > translation because ->dma_as != &address_space memory. If however  
> > ->dma_as == &address_space memory we carry on happily even if ->get_features() dropped  
> > IOMMU_PLATFORM, because we don't actually need an iova -> gpa
> > translation. This is the case with virtiofs confidential guests for
> > example.
> >  
> 
> Well yes, that's what I meant, I just did not spell out all of the
> conditions...
> 
> > But we still don't want the guest dropping ACCESS_PLATFORM, because it is
> > still mandatory, because the device won't operate correctly unless the
> > driver grants access to the pieces of memory that the device needs to
> > access. The underlying mechanism of granting access may not have
> > anything to do with an IOMMU though.
> >
> > Does it make sense now?  
> 
> The code yes, the comment no. What we are actually doing is failing
> realization so we don't end up offering a device without IOMMU_PLATFORM
> that would need it. 

I don't understand. That is only one of the possible cases IMHO.

Do you mean the check
        if (klass->get_dma_as) {                                                
            vdev->dma_as = klass->get_dma_as(qbus->parent);                     
            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {     
                error_setg(errp,                                                
                       "iommu_platform=true is not supported by the device");   
                return;                                                         
            }                                                                   
        }
or something different? If yo mean that check, it does not cover all
cases where has_iommu.

Please note that the line in question is

    if (has_iommu) {                                                            
        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */        
        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);  
only conditional on has_iommu.

But we want the guest to *never* drop ACCESS_PLATFORM, regardless of 
vdev_has_iommu and ->dma_as.

Please also note that the comment 
/* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */
is intended to document why do we do 
virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);  
_only_ and is not intended to document the entire code that follows:

        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);      
        if (klass->get_dma_as) {                                                
            vdev->dma_as = klass->get_dma_as(qbus->parent);                     
            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {     
                error_setg(errp,                                                
                       "iommu_platform=true is not supported by the device");   
                return;                                                         
            }                                                                   
        }

Is that the source of the confusion? If yes, maybe I should add a blank
line after virtio_add_feature().

Regards,
Halil

> The code that fails FEATURES_OK if the driver
> dropped it is already in place.
> 
> I'd suggest a comment like
> 
> /* make sure that the device did not drop a required IOMMU_PLATFORM */
> 
> or so.
> 
> 

