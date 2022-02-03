Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2F4A8869
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:13:20 +0100 (CET)
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFejY-0004t8-12
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFedF-0000gs-VX; Thu, 03 Feb 2022 11:06:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7434
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFedC-0001Oa-PQ; Thu, 03 Feb 2022 11:06:48 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213EWbcG023715; 
 Thu, 3 Feb 2022 16:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hLMptZoPuHlIFdgd68OaCT6sEVq8WNGcOM2DzRuZvng=;
 b=O3T9CTOWjl8Rl+QF8E9hlY+Ej0VbAfIGeyiRhYgiENwfJcp2te+hFxqF1Muew1EtlLGo
 bR7+sLgSeDDSeD8buI8TV9C98bM0gyp1y9bDnzjaavNAVJOggnF1DsWWTGErByZ8bMSD
 amxeHFrlSDHo7hUdNss9qT0XW+5dGtJuk/EqzI909JA8+Z9T2culszVgRMdHfnDYPeMa
 pXHRUdLp0Ypp40gmKVvN7geEF8UyFdyr/HgCNOD2MbbSbT8WHqRC1R+owZesH7gJcOLI
 4H9hvEUGNUN3qWXMxL7qrIphu1yhF98uLsf/VKjLbWHt1zWewdrNM11zYSFgO+ZEdf6/ LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0g16upnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:06:43 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213Fk7Og020500;
 Thu, 3 Feb 2022 16:06:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0g16upmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:06:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213Fwl1X021786;
 Thu, 3 Feb 2022 16:06:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3dvw7a5vtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:06:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 213FujB138601192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 15:56:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E73E34C04A;
 Thu,  3 Feb 2022 16:06:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54AA34C050;
 Thu,  3 Feb 2022 16:06:38 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.19.59])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  3 Feb 2022 16:06:38 +0000 (GMT)
Date: Thu, 3 Feb 2022 17:06:35 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220203170635.1dd2b98d.pasic@linux.ibm.com>
In-Reply-To: <20220202195438.379753-1-pasic@linux.ibm.com>
References: <20220202195438.379753-1-pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u_XN1lE-ip6-nd0UZOQHlRK9TmR-QSKh
X-Proofpoint-ORIG-GUID: rvKiLUY9RLxomgPUX0jXVu4pJbHQL8wN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202030097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Feb 2022 20:54:38 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

>      }
> @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>      if (klass->get_dma_as != NULL && has_iommu) {
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +            error_setg(errp,
> +                       "iommu_platform=true is not supported by the device");
> +        }

I'm wondering, would it be wise to change the message? Since this is now
dependent on the VM/bus the device is plugged into the message might be a
little misleading: i.e. the very same device could work perfectly fine
with iommu_platform=true if the "surroundings" are different.

Maybe "the device has no IOMMU support (iommu_platform=true)" would be a
better option. On the other hand changing the message has its downsides
as well.

Also I realized that keeping the return after error_setg() might have
been a good idea for the case more logic is added at the end of the
function.

In any case I would like to address these, if necessary with a separate
patch. I don't want the fix to experience any further delays.

Regards,
Halil

