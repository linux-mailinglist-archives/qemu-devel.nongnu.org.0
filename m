Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F160D567
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:18:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQK3-0001vz-Qk; Tue, 25 Oct 2022 16:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1onQK1-0001pI-53
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:14:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1onQJz-000377-38
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:14:48 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PJdLtB012436;
 Tue, 25 Oct 2022 20:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=O2P0WqvKIVnH9FeOFCg6sXqv27KBrzuaIp/NR4QJu04=;
 b=JHRJlrPKxOx1nPNqxu2HzRQdHUs3qYr1an5TFNwwtZnVUMJ54Mi4fooFNdQ7Kg8fkhOd
 f6YE7zx5xeYT+cP7ta4WZAfcbLM2UM39KiPv+tczoR5BmZzUJPhyG4rHnTJqWkuKQHna
 inQ2/JsdYR1iPV26VoWwRQ8f3FP3L0Ugo+fDV+VHRlyUK04W74U3oBCXqgxHDT/yZOpA
 he3Jnww5X0KdBbsoyh1/UCkTIdMbo1SvpeAQ2zpfRxb68VlVF/93hwKkqDo7J2F2Jn/O
 Qpv1vjvCUNqCesiWYhXnsiokyFGx8TUx7D1gWHif8T6c0cV/cS7n/lW130C8IPA/64Ib /w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kedmpkdwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 20:14:43 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29PK6f0r004125;
 Tue, 25 Oct 2022 20:14:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3kc859mfxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 20:14:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29PKEbhu34996900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 20:14:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CD33A4040;
 Tue, 25 Oct 2022 20:14:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49081A404D;
 Tue, 25 Oct 2022 20:14:37 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Oct 2022 20:14:37 +0000 (GMT)
Date: Tue, 25 Oct 2022 22:14:32 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 19/36] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Message-ID: <20221025201432.v6rb3hmsdf7tls7m@heavy>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
 <20221021071549.2398137-20-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021071549.2398137-20-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 15pijz0V0c2Dr-kA5Sy6mZl_4jkT3spG
X-Proofpoint-ORIG-GUID: 15pijz0V0c2Dr-kA5Sy6mZl_4jkT3spG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_12,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=921 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 05:15:32PM +1000, Richard Henderson wrote:
> Change 32-bit tci TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EVEN, to
> force 32-bit values to be aligned to 64-bit.  With a small reorg
> to the argument processing loop, this neatly replaces an ifdef for
> CONFIG_TCG_INTERPRETER.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h |  3 ++-
>  tcg/tcg.c            | 62 ++++++++++++++++++++++++++------------------
>  2 files changed, 39 insertions(+), 26 deletions(-)

Hi,

This patch breaks s390x-on-s390x emulation:

    s390x$ ./configure --target-list=s390x-linux-user
    s390x$ make -j$(nproc)
    s390x$ make check-tcg
    ...
    TEST    convd on s390x
    ERROR:../tcg/tcg.c:1575:tcg_gen_callN: code should not be reached
 
With the next patch ("tcg: Reorg function calls") the failure is
slightly different:

    TEST    convd on s390x
    timeout: the monitored command dumped core

s390x-on-x86_64 works though.

Best regards,
Ilya

