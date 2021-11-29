Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E122461CBE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:30:56 +0100 (CET)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkUR-0004c4-LU
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mrkSe-0003PH-0l; Mon, 29 Nov 2021 12:29:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15772
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mrkSa-0003MU-W6; Mon, 29 Nov 2021 12:29:03 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHIQl5031094; 
 Mon, 29 Nov 2021 17:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+k9seSMnOC/i+5BMZf5madGnHhUTDOh3coH8rWAZiq4=;
 b=c07T8zEMpniF8hXsGFMYEDYy5h5Qg4owFb4SD3D/AY+beylle+kFaJNvH2OeeApv9Je+
 JjhLGdarqfcF2s1tfetCtamReeQG0+tjXDkhhQsy3S6lLvWBX958FGgykry737qPeggv
 D+oAsaB8P74g9z1YEH6s68mFHhpfekB7hm6wzvIcra3wlLGSBOe3rsgEK7wbwWh8f4HJ
 pFQBgLQzrPHH5XvgCuukoJ/U4d+mrqhHCCqnsnSMnJudL0rgAeFfX09vVB4VSaobL3P1
 5W8QFVIgxcimz8Qs0965liv5n9MXMocI/fAfEFJWdhyKvYU0vDln+dNXDt2zafPoL8W1 OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn34xr6vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:28:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHJsVh005598;
 Mon, 29 Nov 2021 17:28:57 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn34xr6v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:28:57 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHIFHL015015;
 Mon, 29 Nov 2021 17:28:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxjqa0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:28:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHSqTa24379742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:28:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B97A5AE045;
 Mon, 29 Nov 2021 17:28:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71BD9AE051;
 Mon, 29 Nov 2021 17:28:52 +0000 (GMT)
Received: from [9.171.89.183] (unknown [9.171.89.183])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:28:52 +0000 (GMT)
Message-ID: <1430526c-823a-bd3f-4750-c121c3bc7434@de.ibm.com>
Date: Mon, 29 Nov 2021 18:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] s390x/ipl: support extended kernel command line size
Content-Language: en-US
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211122112909.18138-1-mhartmay@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211122112909.18138-1-mhartmay@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Uy_7XkiLpoDJEZ0dpm-tqV__a6-ILKfT
X-Proofpoint-ORIG-GUID: PBniApupmzLK636z-Vwe7KQC3fZiZozz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290081
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 22.11.21 um 12:29 schrieb Marc Hartmayer:
> In the past s390 used a fixed command line length of 896 bytes. This has changed
> with the Linux commit 5ecb2da660ab ("s390: support command lines longer than 896
> bytes"). There is now a parm area indicating the maximum command line size. This
> parm area has always been initialized to zero, so with older kernels this field
> would read zero and we must then assume that only 896 bytes are available.
> 
> Acked-by: Viktor Mihajlovski <mihajlov@de.ibm.com>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   hw/s390x/ipl.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 7ddca0127fc2..092c66b3f9f1 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -37,8 +37,9 @@
>   
>   #define KERN_IMAGE_START                0x010000UL
>   #define LINUX_MAGIC_ADDR                0x010008UL
> +#define KERN_PARM_AREA_SIZE_ADDR        0x010430UL
>   #define KERN_PARM_AREA                  0x010480UL
> -#define KERN_PARM_AREA_SIZE             0x000380UL
> +#define LEGACY_KERN_PARM_AREA_SIZE      0x000380UL
>   #define INITRD_START                    0x800000UL
>   #define INITRD_PARM_START               0x010408UL
>   #define PARMFILE_START                  0x001000UL
> @@ -110,6 +111,21 @@ static uint64_t bios_translate_addr(void *opaque, uint64_t srcaddr)
>       return srcaddr + dstaddr;
>   }
>   
> +static uint64_t get_max_kernel_cmdline_size(void)
> +{
> +    uint64_t *size_ptr = rom_ptr(KERN_PARM_AREA_SIZE_ADDR, sizeof(*size_ptr));
> +
> +    if (size_ptr) {
> +        uint64_t size;
> +
> +        size = be64_to_cpu(*size_ptr);
> +        if (size != 0) {
> +            return size;
> +        }
> +    }
> +    return LEGACY_KERN_PARM_AREA_SIZE;
> +}
> +
>   static void s390_ipl_realize(DeviceState *dev, Error **errp)
>   {
>       MachineState *ms = MACHINE(qdev_get_machine());
> @@ -197,10 +213,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>               ipl->start_addr = KERN_IMAGE_START;
>               /* Overwrite parameters in the kernel image, which are "rom" */
>               if (parm_area) {
> -                if (cmdline_size > KERN_PARM_AREA_SIZE) {
> +                uint64_t max_cmdline_size = get_max_kernel_cmdline_size();
> +                if (cmdline_size > max_cmdline_size) {
>                       error_setg(errp,
>                                  "kernel command line exceeds maximum size: %zu > %lu",
> -                               cmdline_size, KERN_PARM_AREA_SIZE);
> +                               cmdline_size, max_cmdline_size);
>                       return;
>                   }
>   
> 

