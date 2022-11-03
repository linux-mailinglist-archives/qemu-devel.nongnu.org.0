Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D050617AF7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:40:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXcu-0003xH-MH; Thu, 03 Nov 2022 06:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqXcs-0003vR-IW; Thu, 03 Nov 2022 06:39:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqXcp-0005Qt-M7; Thu, 03 Nov 2022 06:39:10 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A38qRo6008498;
 Thu, 3 Nov 2022 10:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=Bb9gcCdmmXCB7MmLtAMVVE/JP8nnwPIg8lOiAsMOU/M=;
 b=RU+np1qWcfvLTjfyjfkhtZO6xuNU3XYeS5kqjSfR3H1rZxcUpD5I13V5Qki8314vx8nn
 RqeiUuldH+jwhp18q9NRUuHz0g2GHD42fmY9YCrkhEV+Oy6v1xOPQ4t2BpC2IOKXUP89
 Fec2uLmEQV01K4REGdJuQN6mIei7n4WuFRAWJhlUssrc8j2H/C48iDms15wz47Z6JGA6
 Z6jE+xhzs0/CP+ikmyTEkBPKLysOXegN3exTBA/P4rfvk3JEOo4JuciE+FdUIMms5E2C
 DB/KZ2BmozsBcpapk0NGvZfo4FRVRt6YHs2BMpbAOVyI2kWqkyVHGjdQZjXaxUxSobT1 HA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmah1k4ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 10:39:01 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3Aa4lq024567;
 Thu, 3 Nov 2022 10:38:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kguej0kbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 10:38:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3AcvAD47841634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 10:38:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02AD211C064;
 Thu,  3 Nov 2022 10:38:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B455E11C05E;
 Thu,  3 Nov 2022 10:38:56 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Nov 2022 10:38:56 +0000 (GMT)
Date: Thu, 3 Nov 2022 11:38:55 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/26] target/s390x: Use tcg_constant_* in local contexts
Message-ID: <20221103103855.2fuhlbcdptecvbrj@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006034421.1179141-2-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DsVzDOD90hfyPR98EerLiRg_04JNOQJ2
X-Proofpoint-ORIG-GUID: DsVzDOD90hfyPR98EerLiRg_04JNOQJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=670
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030073
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

On Wed, Oct 05, 2022 at 08:43:56PM -0700, Richard Henderson wrote:
> Replace tcg_const_* with tcg_constant_* in contexts
> where the free to remove is nearby.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 408 +++++++++++++----------------------
>  1 file changed, 145 insertions(+), 263 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

