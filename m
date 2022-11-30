Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3F63D300
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0K8D-00082n-6F; Wed, 30 Nov 2022 05:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0K87-0007vU-7y; Wed, 30 Nov 2022 05:15:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0K85-0000Ld-Gc; Wed, 30 Nov 2022 05:15:51 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AU9VifB027606; Wed, 30 Nov 2022 10:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=sncYirRyl6EKGxAEM031NgGXtKEpr34HfRWbqkEmLWg=;
 b=qBXlZMTVLbAkU3DemYvU4hzOdBUq+vC0NhSWgw9zNk7t2X12VxZEaKavx3VQHYeNDS5h
 EAMy47VGddvRwriomF2X0m9QcnaArIV3SZut4wxV8g/zUs5nwry+N3m0+39Hu2fsd+PS
 kdr8Qb37U687nPrm4Q5BMBkwVW4SsNSgc5Cvea5cdytGAxF9lOA0jsQpXHBAdCgATLfM
 ImBkwMM3zYxk4oNtf4pMRMX7o+LOvVKExWr4miu7aN/WNrnpxKuc+6DZ008meYve7TDV
 Q1lJvlYrYRZySZKhnDSrBYoOxl2cS8oMBnuEuAhdnV6Vy7MbzUc4VzGbixfn33YNse81 Zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6280cr9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 10:15:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUA7h9H021068;
 Wed, 30 Nov 2022 10:15:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9djym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 10:15:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AUAFb0D57540930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Nov 2022 10:15:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0254AE04D;
 Wed, 30 Nov 2022 10:15:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69966AE045;
 Wed, 30 Nov 2022 10:15:37 +0000 (GMT)
Received: from heavy (unknown [9.171.36.196])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Nov 2022 10:15:37 +0000 (GMT)
Date: Wed, 30 Nov 2022 11:15:35 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 17/26] target/s390x: Introduce help_goto_indirect
Message-ID: <20221130101535.7474sypzl4qtfzh3@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-18-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-18-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZMlUWaaGiyHHTXviLdpLTOHXRRhH14zS
X-Proofpoint-GUID: ZMlUWaaGiyHHTXviLdpLTOHXRRhH14zS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=644 mlxscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300073
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

On Wed, Oct 05, 2022 at 08:44:12PM -0700, Richard Henderson wrote:
> Add a small helper to handle unconditional indirect jumps.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

