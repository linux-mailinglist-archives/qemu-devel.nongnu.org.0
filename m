Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F74AFE88
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 21:34:56 +0100 (CET)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHtfy-0006lP-T5
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 15:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nHtZo-0001VF-D1
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 15:28:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nHtZm-0003Hr-5K
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 15:28:31 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219KOPJa017782; 
 Wed, 9 Feb 2022 20:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MxHEt6xY9H4W8Hh8DBR9Wo26VS8ErkS1lraADBrqtPk=;
 b=HszqRUn0LJGK+uplpeJ2rd7rzLB7xFd8I4IzFwzSbnCL0ogrK6KFZIW7+qM59+zGU6UO
 Wc0RU0NRHoXA2iDd5j0aFUtCSUcpNz1rAohgMwbm6oi6Mmdl76TgYNBeBvq9vXrA31tx
 9OUna3VUPwzqstOFOv2Y58rpNoGjOqPyWWig8O6nRYpOpknNDZb3eG4Fl3O9oxAls0JZ
 TBlvGJMyIwIifApNEoRG/q/ZUZn4RtalbT0U2YjIahoQihvlXF1SEsAShvfS26LokyYj
 gQHC78l9Ah7y2Oj5qUNErEaf0LFeTsfaDscTmIckk7fapMQLZJTHegbiev98qZ2tur77 IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4ajkp9sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 20:28:24 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 219K4eTJ026697;
 Wed, 9 Feb 2022 20:28:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4ajkp9s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 20:28:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 219KDj1R014465;
 Wed, 9 Feb 2022 20:28:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3e2ygqfpq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 20:28:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 219KSJ4544040608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Feb 2022 20:28:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 022D4AE051;
 Wed,  9 Feb 2022 20:28:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90CBAAE04D;
 Wed,  9 Feb 2022 20:28:18 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.14.250])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Feb 2022 20:28:18 +0000 (GMT)
Date: Wed, 9 Feb 2022 21:27:50 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220209212750.25ddcebe.pasic@linux.ibm.com>
In-Reply-To: <87leykt0k7.fsf@redhat.com>
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
 <87leykt0k7.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _-h3OkhyL5yXF_X3JFBArQpGKC2riSX4
X-Proofpoint-GUID: FUTjXgHMTfbujzUZdmg3mMkhd1apIJqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_10,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202090107
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

On Wed, 09 Feb 2022 18:24:56 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, Feb 09 2022, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
> > QEMU, i.e. the driver must accept it if offered by the device. The
> > virtio specification says that the driver SHOULD accept the
> > ACCESS_PLATFORM feature if offered, and that the device MAY fail to
> > operate if ACCESS_PLATFORM was offered but not negotiated.  
> 
> Maybe add
> 
> (see the "{Driver,Device} Requirements: Reserved Feature Bits" sections
> in the virtio spec)
> 
> ?

I can add that, but I doubt people will have trouble finding it anyway.
There are 6 mentions of ACCESS_PLATFORM in the spec, so unless somebody
is using the dead tree version...
[..]
> > @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >          return;
> >      }
> >  
> > -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > -    if (klass->get_dma_as != NULL && has_iommu) {
> > +    vdev->dma_as = &address_space_memory;
> > +    if (has_iommu) {
> > +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */  
> 
> I must admit that the more I stare at this code, the more confused I
> get. We run this function during device realization, and the reason that
> the feature bit might have gotten lost is that the ->get_features()
> device callback dropped it. This happens before the driver is actually
> involved; the check whether the *driver* dropped the feature is done
> during feature validation, which is another code path. 
[moved text from here]
> 
> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM); [Mark 1]


Let us have a look at 
static int virtio_validate_features(VirtIODevice *vdev)                         
{                                                                               
    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);                       
                                                                                
    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&               
        !virtio_vdev_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {              
        return -EFAULT;                                                         [Mark 2]                  
    }                                                                           
[..]

So were it not of the [Mark 1] we could not hit [Mark 2] if the feature
bit was lost because the ->get_features() callback dropped it. Yes,
feature negotiation is another code path, but the two are interdependent
in a non-trivial way. That is why I added that comment.

[moved here]
> So what we do
> here is failing device realization if a backend doesn't support
> IOMMU_PLATFORM, isn't it?

Not really. We fail the device realization if !vdev_has_iommu &&
vdev->dma_as != &address_space_memory, that is the device does not
support address translation, but we need it to support address
translation because ->dma_as != &address_space memory. If however
->dma_as == &address_space memory we carry on happily even if ->get_features() dropped
IOMMU_PLATFORM, because we don't actually need an iova -> gpa
translation. This is the case with virtiofs confidential guests for
example.

But we still don't want the guest dropping ACCESS_PLATFORM, because it is
still mandatory, because the device won't operate correctly unless the
driver grants access to the pieces of memory that the device needs to
access. The underlying mechanism of granting access may not have
anything to do with an IOMMU though.

Does it make sense now?

> > -        vdev->dma_as = klass->get_dma_as(qbus->parent);
> > -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > -            error_setg(errp,
> > +        if (klass->get_dma_as) {
> > +            vdev->dma_as = klass->get_dma_as(qbus->parent);
> > +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > +                error_setg(errp,
> >                         "iommu_platform=true is not supported by the device");
> > +                return;
> > +            }
> >          }
> > -    } else {
> > -        vdev->dma_as = &address_space_memory;
> >      }
> >  }
> >    
> 
> 


