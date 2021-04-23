Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157836928C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:58:39 +0200 (CEST)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvOI-0002mM-6E
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZvMe-0001v7-A6; Fri, 23 Apr 2021 08:56:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZvMc-00062N-Lj; Fri, 23 Apr 2021 08:56:56 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NCuIiV142437; Fri, 23 Apr 2021 08:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=9AzDODnoq2LuReTryi8Lhl3eItIzfHBWe/4fpqv4lGI=;
 b=jXtOQibz6KGtx5kvy5Cq5GEWYM63r5zESKFeyaNSWZu1oWSx3t2MZb+TqVRn3CGzW6np
 aGEwLLazuglr4tRs8jVk4AOKAp5xZnMiJdztM61fju4FZZNAXtkJ0H23bznuWDp2EaIE
 2MbBBMYL6pub0Eht4oqY/llJmRqjIvtvs9RugDvlVrKxBTXZNXmhVtX+OZNEi1MzDWFa
 c9o57KTDiFDWJZWsHtjgIdbArCmYtjw+aqUYcYQEVGkJoDXKzTBy+nWaSety1bq2zt3v
 sh5bah0GSuRJeCpbt8QXJ4GCwgN2lfW3XV9AEFwiJ4fhzXL0Jvcuyq6qsZPSLuH44+Ea qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383ahj6q9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 08:56:41 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13NCubkQ144052;
 Fri, 23 Apr 2021 08:56:40 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383ahj6q9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 08:56:40 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NCVYwW014575;
 Fri, 23 Apr 2021 12:56:39 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 37yqaagxq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 12:56:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NCud8n37552584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 12:56:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9153AE064;
 Fri, 23 Apr 2021 12:56:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 249CAAE05F;
 Fri, 23 Apr 2021 12:56:38 +0000 (GMT)
Received: from localhost (unknown [9.163.1.180])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Apr 2021 12:56:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/2] tests/tcg/ppc64le: tests for brh/brw/brd
In-Reply-To: <20210422112754.1099177-3-matheus.ferst@eldorado.org.br>
References: <20210422112754.1099177-1-matheus.ferst@eldorado.org.br>
 <20210422112754.1099177-3-matheus.ferst@eldorado.org.br>
Date: Fri, 23 Apr 2021 09:56:35 -0300
Message-ID: <877dktf9bw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fv0iSsrjyGTLkJeCxJPFuzZ0RnVV7bFt
X-Proofpoint-GUID: l3oRMWddatqwLplLMo6jlBS8Ov97U9QJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_04:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230081
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

matheus.ferst@eldorado.org.br writes:

> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> Tests for Byte-Reverse Halfword, Word and Doubleword
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Tested in x86_64 with the new container image.

Tested-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  tests/tcg/ppc64/Makefile.target   |  7 +++++++
>  tests/tcg/ppc64le/Makefile.target |  7 +++++++
>  tests/tcg/ppc64le/byte_reverse.c  | 21 +++++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 tests/tcg/ppc64le/byte_reverse.c
>
> diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
> index 0c6a4585fc..55c690c8ad 100644
> --- a/tests/tcg/ppc64/Makefile.target
> +++ b/tests/tcg/ppc64/Makefile.target
> @@ -10,4 +10,11 @@ PPC64_TESTS=bcdsub
>  endif
>  bcdsub: CFLAGS += -mpower8-vector
>  
> +ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
> +POWER10_TESTS=byte_reverse
> +RUN_POWER10_TESTS=$(patsubst %, run-%, $(POWER10_TESTS))
> +$(RUN_POWER10_TESTS): QEMU_OPTS+=-cpu POWER10
> +PPC64_TESTS += $(POWER10_TESTS)
> +endif
> +
>  TESTS += $(PPC64_TESTS)
> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
> index 1acfcff94a..517d290b1a 100644
> --- a/tests/tcg/ppc64le/Makefile.target
> +++ b/tests/tcg/ppc64le/Makefile.target
> @@ -9,4 +9,11 @@ PPC64LE_TESTS=bcdsub
>  endif
>  bcdsub: CFLAGS += -mpower8-vector
>  
> +ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
> +POWER10_TESTS=byte_reverse
> +RUN_POWER10_TESTS=$(patsubst %, run-%, $(POWER10_TESTS))
> +$(RUN_POWER10_TESTS): QEMU_OPTS+=-cpu POWER10
> +PPC64LE_TESTS += $(POWER10_TESTS)
> +endif
> +
>  TESTS += $(PPC64LE_TESTS)
> diff --git a/tests/tcg/ppc64le/byte_reverse.c b/tests/tcg/ppc64le/byte_reverse.c
> new file mode 100644
> index 0000000000..53b76fc2e2
> --- /dev/null
> +++ b/tests/tcg/ppc64le/byte_reverse.c
> @@ -0,0 +1,21 @@
> +#include <assert.h>
> +
> +int main(void)
> +{
> +    unsigned long var;
> +
> +    var = 0xFEDCBA9876543210;
> +    asm("brh %0, %0" : "+r"(var));
> +    assert(var == 0xDCFE98BA54761032);
> +
> +    var = 0xFEDCBA9876543210;
> +    asm("brw %0, %0" : "+r"(var));
> +    assert(var == 0x98BADCFE10325476);
> +
> +    var = 0xFEDCBA9876543210;
> +    asm("brd %0, %0" : "+r"(var));
> +    assert(var == 0x1032547698BADCFE);
> +
> +    return 0;
> +}
> +

