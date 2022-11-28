Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCB63B454
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 22:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozltX-00011V-7v; Mon, 28 Nov 2022 16:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozltV-00011M-7o
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:42:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozltS-0007F1-Ig
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:42:29 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ASLPrV1019663; Mon, 28 Nov 2022 21:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WER6UHIbN5B00bOU4z1UIYAQ6I2JM07opcW6ogo+NCs=;
 b=ArbE5xUxtywf9C2/rDae5Dw9YFYTkD4PH+FTrb2VXQP5juZ+Zz2ewKlK84Y9EUNWTUEf
 SHdAoZaXMOK2tFBmyDE5Pnx50rlvJSY03pCSfxHjZhF2IHqM2t7+v1/IJvu5ejFrAW1y
 Kx84XSed1LR+Nekh3NxAAOx8psqHxxkPTO4qk8eb95Q5tP74bP9wlnAfu/lpjU9qDt3R
 YbkO13wPooVxZgESg8M72+CaVo2NMQWy+MuAs4VZbG98cxUE6QA0CYI7WWMKf+wkaX/z
 45hkUgiwyexGI80WkMq+F0Q+GMNat+uHzu0O/RixQPDyTQTH43c5Vw03dn7F9P9L2kQz /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m54w7gbyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 21:42:22 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASLTUWp030903;
 Mon, 28 Nov 2022 21:42:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m54w7gbxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 21:42:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASLa4Xv013840;
 Mon, 28 Nov 2022 21:42:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hu4kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 21:42:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2ASLZpP67799424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 21:35:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77B9E4C044;
 Mon, 28 Nov 2022 21:42:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C9EB4C040;
 Mon, 28 Nov 2022 21:42:17 +0000 (GMT)
Received: from heavy (unknown [9.171.30.50])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Nov 2022 21:42:17 +0000 (GMT)
Date: Mon, 28 Nov 2022 22:42:15 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: Re: [PATCH for-8.0 v2 04/13] target/s390x: Use a single return for
 helper_divs32/u32
Message-ID: <20221128214215.envz7e3elmqvgfbc@heavy>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
 <20221111080820.2132412-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111080820.2132412-5-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DxKVJKjphI2m4EcMg79u-fdyaj_OLc4G
X-Proofpoint-ORIG-GUID: FrCKn-16iJtBw3tgCCP-yvaKNRm7DP2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=559 suspectscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280154
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Fri, Nov 11, 2022 at 06:08:11PM +1000, Richard Henderson wrote:
> Pack the quotient and remainder into a single uint64_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix operand ordering; use tcg_extr32_i64.
> ---
>  target/s390x/helper.h         |  2 +-
>  target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
>  target/s390x/tcg/translate.c  |  8 ++++----
>  3 files changed, 18 insertions(+), 18 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

