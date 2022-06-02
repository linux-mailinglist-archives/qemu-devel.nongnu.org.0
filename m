Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD253BD07
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 19:10:33 +0200 (CEST)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwoL8-0005wT-G0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 13:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwoIa-0005Cq-BS; Thu, 02 Jun 2022 13:07:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwoIW-0005kh-JL; Thu, 02 Jun 2022 13:07:51 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252ELBC8001744;
 Thu, 2 Jun 2022 17:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x9rxyrREmIbqFVLbewK0pPCnD4Able+aZ/N5gi/rnag=;
 b=lNjZWYPeldojvd8ycspyHtL3oLFRWyUOOfrZaV9Rr1985wwKP0Pise+B4rLgdAOWxyOj
 4dDUgiJKAVs8jkOO+c42M/S7LavcIFmUHZRJV6J0lj9I5c//Ua2APKzhAyAbiSzy73VT
 1TISjZqB/l8JPjWa1wSNxhuvzfStwkOCgs5umRBKbaKwLt7OmALvRuLRQw5gIeHIP3qG
 n9H4rq/62WSZjFIORfZvYpLDALWHTXuOS/BmU+B3f/NBs6ucBTrZ4UXE+fWDfdVWxRii
 ZMIJrkeoFfreUUSbKemJP8ATkDggfFxXe88AItq1v5SRVSWrRUKtTy7vMbmu2hmulKRI 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geub97kwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 17:07:43 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252Gp9Wv008943;
 Thu, 2 Jun 2022 17:07:43 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geub97kw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 17:07:43 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252H5Te5023174;
 Thu, 2 Jun 2022 17:07:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3gbcaknkh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 17:07:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252H6NcB43909428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 17:06:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4DD1AE045;
 Thu,  2 Jun 2022 17:06:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 832C9AE051;
 Thu,  2 Jun 2022 17:06:23 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jun 2022 17:06:23 +0000 (GMT)
Message-ID: <9af5aa25-6a32-6144-497d-2215187a96e2@linux.ibm.com>
Date: Thu, 2 Jun 2022 19:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] pnv/xive2: Access direct mapped thread contexts from all
 chips
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220602165310.558810-1-fbarrat@linux.ibm.com>
 <3f4bbf08-36b0-170b-2166-be1cda6888b1@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <3f4bbf08-36b0-170b-2166-be1cda6888b1@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kYHG1QovUOKWTDKMtc-89oYH_IYHzLjO
X-Proofpoint-ORIG-GUID: gkQdvY0i19qn9EeA8zgalDPRDVysGLaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=803 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020071
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 02/06/2022 19:00, Cédric Le Goater wrote:
> On 6/2/22 18:53, Frederic Barrat wrote:
>> When accessing a thread context through the IC BAR, the offset of the
>> page in the BAR identifies the CPU. From that offset, we can compute
>> the PIR (processor ID register) of the CPU to do the data structure
>> lookup. On P10, the current code assumes an access for node 0 when
>> computing the PIR. Everything is almost in place to allow access for
>> other nodes though. So this patch reworks how the PIR value is
>> computed so that we can access all thread contexts through the IC BAR.
>>
>> The PIR is already correct on P9, so no need to modify anything there.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Is that a P10 bug ? If so, a fixes tag is needed.


Fixes: da71b7e3ed45 ("ppc/pnv: Add a XIVE2 controller to the POWER10 chip")

Daniel, good enough or you prefer a resend?

   Fred

