Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B758AA20
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:28:37 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvVM-0006HR-43
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJv9t-0003W8-QX; Fri, 05 Aug 2022 07:06:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJv9r-0007dN-N2; Fri, 05 Aug 2022 07:06:25 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275B1hZx008309;
 Fri, 5 Aug 2022 11:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=N5Sok6og3MKl8OhgVe8NLSW1RNpb/Iu61ABn6cXIV7g=;
 b=CKQwH/5BXeGFIST59j9oO6HYjUvH7Z3zuGC+jSLvB9NLEcCKI+zlIX77V+aEC8EOsnZL
 XiAiP6UJB5DtUteaatJXno2eMZzEyqRh4qTfYGHbOofygORthpi3iRnHJxpK4yiRVgd0
 5xNWSTkEh0QTinUqM/3VbnLkFGkeCheWKv32a10yS6uJoOrrnqerdWuB5SFgFeQwQ5Lo
 vRag5pty6okqzz0zycUwNCG1nOg2b6aij7cK1CDQRD6xpVIGkYu9zCp0AZYiCt+EmUbc
 IknMZbubCfD5zUQs3OJCO0vafDoEG3QoLIpJBk4yDpe1npmp9cze3aO5yB7He/oWk/QF LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1yj0384-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 11:06:15 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275B27Ms008822;
 Fri, 5 Aug 2022 11:06:14 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1yj036c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 11:06:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275B6CGr017861;
 Fri, 5 Aug 2022 11:06:12 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3hmv98qb9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 11:06:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275B6ASZ33096098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 11:06:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C741A4051;
 Fri,  5 Aug 2022 11:06:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4E9DA404D;
 Fri,  5 Aug 2022 11:06:09 +0000 (GMT)
Received: from [9.171.39.100] (unknown [9.171.39.100])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 11:06:09 +0000 (GMT)
Message-ID: <b6744c79-c07a-c26c-3243-a939e7cde380@linux.ibm.com>
Date: Fri, 5 Aug 2022 13:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 00/10] enable pnv-phb user created devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220803134459.2633902-1-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NcO4plBlPqoh-XdQJiepanYZywpmX14l
X-Proofpoint-GUID: skOYDkYs1pFI1uzzESU9Z4Ty803n6zT_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=961
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050054
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

Other than my comment on patch 6 regarding the qom parenting of the root 
port, that series looks pretty good to me!

   Fred



On 03/08/2022 15:44, Daniel Henrique Barboza wrote:
> Hi,
> 
> This is a rebase on top of ppc-7.2 of the previous patches sent
> here:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01542.html
> 
> Now that we have the pnv-phb rework in the tree.
> 
> As a recap, the changes introduced in this series compared to what we've
> done in "[PATCH v2 00/16] powernv: introduce pnv-phb base/proxy
> devices" [1], is:
> 
> - the Root Buses objects are now inheriting phb-id and chip-id. This
> turned out to be a clean way of keeping the code QOM compliant, without
> having to do things like dev->parent_bus->parent. All the attributes
> that the root port needs are found in its bus parent;
> 
> - the logic exclusive to user created devices is all centered in a
> single helper inside pnv-phb realize(). PHB3/PHB4 realize() are
> oblivious to whether the device is user created or not. I believe this
> approach is clearer than what I was doing before.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html
> 
> Daniel Henrique Barboza (10):
>    ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
>    ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
>    ppc/pnv: set root port chassis and slot using Bus properties
>    ppc/pnv: add helpers for pnv-phb user devices
>    ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
>    ppc/pnv: enable user created pnv-phb for powernv8
>    ppc/pnv: add PHB4 helpers for user created pnv-phb
>    ppc/pnv: enable user created pnv-phb powernv9
>    ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>    ppc/pnv: user creatable pnv-phb for powernv10
> 
>   hw/pci-host/pnv_phb.c          | 166 ++++++++++++++++++++++++++++++---
>   hw/pci-host/pnv_phb3.c         |  50 ++++++++++
>   hw/pci-host/pnv_phb4.c         |  51 ++++++++++
>   hw/pci-host/pnv_phb4_pec.c     |   6 +-
>   hw/ppc/pnv.c                   |  30 +++++-
>   include/hw/pci-host/pnv_phb3.h |   9 +-
>   include/hw/pci-host/pnv_phb4.h |  10 ++
>   include/hw/ppc/pnv.h           |   6 +-
>   8 files changed, 308 insertions(+), 20 deletions(-)
> 

