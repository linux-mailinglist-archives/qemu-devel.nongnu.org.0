Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB613FB371
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:53:58 +0200 (CEST)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdz9-0002Qt-5A
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mKdxU-0000xm-8l; Mon, 30 Aug 2021 05:52:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63170
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mKdxS-0004i2-9i; Mon, 30 Aug 2021 05:52:03 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17U9XQgP095218; Mon, 30 Aug 2021 05:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FbO8gnqMrcAlzu0onQlb9s/bqdObD9KMbua+ueFaAZc=;
 b=lNidZhG36vemmOFvEJTn1jZEkMJiK+qSDVnCqOn80arNvJkWYYem+cevLOJget5+X0aP
 UZTGp9iUExxNPPXYL8BflfZqVPmw97E2f5Ia4591yXci8STWYw4R1Drw1ZiOz97g/qFf
 dOUIeH01RBnaO7vhg6VIRyr35fTRQXZmsZNFpEqugXQSG6zq3RanZxYxl6FVQQ7oapw+
 DFtdi9ZPxMl0JkN4PXfzcyl4Ri4MhgJF8xriZDrjFTYdhdOmYKUKOuBLdedTamdbJaOZ
 n1aI9MMseC0YRIFbWbeUJ68UwX21TRI0LmAye/sgRrLH9xnI9+Uxov5xSIfhbXy36iy2 bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3are857gd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 05:51:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17U9XvZ2096461;
 Mon, 30 Aug 2021 05:51:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3are857gc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 05:51:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17U9lX5t003244;
 Mon, 30 Aug 2021 09:51:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3aqcs8u847-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 09:51:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17U9lvUY55116238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 09:47:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F5114C046;
 Mon, 30 Aug 2021 09:51:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A02A4C040;
 Mon, 30 Aug 2021 09:51:51 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.78.133])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 09:51:51 +0000 (GMT)
Subject: Re: [PATCH 0/2] s390x: ccw: A simple test device for virtio CCW
To: Pierre Morel <pmorel@linux.ibm.com>, kvm@vger.kernel.org,
 Michael S Tsirkin <mst@redhat.com>
References: <1630061450-18744-1-git-send-email-pmorel@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <fe2c0cbd-24a6-0785-6a64-22c6b6c01e6d@de.ibm.com>
Date: Mon, 30 Aug 2021 11:51:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630061450-18744-1-git-send-email-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HVxNOsCQi9V9Fw1jk6HxavDXyERoGWqO
X-Proofpoint-ORIG-GUID: yph-RShPm_2fm0OOuPfdGNQcvL8FyKJu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_03:2021-08-27,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300070
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.58,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, drjones@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 mst@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27.08.21 12:50, Pierre Morel wrote:
> Hello All,
> 
> 
> This series presents a VIRTIO test device which receives data on its
> input channel and sends back a simple checksum for the data it received
> on its output channel.
>   
> The goal is to allow a simple VIRTIO device driver to check the VIRTIO
> initialization and various data transfer.
> 
> For this I introduced a new device ID for the device and having no
> Linux driver but a kvm-unit-test driver, I have the following
> questions:

I think we should reserve an ID in the official virtio spec then for such a device?
Maybe also add mst for such things.
  

> Is there another way to advertise new VIRTIO IDs but Linux?
> If this QEMU test meet interest, should I write a Linux test program?
> 
> Regards,
> Pierre
> 
> 
> Pierre Morel (2):
>    virtio: Linux: Update of virtio_ids
>    s390x: ccw: A simple test device for virtio CCW
> 
>   hw/s390x/meson.build                        |   1 +
>   hw/s390x/virtio-ccw-pong.c                  |  66 ++++++++
>   hw/s390x/virtio-ccw.h                       |  13 ++
>   hw/virtio/Kconfig                           |   5 +
>   hw/virtio/meson.build                       |   1 +
>   hw/virtio/virtio-pong.c                     | 161 ++++++++++++++++++++
>   include/hw/virtio/virtio-pong.h             |  34 +++++
>   include/standard-headers/linux/virtio_ids.h |   1 +
>   8 files changed, 282 insertions(+)
>   create mode 100644 hw/s390x/virtio-ccw-pong.c
>   create mode 100644 hw/virtio/virtio-pong.c
>   create mode 100644 include/hw/virtio/virtio-pong.h
> 

