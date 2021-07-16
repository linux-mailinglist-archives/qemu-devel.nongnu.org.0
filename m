Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1670E3CB93A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:00:54 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PKe-0002Xc-KD
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4PIv-0001ST-Li
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:59:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1m4PIt-0001VZ-Nz
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:59:05 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GEYFEY108755; Fri, 16 Jul 2021 10:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JB883WHO4raO1Ya3TUSKl0muXpz2CtYjDtL9eaoYAUw=;
 b=HpjarWvUWKDW5m7v+nnv3bbIBZ8K2hdApBYsyReuL/6prbmTnydxytmv7MunPiHlBMus
 oxzwhRz/vHeSkmghRn9gy1HCSbb3NOEl7Ae3YixUBEmr9k6dAL+MnsFKAJwI7mMnszTL
 yh9KbcNaaT7bKSTtOjHDdXJ90d7qgcVJWA+c9cRz24vduvoYpkX8/FqtCfYEcC2QnKR/
 G7TJ00UqRXfA7Yka3B1sRLr0iaTrmY6RirZtBn943iJMsimyizbILfwplMa8idryfzq2
 APLBU7sIg6QiY1kFduGH7kPx0pvzGcf853sLtogRwaCL5ee5uUIsMou6f0lwK+wfpFf4 WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39twqyxu2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:58:56 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GEZYme120211;
 Fri, 16 Jul 2021 10:58:55 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39twqyxu1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:58:55 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GEwKK2024489;
 Fri, 16 Jul 2021 14:58:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 39q368hfy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 14:58:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16GEuZbW14745880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 14:56:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5E7CAE058;
 Fri, 16 Jul 2021 14:58:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CF2CAE056;
 Fri, 16 Jul 2021 14:58:50 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.170.60])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 14:58:50 +0000 (GMT)
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
 <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
 <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
 <79250303-5d6d-3acc-2ae3-94dacb5041f4@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e7d7d936-af4b-b6d2-fada-4b3da7315163@de.ibm.com>
Date: Fri, 16 Jul 2021 16:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79250303-5d6d-3acc-2ae3-94dacb5041f4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ec9iLV6b5QjIoIAlTu_DiHzsxWpjhxGX
X-Proofpoint-GUID: cUIh67sGnNu_-ze-m0-JCLUgX_lqbTtM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_05:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=986
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160088
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 16.07.21 16:51, Richard Henderson wrote:
> On 7/16/21 4:28 AM, Christian Borntraeger wrote:
>>   --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"

Full configure line is

../configure     --prefix=/usr     --libdir=/usr/lib64     --sysconfdir=/etc     --interp-prefix=/usr/qemu-%M     --localstatedir=/var     --libexecdir=/usr/libexec     --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"     --extra-cflags="-O2 -g -fPIE -DPIE"     --enable-werror     --disable-strip     --disable-rbd     --disable-fdt        --disable-xen     --enable-kvm     --enable-trace-backend=log      --iasl=false     --target-list=s390x-softmmu,i386-softmmu,x86_64-softmmu,s390x-linux-user


> FWIW, -pie should not be buried in --extra-ldflags, but as --enable-pie on the normal configure line.

I picked that from the configure script of an older fedora qemu src rpm some years ago and I use that to do build checks.

