Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9864A9CD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qiN-000331-Fc; Mon, 12 Dec 2022 16:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4qiL-00032q-25
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:51:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4qiJ-0001an-6T
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:51:56 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCLEGfF024365; Mon, 12 Dec 2022 21:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=nQH+xbI7cTlu/9Zc1fk3f/OEMiMMRkjastZI7h+RAmU=;
 b=Jik0wPnPcgHfhzGAngBg7f+/kncfHrlwV37+W934rMqQwGd9LdScmkYo3XK3ClywunNb
 x16K0VOXThSCIgtjuyTuqWWSWBc0bzuF1ucQ3QWF25isuh4GFWpBiCfQ749AYn76XCD0
 XlLdX39ms5pQ3D2uOnekV3i/nDqnHdtABJQbfXBommwCCAbpFBuCU7obAdw2Bs7OMmvw
 iPdeCl4eRaIxNX+DfqcYq98xiYka9y28Y0cme8wqB/fbPQQVw7Vkp2s1bEPySwL6yHfA
 UPT3/P3xO1KiD6P5+D8516SQA95dgj+vMPXJZj6k/RaPBkgbsTpAWr2ClwgE5yYeJ8PU WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mec1j8s9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:51:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCLiWlq011503;
 Mon, 12 Dec 2022 21:51:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mec1j8s9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:51:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCD78oO028598;
 Mon, 12 Dec 2022 21:51:47 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mchr637r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:51:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCLpjVV41025916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 21:51:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2473B20043;
 Mon, 12 Dec 2022 21:51:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF2C620040;
 Mon, 12 Dec 2022 21:51:44 +0000 (GMT)
Received: from heavy (unknown [9.179.26.201])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Dec 2022 21:51:44 +0000 (GMT)
Date: Mon, 12 Dec 2022 22:51:43 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v4 03/27] tcg/s390x: Always set TCG_TARGET_HAS_direct_jump
Message-ID: <20221212215143.b6abg6e5nqc36i45@heavy>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209020530.396391-4-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WfT2I3smFo_BBf29iZtlvQdzDc6sd9XY
X-Proofpoint-ORIG-GUID: nFXkez8NxGDNKUge6wQ_GDX4XhA3iY_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 mlxlogscore=530 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120187
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

On Thu, Dec 08, 2022 at 08:05:06PM -0600, Richard Henderson wrote:
> Since USE_REG_TB is removed, there is no need to load the
> target TB address into a register.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.h     |  2 +-
>  tcg/s390x/tcg-target.c.inc | 48 +++++++-------------------------------
>  2 files changed, 10 insertions(+), 40 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

