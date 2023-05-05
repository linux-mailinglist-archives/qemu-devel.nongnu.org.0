Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0A6F80B4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:22:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pusYL-000696-30; Fri, 05 May 2023 06:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pusYI-00068t-Ud; Fri, 05 May 2023 06:20:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pusYD-0000Qd-RA; Fri, 05 May 2023 06:20:35 -0400
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345AEXIh015565; Fri, 5 May 2023 10:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3HDwHs+cs21QvjeRSlSF86YTfk35+AEb1qo7gY+5zvM=;
 b=iYo8t7l4VrhmYAqS3TXLVO1OdnEgm9hiIOBFtjl6BCU27kOldvfK08reLiJvteByKmPF
 RR+JYdFTgRI/U5QpL6pScg2OanwqbiCx0f1h+U5o8caJuncz68MlVfGDwUHdg/VDrNMy
 /om7CPvGyq1W9t+/I9ZRWzrDeX1KRKq+iF9qYLgAjg8fqm9ji5lXD2+P57cyELxwcmFH
 6MaadDjOIDaj6FvF0oQWCiG9uziDaHkp699SSeR/3vlF1GITbhsp6AZhUAz7mku/mx0f
 I7x7BUuAmrlv/CSerrBdnI0TVTYzYyN8HUBOZY6MAO1NNrInjaJSD6iTdU9UFh75mgMi vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qcyv5g4v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 10:20:30 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 345AFR7Y017647;
 Fri, 5 May 2023 10:20:29 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qcyv5g4um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 10:20:29 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 345890IX009976;
 Fri, 5 May 2023 10:20:28 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3q8tv8dk78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 10:20:28 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 345AKR0x48497046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 May 2023 10:20:27 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF92F58065;
 Fri,  5 May 2023 10:20:27 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE6058056;
 Fri,  5 May 2023 10:20:25 +0000 (GMT)
Received: from [9.43.126.158] (unknown [9.43.126.158])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  5 May 2023 10:20:25 +0000 (GMT)
Message-ID: <f43c0f86-3a74-e3c5-ab7a-20c719edf5fe@linux.ibm.com>
Date: Fri, 5 May 2023 15:50:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 1/4] spapr: H_ENTER_NESTED should restore host XER ca
 field
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20230503003954.128188-1-npiggin@gmail.com>
 <20230503003954.128188-2-npiggin@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230503003954.128188-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G2QDjNJZuEoV0TxGOwyG2PQ0zO0CBOLo
X-Proofpoint-GUID: 1Vo24OLWsAsDjjSk9TQlWR7IerwW2lqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_16,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=938 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

<correcting my email in CC>

On 5/3/23 06:09, Nicholas Piggin wrote:
> Fix missing env->ca restore when going from L2 back to the host.
> 
> Fixes: 120f738a467 ("spapr: implement nested-hv capability for the virtual hypervisor")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   hw/ppc/spapr_hcall.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index ec4def62f8..be225adaf6 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1785,6 +1785,7 @@ out_restore_l1:
>       env->cfar = spapr_cpu->nested_host_state->cfar;
>       env->xer = spapr_cpu->nested_host_state->xer;
>       env->so = spapr_cpu->nested_host_state->so;
> +    env->ca = spapr_cpu->nested_host_state->ca;
>       env->ov = spapr_cpu->nested_host_state->ov;
>       env->ov32 = spapr_cpu->nested_host_state->ov32;
>       env->ca32 = spapr_cpu->nested_host_state->ca32;

Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

