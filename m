Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E389C4B6FFE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:02:19 +0100 (CET)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0HS-0003fv-Ci
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK0F3-0002pQ-Cv; Tue, 15 Feb 2022 10:59:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK0F0-0005aq-H3; Tue, 15 Feb 2022 10:59:49 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FFfqUR014455; 
 Tue, 15 Feb 2022 15:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=0Lk5qLZLbmxMDOXqVXMQHgcdLyeHfh54dct2rf/ES+U=;
 b=VpWGr3uWXVLRdcvftqxvI4kEOqp/R6XRuM9rHYjvqzpkr3X7b18o3ekiYMgGH6feJtqf
 Xu5tcst6cBdATcI7DyFdRUUg6TsMNmeESSMjFEiLyOOPZNu763n+BMw06J3MALUBS82D
 rbYOAU+/4yhPyYJCJISBFW0Vl7ArOJhdmp4v6Uy6gaAuKZ+oHnE0g1uGfcR4NWlaQNSm
 OKpDNPu3W0xcGsq+7VJ9KGHbFBbQ/zUGiOV7OKGQA44q+Kxzqm2ZxhSMaGIAT1ceiz09
 g1I2mHR2f6ajBkjnhxRhiQbQck1J+Nz3yJG0db+1b8bdDThlx7Ta+2fQCgi+6Qb6Vbjq BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8f1s0dpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 15:59:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FFjknj001271;
 Tue, 15 Feb 2022 15:59:38 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8f1s0dny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 15:59:38 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FFwSx5026542;
 Tue, 15 Feb 2022 15:59:37 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3e64hakwj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 15:59:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FFxapf28377552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:59:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F060BE054;
 Tue, 15 Feb 2022 15:59:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B0ABBE062;
 Tue, 15 Feb 2022 15:59:35 +0000 (GMT)
Received: from localhost (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Feb 2022 15:59:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 8/9] target/ppc: Introduce a vhyp framework for nested
 HV support
In-Reply-To: <20220215031642.1691873-9-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-9-npiggin@gmail.com>
Date: Tue, 15 Feb 2022 12:59:33 -0300
Message-ID: <87pmnoxgre.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WieWIi7qtFtTlns1lvnSUwiJ4Pl26tOS
X-Proofpoint-GUID: fAcFT-yVq5NKoS2RRYGmSeyPTMHU9Rdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxlogscore=582 bulkscore=0
 suspectscore=0 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Introduce virtual hypervisor methods that can support a "Nested KVM HV"
> implementation using the bare metal 2-level radix MMU, and using HV
> exceptions to return from H_ENTER_NESTED (rather than cause interrupts).
>
> HV exceptions can now be raised in the TCG spapr machine when running a
> nested KVM HV guest. The main ones are the lev==1 syscall, the hdecr,
> hdsi and hisi, hv fu, and hv emu, and h_virt external interrupts.
>
> HV exceptions are intercepted in the exception handler code and instead
> of causing interrupts in the guest and switching the machine to HV mode,
> they go to the vhyp where it may exit the H_ENTER_NESTED hcall with the
> interrupt vector numer as return value as required by the hcall API.
>
> Address translation is provided by the 2-level page table walker that is
> implemented for the bare metal radix MMU. The partition scope page table
> is pointed to the L1's partition scope by the get_pate vhc method.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>


