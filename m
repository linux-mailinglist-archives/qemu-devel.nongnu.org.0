Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175C4D4953
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:16:24 +0100 (CET)
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJaZ-0006Gd-Ay
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:16:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nSJCn-0003xY-0u
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:51:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43364
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nSJC1-0000RJ-D6
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:51:45 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ACAPVX026686; 
 Thu, 10 Mar 2022 13:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cnJUoK2OGhMVOwP8n2P33vYhIchXr02wvn4ZRBjDBEI=;
 b=Ks7AuLSNmSShD/2pD1dpi/BAlSb5Cz5wDBGDMGgM8n6ftrVoReQoN9c7Qx9u0q2jBFxW
 thhQmAnmCKVyYvyhIXJYlnutuvaeyixCPs+Q8SapZUM88puro3qNAsTnzjyhPzGmmM3b
 1r6hzdOjEuwci5yHLSTqCx2A64aLxw3RDxaWhDbownR2tv371UotArh55Fbr42Y++i4V
 oa9woWvyqHKxp/uekhsjD6/GUu2XgHOXJK1e9/W+o/MtG1nWfcGC/vawZBgdnnvSkKhu
 rgFlH1gU1EiAGYhgb/VTDSMfe6K3JJkqcden1IR+e4axr8NE5djdcKYpl+U8IGX+UOG7 lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eq7yr58s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 13:50:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ACQSR9013459;
 Thu, 10 Mar 2022 13:50:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eq7yr58r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 13:50:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ADh4TO029812;
 Thu, 10 Mar 2022 13:50:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8jwr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 13:50:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ADogSK19005874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 13:50:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9077211C052;
 Thu, 10 Mar 2022 13:50:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DE6D11C050;
 Thu, 10 Mar 2022 13:50:42 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.8.60])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Mar 2022 13:50:42 +0000 (GMT)
Date: Thu, 10 Mar 2022 14:50:30 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220310145030.6f599536.pasic@linux.ibm.com>
In-Reply-To: <20220307112939.2780117-1-pasic@linux.ibm.com>
References: <20220307112939.2780117-1-pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yCd3PzbOB-VJPdMZApYgbLFU-ca9RusP
X-Proofpoint-ORIG-GUID: iP5F76NtLc52-XuFKwTgOZAQRtP6LyBB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100073
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Mon,  7 Mar 2022 12:29:39 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
> QEMU, i.e. the driver must accept it if offered by the device. The
> virtio specification says that the driver SHOULD accept the
> ACCESS_PLATFORM feature if offered, and that the device MAY fail to
> operate if ACCESS_PLATFORM was offered but not negotiated.
> 
> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> the device when the driver fences ACCESS_PLATFORM. With commit
> 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
> decision to do so whenever the get_dma_as() callback is implemented (by
> the bus), which in practice means for the entirety of virtio-pci.
> 
> That means, if the device needs to translate I/O addresses, then
> ACCESS_PLATFORM is mandatory. The aforementioned commit tells us in the
> commit message that this is for security reasons. More precisely if we
> were to allow a less then trusted driver (e.g. an user-space driver, or
> a nested guest) to make the device bypass the IOMMU by not negotiating
> ACCESS_PLATFORM, then the guest kernel would have no ability to
> control/police (by programming the IOMMU) what pieces of guest memory
> the driver may manipulate using the device. Which would break security
> assumptions within the guest.
> 
> If ACCESS_PLATFORM is offered not because we want the device to utilize
> an IOMMU and do address translation, but because the device does not
> have access to the entire guest RAM, and needs the driver to grant
> access to the bits it needs access to (e.g. confidential guest support),
> we still require the guest to have the corresponding logic and to accept
> ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
> things are bound to go wrong, and we may see failures much less graceful
> than failing the device because the driver didn't negotiate
> ACCESS_PLATFORM.
> 
> So let us make ACCESS_PLATFORM mandatory for the driver regardless
> of whether the get_dma_as() callback is implemented or not.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
> 
> ---
> v2 -> v3:
> * Rebased onto the next branch of the git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
>   repository
> v1 -> v2:
> * Change comment: reflect that this is not about the verify
>   but also about the device features as seen by the driver (Connie)
> RFC -> v1:
> * Tweaked the commit message and fixed typos (Connie)
> * Added two sentences discussing the security implications (Michael)
> 
> This patch is based on:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
> 
> During the review of "virtio: fix the condition for iommu_platform not
> supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
> iff has_iommu && !!klass->get_dma_as. My answer to that was, that
> this logic ain't right.
> 
> While at it I used the opportunity to re-organize the code a little
> and provide an explanatory comment.
> ---
>  hw/virtio/virtio-bus.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 0f69d1c742..d7ec023adf 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -78,17 +78,23 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> -    if (klass->get_dma_as != NULL && has_iommu) {
> +    vdev->dma_as = &address_space_memory;
> +    if (has_iommu) {
> +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +        /*
> +         * Present IOMMU_PLATFORM to the driver iff iommu_plattform=on and
> +         * device operational. If the driver does not accept IOMMU_PLATFORM
> +         * we fail the device.
> +         */
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> -        vdev->dma_as = klass->get_dma_as(qbus->parent);
> -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> -            error_setg(errp,
> +        if (klass->get_dma_as) {
> +            vdev->dma_as = klass->get_dma_as(qbus->parent);
> +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +                error_setg(errp,
>                         "iommu_platform=true is not supported by the device");
> -            return;
> +                return;
> +            }
>          }
> -    } else {
> -        vdev->dma_as = &address_space_memory;
>      }
>  }
>  
> 
> base-commit: 41d137fc631bd9315ff84727d780757d25054c58


