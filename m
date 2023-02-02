Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5DB687CCA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYE2-0003DN-FJ; Thu, 02 Feb 2023 06:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pNYDj-00039k-AP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:57:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pNYDV-0004f6-BG
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:57:39 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3129qKsZ013403; Thu, 2 Feb 2023 11:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LlLrTW4yQktcIh5viWDzsDIh3HcEuBT+/luNj7OrXZE=;
 b=R47I81zf2w+g1xNHX6vvvnStE9cRPLzjmJ+7oI6T0ltr6IIXVsomUgfOWLP5CZwxotT4
 RDqjN2ii9kEKi8h3yPfdJqi9aRTKstcCmJ/EUtHJ90nWtsifgsP7nmgm6T/9SIu8cd5+
 AdfUygkdAbyhNcmL62thOl2plq+NW3nIBJ/YL9uVvc8h9Wabg3SdAcG4W1PM9SGFysw4
 h3kt99tGJv//G6hg22NFgs/4V0OZWRD9SHUjVpZDLYjB/4Nx1uFKo6aINhfldJ+UxlDH
 nwAySXT3zwnWv/427gpUGCD3yPCJ/QjpiVpcf9+0BNl5MK8u4BH5fYFNLrM1xfXYhf+7 VA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng92m5k45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 11:57:04 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3121LOJi005834;
 Thu, 2 Feb 2023 11:57:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ncvugmcyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 11:57:02 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 312Bux2Z42336692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Feb 2023 11:56:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94A8320040;
 Thu,  2 Feb 2023 11:56:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35B4D2004D;
 Thu,  2 Feb 2023 11:56:59 +0000 (GMT)
Received: from [9.171.0.211] (unknown [9.171.0.211])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Feb 2023 11:56:59 +0000 (GMT)
Message-ID: <ee7efdc49eec7cb26d9cbe909a30f3c126759a54.camel@linux.ibm.com>
Subject: Re: [PATCH 01/14] linux-user/sparc: Raise SIGILL for all unhandled
 software traps
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, laurent@vivier.eu
Date: Thu, 02 Feb 2023 12:56:58 +0100
In-Reply-To: <20230202005204.2055899-2-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
 <20230202005204.2055899-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FOBQzikWWtt667WKSaK_eG94uH8BLECn
X-Proofpoint-ORIG-GUID: FOBQzikWWtt667WKSaK_eG94uH8BLECn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_02,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=717 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 2023-02-01 at 14:51 -1000, Richard Henderson wrote:
> The linux kernel's trap tables vector all unassigned trap
> numbers to BAD_TRAP, which then raises SIGILL.
>=20
> Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> =C2=A0linux-user/sparc/cpu_loop.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)

Thanks!

Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>

