Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8994A6706
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:25:15 +0100 (CET)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0eI-0006hf-Di
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:25:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nExy7-0005KW-Mr; Tue, 01 Feb 2022 13:33:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42500
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nExy4-0002Nk-Vv; Tue, 01 Feb 2022 13:33:30 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211ISJqZ002004; 
 Tue, 1 Feb 2022 18:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=u3VOvJFYSYZ5bN5v34ikHPyZ4vYnICqsBvOfSiwpNRo=;
 b=bc/Zt5llc7wRGO8s40CqeC1jKnbQR8Em+TuPj4XiWyL6QOmfcDxQ8Ah2MBk/vmazip5x
 LJvSnEOH0MuT0b+BnhiyY9a62wxpVGO36TP0bMHPiYYX+arsF+8Bkw/Ydi90MEZX1nTL
 ehWgAQDPQUXZ4X1smgRt3erjUCLvUk2TOGs1Pd/q2PrSvCzcGbl75suas0K/xXGaLYAm
 lKaAF5dTHANNQBKkw5FkTwf52MXTbJstB+3WWQKw38fhIaQ0Xb9Uj+Bp04XIqZ1TnYHb
 Pzxg8D+FHS6qyEULRFsyUtj6+mNdzMvdW/1ZFzbstEM2kNIlPN6OmTzNswToYbwMvGEL CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dxkthuep1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 18:33:24 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211Hd9AB025633;
 Tue, 1 Feb 2022 18:33:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dxkthuent-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 18:33:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211IMnbk025460;
 Tue, 1 Feb 2022 18:33:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3dvw79q6jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 18:33:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 211INUbh49938862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 18:23:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56AECA4060;
 Tue,  1 Feb 2022 18:33:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5BECA405B;
 Tue,  1 Feb 2022 18:33:18 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.90.234])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  1 Feb 2022 18:33:18 +0000 (GMT)
Date: Tue, 1 Feb 2022 19:33:09 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220201193309.7da86258.pasic@linux.ibm.com>
In-Reply-To: <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YeXTZNtoWhCKB0XrygQOnZXP5sya7RU-
X-Proofpoint-GUID: 3YzipGEhfdmDgCHtgUkovVxLc2I0gzZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_09,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010104
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
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 12:36:25 -0300
Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:

> > +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >       if (klass->get_dma_as != NULL && has_iommu) {
> >           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >           vdev->dma_as = klass->get_dma_as(qbus->parent);
> > +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > +            error_setg(errp,
> > +                       "iommu_platform=true is not supported by the device");
> > +        }  
> 
> 
> >       } else {
> >           vdev->dma_as = &address_space_memory;
> >       }  
> 
> 
> I struggled to understand what this 'else' clause was doing and I assumed that it was
> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
> 
> 
> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
> 'else' clause explaining that this is the legacy virtio devices condition and those devices
> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
> myself.

I do not agree that this is about legacy virtio. In my understanding
virtio-ccw simply does not need translation because CCW devices use
guest physical addresses as per architecture. It may be considered
legacy stuff form PCI perspective, but I don't think it is legacy
in general.

And there is a good reason for virtio-ccw devices to use
F_IOMMU_PLATFORM (secure execution).

Other opinions?

Regards,
Halil

