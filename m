Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97A60F57D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:40:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0Gj-0002JA-6Z; Thu, 27 Oct 2022 06:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0GA-0000q7-I3; Thu, 27 Oct 2022 06:37:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0Fv-0001GW-U5; Thu, 27 Oct 2022 06:37:14 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RAHO8B003976;
 Thu, 27 Oct 2022 10:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ebvIoaIlDFrskf8lwCamNEpX5siufeAje8fUooCZTRM=;
 b=at6LBr4w2Pru+W7tnOp77JNG/dNcmK9ABaTuRt2VYdGSzmiDbQ28Pd9zypy2lticP38j
 ldH4YbROLpWHgrpTWxdLw46KntVKFp09cWkKsai8vaPZPfO91TD4cUPI95JSgPrk34Pu
 cZnYo/UPxhTB/ioU5EVr4eE3ARNNRs4SNpieMrl5F4R0siph6Bdlw0lNp/hlPUjSjo1V
 u57AvxW3W42lTmdIGyKFocNlgA1R4Zi+Z2+HSkZWGIzbF8BzhpM+cLtV05+6Eq2yMvf+
 i1Tk6Q3d8uUetRU+MFqjnrT3Bukc/lMY+LWgagpfGnz9G0IDlaHGnaRWoRPgC1HxW0uG WA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfr3vgmq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:36:56 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RANsTt027748;
 Thu, 27 Oct 2022 10:36:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3kfbg294qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:36:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29RAaqJq20382254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 10:36:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CF9DA405D;
 Thu, 27 Oct 2022 10:36:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5937A405F;
 Thu, 27 Oct 2022 10:36:51 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 10:36:51 +0000 (GMT)
Date: Thu, 27 Oct 2022 12:36:50 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 4/9] target/s390x: Use Int128 for return from CKSM
Message-ID: <20221027103650.a7ytbkz3caxrskle@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021073006.2398819-5-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5lFWsTsA0z3-Mr3yKt97PJ6wA9v2DSBw
X-Proofpoint-ORIG-GUID: 5lFWsTsA0z3-Mr3yKt97PJ6wA9v2DSBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=549 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270058
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 21, 2022 at 05:30:01PM +1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h         | 2 +-
>  target/s390x/tcg/mem_helper.c | 7 +++----
>  target/s390x/tcg/translate.c  | 6 ++++--
>  3 files changed, 8 insertions(+), 7 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

