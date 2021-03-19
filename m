Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730453416D2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 08:44:15 +0100 (CET)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN9nq-0007UQ-2C
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 03:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lN9mv-0006xf-TU; Fri, 19 Mar 2021 03:43:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29344
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lN9mt-0000Ox-Ku; Fri, 19 Mar 2021 03:43:17 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12J7YCF6066370; Fri, 19 Mar 2021 03:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UU76RkvDtpXAMrKVTTnXCUDn8B+cHg+3JT8dnJF9YYE=;
 b=MRlfXlPMNRR/mHI04hiidJKFet44Mz5M7v01ubYYCH2KRCYV1PM9CNAitPRNreiv9TwP
 pHvucLQnq6wPKD7pr+qfDCnGF3WMlWlSOqkkZSN9FEwgZUWL/HDasiR6G2cNeHfGD5Nq
 FRn4YGSDLkf7b8vKqn86gjijj8cvJCiH2ETCqdPm+e0p2Kskb6uzEqDsC1qyQpTOvc8v
 ObauoXwKCKYpKwarEMiyHTmfICgZMGJnartLyZF5LRKSoGZll+ImJhbAG38a2+PV84pM
 Yzwx4dOZ4MPJKlmkdBnkAhbZM3zmTkmpR1lk2ozt+8El1a23ITnhmusgIGaFec96aL0i tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37c10gdwf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 03:43:13 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12J7ZJ8M072818;
 Fri, 19 Mar 2021 03:43:13 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37c10gdweq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 03:43:12 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12J7gPXO017160;
 Fri, 19 Mar 2021 07:43:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37b30p2b20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 07:43:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12J7gpeX35914138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 07:42:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E13F642041;
 Fri, 19 Mar 2021 07:43:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C3884203F;
 Fri, 19 Mar 2021 07:43:08 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.72.169])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Mar 2021 07:43:08 +0000 (GMT)
Subject: Re: [PATCH 1/1] iotests: fix 051.out expected output after error text
 touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210318200949.1387703-1-ckuehl@redhat.com>
 <20210318200949.1387703-2-ckuehl@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <882fa38e-1779-d50a-a641-84c0c1037fa0@de.ibm.com>
Date: Fri, 19 Mar 2021 08:43:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318200949.1387703-2-ckuehl@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-19_02:2021-03-17,
 2021-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: kwolf@redhat.com, qemu-s390x@nongnu.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18.03.21 21:09, Connor Kuehl wrote:
> A patch was recently applied that touched up some error messages that
> pertained to key names like 'node-name'. The trouble is it only updated
> tests/qemu-iotests/051.pc.out and not tests/qemu-iotests/051.out as
> well.
> 
> Do that now.
> 
> Fixes: 785ec4b1b9 ("block: Clarify error messages pertaining to
> 'node-name'")
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>

Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>

Thanks for the quick response.

> ---
>   tests/qemu-iotests/051.out | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
> index de4771bcb3..db8c14b903 100644
> --- a/tests/qemu-iotests/051.out
> +++ b/tests/qemu-iotests/051.out
> @@ -61,13 +61,13 @@ QEMU X.Y.Z monitor - type 'help' for more information
>   (qemu) quit
>   
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node-name: '123foo'
>   
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node-name: '_foo'
>   
>   Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
> -QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
> +QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'foo#12'
>   
>   
>   === Device without drive ===
> 

