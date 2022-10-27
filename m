Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886560F59B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:44:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0JG-0007r5-TU; Thu, 27 Oct 2022 06:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0JB-00072z-Nd; Thu, 27 Oct 2022 06:40:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0J7-0001p5-6f; Thu, 27 Oct 2022 06:40:19 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RABcgs003250;
 Thu, 27 Oct 2022 10:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=aAHBGpkbHcpbpfc3VElImHSzVm/EjZe+L3Pnpa/H1HI=;
 b=swYky5SnUYQDMKNMGcXAc9ekYVzk+4R+eyE7d8l+miZ0lKaDLEz8mTyB7JEvbFI8sEzM
 wC3wo7qtxMZCpPYatfZOZCtamLFQ4fjbIDOgDSjIy1kLA1ViIHcBYkU+AO9yQv8UTEkq
 VlLPCsvqbAFYE3+m+cslfnnkbTdYz5HEIJXPFB3H+YVorfY2NRQWT/IqXuRGXG4oBvio
 vEhiVsZJSuJgTTOsGmViRRLSAJ1F1acG+L9/y3T5EXVGC58j8n1uAUenujs4UZ9SEE8K
 mnmyycJCym5vhps5uK2PXmtK9nreNawsh44Ymk8BLjSDdeTHAgc9pRpqBkb9SL/4pb+a FQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfr13gv7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:40:14 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RAODYq019421;
 Thu, 27 Oct 2022 10:40:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3kfah917cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:40:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29RAe9UN64356750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 10:40:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35D1A4204B;
 Thu, 27 Oct 2022 10:40:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07CB342045;
 Thu, 27 Oct 2022 10:40:09 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 10:40:08 +0000 (GMT)
Date: Thu, 27 Oct 2022 12:40:04 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 5/9] target/s390x: Use Int128 for return from TRE
Message-ID: <20221027104004.7l2p3pjfwxcger57@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021073006.2398819-6-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _X5-avA8sKUYR-tCVMu3IKO51ZqP-bPD
X-Proofpoint-ORIG-GUID: _X5-avA8sKUYR-tCVMu3IKO51ZqP-bPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=561 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270058
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

On Fri, Oct 21, 2022 at 05:30:02PM +1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h         | 2 +-
>  target/s390x/tcg/mem_helper.c | 7 +++----
>  target/s390x/tcg/translate.c  | 7 +++++--
>  3 files changed, 9 insertions(+), 7 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

