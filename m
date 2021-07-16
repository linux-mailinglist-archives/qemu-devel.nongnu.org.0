Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07833CB9EA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:35:02 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Prh-0007vj-Go
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4PoW-0004v4-KG
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:31:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31220
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4PoS-0006QR-Te
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:31:43 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GFJ5Ik050331; Fri, 16 Jul 2021 11:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=P5mKkgopReazB10WWx2WKXGxntvRswIDsyMn+UktIb0=;
 b=lCnj9r/NIG4+niEsu2yHnQS2d+/rKYwrr7hbrE/SYLu5ckSD1yxzNIOQ19sVr9rxjwml
 B0j95+vhZQCR4CwrDwLWEbMK7+qVNjftDAL3AXBadPAuU9YLoA+xQ1q1XPYpBnEDu/vc
 uLkdVRmDQGzKtI2VmT+KwBKxfrXop8pX1dmVSeH9y8JB9LT7/CUuM4axExjMCG5VGp+1
 ZMQ9IB/a7E6LJ8iOwz97HZBCW65BvseO81KzLHXfrTJEUhEnZ6ebKZmYtctH0DrAOEIb
 1UuTwLoVZTYJvwE4wc8DR+h7GjtMPPve86iOAeQRMAW9aZhJCny/3rrJFO/lNcTYGG9n 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw3w12n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:31:27 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GFJGFI053019;
 Fri, 16 Jul 2021 11:31:26 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw3w12mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:31:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GFIDC5031371;
 Fri, 16 Jul 2021 15:31:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 39q368at35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 15:31:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GFVL4h26673596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 15:31:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA805AE04D;
 Fri, 16 Jul 2021 15:31:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54FA4AE045;
 Fri, 16 Jul 2021 15:31:21 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.170.60])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 15:31:21 +0000 (GMT)
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
 <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
 <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
 <79250303-5d6d-3acc-2ae3-94dacb5041f4@linaro.org>
 <e7d7d936-af4b-b6d2-fada-4b3da7315163@de.ibm.com>
Message-ID: <79129f00-6b82-e2e9-8e1e-5ffdfad02b84@de.ibm.com>
Date: Fri, 16 Jul 2021 17:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e7d7d936-af4b-b6d2-fada-4b3da7315163@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: csxQ9T59GEZpOmDP5EG5vrlNNmb0W6at
X-Proofpoint-ORIG-GUID: LqDtgY-DKUB8K_vPPOGVknUIpaakUvdo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_05:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=961 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160092
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16.07.21 16:58, Christian Borntraeger wrote:
> 
> 
> On 16.07.21 16:51, Richard Henderson wrote:
>> On 7/16/21 4:28 AM, Christian Borntraeger wrote:
>>>   --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"
> 
> Full configure line is
> 
> ../configure     --prefix=/usr     --libdir=/usr/lib64     --sysconfdir=/etc     --interp-prefix=/usr/qemu-%M     --localstatedir=/var     --libexecdir=/usr/libexec     --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"     --extra-cflags="-O2 -g -fPIE -DPIE"     --enable-werror     --disable-strip     --disable-rbd     --disable-fdt        --disable-xen     --enable-kvm     --enable-trace-backend=log      --iasl=false     --target-list=s390x-softmmu,i386-softmmu,x86_64-softmmu,s390x-linux-user
> 
> 
>> FWIW, -pie should not be buried in --extra-ldflags, but as --enable-pie on the normal configure line.
> 
> I picked that from the configure script of an older fedora qemu src rpm some years ago and I use that to do build checks.

using enable-pie instead of burying it in the ldflags seems to fix things.
Question is do we still care about this regression?

