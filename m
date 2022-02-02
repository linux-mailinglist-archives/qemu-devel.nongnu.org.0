Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732444A7239
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 14:52:48 +0100 (CET)
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFG3z-0003Eq-82
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 08:52:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFFWJ-0004rg-Fr; Wed, 02 Feb 2022 08:17:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFFWG-0005AB-23; Wed, 02 Feb 2022 08:17:59 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212CHjS9014151; 
 Wed, 2 Feb 2022 13:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=K0XEdaO3GIDtvTx8WJjl7qJgyNpVN9q1KQ3+twGDFgQ=;
 b=kGcGBBXhcJuLbu9fR06LFdwuWMqnH1v4tJHiC0foxA+BWs5kqkD82DrP7aufW2EONlvs
 R/vZSV83A+lTmkZGDl2qwt1QhSTBGK5WznNEWkcT40Oh54GJl5VSZ+W3ozaBwEKojH0T
 yCfhdvdlmwrn9SNqvEWU+fx+RquB9mbqvBn7lFkj+/aRh43jlZoOgKJF1bEW1PU7uKx2
 x6Hd3YBcgsNQGAeBwNZhtIvn7Vdh815nzTkQC9PzQZmzR7KD3Ug1HZsgUKyLIA5AQz3Q
 eJ7igJiEsrksZR0t8EqdRo3o+ELH43GFqaOnGWKnIKW+mp14K205ieXatkuWLh9dG+Z8 cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dysbnst0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:17:31 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 212DHRta021258;
 Wed, 2 Feb 2022 13:17:30 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dysbnssyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:17:30 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 212DD3hQ005461;
 Wed, 2 Feb 2022 13:17:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3dvw79kud3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:17:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 212DHOej46858676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Feb 2022 13:17:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EDA5A404D;
 Wed,  2 Feb 2022 13:17:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F190DA4055;
 Wed,  2 Feb 2022 13:17:23 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.6.30])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Feb 2022 13:17:23 +0000 (GMT)
Date: Wed, 2 Feb 2022 14:16:45 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220202141645.1f784f19.pasic@linux.ibm.com>
In-Reply-To: <20220202020543-mutt-send-email-mst@kernel.org>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
 <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
 <20220202021547.20dc65c9.pasic@linux.ibm.com>
 <20220202020543-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QYIZisRXSguBcPXYO_yfN8FBT3DqzeZZ
X-Proofpoint-ORIG-GUID: PYoc40tdDYHU93S4xAQaqoJpjvj0aNNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020072
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 02:06:12 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

[..]
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
> > 
> > IMHO the best course of action is
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index 34f5a0a664..1d0eb16d1c 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -80,7 +80,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >  
> >      vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >      if (klass->get_dma_as != NULL && has_iommu) {
> > -        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> >          if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> >              error_setg(errp,
> > @@ -89,6 +88,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >      } else {
> >          vdev->dma_as = &address_space_memory;
> >      }
> > +    virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >  }
> > 
> > which would be a separate patch, as this is a separate issue. Jason,
> > Michael, Connie, what do you think?  
> 
> Do you mean just force VIRTIO_F_IOMMU_PLATFORM for everyone?
> Or am I misreading the patch?

Yes. Where force means: prevent the driver from setting FEATURES_OK
if it cleared VIRTIO_F_IOMMU_PLATFORM. I really don't see the case
where the device offering but the driver not accepting
VIRTIO_F_IOMMU_PLATFORM is good and useful.

Regards,
Halil


> 
> 
> > Regards,
> > Halil  
> 
> 


