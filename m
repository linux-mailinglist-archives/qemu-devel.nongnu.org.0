Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAFB4EB47E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:11:42 +0200 (CEST)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIBo-0003WX-O7
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:11:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1nZI9w-0002HB-VC; Tue, 29 Mar 2022 16:09:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1nZI9u-0007VC-TX; Tue, 29 Mar 2022 16:09:44 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TJbiNJ010887; 
 Tue, 29 Mar 2022 20:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=kcNlqysRAjg4C+oWN+eCERygIclIBhYhB9ayXpIxYL8=;
 b=C8VhuZmKjCQ0v1yvOmLnlF+x7NaNVlAlOtdDsSansVbRyp9noV1Sd45+2Z9b6aIq4uLX
 rMfw0TLeCLUS6YD+I4MQEXmK35Uhcjh4XtG6Uav+2/ZxRpCToptX0+6fk0LB8F/IioOF
 wIJr/5nwbuSKaFmoyX+i2NstGciaHqHSDsjQT6Aqgg/npmwoK6gqfiGp5VfYzJZKdmZz
 4Iy8zEdyOK3uFUi+jevdEtAcpu0xobkcYOuEAuu91o9bBr7sDz2XSjP5rFJ22qTCKmTW
 fZzX7H6cZm6nxHIGxXTLIGHWmpjcCFEzPguptRxjM/Rqw+Zc18CfBQKKxjgQHBjHa31r 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40c8mkgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 20:09:40 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22TK03fk026503;
 Tue, 29 Mar 2022 20:09:39 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40c8mkgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 20:09:39 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22TJrZW6017057;
 Tue, 29 Mar 2022 20:09:39 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3f1tf9eycp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 20:09:39 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22TK9cBh46727654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 20:09:38 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A0BE2805E;
 Tue, 29 Mar 2022 20:09:38 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4B9428064;
 Tue, 29 Mar 2022 20:09:36 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.75.76])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 29 Mar 2022 20:09:36 +0000 (GMT)
