Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FF63B486
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 22:55:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozm4J-00030r-7l; Mon, 28 Nov 2022 16:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozm4G-00030M-J1
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:53:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozm4E-0000PF-Rr
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 16:53:36 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ASKteQG003144; Mon, 28 Nov 2022 21:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=3KRyUVDjchLU4mAqG+odBK4fqObn7f4RS2qY6jx6wm4=;
 b=G8mCQlC4xkOOrvKyaofXNOj9w3NpPXM4sMQwEEvK/Qfs5Stkjt8REKjOXH0J/xoN9iuo
 LL+Ly1tXqNcajEiUhbvrFvQib/6NbBiPDhVyL/qBHUns0qC2C7CCEIY05G4mdsoWUKTe
 E0B7RUCH3Upf7VCRFoSBqRk+OFeJBnPT5NGgyGwRi8Ib2PIpJluwFaYrMP5OfhzI7EZu
 sJGqyOOciYlwQ2ajUxaZKZ0opqGuH+ifUQFICehlEI9QYrLFFH4/NvuzHI36NAkiWiUh
 U1zGUKyGJkJYMLt8WCiWo008GsmkDYMEAD//zElJfyWRgqA1xJswL2no65J+b87feIA8 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m54f1h9pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 21:53:31 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASLr5hF031886;
 Mon, 28 Nov 2022 21:53:31 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m54f1h9p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 21:53:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASLpi3S014044;
 Mon, 28 Nov 2022 21:53:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9b433-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 21:53:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ASLrQMp62914896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 21:53:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01B3C42041;
 Mon, 28 Nov 2022 21:53:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1D284203F;
 Mon, 28 Nov 2022 21:53:25 +0000 (GMT)
Received: from heavy (unknown [9.171.30.50])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Nov 2022 21:53:25 +0000 (GMT)
Date: Mon, 28 Nov 2022 22:53:24 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH for-8.0 v2 10/13] target/s390x: Use Int128 for returning
 float128
Message-ID: <20221128215324.d7ti7qkleu54vqya@heavy>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
 <20221111080820.2132412-11-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111080820.2132412-11-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I6KCW9EUt123sucZ8OEnWXrlydtAlecI
X-Proofpoint-GUID: -nhS0xC7acDc6AJ9ZfAcS28AQ2jfjGqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=594 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280154
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

On Fri, Nov 11, 2022 at 06:08:17PM +1000, Richard Henderson wrote:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Remove extraneous return_low128.
> ---
>  target/s390x/helper.h            | 22 +++++++-------
>  target/s390x/tcg/fpu_helper.c    | 29 +++++++++---------
>  target/s390x/tcg/translate.c     | 51 +++++++++++++++++---------------
>  target/s390x/tcg/insn-data.h.inc | 20 ++++++-------
>  4 files changed, 63 insertions(+), 59 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

