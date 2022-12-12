Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C237164AA3F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rIu-0008Gc-6N; Mon, 12 Dec 2022 17:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4rIs-0008GS-F0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:29:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4rIq-000468-VW
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:29:42 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCKd5Th012531; Mon, 12 Dec 2022 22:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=99T/a6g9xkWjgal1+urkVHv9rJgU3Kyun0AhA8wdc5Y=;
 b=glZ1h69pfYG8c1sd3yKP5uwsO9djX6pOIQJH8RMdorBCE2KFmB9VDYtSpkjGyBG2x2uh
 7bigJEUmD0HZh0U0Oucxr6AnmuUL2q0yUltIytoZM8mXcj1j+4wPceNJCTCsKE6gskq1
 u1gjrjdrK6/IWKT6Kvsbe60D+2vMFcAz0ygXZtK6z6Ge8XjagUBOP+ntWpTHDPzJOAEh
 9TMVUq6KPniEOn05NIOwvro05dM0t7tDPobjS1lkVHrplXvesH8zoyAyN6XGi4M+sLZ5
 81y3oU0VqRAQCdGZAyMTT5DoX0+c/nG+hgNi4NeQS8rxj6v8/qIFu7fiRlLJ8fMGuGFg EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me9c4ddus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:29:38 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMHMNN021813;
 Mon, 12 Dec 2022 22:29:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me9c4ddu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:29:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCDC5na007765;
 Mon, 12 Dec 2022 22:29:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mchcf39e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:29:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCMTXXK49938726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 22:29:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 583CD20049;
 Mon, 12 Dec 2022 22:29:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ED0420040;
 Mon, 12 Dec 2022 22:29:33 +0000 (GMT)
Received: from heavy (unknown [9.179.26.201])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Dec 2022 22:29:32 +0000 (GMT)
Date: Mon, 12 Dec 2022 23:29:31 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v4 10/27] tcg/s390x: Remove DISTINCT_OPERANDS facility
 check
Message-ID: <20221212222931.d4rymnlc3iq6fwvv@heavy>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-11-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209020530.396391-11-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W8L800J1WOI5xSielI6moaNBjGAF_RHr
X-Proofpoint-GUID: SGdx4xNO5idQMAHflwgzCh3edbSUjtVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=673
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120189
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 08, 2022 at 08:05:13PM -0600, Richard Henderson wrote:
> The distinct-operands facility is bundled into facility 45,
> along with load-on-condition.  We are checking this at startup.
> Remove the a0 == a1 checks for 64-bit sub, and, or, xor, as there
> is no space savings for avoiding the distinct-operands insn.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

