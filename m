Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E9E644CA0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 20:44:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2dqT-0003KE-7i; Tue, 06 Dec 2022 14:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2dqR-0003K6-OS
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 14:43:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2dqP-0008BN-Mr
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 14:43:11 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6IupiF022604; Tue, 6 Dec 2022 19:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=+Xyst5aaLJbpqH4oBxwjt3UNa82Q9MVdZDQiGgdZDzY=;
 b=tjhGAujbYdpZraPyFhAcudhYpoe0h4JGX/mwzO+VjVbk52d9WuCKZzNNeldFNGypqCeS
 laBZ3tPgnSNXOHmD5QRprvA+NteadVyNCc0ofbuEbUccq8g7ucokmfJP+2GTzipWNq7p
 Jg39N2hKxrsCQtSZncSWJsKGQQmzgKyD5MkTJnLLNdazBRrIlBY2dhiuJYe5FWenqUts
 VREWprqUpR0P/muM4AHDWfxlMyZ/EXF8jtMJAS9IkRulJ5H9B2Jtt6VxnFqmFdNi2iM9
 b8kMhKoiUGWQkY6vnDO6c/KTV+FDWzxfBhlUSQVewcKQXwXkrUsv83ZZ3gMYFc9M9EIz 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabfa13kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:43:05 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6JJRnQ012262;
 Tue, 6 Dec 2022 19:43:04 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabfa13jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:43:04 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B6DVV0P010213;
 Tue, 6 Dec 2022 19:43:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3m9m7r9c53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:43:02 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6Jh05B40042782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 19:43:00 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12FFB20040;
 Tue,  6 Dec 2022 19:43:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC35720043;
 Tue,  6 Dec 2022 19:42:59 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 19:42:59 +0000 (GMT)
Date: Tue, 6 Dec 2022 20:42:54 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 03/13] tcg/s390x: Use LARL+AGHI for odd addresses
Message-ID: <20221206194254.dsfr76syk3fxdvhl@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-4-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2sY_TSs6TsANl8nTuMfv0Kni-MsCsBWh
X-Proofpoint-ORIG-GUID: hRXnV6ytGJv07U32LOU6vvDQH1ZUDjJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=715
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060163
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

On Thu, Dec 01, 2022 at 10:51:50PM -0800, Richard Henderson wrote:
> Add one instead of dropping odd addresses to the constant pool.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.c.inc | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

