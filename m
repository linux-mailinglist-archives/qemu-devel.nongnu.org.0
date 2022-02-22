Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB14BF344
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:13:33 +0100 (CET)
Received: from localhost ([::1]:36006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQId-0008FY-UO
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nMQCV-0005Ws-3Z; Tue, 22 Feb 2022 03:07:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nMQCR-0000tx-Pl; Tue, 22 Feb 2022 03:07:10 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21M7DM0u006018; 
 Tue, 22 Feb 2022 08:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=twhYKI5d2eTQkTpDFPHtP3GjuW6Gdm/8d9fBgAnQn+c=;
 b=XP/7G3oQbbQbYVAeMTZExJHaa/c392nMJAwApXBDWSDLT1dmmuHVxYRUAjdaq4iifGlO
 awP2NJetP/XeMXRucyeHE+sShCyS+isJFaK/p8tb29sAyz3WD3OeZvUVL8gtJBYajLNW
 97qNpwEiMbzVE87yxQfizAkVAhQb6MgRZa4PbCMzZTGqnVNfgEXkmZNpemLQEoDY3ZOV
 PHcucDkboC9hbw6NhhOca8ZC+oMztTUKiazoerOVRmmQ7fFvPcsFBBHGe2kM4c8xvlQD
 Pj2hgFIGKchnzX2dKdfY4+X1P0fFY8/htQJlLCRNCNBrHpdDAjM4BPcY17fTvkb57jyC dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ecu8jh5kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 08:06:58 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21M7lJsp007655;
 Tue, 22 Feb 2022 08:06:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ecu8jh5k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 08:06:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21M7vWUn029880;
 Tue, 22 Feb 2022 08:06:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3ear690v36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 08:06:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21M86s8459703652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 08:06:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ABC34C046;
 Tue, 22 Feb 2022 08:06:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D030B4C04E;
 Tue, 22 Feb 2022 08:06:53 +0000 (GMT)
Received: from [9.171.12.252] (unknown [9.171.12.252])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Feb 2022 08:06:53 +0000 (GMT)
Message-ID: <026cbf2c-df86-9d19-671b-bf29097519d1@linux.ibm.com>
Date: Tue, 22 Feb 2022 09:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] gitlab: upgrade the job definition for s390x to 20.04
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220221230607.1277120-1-alex.bennee@linaro.org>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220221230607.1277120-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vl1uJCjrKMCofHJIJwiZGX78C86hbLs9
X-Proofpoint-GUID: ELNU0vcg4MiIz3esIYS-Ot4Jn6H1VZUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_02,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220046
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Am 22.02.22 um 00:06 schrieb Alex Bennée:
> The new s390x machine has more of everything including the OS. As
> 18.04 will soon be going we might as well get onto something moderately
> modern.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>

Looks sane,

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   .gitlab-ci.d/custom-runners.yml               |  2 +-
>   ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 056c374619..3e76a2034a 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -14,6 +14,6 @@ variables:
>     GIT_STRATEGY: clone
>   
>   include:
> -  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
> +  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
>     - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> similarity index 87%
> rename from .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
> rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> index f39d874a1e..0333872113 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> @@ -1,12 +1,12 @@
> -# All ubuntu-18.04 jobs should run successfully in an environment
> +# All ubuntu-20.04 jobs should run successfully in an environment
>   # setup by the scripts/ci/setup/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +# "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
>   
> -ubuntu-18.04-s390x-all-linux-static:
> +ubuntu-20.04-s390x-all-linux-static:
>    needs: []
>    stage: build
>    tags:
> - - ubuntu_18.04
> + - ubuntu_20.04
>    - s390x
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> @@ -21,11 +21,11 @@ ubuntu-18.04-s390x-all-linux-static:
>    - make --output-sync -j`nproc` check V=1
>    - make --output-sync -j`nproc` check-tcg V=1
>   
> -ubuntu-18.04-s390x-all:
> +ubuntu-20.04-s390x-all:
>    needs: []
>    stage: build
>    tags:
> - - ubuntu_18.04
> + - ubuntu_20.04
>    - s390x
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> @@ -37,11 +37,11 @@ ubuntu-18.04-s390x-all:
>    - make --output-sync -j`nproc`
>    - make --output-sync -j`nproc` check V=1
>   
> -ubuntu-18.04-s390x-alldbg:
> +ubuntu-20.04-s390x-alldbg:
>    needs: []
>    stage: build
>    tags:
> - - ubuntu_18.04
> + - ubuntu_20.04
>    - s390x
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> @@ -58,11 +58,11 @@ ubuntu-18.04-s390x-alldbg:
>    - make --output-sync -j`nproc`
>    - make --output-sync -j`nproc` check V=1
>   
> -ubuntu-18.04-s390x-clang:
> +ubuntu-20.04-s390x-clang:
>    needs: []
>    stage: build
>    tags:
> - - ubuntu_18.04
> + - ubuntu_20.04
>    - s390x
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> @@ -78,11 +78,11 @@ ubuntu-18.04-s390x-clang:
>    - make --output-sync -j`nproc`
>    - make --output-sync -j`nproc` check V=1
>   
> -ubuntu-18.04-s390x-tci:
> +ubuntu-20.04-s390x-tci:
>    needs: []
>    stage: build
>    tags:
> - - ubuntu_18.04
> + - ubuntu_20.04
>    - s390x
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> @@ -97,11 +97,11 @@ ubuntu-18.04-s390x-tci:
>    - ../configure --disable-libssh --enable-tcg-interpreter
>    - make --output-sync -j`nproc`
>   
> -ubuntu-18.04-s390x-notcg:
> +ubuntu-20.04-s390x-notcg:
>    needs: []
>    stage: build
>    tags:
> - - ubuntu_18.04
> + - ubuntu_20.04
>    - s390x
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'

