Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B75FEFCE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:08:02 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLM1-00051r-6k
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ojL9W-0003R9-CG
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:55:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ojL9O-0002eo-CL
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:55:03 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EDBddr027503;
 Fri, 14 Oct 2022 13:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IgdA0gZzy3ErRsjoO/C3EqUft0IJFcmKI4PiuSNnljY=;
 b=WBv534IZtfbNQeawmP9sWvFZvghTNedjWJgieAAcmCFo6iQeuy195Qqz7796LN/0KuB0
 Eoy0H9ZaedWIsEEZsJmtQFWamvoe3+GWSClj9Rqq5anoLtsOzgrdvBuWj6WesYuusp/2
 Vlx3iIlGeEz5BVa7byzdeJUPQ0otUvcfFtGSjNDXnocfc1f/BDzgYq7VRF9JYARff1qi
 B+sbGD8hRitshM3lgd5HGww9bnn89rqnF9btpz2eR0QQdI/+GMkmPawu18u4hpRUGEFm
 XFJmbXBz/MN83ttVxUHAwClU3J16A35SP/r54Kai2UDuWc0+WYShOhQyZaoFhyAXSUky kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k75q1eens-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 13:54:55 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EDD5RC001354;
 Fri, 14 Oct 2022 13:54:55 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k75q1een2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 13:54:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EDprUx023635;
 Fri, 14 Oct 2022 13:54:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3k30u9f3w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 13:54:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EDsoXu55968002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 13:54:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A4AC4C040;
 Fri, 14 Oct 2022 13:54:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C0804C046;
 Fri, 14 Oct 2022 13:54:50 +0000 (GMT)
Received: from [9.171.8.36] (unknown [9.171.8.36])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Oct 2022 13:54:50 +0000 (GMT)
Message-ID: <498b60ab-7718-91db-50ed-d906b3b19278@linux.ibm.com>
Date: Fri, 14 Oct 2022 15:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20221014132108.2559156-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I22nkte3ad0fQak3KcGZ-GDW7-suFdQg
X-Proofpoint-GUID: NCGvJ3xuLoVQSCOVWEBVPoM2FUZoA6j6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210140078
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.856, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 14.10.22 um 15:21 schrieb Alex Bennée:
> During migration the virtio device state can be restored before we
> restart the VM. As no devices can be running while the VM is paused it
> makes sense to bail out early in that case.
> 
> This returns the order introduced in:
> 
>   9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> 
> to what virtio-sock was doing longhand.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>

> ---
>   include/hw/virtio/virtio.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f41b4a7e64..ebb58feaac 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
>   
>   static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>   {
> -    if (vdev->use_started) {
> -        return vdev->started;
> -    }
> -
>       if (!vdev->vm_running) {
>           return false;
>       }
>   
> +    if (vdev->use_started) {
> +        return vdev->started;
> +    }
> +
>       return status & VIRTIO_CONFIG_S_DRIVER_OK;
>   }
>   

