Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7644ADFD9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:44:59 +0100 (CET)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUXy-00063N-Ub
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nHU6m-0003lZ-Qz
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:16:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4558
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nHU6i-0002NV-PM
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:16:52 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218FQjxQ022968; 
 Tue, 8 Feb 2022 17:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RmqJz7fOOYCZJ/aXTxMGBi2e5cGKKVt2C+s2JgbZ1vk=;
 b=mcdRHBX7ZYJ7UEtmrlCVMRaSRADwY7M/failx08ri4o2D6Y2rBCBqf6toCEK79wM7tD7
 UL8AJ0rTu0g5hYfUAKQuxcBBhbdP9+Ri1pznUs1g+/HhFSXLv/MXjVw8UngwEOwjOKSG
 1QuEeJJVHJzMs9LDbbm0jly4kQvCq7ogias+pM8ZkdlNOv79hVR9IovzrK3ZVFIihoFd
 zMmifN/cxSCsYrSx4U4p6pQtSMPqX1tzf2O3agZb8YMuYiKsorfpDrcX9jKOj2dvwjJA
 dXbrKFJk9QpYbRa6RLHfyn3Xjlew3MgmmEWSUE00QMTFXQlpSpza3RtIQ0Zo1BGTljlR Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kr0ehw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 17:16:33 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 218GcXMr003295;
 Tue, 8 Feb 2022 17:16:32 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kr0ehg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 17:16:32 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218HCkHf011825;
 Tue, 8 Feb 2022 17:16:31 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3e1gvb0jsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 17:16:31 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 218HGUCO33816920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 17:16:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FD76112063;
 Tue,  8 Feb 2022 17:16:30 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D041C112067;
 Tue,  8 Feb 2022 17:16:29 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Feb 2022 17:16:29 +0000 (GMT)
Message-ID: <310e3bd1-0ca8-ddc6-4500-dd1bea589fad@linux.ibm.com>
Date: Tue, 8 Feb 2022 12:16:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220208133842.112017-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vwm8oE_PCLT8Dq2qRVjuoUKZjRRm3W7N
X-Proofpoint-ORIG-GUID: i310BVwWpZY9bxz2ueJXUlp2hqliaSER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080103
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/8/22 08:38, Eric Auger wrote:
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


v4 doesn't build for me:

../hw/tpm/tpm_crb.c: In function ?tpm_crb_realize?:
../hw/tpm/tpm_crb.c:297:33: error: implicit declaration of function 
?HOST_PAGE_ALIGN? [-Werror=implicit-function-declaration]
   297 | HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
       |                                 ^~~~~~~~~~~~~~~
../hw/tpm/tpm_crb.c:297:33: error: nested extern declaration of 
?HOST_PAGE_ALIGN? [-Werror=nested-externs]
cc1: all warnings being treated as errors