Message-ID: <d8d2bbd5021076bdba444d31a6da74f507baede3.camel@linux.ibm.com>
Subject: Re: [PATCH 2/4] virtio-ccw: move vhost_ccw_scsi to a separate file
From: Eric Farman <farman@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 29 Mar 2022 16:09:35 -0400
In-Reply-To: <20220328143019.682245-3-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-3-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: werZb8OuTSNEho5IObG5NR-HrGy_sR3T
X-Proofpoint-GUID: ZsGbmc2TwwJt_Ps8Yn5HNi3AW4KZIhFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_08,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, thuth@redhat.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-03-28 at 16:30 +0200, Paolo Bonzini wrote:
> Remove unecessary use of #ifdef CONFIG_VHOST_SCSI, instead just use a
> separate file and a separate rule in meson.build.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/s390x/meson.build       |  1 +
>  hw/s390x/vhost-scsi-ccw.c  | 64
> ++++++++++++++++++++++++++++++++++++++
>  hw/s390x/virtio-ccw-scsi.c | 47 ----------------------------
>  3 files changed, 65 insertions(+), 47 deletions(-)
>  create mode 100644 hw/s390x/vhost-scsi-ccw.c
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 28484256ec..feefe0717e 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -44,6 +44,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_SERIAL',
> if_true: files('virtio-ccw-serial.c'
>  if have_virtfs
>    virtio_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-
> ccw-9p.c'))
>  endif
> +virtio_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-
> ccw.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-
> vsock-ccw.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-
> user-fs-ccw.c'))
>  s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
> diff --git a/hw/s390x/vhost-scsi-ccw.c b/hw/s390x/vhost-scsi-ccw.c
> new file mode 100644
> index 0000000000..b68ddddd1c
> --- /dev/null
> +++ b/hw/s390x/vhost-scsi-ccw.c

Entries exist in the "virtio-ccw" section of MAINTAINERS for the two
vhost files that live in hw/s390x/ today (also covered by the wildcard
entry for vhost). I'd guess this means we should add another to cover
the new file?

Besides that, looks fine.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

Thanks,
Eric

> @@ -0,0 +1,64 @@
> +/*
> + * vhost ccw scsi implementation
> + *
> + * Copyright 2012, 2015 IBM Corp.
> + * Author(s): Cornelia Huck <cornelia.huck@de.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2
> or (at
> + * your option) any later version. See the COPYING file in the top-
> level
> + * directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/virtio/virtio.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "virtio-ccw.h"
> +
> +static void vhost_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error
> **errp)
> +{
> +    VHostSCSICcw *dev = VHOST_SCSI_CCW(ccw_dev);
> +    DeviceState *vdev = DEVICE(&dev->vdev);
> +
> +    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
> +}
> +
> +static void vhost_ccw_scsi_instance_init(Object *obj)
> +{
> +    VHostSCSICcw *dev = VHOST_SCSI_CCW(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VHOST_SCSI);
> +}
> +
> +static Property vhost_ccw_scsi_properties[] = {
> +    DEFINE_PROP_UINT32("max_revision", VirtioCcwDevice, max_rev,
> +                       VIRTIO_CCW_MAX_REV),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vhost_ccw_scsi_class_init(ObjectClass *klass, void
> *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtIOCCWDeviceClass *k = VIRTIO_CCW_DEVICE_CLASS(klass);
> +
> +    k->realize = vhost_ccw_scsi_realize;
> +    device_class_set_props(dc, vhost_ccw_scsi_properties);
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +}
> +
> +static const TypeInfo vhost_ccw_scsi = {
> +    .name          = TYPE_VHOST_SCSI_CCW,
> +    .parent        = TYPE_VIRTIO_CCW_DEVICE,
> +    .instance_size = sizeof(VHostSCSICcw),
> +    .instance_init = vhost_ccw_scsi_instance_init,
> +    .class_init    = vhost_ccw_scsi_class_init,
> +};
> +
> +static void virtio_ccw_scsi_register(void)
> +{
> +    type_register_static(&vhost_ccw_scsi);
> +}
> +
> +type_init(virtio_ccw_scsi_register)
> diff --git a/hw/s390x/virtio-ccw-scsi.c b/hw/s390x/virtio-ccw-scsi.c
> index 6e4beef700..fa706eb550 100644
> --- a/hw/s390x/virtio-ccw-scsi.c
> +++ b/hw/s390x/virtio-ccw-scsi.c
> @@ -70,56 +70,9 @@ static const TypeInfo virtio_ccw_scsi = {
>      .class_init    = virtio_ccw_scsi_class_init,
>  };
>  
> -#ifdef CONFIG_VHOST_SCSI
> -
> -static void vhost_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error
> **errp)
> -{
> -    VHostSCSICcw *dev = VHOST_SCSI_CCW(ccw_dev);
> -    DeviceState *vdev = DEVICE(&dev->vdev);
> -
> -    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
> -}
> -
> -static void vhost_ccw_scsi_instance_init(Object *obj)
> -{
> -    VHostSCSICcw *dev = VHOST_SCSI_CCW(obj);
> -
> -    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> -                                TYPE_VHOST_SCSI);
> -}
> -
> -static Property vhost_ccw_scsi_properties[] = {
> -    DEFINE_PROP_UINT32("max_revision", VirtioCcwDevice, max_rev,
> -                       VIRTIO_CCW_MAX_REV),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void vhost_ccw_scsi_class_init(ObjectClass *klass, void
> *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    VirtIOCCWDeviceClass *k = VIRTIO_CCW_DEVICE_CLASS(klass);
> -
> -    k->realize = vhost_ccw_scsi_realize;
> -    device_class_set_props(dc, vhost_ccw_scsi_properties);
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> -}
> -
> -static const TypeInfo vhost_ccw_scsi = {
> -    .name          = TYPE_VHOST_SCSI_CCW,
> -    .parent        = TYPE_VIRTIO_CCW_DEVICE,
> -    .instance_size = sizeof(VHostSCSICcw),
> -    .instance_init = vhost_ccw_scsi_instance_init,
> -    .class_init    = vhost_ccw_scsi_class_init,
> -};
> -
> -#endif
> -
>  static void virtio_ccw_scsi_register(void)
>  {
>      type_register_static(&virtio_ccw_scsi);
> -#ifdef CONFIG_VHOST_SCSI
> -    type_register_static(&vhost_ccw_scsi);
> -#endif
>  }
>  
>  type_init(virtio_ccw_scsi_register)


