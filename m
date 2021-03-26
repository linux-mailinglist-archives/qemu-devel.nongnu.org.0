Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73334A36A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:51:44 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiBz-0005cS-Gu
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lPiAw-0004b5-QY; Fri, 26 Mar 2021 04:50:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lPiAt-0005VL-Is; Fri, 26 Mar 2021 04:50:38 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q8WaEw188087; Fri, 26 Mar 2021 04:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=t++xK6O5aaZFVgjpVUEfdORQv6pI+XaJgFBR8z/gndY=;
 b=OKxP6vyLZjx421kz3NBYLt8PkRZHLUGEPlJBxPAQMwg/0yflBVqcQv0zSeaihCZzXau3
 4h/DlIWn8LrXNIoRinSMgESc9Y+jFrLixmC5DXZ8i/O6AFrW78tTp497Bgz7TjymG7lC
 rtkkb7hqWi48AlnehL5frTNuH6j1FG96K99ZEatUEaHeTAFU06OywB/grTk8YTlMPe9/
 SHzzhZGWseC8yKAzhJINts1YsYXpQULZ/ilRZdhiy1y5EJdhPaQJ46t/2TdLwD81/Qxf
 JB3z5woAGaQl8gui7EBcsaa0sBXxJBSz3tzjN9GNeh16MHSlewBOQ8L7FWva6KPUpxno cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h767f8c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 04:50:32 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12Q8WYTD187917;
 Fri, 26 Mar 2021 04:50:31 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h767f8b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 04:50:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12Q8lQke026917;
 Fri, 26 Mar 2021 08:50:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37h14ugfjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 08:50:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12Q8o7Ep37683538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 08:50:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61F18A4055;
 Fri, 26 Mar 2021 08:50:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63326A404D;
 Fri, 26 Mar 2021 08:50:25 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.87.8])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 08:50:25 +0000 (GMT)
Subject: Re: [PATCH] MAINTAINERS: add/replace backups for some s390 areas
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com
References: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <a146aaab-4006-5893-d6b2-0a5e553d4ae0@de.ibm.com>
Date: Fri, 26 Mar 2021 09:50:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KIZzhqo934xdPfd8zyqTEgI8WihB0XcV
X-Proofpoint-GUID: CIQP1uCbzNRuJKIGpF4xQNtYFxBYQclt
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_02:2021-03-25,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260062
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, farman@linux.ibm.com,
 pmorel@linux.ibm.com, qemu-s390x@nongnu.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25.03.21 14:55, Matthew Rosato wrote:
> S390 PCI currently has no backup, add one.  Add an additional backup
> for vfio-ccw and refresh the backup for vfio-ap.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
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

