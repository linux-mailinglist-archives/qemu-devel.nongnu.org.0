Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0F49B1B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:29:51 +0100 (CET)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJ5B-0008Ck-NG
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nCIxG-000559-8B; Tue, 25 Jan 2022 05:21:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nCIxB-0004I1-TP; Tue, 25 Jan 2022 05:21:36 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PADb7U024665; 
 Tue, 25 Jan 2022 10:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ArCra1fQ8T+J7Ab+fTdca6KALLIXb3h0mQaNiQojm5g=;
 b=it1EWQOFcv8/z3axIyZ9H0BFvSvkPXp6DjtCzrWxT/GD0+R7RJEgrLd72snEvYWv9E+I
 VZo/zxH7nCJg0N6dtIsBNOECzNw1kHR/y0AcuMV1BIdQr30ivJFZMHxanD0ccFTaX5SC
 qDPQ1x9rnv/xEqzupZbX6As157M2P4hK9LAj+eIC0wIb34Du6x4sLlKnQ4jCpWYWsbYr
 kRGqlDEpmZgy1cEIDyDiizXQ1CPatOyI7D8tqVrByk5nj1X0nWZcdLKFwxU4J9nxio8l
 YVrCXQpeFYUCcoYGrXFlCeUk+K/YrL4BW/k1RIRXjvkrQNKMfVGWzlhln7r6QhiQDmlr 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtf92g410-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 10:21:20 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PAFSUc029675;
 Tue, 25 Jan 2022 10:21:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtf92g406-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 10:21:19 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PADO6d016833;
 Tue, 25 Jan 2022 10:21:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3dr9j9bfvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 10:21:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PALF6M7537064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 10:21:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBCE352059;
 Tue, 25 Jan 2022 10:21:14 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.54.57])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 88CF652051; 
 Tue, 25 Jan 2022 10:21:14 +0000 (GMT)
Date: Tue, 25 Jan 2022 11:21:12 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220125112112.44957075.pasic@linux.ibm.com>
In-Reply-To: <20220117120238.2519239-1-pasic@linux.ibm.com>
References: <20220117120238.2519239-1-pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D7JEeiz7WS8pZ1XAeAeJVo8iTi5y8_Lx
X-Proofpoint-ORIG-GUID: X_KNKLS7V44Lj6PNlbI26sGPPLhpBsGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>, Jakob Naucke <Jakob.Naucke@ibm.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Mon, 17 Jan 2022 13:02:38 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported") claims to fail the device hotplug when iommu_platform
> is requested, but not supported by the (vhost) device. On the first
> glance the condition for detecting that situation looks perfect, but
> because a certain peculiarity of virtio_platform it ain't.
> 
> In fact the aforementioned commit introduces a regression. It breaks
> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> or any other confidential guest scenario that relies encrypted guest
> memory.  The same also applies to any other vhost device that does not
> support _F_ACCESS_PLATFORM.
> 
> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> "device can not access all of the guest RAM" and "iova != gpa, thus
> device needs to translate iova".
> 
> Confidential guest technologies currently rely on the device/hypervisor
> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> negotiated, the guest  grants access to the portions of memory the
> device needs to see. So in for confidential guests, generally,
> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> about the addresses used being something else than guest physical
> addresses.
> 
> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> form the vhost device that does not need it, because on the vhost
> interface it only means "I/O address translation is needed".
> 
> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> by the device, and thus no device capability is needed. In this
> situation claiming that the device does not support iommu_plattform=on
> is counter-productive. So let us stop doing that!
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported")
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-stable@nongnu.org
> 
> ---
> 
> v1->v2: 
> * Commit message tweaks. Most notably fixed commit SHA (Michael)
> 
> ---
>  hw/virtio/virtio-bus.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d23db98c56..c1578f3de2 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> -        return;
> -    }
> -
>      if (klass->device_plugged != NULL) {
>          klass->device_plugged(qbus->parent, &local_err);
>      }
> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>      } else {
>          vdev->dma_as = &address_space_memory;
>      }
> +
> +    if (has_iommu && vdev->dma_as != &address_space_memory
> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> +        error_setg(errp, "iommu_platform=true is not supported by the device");
> +        return;
> +    }
>  }
>  
>  /* Reset the virtio_bus */
> 
> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32


