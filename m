Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAC84B6FFF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:03:09 +0100 (CET)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0IG-0005Ru-EM
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:03:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK0HG-0004AW-1I; Tue, 15 Feb 2022 11:02:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK0HD-0006Bt-0x; Tue, 15 Feb 2022 11:02:05 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FF3pJ3012815; 
 Tue, 15 Feb 2022 16:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=44WD/3bxxZXGZEEeO6eGQS1HcleNpgaMhZvEZL+W0Tw=;
 b=AzJ9FRwhtx+cmyl2fpPHqsKcVrczm+gqbDf5p0SjY37XsryfuPXN5INBdXVp5jtP32IT
 WaKhP1Su3GW5TOrtGZfbvnSSqQF6GVuLeZiEf2/lwdODejnMM/9AE/dQxfZGQugmzrvg
 6PJ+bZSlCnKLc/AvRQbowaME3VtqR8jD2oshsPQGpGIkMz53XvsRb++dECx32+snaUjv
 rxJn1bDW/a0k+iJw2Qa+Oiktc7L8wq1Y8RWBM7aWw0XcPL6EtSM59eCmf5xWdKPA2q1G
 jQfqOeI6IlU/t4dI/xEQG/HfB1hw2E22yJsnN7LwS1SpHUIiE6vXJEj59miTadPD2hkk aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e5ka56x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:01:44 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FFoipt009920;
 Tue, 15 Feb 2022 16:01:43 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e5ka56c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:01:43 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FFvmXg023311;
 Tue, 15 Feb 2022 16:01:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3e64hbtff7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:01:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FG1fk627066676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 16:01:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78A92C6067;
 Tue, 15 Feb 2022 16:01:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E613C6069;
 Tue, 15 Feb 2022 16:01:40 +0000 (GMT)
Received: from localhost (unknown [9.211.143.123])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Feb 2022 16:01:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 9/9] spapr: implement nested-hv capability for the
 virtual hypervisor
In-Reply-To: <20220215031642.1691873-10-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-10-npiggin@gmail.com>
Date: Tue, 15 Feb 2022 13:01:38 -0300
Message-ID: <87mtisxgnx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cxToWmyNlEVpqnKQWGAMw_xgHisUQcw-
X-Proofpoint-GUID: jOEoyfRwp_PFnVIV3_kxxHNHk3MXoEJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=546 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150095
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

> This implements the Nested KVM HV hcall API for spapr under TCG.
>
> The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
> L1 is switched back in returned from the hcall when a HV exception
> is sent to the vhyp. Register state is copied in and out according to
> the nested KVM HV hcall API specification.
>
> The hdecr timer is started when the L2 is switched in, and it provides
> the HDEC / 0x980 return to L1.
>
> The MMU re-uses the bare metal radix 2-level page table walker by
> using the get_pate method to point the MMU to the nested partition
> table entry. MMU faults due to partition scope errors raise HV
> exceptions and accordingly are routed back to the L1.
>
> The MMU does not tag translations for the L1 (direct) vs L2 (nested)
> guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
> and exit).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

