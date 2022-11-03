Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB443617BD2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:44:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqYJp-0001rr-C6; Thu, 03 Nov 2022 07:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqYJj-0001nF-Cx; Thu, 03 Nov 2022 07:23:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqYJW-0004eN-9q; Thu, 03 Nov 2022 07:23:27 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A39cZIu010574;
 Thu, 3 Nov 2022 11:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=i0+HMl/FLGabS3+z1Dd+IFJrUTuWPEZfhQehMzQXJW8=;
 b=L5cZMnHelOXjUIONf4yX8mkASXCaKgi/i5lWcIGrV55EJDgpPBS1kYHDy73NUNp4g9B+
 sUrFlwl5Z+wR35Iq37gwwh8q/sL9/GZL4eFi6SppcC2VPPKag8DFjvUds2nrg702fNv7
 mS9FhaV5blgxKx+tzMoHNZOtGkeVyhPHsqHdNL3WWDytK3lGe4x//e4VK8a2fgm6LfGE
 Eo9hujfjGfsPhe/CA0slsfr6Wiljt+/Ir+sSsLuwXoqH8X7we+xI+ZpwrACXTitoGCw/
 KTnISiVpAK62MgILDiVkC1JqBdHqESAL+mMKM19wiyxSv/xGDp6cCQ1XoxTU2ZD1y0AP PQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km9mndj1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:23:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3BLT5D030025;
 Thu, 3 Nov 2022 11:23:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3kguej0npf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:23:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A3BHWRt42533128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 11:17:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50246A4053;
 Thu,  3 Nov 2022 11:23:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CE01A4051;
 Thu,  3 Nov 2022 11:23:04 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Nov 2022 11:23:03 +0000 (GMT)
Date: Thu, 3 Nov 2022 12:23:02 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 07/26] target/s390x: Remove pc argument to pc_to_link_into
Message-ID: <20221103112302.kvazjuylnw743zmr@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-8-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006034421.1179141-8-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XSwwOWFCkNfF1ZBB_UkRpdzhU_lObAOw
X-Proofpoint-GUID: XSwwOWFCkNfF1ZBB_UkRpdzhU_lObAOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=651 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211030076
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

On Wed, Oct 05, 2022 at 08:44:02PM -0700, Richard Henderson wrote:
> All callers pass s->pc_tmp.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

