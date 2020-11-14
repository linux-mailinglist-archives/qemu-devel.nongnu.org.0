Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0C2B3170
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 00:44:46 +0100 (CET)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ke5Dp-0002N9-EE
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 18:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ke5CY-0001w3-OS
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 18:43:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ke5CV-00059y-Ho
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 18:43:26 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AENVRYM050296; Sat, 14 Nov 2020 18:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=P2YZKYCpzy1cPPcuoZ0B8q640a8gnN0O39V5/vVtHiM=;
 b=teW26n4ljYIXqjFA6KpxmsTJAmezpgSHK/naGu0hp1F7l/S2QCGLXUMuki3U7qRqEr8w
 bVio7JmHw7nZbKtbLVvFYtf3E4ILvLehANb9fB+3EuZJFSt2oyFjgjLYZApFgFjze+uk
 HFR+rDEvTXguUvSYkojiDGTELK/E40MH6S8XDWPEpzEkKL7nj2hR57+P5WtTUfIRDWzV
 /KHMrly7NPR+pS7u//WrtzgORZkdh7vvKGDSRdwJkzetbJaA+kRZpmqhW0LwGTSpk19S
 2xyOzfVTiOnbU1bq9BoCSjfeiqdkXXksN/Ru24UPGA/DcdtmfIecvbKDULsDjHPlL9q9 Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34tqk89fs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 18:43:20 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AENelhK074129;
 Sat, 14 Nov 2020 18:43:19 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34tqk89fru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 18:43:19 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AENfuXe026246;
 Sat, 14 Nov 2020 23:43:19 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 34t6v8p04v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Nov 2020 23:43:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AENhH8O8520350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Nov 2020 23:43:17 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8ACDBE051;
 Sat, 14 Nov 2020 23:43:17 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26054BE056;
 Sat, 14 Nov 2020 23:43:17 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 14 Nov 2020 23:43:16 +0000 (GMT)
Subject: Re: [PATCH 3/4] configure: Add a proper check for sys/ioccom.h and
 use it in tpm_ioctl.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-4-thuth@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <c13d2937-1eed-370f-4a5a-ebfd3103535f@linux.ibm.com>
Date: Sat, 14 Nov 2020 18:43:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201114165137.15379-4-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-14_08:2020-11-13,
 2020-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011140156
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 18:43:21
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>, kraxel@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/20 11:51 AM, Thomas Huth wrote:
> On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
> Add a proper check for this header to our configure scripts, and
> make sure to include the header in tpm_ioctl.h to fix a build failure
> on Solaris and Haiku.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   backends/tpm/tpm_ioctl.h |  4 ++++
>   configure                | 11 ++++++++++-
>   nbd/nbd-internal.h       |  2 +-
>   3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
> index f5f5c553a9..bd6c12cb86 100644
> --- a/backends/tpm/tpm_ioctl.h
> +++ b/backends/tpm/tpm_ioctl.h
> @@ -12,6 +12,10 @@
>   #include <sys/uio.h>
>   #include <sys/ioctl.h>
>
> +#ifdef HAVE_SYS_IOCCOM_H
> +#include <sys/ioccom.h>
> +#endif
> +
>   /*
>    * Every response from a command involving a TPM command execution must hold
>    * the ptm_res as the first element.
> diff --git a/configure b/configure
> index c0acda164d..764e903748 100755
> --- a/configure
> +++ b/configure
> @@ -3123,6 +3123,13 @@ if check_include "sys/signal.h" ; then
>     have_sys_signal_h=yes
>   fi
>
> +#########################################
> +# sys/ioccom.h check
> +have_sys_ioccom_h=no
> +if check_include "sys/ioccom.h" ; then
> +  have_sys_ioccom_h=yes
> +fi
> +
>   ##########################################
>   # VTE probe
>
> @@ -6214,7 +6221,9 @@ fi
>   if test "$have_sys_signal_h" = "yes" ; then
>       echo "HAVE_SYS_SIGNAL_H=y" >> $config_host_mak
>   fi
> -
> +if test "$have_sys_ioccom_h" = "yes" ; then
> +    echo "HAVE_SYS_IOCCOM_H=y" >> $config_host_mak
> +fi
>   # Work around a system header bug with some kernel/XFS header
>   # versions where they both try to define 'struct fsxattr':
>   # xfs headers will not try to redefine structs from linux headers
> diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
> index 60629ef160..1b2141ab4b 100644
> --- a/nbd/nbd-internal.h
> +++ b/nbd/nbd-internal.h
> @@ -19,7 +19,7 @@
>   #ifndef _WIN32
>   #include <sys/ioctl.h>
>   #endif
> -#if defined(__sun__) || defined(__HAIKU__)
> +#ifdef HAVE_SYS_IOCCOM_H
>   #include <sys/ioccom.h>
>   #endif
>


