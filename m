Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E30617B2A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:57:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXuB-0004eF-Qz; Thu, 03 Nov 2022 06:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqXu9-0004dc-5i; Thu, 03 Nov 2022 06:57:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqXu7-0007tG-O7; Thu, 03 Nov 2022 06:57:00 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A39cShf009141;
 Thu, 3 Nov 2022 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=rfJUyfTYldp/zWajFLSomqP7GK+QHnk1Y/SDziDqfVo=;
 b=KP8PDziTgVTeg2TzhUBd9WH2sc1e/sLdN/uKmC67Z+Rvh1cAh+tGvhwPzCMJE1Anfeh6
 A0kPvFaBk+OeMlt+pXXMlr/k9/s/sqi5YuIHxTdajjQUg9nT/MPP0XXRPB5JRe8qU49g
 kwxjVCq7gGnNG/fAlnCZZQHeKeXdF+xWBBTCqbzIMLp+w3IzFbO8Ox/pqguveWv4dRAs
 9C0mBcHjuxHeyc5DeLpEyvLHc/NQVgeeAfHzCAdpZ29ZvinBidoAO4hZmI7j3PRADgYe
 l20TI0IvsJw21b1zsB2oPIxQIWvddFUX/nnYt0IxbkiMVgTzhxW7LYyTJndC9kEA5eYB dA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km9mncr8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 10:56:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3Aoi8q024047;
 Thu, 3 Nov 2022 10:56:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3kgut98k0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 10:56:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3AuqfR4981342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 10:56:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 139414C046;
 Thu,  3 Nov 2022 10:56:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE8534C040;
 Thu,  3 Nov 2022 10:56:51 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Nov 2022 10:56:51 +0000 (GMT)
Date: Thu, 3 Nov 2022 11:56:50 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 03/26] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Message-ID: <20221103105650.7lozutl7qbh5fpzy@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-4-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AeFy9tA_rvxr8n8mnvW-5Xt8lNljcR2P
X-Proofpoint-GUID: AeFy9tA_rvxr8n8mnvW-5Xt8lNljcR2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=708 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211030073
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

On Wed, Oct 05, 2022 at 08:43:58PM -0700, Richard Henderson wrote:
> Return a constant or NULL, which means the free may be
> removed from all callers of fpinst_extract_m34.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 26 +-------------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

