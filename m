Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0C4A6335
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:07:49 +0100 (CET)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExZD-0003fY-T5
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1nEvCy-0000ly-PO; Tue, 01 Feb 2022 10:36:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb@linux.ibm.com>)
 id 1nEvCw-0006ju-Bv; Tue, 01 Feb 2022 10:36:40 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211FSiTP024710; 
 Tue, 1 Feb 2022 15:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dm+u3Xeq/3dfLwFy+er3QPCmMckb0U756SA6QjTQpRg=;
 b=st8Gn+sc3K7+9bW+wheJqIpqolvZfLIhkuGVmQlMlMwUem6x3GoOR5HCUovMvye5dQwE
 rTYC+jOp/fKjPUtw+IQ3H9Hw+Ib7/LMMk+mpU+rAcBxpuh0FhXCLRMC4FZJ/oCmPOCI7
 9/PNqe4VNPt9Y62GH8CQ8sHYVkEO6I8mAtMuoediHTkcF6/U890ZOfE3RWNhXZX5Ml1o
 zVT/yGMQKGV/lcCqiAPQt1iTFxGQ9bJQv3EcprJhQGULXI+hf/NYQwTLlfA1oz+6w1XR
 LWTmmeO4swvM2QRlh5wykjER/c2Ey36xzT3vhZF22bmnsyTBIMN2OQJNbCKVbYVxDhuG IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxn4hx86w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 15:36:33 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211F0WMZ020352;
 Tue, 1 Feb 2022 15:36:33 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxn4hx868-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 15:36:32 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211FGv6s015667;
 Tue, 1 Feb 2022 15:36:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3dvw7akcub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 15:36:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211FaTUL35848658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 15:36:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88469BE056;
 Tue,  1 Feb 2022 15:36:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBE69BE061;
 Tue,  1 Feb 2022 15:36:26 +0000 (GMT)
Received: from [9.77.151.54] (unknown [9.77.151.54])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Feb 2022 15:36:26 +0000 (GMT)
Message-ID: <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
Date: Tue, 1 Feb 2022 12:36:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 qemu-devel@nongnu.org
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
In-Reply-To: <20220201133915.3764972-1-pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lghQy6CCMf3L8Uw7jAbkveidKkhAR5Ep
X-Proofpoint-ORIG-GUID: NbSqeDEEq_dHPIiwiLB7XaJJEvwkqwdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_07,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010087
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=danielhb@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, Jakob Naucke <Jakob.Naucke@ibm.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/1/22 10:39, Halil Pasic wrote:
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

This version solved the case I mentioned in the v2 about the false positive with
iommu_platform=on and and the vhost-user-fs-pci device. Now I get:


$ sudo ./qemu-system-ppc64 -machine pseries,accel=kvm (...)
-chardev socket,id=char0,path=/tmp/vhostqemu -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on
qemu-system-ppc64: -device vhost-user-fs-pci,chardev=char0,tag=myfs,iommu_platform=on: iommu_platform=true is not supported by the device


Which is the expected result.

I didn't find the opportunity to test this patch with the PowerPC secure VM tech (papr-pef) but I
don't see the point of delaying this fix because of that.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


One small suggestion down below in case a v4 is needed:

> 
> v2->v3:
> * Caught a bug: I tired to check if vdev has the feature
>     ACCESS_PLATFORM after we have forced it. Moved the check
>     to a better place
> v1->v2:
> * Commit message tweaks. Most notably fixed commit SHA (Michael)
> 
> ---
> ---
>   hw/virtio/virtio-bus.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d23db98c56..34f5a0a664 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>       VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
>       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>       bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +    bool vdev_has_iommu = false;
>       Error *local_err = NULL;
>   
>       DPRINTF("%s: plug device.\n", qbus->name);
> @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>           return;
>       }
>   
> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> -        return;
> -    }
> -
>       if (klass->device_plugged != NULL) {
>           klass->device_plugged(qbus->parent, &local_err);
>       }
> @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>           return;
>       }
>   
> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>       if (klass->get_dma_as != NULL && has_iommu) {
>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>           vdev->dma_as = klass->get_dma_as(qbus->parent);
> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +            error_setg(errp,
> +                       "iommu_platform=true is not supported by the device");
> +        }


>       } else {
>           vdev->dma_as = &address_space_memory;
>       }


I struggled to understand what this 'else' clause was doing and I assumed that it was
wrong. Searching through the ML I learned that this 'else' clause is intended to handle
legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.


My suggestion, if a v4 is required for any other reason, is to add a small comment in this
'else' clause explaining that this is the legacy virtio devices condition and those devices
don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
myself.



Thanks,


Daniel


> 
> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32

