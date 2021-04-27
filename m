Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004CB36CC2D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 22:09:32 +0200 (CEST)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbU1S-0003IA-Qw
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 16:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lbTzS-0002p5-Qh; Tue, 27 Apr 2021 16:07:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8422
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lbTzQ-0006ZI-P6; Tue, 27 Apr 2021 16:07:26 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RK4xuq165843; Tue, 27 Apr 2021 16:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nGKJ38/4ZNpcB022UYzR2oPVmpNlef3ok1yvEx1zGAI=;
 b=OZlNk9B0S9YQ6tXUwtpL7Zq4BlwVcD/kYUFOkYHeUJho5kHR7zZymnsbe2zIJ8hjy7Tz
 PKMb46Sb+M46sGcSfUryHM+j30oiIxi+cHWmXoRunSpMD+SJNEkCGAGwpHm9Ds6F311z
 mizrvDFe4R497zEz1ofiof1IQtu8oF/hMUhjLWC+1AlpWsOE7J+2/EYMkKAq9yNKut4q
 32KqozphYscwb/1tVtDMThh08zj6VlljYjIZQYTmeyJdKgZ04QOCkbEWmA/8h/oMF7Bd
 R6lX3kYMBSn+k3wvKkog2mY+WE8+l5nu/TkxkrGqGOJoHguV1WzIwLr5Ck7N/7WKfdds uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386qsatmdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 16:07:15 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RK6Yc0174856;
 Tue, 27 Apr 2021 16:07:15 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386qsatmdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 16:07:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RJvvMh021766;
 Tue, 27 Apr 2021 20:07:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 384ay95rkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 20:07:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13RK7DmB21692726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 20:07:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A17FBE051;
 Tue, 27 Apr 2021 20:07:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE9D5BE04F;
 Tue, 27 Apr 2021 20:07:10 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.111.105])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 20:07:10 +0000 (GMT)
Message-ID: <4cc98e142a94cc980790a400e155c1307b4ce729.camel@linux.ibm.com>
Subject: Re: [RFC PATCH] hw/s390x/ccw: Register qbus type in abstract
 TYPE_CCW_DEVICE parent
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Date: Tue, 27 Apr 2021 16:07:10 -0400
In-Reply-To: <20210424145313.3287400-1-f4bug@amsat.org>
References: <20210424145313.3287400-1-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PnG0KHZrRK0JM-1q_5Y_t5T6JTeKhwD2
X-Proofpoint-GUID: pYo0ZabrAA0x6iumwXQctT9Vi-wN5e6F
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_11:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1011 mlxscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270134
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2021-04-24 at 16:53 +0200, Philippe Mathieu-Daudé wrote:
> Instead of having all TYPE_CCW_DEVICE children set the bus type to
> TYPE_VIRTUAL_CSS_BUS, do it once in the abstract parent.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because I don't know these devices, maybe there is a reason
> for setting the bus type in the children (but it should be documented
> IMO).

I don't know the history behind it, but don't see an obvious reason for
doing it the current way. I sure do like the end result.

Acked-by: Eric Farman <farman@linux.ibm.com>

> ---
>  hw/s390x/ccw-device.h | 1 +
>  hw/s390x/3270-ccw.c   | 1 -
>  hw/s390x/ccw-device.c | 1 +
>  hw/s390x/s390-ccw.c   | 2 --
>  hw/s390x/virtio-ccw.c | 1 -
>  5 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/ccw-device.h b/hw/s390x/ccw-device.h
> index 832c78cd421..6dff95225df 100644
> --- a/hw/s390x/ccw-device.h
> +++ b/hw/s390x/ccw-device.h
> @@ -14,6 +14,7 @@
>  #include "qom/object.h"
>  #include "hw/qdev-core.h"
>  #include "hw/s390x/css.h"
> +#include "hw/s390x/css-bridge.h"
>  
>  struct CcwDevice {
>      DeviceState parent_obj;
> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
> index f3e7342b1e8..0757af60632 100644
> --- a/hw/s390x/3270-ccw.c
> +++ b/hw/s390x/3270-ccw.c
> @@ -159,7 +159,6 @@ static void
> emulated_ccw_3270_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      device_class_set_props(dc, emulated_ccw_3270_properties);
> -    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
>      dc->realize = emulated_ccw_3270_realize;
>      dc->hotpluggable = false;
>      set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> diff --git a/hw/s390x/ccw-device.c b/hw/s390x/ccw-device.c
> index c9707110e9c..95f269ab441 100644
> --- a/hw/s390x/ccw-device.c
> +++ b/hw/s390x/ccw-device.c
> @@ -59,6 +59,7 @@ static void ccw_device_class_init(ObjectClass
> *klass, void *data)
>      k->refill_ids = ccw_device_refill_ids;
>      device_class_set_props(dc, ccw_device_properties);
>      dc->reset = ccw_device_reset;
> +    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
>  }
>  
>  const VMStateDescription vmstate_ccw_dev = {
> diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
> index b497571863f..cb49f380a6b 100644
> --- a/hw/s390x/s390-ccw.c
> +++ b/hw/s390x/s390-ccw.c
> @@ -177,10 +177,8 @@ static void s390_ccw_instance_init(Object *obj)
>  
>  static void s390_ccw_class_init(ObjectClass *klass, void *data)
>  {
> -    DeviceClass *dc = DEVICE_CLASS(klass);
>      S390CCWDeviceClass *cdc = S390_CCW_DEVICE_CLASS(klass);
>  
> -    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
>      cdc->realize = s390_ccw_realize;
>      cdc->unrealize = s390_ccw_unrealize;
>  }
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 8195f3546e4..71ec2bdcc31 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -1235,7 +1235,6 @@ static void
> virtio_ccw_device_class_init(ObjectClass *klass, void *data)
>      k->unplug = virtio_ccw_busdev_unplug;
>      dc->realize = virtio_ccw_busdev_realize;
>      dc->unrealize = virtio_ccw_busdev_unrealize;
> -    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
>      device_class_set_parent_reset(dc, virtio_ccw_reset, &vdc-
> >parent_reset);
>  }
>  


