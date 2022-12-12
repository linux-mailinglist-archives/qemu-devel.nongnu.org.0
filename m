Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A24664A9D7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:55:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qlW-00053s-Mq; Mon, 12 Dec 2022 16:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4qlT-00053h-7o
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:55:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4qlP-0005bM-Es
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:55:10 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCLoU6b013217; Mon, 12 Dec 2022 21:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=01VqomEvIsrH6OrjIbH62Vz131N+rOpkNRtBd0ZLVeY=;
 b=o2KFfVDR9BAg4SiH+oHpxyqHX8qj484TDQjfgcv9xiRL+VjJ5LnXfPV4nRfTWf9bcjcX
 78js2hJWfgXzpscH0aVho8ML9ZHCpkYSA2JIUNiqyeATBRc5Bia/nsxTJHhmnin3n98H
 GiKCdU1TDZy+Bia0058oo4T+FylBBYLTbFTWEf0bTF3uPg1oDQldCQlmr0EqVpQQ0nm6
 7SyuSdfrvVtVLOd+M5OEpRIhv9ExLuI6igMyCdBEBbGl8To9ha1c/S1ZktxwxblPuX26
 IHKI+SjFQDLiPcE7VVfg/EJbCLHh7zGS/utFxIrRST5s7q+vZHo1S5L/OLPphtXcCYk8 WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecjs020g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:55:04 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCLspqC006248;
 Mon, 12 Dec 2022 21:55:04 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecjs01ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:55:04 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCAWFLp030145;
 Mon, 12 Dec 2022 21:55:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3mchr62b4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:55:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCLsxOw22938114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 21:54:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58C4720043;
 Mon, 12 Dec 2022 21:54:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10E1920040;
 Mon, 12 Dec 2022 21:54:59 +0000 (GMT)
Received: from heavy (unknown [9.179.26.201])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Dec 2022 21:54:58 +0000 (GMT)
Date: Mon, 12 Dec 2022 22:54:57 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v4 05/27] tcg/s390x: Check for long-displacement facility
 at startup
Message-ID: <20221212215457.tipv77exxnlapvsa@heavy>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209020530.396391-6-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _iN_DWrvV14QjToGXYZHJnM0mAWj3oee
X-Proofpoint-ORIG-GUID: Yajq3jwPxLJysRVODjsEB1NPMXZ_BKGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=689 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120187
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

On Thu, Dec 08, 2022 at 08:05:08PM -0600, Richard Henderson wrote:
> We are already assuming the existance of long-displacement, but were
> not being explicit about it.  This has been present since z990.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.h     |  6 ++++--
>  tcg/s390x/tcg-target.c.inc | 15 +++++++++++++++
>  2 files changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

