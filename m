Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A162D10C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 03:15:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovUPv-00045e-Bx; Wed, 16 Nov 2022 21:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovUPt-00045S-Mn; Wed, 16 Nov 2022 21:14:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovUPr-00058G-Rt; Wed, 16 Nov 2022 21:14:13 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AH22Hko013435; Thu, 17 Nov 2022 02:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=hvU1fOKORDDFEKxfeKffsn4vURKe6jWyR/PtZFlLpIA=;
 b=rpYxdYiWtC2aHXv9GoF1BH/9OBh4UCH8kvWfnE3WHFJyfZbh5xKKTVeC67zENZgy07XP
 TLlM9+rLxPiNA7Q2hqIsDEjMwEwAhk/L4rJc0bOQ+1Z42Nb92KMXsPvxvNOelZg425L1
 zgwskupkBWBOZSeqGejetDQl50C6MT6xtUfkgh59RfYO1qDygQt2Kz4yVpP/pKrhCWVG
 P2Jw4yfpbMW29Ojqv9x+meASm9dYnv8JS65QBFAIoFHVL6a2R6EH0iP/zrtpknMOh+oI
 odlwKtNd1gpiFU88XEYP2BxGMJ9xW5KVzXovEEQVTsDkAxKHiVObZ3p4t2obslcMNEHG eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwbtrr7sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 02:14:03 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AH2E3d2027858;
 Thu, 17 Nov 2022 02:14:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwbtrr7s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 02:14:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AH265em018737;
 Thu, 17 Nov 2022 02:14:01 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3kt348xtua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 02:14:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AH2DxBe58327378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Nov 2022 02:13:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 137DE42041;
 Thu, 17 Nov 2022 02:13:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C2674203F;
 Thu, 17 Nov 2022 02:13:56 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.98.134])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 17 Nov 2022 02:13:55 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 17 Nov 2022 07:43:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Kowshik
 Jois B S <kowsjois@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
In-Reply-To: <20221116162025.330e5a4f@bahia>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <20221116162025.330e5a4f@bahia>
Date: Thu, 17 Nov 2022 07:43:54 +0530
Message-ID: <87r0y2wcnx.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oQaax_yZCaikU9oMjb8iOkLr6h97HXyW
X-Proofpoint-GUID: rKwuTqIcP5J7t_ovbREJaChF816f14YL
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=929 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170013
Received-SPF: pass client-ip=148.163.158.5; envelope-from=vaibhav@linux.ibm.com;
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

Greg Kurz <groug@kaod.org> writes:

> Hi Vaibhav,
>
Hey Greg,

Good to see you,

> Nice to see some people are still building QEMU at IBM ;-)
Yeah, and will hopefully continue to do this in future :-)

<snip>
>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>
> Reviewed-by: Greg Kurz <groug@kaod.org>
>
Thanks

> This was introduced by a recent commit.
>
> Fixes: 61bd1d29421a ("target/ppc: Convert to tcg_ops restore_state_to_opc")
Thanks again for pointing out the commit that caused this.

>
>
> Vaibhav,
>
> This is serious enough it should get fixed in 7.2. Please fill up an
> issue as explain in [1].
I have raised an issue on gitlab at
https://gitlab.com/qemu-project/qemu/-/issues/1319


-- 
Cheers
~ Vaibhav

