Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA264CED9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 18:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5VTI-0001O9-8V; Wed, 14 Dec 2022 12:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p5VTF-0001NL-6V; Wed, 14 Dec 2022 12:23:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p5VTD-0005AU-D5; Wed, 14 Dec 2022 12:23:04 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEHE36a007550; Wed, 14 Dec 2022 17:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ljuLaZt00xjLv9IIbiHK6t6gjEdSUr1eHa7PV9ntHvI=;
 b=go1qFfafB2AfM5OPOwS7wvPG9DRzFU4ou2Y9e5D9+c2Uiwq8WYEBXn6JlvPzF2XtdUBo
 72JhMVpos9Le/qi0irfitnzP3/1AA4WbKKcRK2EwXgOWtoBxRNHQodaNi71nxFeTqha9
 bRRSROumu146samqDPd9QklC6gLk6cLPjTQhH+Pk81Q/KQ+9bGmIytYJUnSGkNKpiGTw
 xGVaMO2l2U3txE8d/8i9woMpsc73r1gkUuMdIPWuY226Rx9p+Wqh9ZRFhTlOUAdbGAj8
 k8ee0vqhhn670U2bPe0k2Z5x9TUxLYRYgMq3Q/pbfcrYrgrK4h1RN3oOPNnjxz6k0LpR 5g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mfjpyg7m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 17:22:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BEAOMAe001043;
 Wed, 14 Dec 2022 17:22:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3meyyehnx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 17:22:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BEHMtVF46465486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Dec 2022 17:22:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E25320040;
 Wed, 14 Dec 2022 17:22:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1ECC20049;
 Wed, 14 Dec 2022 17:22:54 +0000 (GMT)
Received: from heavy (unknown [9.171.36.165])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Dec 2022 17:22:54 +0000 (GMT)
Date: Wed, 14 Dec 2022 18:22:53 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 27/27] target/s390x: Enable TARGET_TB_PCREL
Message-ID: <20221214172253.4sff3cqo6kbn4pdu@heavy>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-28-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211152802.923900-28-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C7VV7Z0zSnx7QG00i1_AGKoangTZMsxw
X-Proofpoint-ORIG-GUID: C7VV7Z0zSnx7QG00i1_AGKoangTZMsxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_07,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=704 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212140137
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Sun, Dec 11, 2022 at 09:28:02AM -0600, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/cpu-param.h     |  1 +
>  target/s390x/cpu.c           | 12 +++++
>  target/s390x/tcg/translate.c | 86 +++++++++++++++++++++++-------------
>  3 files changed, 68 insertions(+), 31 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

