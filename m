Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA302A4628
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 14:22:45 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZwGq-0003Pr-1b
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 08:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kZwFV-0002wb-OR; Tue, 03 Nov 2020 08:21:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kZwFS-0005Px-Q6; Tue, 03 Nov 2020 08:21:21 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3D2dLB023274; Tue, 3 Nov 2020 08:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5GuyiYVJkG/nRWd32CceKREYsscM4hwt+s0g7GZw8tw=;
 b=MDzrEOnq6baQbRruCXmmmB8JzZGQ6mzU527sd3AVnwAVPpi9Gu0rWZaOyzVtVHd/hbvS
 tpHWTIY7euRakOhgYUf41XBYdYkTpE3aHtx3ptCsi8KAoxkKyplt391Mry0ussTkQq/g
 zF1P7/Bd2c2WVHoxvWC4Tl2tYdDlzTvaUtUPJ9n5Hjo6+w2HxCZcWXMAOIDsY4pxXsRb
 sXzn2rQfM2N29GWzI/057O2Rkn+uNrJYCa2xyiALiUHwiJ9qlkcQmFS6C7y6nhls5ipW
 2Wapnc9CxqmyPQ7YQXkCoPVcSopvBCaxw9DkDmloiGvRbIfGMXilMXjRwOYl0/O4J4GL 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34k7159xq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 08:21:14 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A3D2rhp025559;
 Tue, 3 Nov 2020 08:21:14 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34k7159xpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 08:21:14 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A3DLC0P002001;
 Tue, 3 Nov 2020 13:21:13 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 34h024e05c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 13:21:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A3DLBhd13042334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Nov 2020 13:21:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D60EBBE056;
 Tue,  3 Nov 2020 13:21:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 215BABE051;
 Tue,  3 Nov 2020 13:21:11 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.156.34])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Nov 2020 13:21:10 +0000 (GMT)
Subject: Re: [PATCH for-5.2] s390x: fix build for --without-default-devices
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201103123237.718242-1-cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <deff16f8-028e-32dc-89d1-29a5881f07be@linux.ibm.com>
Date: Tue, 3 Nov 2020 08:21:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201103123237.718242-1-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030086
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 05:07:52
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/20 7:32 AM, Cornelia Huck wrote:
> s390-pci-vfio.c calls into the vfio code, so we need it to be
> built conditionally on vfio (which implies CONFIG_LINUX).
> 
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Fixes: cd7498d07fbb ("s390x/pci: Add routine to get the vfio dma available count")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Good catch.  Did a test compile and this clearly works, but I'm 
wondering if it should be checking against CONFIG_VFIO_PCI?

> ---
>   hw/s390x/meson.build             | 2 +-
>   include/hw/s390x/s390-pci-vfio.h | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index f4663a835514..2a7818d94b94 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -27,7 +27,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>   ))
>   s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
> -s390x_ss.add(when: 'CONFIG_LINUX', if_true: files('s390-pci-vfio.c'))
> +s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
>   
>   virtio_ss = ss.source_set()
>   virtio_ss.add(files('virtio-ccw.c'))
> diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
> index c7984905b3b7..ff708aef500f 100644
> --- a/include/hw/s390x/s390-pci-vfio.h
> +++ b/include/hw/s390x/s390-pci-vfio.h
> @@ -13,8 +13,9 @@
>   #define HW_S390_PCI_VFIO_H
>   
>   #include "hw/s390x/s390-pci-bus.h"
> +#include CONFIG_DEVICES
>   
> -#ifdef CONFIG_LINUX
> +#ifdef CONFIG_VFIO
>   bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
>   S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
>                                             S390PCIBusDevice *pbdev);
> 


