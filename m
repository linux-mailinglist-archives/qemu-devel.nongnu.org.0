Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA03499DA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:59:43 +0100 (CET)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVCk-0006u2-L1
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjherne@linux.ibm.com>)
 id 1lPVAj-0006M4-OF; Thu, 25 Mar 2021 14:57:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjherne@linux.ibm.com>)
 id 1lPVAh-00080e-7D; Thu, 25 Mar 2021 14:57:33 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PIXJOX053023; Thu, 25 Mar 2021 14:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=7g9Q5wR+C2XlVjtCJ0LVDaESsvj6XwXdFk2AZEH4E0A=;
 b=huWKhe8Z1hiT00oa4bcT3ioopqClN8Cq0FrhuvoHEAFB/cmIaaGA2jUENT6c/VEk5L+m
 7wv92A1a6BHJIXj9t/4zwDVaplaGh0ehUrpoxgCkJ3AYxn4SYdb92cii+EVbQdPMT8Fp
 d/8/YdNKpnLnNlrf57MRx2r63nEYh51UU9t7OTk0feaGZsVUdWAtlvCAPfkLFTrzEjg1
 v/k9CrmRqJAQRBxZ7l6W9Tx7DWqgV30ubZqLaRAsu2KSIvZV4w3w0yFuZimzjvJW+m9e
 JjiSTlEczNISpGMstlZtaGp3A5ojPN18fCO6N4wwIw+WlMCpXV+hIJfS8irk2t4r39KS QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gwxnbt2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 14:57:22 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PIXE3M052718;
 Thu, 25 Mar 2021 14:57:22 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gwxnbt2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 14:57:22 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PIqkGV009787;
 Thu, 25 Mar 2021 18:57:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 37d9bpyx45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 18:57:21 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PIvI3c13238762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 18:57:18 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0F4F6E04C;
 Thu, 25 Mar 2021 18:57:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BBDD6E052;
 Thu, 25 Mar 2021 18:57:16 +0000 (GMT)
Received: from [9.85.177.53] (unknown [9.85.177.53])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 18:57:16 +0000 (GMT)
Subject: Re: [PATCH] MAINTAINERS: add/replace backups for some s390 areas
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com
References: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
From: "Jason J. Herne" <jjherne@linux.ibm.com>
Organization: IBM
Message-ID: <cb6225f7-535a-95e8-8cf9-82c525fb5d0a@linux.ibm.com>
Date: Thu, 25 Mar 2021 14:57:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
In-Reply-To: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_07:2021-03-25,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250133
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jjherne@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Reply-To: jjherne@linux.ibm.com
Cc: akrowiak@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 qemu-s390x@nongnu.org, thuth@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 9:55 AM, Matthew Rosato wrote:
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

Acked-by: Jason J. Herne <jjherne@linux.ibm.com>

-- 
-- Jason J. Herne (jjherne@linux.ibm.com)

