Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544C5600CC0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:42:59 +0200 (CEST)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNaE-00086F-3o
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1okNWl-0004Ro-RG
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:39:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1okNWj-0005Tg-EV
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:39:23 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H9ckW3028317
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vdAHszVh915PVLZBBaZG9FYOXx8bF8QxghvlGtjDkrM=;
 b=Fr2jx3E4Iq1MwIzADWb+oruYq7H1v+vyfBLpRbLIhnkJqx7IJjjWxGZHQEiKYfZlNewO
 UiMvfHR+tsy84a3hfBhIPe+9eGMxPhNW8yIq3UOyWfdjDCsYgeFOblK84Y+OTeybKYwY
 hOje+6FmR47nW2GrvhWeiXiVHta00GHIZbRpbjK9r95P0wsjeaPNrl7g6oZcDrnxSr9i
 mFvDf2hnaBqJaAiiXLzILZvYpqgbYUvsOp7PuUuO4+bftwzLgrBzCRt1kQgVKl3Nj6X5
 hhLKcPhieNqM3GgE8AHPOqO83L6fu6i2AtMZQSd/aMXY5CNJHXjo/2yvu3T0PqjpMU/j 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86ws4rpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:39:17 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29HAZp02022252
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:39:17 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86ws4rpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 10:39:17 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29HAc7I5006830;
 Mon, 17 Oct 2022 10:39:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3k7mg9e212-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 10:39:16 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29HAdF0255247146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 10:39:16 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 753A558054;
 Mon, 17 Oct 2022 10:39:15 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F4DD58058;
 Mon, 17 Oct 2022 10:39:15 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 10:39:14 +0000 (GMT)
