Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD52F0F66
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:47:27 +0100 (CET)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytnK-0005Rb-O8
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kytmH-0004z1-6Y; Mon, 11 Jan 2021 04:46:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32800
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kytmA-0007yD-Gk; Mon, 11 Jan 2021 04:46:20 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10B9i1SP010588; Mon, 11 Jan 2021 04:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ItrIfx1YNuyHTNeOf33J+V0QCsMMJ872rZLTmqbNzT8=;
 b=eW8p9s+apV4yn68mQd5n9R0CyxfKLKBTcc2u4c5HUFwDaCe+ASqOrZCALP1k7OlOabCT
 8NVcAqMhT6Xuy+ULaGm+Ri4bj8vBeH2dcGOg1PrpncxloVfgLZzR3p/vEB/zTaWKsP6Z
 frsd1g/MtJ/eMI3AK0HQcznNDTTD5NvS8GdXvyEMGXp7zDfN3jwo1qn/rEbHO/MFf1tR
 15KgV7LbfodpJCKq4CAGfJcwDCdYAKvJcECmIaTLR5CsjjiJAsILr/hijETSI72vCgH1
 7RrqdEHEdCMJSSQYtPduaUGrexa7z3mJ2lRDVTqThOkhEj0ESgpdI1G7jQ/XqPeFuy5W eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360ma301ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 04:46:11 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10B9jngi013969;
 Mon, 11 Jan 2021 04:46:11 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360ma3019t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 04:46:11 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10B9XPHi001192;
 Mon, 11 Jan 2021 09:46:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 35y4489324-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 09:46:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10B9k22231261058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 09:46:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C1F511C04C;
 Mon, 11 Jan 2021 09:46:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9D1A11C04A;
 Mon, 11 Jan 2021 09:46:06 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.14.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 09:46:06 +0000 (GMT)
Subject: Re: [PATCH] vhost-user-fs: add the "bootindex" property
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
References: <20210104132401.5100-1-lersek@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <f296274e-3c4b-bb90-ca4a-273c3bd97f7f@de.ibm.com>
Date: Mon, 11 Jan 2021 10:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210104132401.5100-1-lersek@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-09_13:2021-01-07,
 2021-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101110057
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04.01.21 14:24, Laszlo Ersek wrote:
> virtio-fs qualifies as a bootable device minimally under OVMF, but
> currently the necessary "bootindex" property is missing (fw_cfg kernel
> boot notwithstanding).
> 
> Add the property. For completeness, add it to the CCW device as well;
> other virtio-ccw devices seem to have "bootindex" properties too.

Currently we do not have boot support for virtiofs on s390x (ccw)
Not sure if it is better if we should add the property now or whenever
boot support is implemented. 
As of today we do have bootindex for block and net. Maybe it is better
to defer bootindex for virtio-fs-ccw until we can boot from it? In
that way management software can detect if this is bootable or not?

> 
> Example OpenFirmware device path for the "vhost-user-fs-pci" device in the
> "bootorder" fw_cfg file:
> 
>   /pci@i0cf8/pci-bridge@1,6/pci1af4,105a@0/filesystem@0
> 
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: virtio-fs@redhat.com
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  include/hw/virtio/vhost-user-fs.h |  1 +
>  hw/s390x/vhost-user-fs-ccw.c      |  2 ++
>  hw/virtio/vhost-user-fs-pci.c     |  2 ++
>  hw/virtio/vhost-user-fs.c         | 10 ++++++++++
>  4 files changed, 15 insertions(+)
> 
> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> index 698575277101..0d62834c2510 100644
> --- a/include/hw/virtio/vhost-user-fs.h
> +++ b/include/hw/virtio/vhost-user-fs.h
> @@ -39,6 +39,7 @@ struct VHostUserFS {
>      VhostUserState vhost_user;
>      VirtQueue **req_vqs;
>      VirtQueue *hiprio_vq;
> +    int32_t bootindex;
>  
>      /*< public >*/
>  };
> diff --git a/hw/s390x/vhost-user-fs-ccw.c b/hw/s390x/vhost-user-fs-ccw.c
> index 6c6f26929301..474e97e937b8 100644
> --- a/hw/s390x/vhost-user-fs-ccw.c
> +++ b/hw/s390x/vhost-user-fs-ccw.c
> @@ -47,6 +47,8 @@ static void vhost_user_fs_ccw_instance_init(Object *obj)
>      ccw_dev->force_revision_1 = true;
>      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>                                  TYPE_VHOST_USER_FS);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
>  }
>  
>  static void vhost_user_fs_ccw_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> index 8bb389bd282a..2ed8492b3fa3 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -68,6 +68,8 @@ static void vhost_user_fs_pci_instance_init(Object *obj)
>  
>      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>                                  TYPE_VHOST_USER_FS);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
>  }
>  
>  static const VirtioPCIDeviceTypeInfo vhost_user_fs_pci_info = {
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ed036ad9c13f..ac4fc34b36a2 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -22,6 +22,7 @@
>  #include "qemu/error-report.h"
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
> +#include "sysemu/sysemu.h"
>  
>  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>  {
> @@ -279,6 +280,14 @@ static Property vuf_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void vuf_instance_init(Object *obj)
> +{
> +    VHostUserFS *fs = VHOST_USER_FS(obj);
> +
> +    device_add_bootindex_property(obj, &fs->bootindex, "bootindex",
> +                                  "/filesystem@0", DEVICE(obj));
> +}
> +
>  static void vuf_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -300,6 +309,7 @@ static const TypeInfo vuf_info = {
>      .name = TYPE_VHOST_USER_FS,
>      .parent = TYPE_VIRTIO_DEVICE,
>      .instance_size = sizeof(VHostUserFS),
> +    .instance_init = vuf_instance_init,
>      .class_init = vuf_class_init,
>  };
>  
> 

