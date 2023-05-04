Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA3A6F648E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 07:54:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puRtP-00078O-Lc; Thu, 04 May 2023 01:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1puRsH-000728-Lh; Thu, 04 May 2023 01:51:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1puRsE-0005sB-8y; Thu, 04 May 2023 01:51:29 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3445f1QN028669; Thu, 4 May 2023 05:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7OGL3b9hIswA8GRHMEfYMllo2XQJAkYE4DiZfFxVePw=;
 b=bXZGbkNgQioE3PsnpxmyNj+4JyXgtgXFPzAJtIfeJAcRIg0gEZYav9/fbJATp3u8HfX9
 Bc+r93DgiDsbV1kwncpRFTL4DcL+pIkx+KkKcrwjkXCLo0FgH0fAFB5yEtLJODiVUE3e
 1qjgzTW/jLI5VRgYxuP2TAA8Q6UyYBtDntMqfSMTy/D2HyWnDnAWY0mKMoJ5QvF2BCBo
 ch6gzQEqSxMhRxYmD1Epr0ypOGi+AzBjoqnuvLuSzgIdDsDex2G6BRbfRlslB99sMn+E
 NSbSj3ak2jmjJ9rAhiZ2d6nKiIN0+dyhLm6T/BbUshsC2XvyIM193z85X0tCvYE2G9XR ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6bgs1tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:51:23 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3445oeTM025542;
 Thu, 4 May 2023 05:51:23 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6bgs1sj-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:51:23 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3444hvCg027193;
 Thu, 4 May 2023 05:33:56 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv8002r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:33:56 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3445XspS36897384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 05:33:55 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC15458056;
 Thu,  4 May 2023 05:33:54 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8B645803F;
 Thu,  4 May 2023 05:33:52 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 05:33:52 +0000 (GMT)
Message-ID: <476da90d-02e3-1e22-61eb-05724412e75b@linux.ibm.com>
Date: Thu, 4 May 2023 11:03:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/2] ppc: spapr: cleanup cr get/set with helpers.
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com
References: <20230503093619.2530487-1-harshpb@linux.ibm.com>
 <20230503093619.2530487-2-harshpb@linux.ibm.com>
 <6dc41ce7-264f-db9f-b15a-6d83907fc925@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <6dc41ce7-264f-db9f-b15a-6d83907fc925@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nfPzBgsARfnR-0o1Lq3BB-igXQ8A4DYA
X-Proofpoint-GUID: nDJvDpd9-7xC-yQP9njyx5CLW_RtNanw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040046
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 5/4/23 02:19, Daniel Henrique Barboza wrote:
> I squashed in this change to fix it:
> 
> 
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 241d9e27e5..424f2e1741 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -75,7 +75,7 @@ void ppc_set_cr(CPUPPCState *env, uint64_t cr)
>        }
>    }
> -uint64_t ppc_get_cr(CPUPPCState *env)
> +uint64_t ppc_get_cr(const CPUPPCState *env)
>    {
>        uint64_t cr = 0;
>        for (int i = 0; i < 8; i++) {
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 0af94170d0..1c02596d9f 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2774,7 +2774,7 @@ void ppc_maybe_bswap_register(CPUPPCState *env, 
> uint8_t *mem_buf, int len);
>    void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
>    uint32_t ppc_get_vscr(CPUPPCState *env);
>    void ppc_set_cr(CPUPPCState *env, uint64_t cr);
> -uint64_t ppc_get_cr(CPUPPCState *env);
> +uint64_t ppc_get_cr(const CPUPPCState *env);
>    
> /*****************************************************************************/
> 
> 
> Just a FYI,. No need to re-send.
> 
Oh ok, thanks Daniel.

> 
> 
> Daniel