Message-ID: <ab763898-e483-4a98-8094-d6dfa4c40b44@linux.ibm.com>
Date: Mon, 17 Oct 2022 06:39:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/qtest/tpm: Clean up remainders of swtpm
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
References: <20221012084334.794253-1-thuth@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20221012084334.794253-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U7mmh9dTaTOrrN6ysVnxwP6wJAuiCC1W
X-Proofpoint-ORIG-GUID: gsFkdp1S4l6lWh2D8-rsPnPY3F9709SC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_07,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/12/22 04:43, Thomas Huth wrote:
> After running "make check", there are remainders of the tpm
> tests left in the /tmp directory, slowly filling it up.
> Seems like "swtpm" leaves a ".lock" and a "tpm2-00.permall"
> file behind, so that the g_rmdir() calls on the temporary
> directories fail. Introduce a helper function to remove those
> leftovers before doing the g_rmdir().
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   tests/qtest/tpm-util.h                  |  1 +
>   tests/qtest/tpm-crb-swtpm-test.c        |  5 ++---
>   tests/qtest/tpm-tis-device-swtpm-test.c |  5 ++---
>   tests/qtest/tpm-tis-swtpm-test.c        |  5 ++---
>   tests/qtest/tpm-util.c                  | 19 +++++++++++++++++++
>   5 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/qtest/tpm-util.h b/tests/qtest/tpm-util.h
> index 3b97d69017..80720afac0 100644
> --- a/tests/qtest/tpm-util.h
> +++ b/tests/qtest/tpm-util.h
> @@ -53,5 +53,6 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
>                                      const char *machine_options);
> 
>   void tpm_util_wait_for_migration_complete(QTestState *who);
> +void tpm_util_rmdir(const char *path);
> 
>   #endif /* TESTS_TPM_UTIL_H */
> diff --git a/tests/qtest/tpm-crb-swtpm-test.c b/tests/qtest/tpm-crb-swtpm-test.c
> index 55fdb5657d..40254f762f 100644
> --- a/tests/qtest/tpm-crb-swtpm-test.c
> +++ b/tests/qtest/tpm-crb-swtpm-test.c
> @@ -13,7 +13,6 @@
>    */
> 
>   #include "qemu/osdep.h"
> -#include <glib/gstdio.h>
> 
>   #include "libqtest.h"
>   #include "qemu/module.h"
> @@ -62,9 +61,9 @@ int main(int argc, char **argv)
>                           tpm_crb_swtpm_migration_test);
>       ret = g_test_run();
> 
> -    g_rmdir(ts.dst_tpm_path);
> +    tpm_util_rmdir(ts.dst_tpm_path);
>       g_free(ts.dst_tpm_path);
> -    g_rmdir(ts.src_tpm_path);
> +    tpm_util_rmdir(ts.src_tpm_path);
>       g_free(ts.src_tpm_path);
>       g_free(ts.uri);
> 
> diff --git a/tests/qtest/tpm-tis-device-swtpm-test.c b/tests/qtest/tpm-tis-device-swtpm-test.c
> index 7b20035142..8c067fddd4 100644
> --- a/tests/qtest/tpm-tis-device-swtpm-test.c
> +++ b/tests/qtest/tpm-tis-device-swtpm-test.c
> @@ -14,7 +14,6 @@
>    */
> 
>   #include "qemu/osdep.h"
> -#include <glib/gstdio.h>
> 
>   #include "libqtest.h"
>   #include "qemu/module.h"
> @@ -66,9 +65,9 @@ int main(int argc, char **argv)
>                           tpm_tis_swtpm_migration_test);
>       ret = g_test_run();
> 
> -    g_rmdir(ts.dst_tpm_path);
> +    tpm_util_rmdir(ts.dst_tpm_path);
>       g_free(ts.dst_tpm_path);
> -    g_rmdir(ts.src_tpm_path);
> +    tpm_util_rmdir(ts.src_tpm_path);
>       g_free(ts.src_tpm_path);
>       g_free(ts.uri);
> 
> diff --git a/tests/qtest/tpm-tis-swtpm-test.c b/tests/qtest/tpm-tis-swtpm-test.c
> index 90131cb3c4..11539c0a52 100644
> --- a/tests/qtest/tpm-tis-swtpm-test.c
> +++ b/tests/qtest/tpm-tis-swtpm-test.c
> @@ -13,7 +13,6 @@
>    */
> 
>   #include "qemu/osdep.h"
> -#include <glib/gstdio.h>
> 
>   #include "libqtest.h"
>   #include "qemu/module.h"
> @@ -61,9 +60,9 @@ int main(int argc, char **argv)
>                           tpm_tis_swtpm_migration_test);
>       ret = g_test_run();
> 
> -    g_rmdir(ts.dst_tpm_path);
> +    tpm_util_rmdir(ts.dst_tpm_path);
>       g_free(ts.dst_tpm_path);
> -    g_rmdir(ts.src_tpm_path);
> +    tpm_util_rmdir(ts.src_tpm_path);
>       g_free(ts.src_tpm_path);
>       g_free(ts.uri);
> 
> diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
> index e0dc5da0af..a7efe2d0d2 100644
> --- a/tests/qtest/tpm-util.c
> +++ b/tests/qtest/tpm-util.c
> @@ -13,6 +13,7 @@
>    */
> 
>   #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
> 
>   #include "hw/acpi/tpm.h"
>   #include "libqtest.h"
> @@ -292,3 +293,21 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
>       g_free(src_qemu_args);
>       g_free(dst_qemu_args);
>   }
> +
> +/* Remove directory with remainders of swtpm */
> +void tpm_util_rmdir(const char *path)
> +{
> +    char *filename;
> +    int ret;
> +
> +    filename = g_strdup_printf("%s/tpm2-00.permall", path);
> +    g_unlink(filename);
> +    g_free(filename);
> +
> +    filename = g_strdup_printf("%s/.lock", path);
> +    g_unlink(filename);
> +    g_free(filename);
> +
> +    ret = g_rmdir(path);
> +    g_assert(!ret);
> +}

