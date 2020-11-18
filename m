Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC12B7A14
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:12:26 +0100 (CET)
Received: from localhost ([::1]:55112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJVp-0006JG-3d
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kfJSk-0003bS-NC; Wed, 18 Nov 2020 04:09:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kfJSi-0001o2-Kp; Wed, 18 Nov 2020 04:09:14 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI93xcb083357; Wed, 18 Nov 2020 04:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/8L148HLFxJB5VV7zNTmfLMs7NEOlnhJkgDfyuxY/1I=;
 b=h1ByvcvEejyi6bQ2xlho98TtVHKWvbpCtQxqa95pyK5ql1+xtTVTjJWyZxhvXAqN8pTD
 9g94a9t9sjA1qiPIWUWUMPv8Zi5ZXXPlkmhhncv9Amj1ff1Wpq/MdVM58AFo+FYoQIBq
 bPH+IJgY3/pMfxOsxC9aCJyMdnAbAk9PCPglX2bDmMVmQlZOPgeQtdA97Tgnd8RIVmwO
 4zaJgD66p9V0mJzvIF9uMdNTxAQ9RsHbDduQ6rfaHyiahY7WhsMJ+QiwGf3wrZ7a2rPV
 dZkLME0p/osq2nvJ94JM+QvpGELlPycgB3IDGb5f4aHbWEVbQA5PEyfuc53VAtfWEx8e mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vy2uka63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 04:08:42 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AI94dCf087324;
 Wed, 18 Nov 2020 04:07:46 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vy2uk7w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 04:07:45 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI96sN6003507;
 Wed, 18 Nov 2020 09:06:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 34t6v8br1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 09:06:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI96qg07668336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 09:06:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD6EA11C054;
 Wed, 18 Nov 2020 09:06:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 816BF11C052;
 Wed, 18 Nov 2020 09:06:52 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.87.122])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 09:06:52 +0000 (GMT)
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201118090344.243117-1-thuth@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <63561245-fea1-5e2c-7fcc-d18f7a857801@de.ibm.com>
Date: Wed, 18 Nov 2020 10:06:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201118090344.243117-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_04:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180058
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 04:08:43
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18.11.20 10:03, Thomas Huth wrote:
> Both headers, sysbus.h and module.h, are not required to compile this file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

It is not a sysbus device and not a module.

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>  hw/watchdog/wdt_diag288.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
> index 71a945f0bd..4c4b6a6ab7 100644
> --- a/hw/watchdog/wdt_diag288.c
> +++ b/hw/watchdog/wdt_diag288.c
> @@ -14,12 +14,10 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/watchdog.h"
> -#include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/watchdog/wdt_diag288.h"
>  #include "migration/vmstate.h"
>  #include "qemu/log.h"
> -#include "qemu/module.h"
>  
>  static WatchdogTimerModel model = {
>      .wdt_name = TYPE_WDT_DIAG288,
> 

