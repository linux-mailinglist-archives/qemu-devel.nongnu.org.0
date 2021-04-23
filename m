Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3B369286
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:55:58 +0200 (CEST)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvLh-00014c-L6
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZvKa-0000Y2-9B; Fri, 23 Apr 2021 08:54:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZvKY-0004hR-8z; Fri, 23 Apr 2021 08:54:47 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NCjemu084009; Fri, 23 Apr 2021 08:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Ct9Bpd5bMl2HTDn6eixckCDWy6OwTinAbysMvKuS4Vg=;
 b=jVHAjb5mIk9lyzX2VyCRxNOZoiyEzVP6xTrnmvjD5Z+iOXwVxVQiMuKmbjU1Q6oG9RyM
 FBoTpSDJyWITuHcZGwGPSoZFFSTkZ0guMtf0f6TszenvWKbg01wC8ejH73E0UXtnk7rD
 SG+2phtoAyRifMtPHjfDNY5EGolGxDzx6l53e2ulrdTbrBu65To6ZoFUGCjK/wAPxBM3
 UwvTh4j5+++yiVv5KM6JijAPxJxqPQt8t58/HVCoDxJw47kidqnDbGXX9HzyfJNlJs87
 JG0GNF+g5HhvATxMBwFoC/8LoHcHkG3zF9MIWrY4lY8e0zbJCgxJxqrPyYRQ3nRkBvUc dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838byunec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 08:54:31 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13NCk5QA086359;
 Fri, 23 Apr 2021 08:54:30 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838byund4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 08:54:30 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NCqqHb025360;
 Fri, 23 Apr 2021 12:54:27 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 37yqaan4cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 12:54:27 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NCsRwe35455430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 12:54:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28715AC05B;
 Fri, 23 Apr 2021 12:54:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44F53AC059;
 Fri, 23 Apr 2021 12:54:26 +0000 (GMT)
Received: from localhost (unknown [9.163.1.180])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Apr 2021 12:54:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/2] tests/docker: gcc-10 based images for ppc64{,
 le} tests
In-Reply-To: <20210422112754.1099177-2-matheus.ferst@eldorado.org.br>
References: <20210422112754.1099177-1-matheus.ferst@eldorado.org.br>
 <20210422112754.1099177-2-matheus.ferst@eldorado.org.br>
Date: Fri, 23 Apr 2021 09:54:23 -0300
Message-ID: <87a6ppf9fk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a_r74wU0BseNSBjjsftObF8IC8iB93kd
X-Proofpoint-ORIG-GUID: 2C5RkYkAGwiuGYcbSCButYZBrUWZ0FsE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_03:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230081
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
> A newer compiler is needed to build tests for Power10 instructions. As
> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
> is added to verify that the toolchain in use has '-mpower10'. Finally,
> unused images (docker-power-cross and docker-ppc64-cross) are removed.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  .gitlab-ci.d/containers.yml                   | 11 ++--------
>  tests/docker/Makefile.include                 |  5 ++---
>  .../dockerfiles/debian-powerpc-cross.docker   | 12 -----------
>  .../debian-powerpc-test-cross.docker          | 17 ++++++++++++++++
>  .../dockerfiles/debian-ppc64-cross.docker     | 11 ----------
>  tests/tcg/configure.sh                        | 20 +++++++++----------
>  6 files changed, 31 insertions(+), 45 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
>  create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>  delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 33e4046e23..32f1b5887f 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -144,19 +144,12 @@ mipsel-debian-cross-container:
>    variables:
>      NAME: debian-mipsel-cross
>  
> -powerpc-debian-cross-container:
> +powerpc-test-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
>    needs: ['amd64-debian10-container']

Should this be debian11?

>    variables:
> -    NAME: debian-powerpc-cross
> -
> -ppc64-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-ppc64-cross
> +    NAME: debian-powerpc-test-cross
>  
>  ppc64el-debian-cross-container:
>    <<: *container_job_definition

