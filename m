Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3C3682E9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:05:14 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZatF-0006LH-RG
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZar8-0005AP-UE; Thu, 22 Apr 2021 11:03:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZaqz-0004tm-Vz; Thu, 22 Apr 2021 11:03:02 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MF1ci8098401; Thu, 22 Apr 2021 11:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=q8AQbHWZOJWn95H6dhRFri3mwAMLFM4KwlZOljlH8ZI=;
 b=cTznpGFVigzuZzPzMX6swyomVmOA1m17DZh/IfMggpkWqizjwbEbZI7QJAo0QAknLZbU
 bi1lYnqsM/2FsDHjk7OWSrRaPiMw9w8Y1Q6llFI89tNOz5aZ6oLV58xvNkPVOVMb0lXq
 VQxfMYKtwPfkCv01bhjE3iysEX8TiyWW5OUlK7IKSHYAlkfhfbumQpl9AUTo/Ztnmqc+
 MWCDxtAU5UJvvEAnQtIbYQ+T9d7mMMmSbU704PjBfaz00qFKCsAGKQ9FJLMAjFM1F8+w
 Qz0SEA6wIOokdcbktDZHtBSSG1Q22/BwgutPse8xBHAzOHMz3QEZWpq8Z/yrR5GGRs4g Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383ahha7gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 11:02:44 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13MF24uN100423;
 Thu, 22 Apr 2021 11:02:34 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383ahha6wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 11:02:33 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MEpPtk021740;
 Thu, 22 Apr 2021 15:02:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 37yqa89m4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 15:02:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13MF1rA215794554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 15:01:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFD055206C;
 Thu, 22 Apr 2021 15:02:16 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.31.146])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 388C052050;
 Thu, 22 Apr 2021 15:02:16 +0000 (GMT)
Subject: Re: [PATCH] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210422145911.2513980-1-philmd@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <beda5118-79f7-b2b3-3afd-68845087903b@de.ibm.com>
Date: Thu, 22 Apr 2021 17:02:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210422145911.2513980-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bvjd0r6dpJBG7E-Qo5Fmxe0KiyphZs4z
X-Proofpoint-GUID: ZTWk_u_e6YBg79Mr16RvGWasHKzPWfLi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_06:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220118
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 16:59, Philippe Mathieu-Daudé wrote:
> When building on Fedora 34 (gcc version 11.0.0 20210210) we get:
> 
>    In file included from pc-bios/s390-ccw/main.c:11:
>    In function ‘memset’,
>        inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>        inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>    pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
>       28 |         p[i] = c;
>          |         ~~~~~^~~
> 
> The offending code is:
> 
>    memset((char *)S390EP, 0, 6);
> 
> where S390EP is a const address:
> 
>    #define S390EP 0x10008
> 
> The compiler doesn't now how big that pointed area is, so assume its
> length is zero. This has been reported as BZ#99578 to GCC:
> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
> pointer from integer literal"
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
> 
> As this warning does us more harm than good in the BIOS code (where
> lot of direct accesses to low memory are done), silence this warning
> for all BIOS objects.
> 
> Re-introduce the cc-c-option macro (see commit 036999e93e4) to check
> whether the compiler supports this warning or not.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

untested, but
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   pc-bios/s390-ccw/Makefile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index 29fd9019b83..21581d1258d 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -8,6 +8,8 @@ CFLAGS = -O2 -g
>   quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
>   cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null > /dev/null \
>   	      2>&1 && echo OK), $1, $2)
> +cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
> +	      >/dev/null 2>&1 && echo OK), $2, $3)
>   
>   VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>   set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
> @@ -30,6 +32,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
>   	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
>   
>   QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
> +QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), -Wno-stringop-overflow)
>   QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
>   QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
>   QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
> 

