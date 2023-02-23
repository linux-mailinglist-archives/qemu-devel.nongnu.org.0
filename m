Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E546A12C8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVK1O-00078B-Ah; Thu, 23 Feb 2023 17:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVK1L-00077N-U9
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:24:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVK1K-0000Um-3J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:24:59 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NLv8QW010611; Thu, 23 Feb 2023 22:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Mw8fjAfdIpmcBKW1x6/o8zHyYNyFcOsS86vI+WqE9gA=;
 b=sDHSZTC/oVKNOPk7OtXaODUzltkvHH4WKLdwNfMtX7lvac5cUT0ElUxCR2MbVnDzphWw
 vNyhWcDCnsN0wWL4334ZlfVaXd1Bfh1UghQCwy5OOW+xRroPmdVWUaxyFYRZAZG5mU5r
 4E4G4M0NeJJbE5UFRmKrji/UImQkthac4p7btghPHG1L+myKfUT+EkEZu1/WITHCgTFQ
 XRuXrZJpYsq2Vx24ftmOQdwKyW4Wid/LLsoxadWuvFdUh587WHlDc4VQIi9ARDtw5qdL
 6nZfaeUKE1HZLwKXIdOQsm+eSy3ygKNN5q9ABUNUAm16ZmXLebRlU1tTrZoEsBplrZze 9w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxggjgkxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 22:24:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31N80G2P016645;
 Thu, 23 Feb 2023 22:24:54 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6f7vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 22:24:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NMOpRP35783002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 22:24:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92E5920043;
 Thu, 23 Feb 2023 22:24:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B00320040;
 Thu, 23 Feb 2023 22:24:51 +0000 (GMT)
Received: from [9.179.17.238] (unknown [9.179.17.238])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 22:24:51 +0000 (GMT)
Message-ID: <f3c104b608329b1636e18a5cf40ac63ae9a87c9c.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] linux-user: Fix unaligned memory access in
 prlimit64 syscall
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Date: Thu, 23 Feb 2023 23:24:50 +0100
In-Reply-To: <77733ac2-9d30-8262-f6d4-5b1a169f8003@linaro.org>
References: <20230223215834.166055-1-iii@linux.ibm.com>
 <20230223215834.166055-2-iii@linux.ibm.com>
 <77733ac2-9d30-8262-f6d4-5b1a169f8003@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XWZ2P-ElayFUEq1FFvx8faoBveqHFk7I
X-Proofpoint-GUID: XWZ2P-ElayFUEq1FFvx8faoBveqHFk7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230182
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

On Thu, 2023-02-23 at 23:17 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> On 23/2/23 22:58, Ilya Leoshkevich wrote:
> > 32-bit guests may enforce only 4-byte alignment for
> > target_rlimit64,
> > whereas 64-bit hosts normally require the 8-byte one. Therefore
> > accessing this struct directly is UB.
> >=20
> > Fix by adding a local copy.
>=20
> Shouldn't we fix that globally in __get_user/__put_user?

Do you mean replace tswapNN() usages with these functions
in syscall.c? This makes sense.

>=20
> > Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> > Reported-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > =C2=A0 linux-user/syscall.c | 12 +++++++-----
> > =C2=A0 1 file changed, 7 insertions(+), 5 deletions(-)

