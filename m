Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD3D349390
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:03:38 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQaH-00063T-AH
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lPQXA-00059P-Hd; Thu, 25 Mar 2021 10:00:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lPQX7-0001bi-G5; Thu, 25 Mar 2021 10:00:24 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PDYjmD182019; Thu, 25 Mar 2021 10:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NVM6YhuQtSE9bhUdkQr+tBKhrDPkryZBy+vll9TDJIs=;
 b=eo/QHW/BrYX0LFF6mjmaJPIJmB5nN/gRePHRW+UwLRpqUaz6WeNMt9te68t3wiWkXBT7
 YaWvWW9CRbTwYlp+wBNTXGB2X1V6/xW7/PAmP8DE2V0txaoNOV7gShuz3dZvfxyJ+K/P
 yeF8azDKrI+R8Pj+qCh2IaN6ev3qHSlHkO4G1Cnax5coSYozQXHaga5wkLd6TEBZzgwe
 NoJX2s0WPSijHyZzM8AzWVp+3Ehxl8yleHjSNsB4HV7+0ncqETtKbOYLXkcZFfC7jfek
 EBo80YQROEBh9ZIb/3qmAPhBGglhEf7dUmvgePx976TQdvyjjpeOpgsnN2sSLPFBXzqv nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gn99cf1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:00:15 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PDWoM0172544;
 Thu, 25 Mar 2021 10:00:15 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gn99cexn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:00:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PDwZ5d006934;
 Thu, 25 Mar 2021 14:00:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37df68d0fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 14:00:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PE08jh46072274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 14:00:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC2BF11C0DC;
 Thu, 25 Mar 2021 14:00:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DA8811C0B7;
 Thu, 25 Mar 2021 14:00:07 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.41.31])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 14:00:07 +0000 (GMT)
Subject: Re: [PATCH] MAINTAINERS: add/replace backups for some s390 areas
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com
References: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <20108037-6249-83e2-88f6-944a304f2c37@linux.ibm.com>
Date: Thu, 25 Mar 2021 15:00:07 +0100
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
 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, farman@linux.ibm.com,
 alex.williamson@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/21 2:55 PM, Matthew Rosato wrote:
> S390 PCI currently has no backup, add one.  Add an additional backup
> for vfio-ccw and refresh the backup for vfio-ap.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
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

Acked-by: Pierre Morel <pmorel@linux.ibm.com>


-- 
Pierre Morel
IBM Lab Boeblingen

