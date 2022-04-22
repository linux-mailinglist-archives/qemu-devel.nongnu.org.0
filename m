Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BBF50B7E0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:06:02 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsz3-0006nl-Kn
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nhsEw-0005Q7-Gr; Fri, 22 Apr 2022 08:18:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48520
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nhsEr-0001Lg-9e; Fri, 22 Apr 2022 08:18:22 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23MBfGu2004942; 
 Fri, 22 Apr 2022 12:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=nLA6n7L+SyecCT5BOaID7CzAqqUQJUDqpH71T3Rz4o4=;
 b=FY97y8mVli+USeSWoDvUmkFQr8VMl9kVfe6poJd/a/earoQ1N5mTijCR6wt8DBF1/kMy
 eczPzqYgKwr5AxdNt1s6Xxch3R/MGAEFuPQLm0MIGnnMDpti8jwHrooFKG3uG7QQkec1
 VV8y4+GPXqY7B/Uw0hVYoC6GfzSIGXxqqKrgf2zY39Xt9cLdHl4v/CAweehv8qmJsIh6
 9vSoRzNqdF0Lx5qB/lpBP0Gknc1JSAQnrPQHHP0us5vwaYOT3L4ctt7rsMVwVRxyqOD5
 cGWftrcoYjEdxpPjUVIggAaR/eSB9FrzUvQ/s2UeO03OAuNfF0NSK4xW0SsMGhUgYhaK PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fjjhgj5g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 12:18:02 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23MBum1U030470;
 Fri, 22 Apr 2022 12:18:02 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fjjhgj5g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 12:18:02 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23MCF5AA011922;
 Fri, 22 Apr 2022 12:18:01 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3ffnean8k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 12:18:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23MCI07b29229372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 12:18:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4212A78066;
 Fri, 22 Apr 2022 12:18:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9D37805E;
 Fri, 22 Apr 2022 12:17:57 +0000 (GMT)
Received: from localhost (unknown [9.65.243.207])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Apr 2022 12:17:56 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bin Meng <bmeng.cn@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] target/ppc: Fix BookE debug interrupt generation
In-Reply-To: <20220421011729.1148727-1-bmeng.cn@gmail.com>
References: <20220421011729.1148727-1-bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 09:17:51 -0300
Message-ID: <87o80tjor4.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jvCoZwm48NsTJceHD3T7ZPeKuCdUUu2e
X-Proofpoint-GUID: 5aUov23Dhwi9BXLptXgH_56FFczeeHQ4
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_03,2022-04-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=769 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204220053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
> Event" and chapter 8.4.5 "Instruction Complete Debug Event":
>
>   "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
>   are set ... Branch taken debug events are not recognized if MSR[DE]
>   is cleared when the branch instruction executes."
>
>   "An instruction complete debug event occurs when any instruction
>   completes execution so long as MSR[DE] and DBCR0[ICMP] are both
>   set ... Instruction complete debug events are not recognized if
>   MSR[DE] is cleared at the time of the instruction execution."
>
> Current codes do not check MSR.DE bit before setting HFLAGS_SE and
> HFLAGS_BE flag, which would cause the immediate debug interrupt to
> be generated, e.g.: when DBCR0.ICMP bit is set by guest software
> and MSR.DE is not set.
>
> [1] https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

