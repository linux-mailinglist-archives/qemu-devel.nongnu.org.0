Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B90C64AA37
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rFn-0006bm-Q6; Mon, 12 Dec 2022 17:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4rFl-0006ak-OU
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:26:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4rFk-00021j-26
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:26:29 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCKoiQS020531; Mon, 12 Dec 2022 22:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Emc41FyCVmDg9zKEPXkDMAp7DR9nDMsqx7oSOcbcHZM=;
 b=pZfkfbBtgMrtdRJwiPV6BXFq9qCV896OU40xbHU/OmOfidgNkRGzUNKlONK/Fld34pNa
 o3PkFUNCXRm9yZOs1cH4AnBsddPDFy4BpL7ovcDE0eUd4rbtjWUHtfMPYg8MzDoF0Jql
 gVCKkfU4Q9WrSNGYAo6tCFp0KBFBhPdIbzmFpIfBzotKngUg4BVW3kdIy486OSOG8SGP
 9Nd4Cs3zZSATYpfZBYv9Lz6+dFaIEZfmrIGa21v1fD/m+8Pbvl+JhpiugRlAuy0cPt1o
 yr8D+i96v77QW32BxQlpEQJxn2OGbAZIFrMh3SaMPAazo5lTeKtJX2hs0Esx8wqBolui eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mebpqt5cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:26:25 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCM1O1Q026790;
 Mon, 12 Dec 2022 22:26:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mebpqt5bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:26:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCDbI9s030834;
 Mon, 12 Dec 2022 22:26:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mchr5u86f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:26:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCMQKbH21037372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 22:26:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7757E2006A;
 Mon, 12 Dec 2022 22:26:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3948B20067;
 Mon, 12 Dec 2022 22:26:20 +0000 (GMT)
Received: from heavy (unknown [9.179.26.201])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Dec 2022 22:26:20 +0000 (GMT)
Date: Mon, 12 Dec 2022 23:26:18 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v4 08/27] tcg/s390x: Check for load-on-condition facility
 at startup
Message-ID: <20221212222618.p6fpsxbljtoxpn25@heavy>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-9-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209020530.396391-9-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xGCGmY_xs3v7qdSdlUwtGBP0-3azqVUt
X-Proofpoint-GUID: UyJt7jlH9SA4M9WAhbHsiziGcY2eGW0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=744
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Thu, Dec 08, 2022 at 08:05:11PM -0600, Richard Henderson wrote:
> The general-instruction-extension facility was introduced in z196,
> which itself was end-of-life in 2021.  In addition, z196 is the
> minimum CPU supported by our set of supported operating systems:
> RHEL 7 (z196), SLES 12 (z196) and Ubuntu 16.04 (zEC12).
> 
> Check for facility number 45, which will be the consilidated check
> for several facilities.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

