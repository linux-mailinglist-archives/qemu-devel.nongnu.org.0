Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B52DD58D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:58:21 +0100 (CET)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwbc-0003Pk-V4
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpwYl-0002Us-4r; Thu, 17 Dec 2020 11:55:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpwYj-0002mS-Cl; Thu, 17 Dec 2020 11:55:22 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHGVZkC032620; Thu, 17 Dec 2020 11:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=weG5EWEKNB+5Jz44HXn81ThRGoIOQMbcznhlb2mKjj4=;
 b=C/W6WzaB/zpkSqbBK8S3bKcmWuZT22rHwEVCKZbz+YE7+6lfY9X91gDVqFoBXx4IuqC/
 zbr+zA8Q+1rt7ny2I1zTle35VksaKmisoaVElH7EIjEk2ANnvHjT8ovMc956eyK0oc3Y
 5lfFsy2UiKBsUVi6DzqaWtX6V+tyM9opp1jcRB0bv34tGfd8Nbs/7euWShamUMSnuBOj
 k8plhWLTjubU5iqcOWCLTI2bUDy9zu0YtYZpzwcH7uXYj5L8amsI0xz0GWm+s54YuXtU
 XzQNZ69SN7T7NjRM2RjiPZl4RSJSG/aLElwZbGN6MHUxp2wiD44mK9MYliv4BtyLdrLE lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gav08tsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 11:55:08 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BHGWB7W034975;
 Thu, 17 Dec 2020 11:55:08 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gav08ts1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 11:55:08 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHGrM3f030272;
 Thu, 17 Dec 2020 16:55:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 35cng9u9gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 16:55:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHGt6PF24838592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 16:55:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CB95AC06A;
 Thu, 17 Dec 2020 16:55:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B811AC06E;
 Thu, 17 Dec 2020 16:55:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.157.218])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 16:55:05 +0000 (GMT)
Subject: Re: [PATCH] configure: Fail when specified cross compiler cannot be
 found
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201216013646.40799-1-gromero@linux.ibm.com>
 <87bleut3si.fsf@linaro.org>
From: Gustavo Romero <gromero@linux.ibm.com>
Message-ID: <16b08946-9f96-200e-231f-40e24bb21734@linux.ibm.com>
Date: Thu, 17 Dec 2020 13:55:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87bleut3si.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_10:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=gromero@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: gustavo.romero@protonmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 12/16/20 7:51 AM, Alex Bennée wrote:
> 
> Gustavo Romero <gromero@linux.ibm.com> writes:
> 
>> Currently if the cross compiler passed to 'configure' (--cross-cc-<arch>) does
>> not exist no error happens and only later when the TCG tests are run they fail
>> because the cross compiler is not set correctly.
> 
> Do they? They should just skip because of a non-existing compiler and a
> failed fallback to using docker:
> 
>    ../../configure --disable-docs --target-list=aarch64-softmmu --cross-cc-aarch64=nonexisting_gcc
> 
> and then cat ./tests/tcg/config-aarch64-softmmu.mak
> 
>    # Automatically generated by configure - do not modify
>    TARGET_NAME=aarch64
>    CONFIG_SOFTMMU=y
>    QEMU=/home/alex/lsrc/qemu.git/builds/bisect/qemu-system-aarch64
>    CROSS_CC_GUEST_CFLAGS=
>    DOCKER_IMAGE=debian-arm64-test-cross
>    DOCKER_CROSS_CC_GUEST=aarch64-linux-gnu-gcc-10
> 
> So what do you see in your failing case?

I get the following (I don't have docker installed):

$  ../configure --disable-docs --target-list=aarch64-softmmu --cross-cc-aarch64=nonexisting_gcc
gromero@pub:~/git/qemu/build$ cat ./tests/tcg/config-aarch64-softmmu.mak
# Automatically generated by configure - do not modify
TARGET_NAME=aarch64
CONFIG_SOFTMMU=y
QEMU=/home/gromero/git/qemu/build/qemu-system-aarch64
CROSS_CC_GUEST_CFLAGS=

$ ../configure --disable-docs --target-list=ppc64-softmmu --cross-cc-ppc64=nonexisting_gcc
gromero@pub:~/git/qemu/build$ cat ./tests/tcg/config-ppc64-softmmu.mak
# Automatically generated by configure - do not modify
TARGET_NAME=ppc64
CONFIG_SOFTMMU=y
QEMU=/home/gromero/git/qemu/build/qemu-system-ppc64
CROSS_CC_GUEST_CFLAGS=
CROSS_CC_GUEST_STATIC=y
CROSS_CC_GUEST=powerpc-linux-gnu-gcc

hrm It seems PPC64 is even assuming some default gcc...

I'm at commit af3f37319c from Dec 15.

I'm wondering if tha happens because I don't have docker package installed.

Anyway, should we at least say we're using Docker as fallback?


Cheers,
Gustavo

