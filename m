Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC0F34939A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:04:50 +0100 (CET)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQbR-000738-Lr
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lPQXz-0005nY-2w; Thu, 25 Mar 2021 10:01:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34915
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lPQXw-0002Dc-Rh; Thu, 25 Mar 2021 10:01:14 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PDaNJg017939; Thu, 25 Mar 2021 10:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Dw/xOH7OuRjGGZsoyLXxZC8Ic7q9/RXTMOwov19bf6c=;
 b=RrEl5PY8DZ+N5Rd2NFUs1DfyoMPkQjEmBU/18u5Lep+zX0ObBysz8QYQ0JzdNss+Q3n+
 FumuKtWZlsKRMp9i7gGmM4Zg9udnE5XMTwIJZcmK8QvuxFT8gqqmGIqvqLf9pweaX7u5
 uFlkuvhZHBYh5FlHz875pyudirfkEWPRbRZCmmdKrZZfGhWJChgtu4EE+UUy5KybA/X8
 LmIio2Q4XenJ9qB1pOmIhr6YfuBiqJ2y9Z5uJ0irMmRXb0GYv5BMxXj95mvI73qQhg2D
 ZjN1qBuOAB36A5w7VuBXhLZBsofIF8VjF6vy2lCBpl49ztZONGjF4Nn9OwkdN6SpIcXK vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37gq0b912u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:01:08 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PDadc8019308;
 Thu, 25 Mar 2021 10:01:07 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37gq0b9128-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:01:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PDvPt1025750;
 Thu, 25 Mar 2021 14:01:07 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 37d9dae3yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 14:01:07 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PE15QU23200096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 14:01:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A1C6112062;
 Thu, 25 Mar 2021 14:01:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C805E112069;
 Thu, 25 Mar 2021 14:01:04 +0000 (GMT)
Received: from [9.160.1.180] (unknown [9.160.1.180])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 14:01:04 +0000 (GMT)
Subject: Re: [PATCH] MAINTAINERS: add/replace backups for some s390 areas
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com
References: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <8413193e-a392-ada3-6e1d-c8504451bb20@linux.ibm.com>
Date: Thu, 25 Mar 2021 10:01:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, thuth@redhat.com,
 pmorel@linux.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/21 9:55 AM, Matthew Rosato wrote:
> S390 PCI currently has no backup, add one.  Add an additional backup
> for vfio-ccw and refresh the backup for vfio-ap.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Acked-by: Eric Farman <farman@linux.ibm.com>

> ---
>   MAINTAINERS | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 554be84..5620fc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1516,6 +1516,7 @@ L: qemu-s390x@nongnu.org
>   
>   S390 PCI
>   M: Matthew Rosato <mjrosato@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/s390-pci*
>   F: include/hw/s390x/s390-pci*
> @@ -1830,6 +1831,7 @@ F: docs/igd-assign.txt
>   vfio-ccw
>   M: Cornelia Huck <cohuck@redhat.com>
>   M: Eric Farman <farman@linux.ibm.com>
> +M: Matthew Rosato <mjrosato@linux.ibm.com>
>   S: Supported
>   F: hw/vfio/ccw.c
>   F: hw/s390x/s390-ccw.c
> @@ -1839,10 +1841,9 @@ T: git https://gitlab.com/cohuck/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
>   
>   vfio-ap
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
>   M: Tony Krowiak <akrowiak@linux.ibm.com>
>   M: Halil Pasic <pasic@linux.ibm.com>
> -M: Pierre Morel <pmorel@linux.ibm.com>
> +M: Jason Herne <jjherne@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/ap-device.c
>   F: hw/s390x/ap-bridge.c
> 

