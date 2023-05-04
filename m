Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01AE6F6451
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 07:19:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puRM2-0003c9-HG; Thu, 04 May 2023 01:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRLs-0003bt-NR; Thu, 04 May 2023 01:18:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRLq-0007S7-8j; Thu, 04 May 2023 01:18:00 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3445C4BF014828; Thu, 4 May 2023 05:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ESiBNw5k+3ALp+2xb9y6VHa1iWQTXEIU38N1ol6AFQ8=;
 b=plYnfu2dZ/Sh4oml+/W23oN6OKc7GP/tkLnnUUkkS3sffy48QS7dbWPLr6SpS/WdtcIr
 KNOrLGRcjMW2fO9qC0Kg4ESs28OPjSUPWWAluvRQZOIORYBtHRpNeZyCV1nM879RXrrw
 FWrBKatyQ9e/czFW0pNyj6prHBHH+SppAAX0nfvG2FKoGtnGVD3BTFEg1h4rZElFPHcH
 qM0UESznayaJ6o8D1W0ym9jXLTTitRBAH2P/j4tt+GhkoD2zK1z3u1EolrxxxiYhinbZ
 azyt6dhRbXgZZCxYZhAhkOiZ0TwfhKUMpJbmMTVz2c1E9ccGRUyT7/hDOwvqYZHcolhE Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6bgg487-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:17:36 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3445FStX026226;
 Thu, 4 May 2023 05:17:36 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6bgg47p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:17:36 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3444uFRh031622;
 Thu, 4 May 2023 05:17:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3q8tv6t69f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:17:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3445HVIY64618826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 05:17:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6570E20040;
 Thu,  4 May 2023 05:17:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44C5E20043;
 Thu,  4 May 2023 05:17:29 +0000 (GMT)
Received: from [9.43.55.38] (unknown [9.43.55.38])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 05:17:29 +0000 (GMT)
Message-ID: <8ddf6bcf-c499-9173-a3a0-7aa86dd9d42a@linux.ibm.com>
Date: Thu, 4 May 2023 10:47:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] tests: tcg: ppc64: Add tests for Vector Extract Mask
 Instructions
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, philmd@linaro.org,
 richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, groug@kaod.org
Cc: john_platts@hotmail.com, qemu-devel@nongnu.org
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168141246968.3026479.12755025628496245070.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <0435d42f-e48a-3c51-108a-df284fc496ab@kaod.org>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <0435d42f-e48a-3c51-108a-df284fc496ab@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IG68h5xRHlWumbdy6Um5iJW07qkHpYK8
X-Proofpoint-ORIG-GUID: caacO-KUYtOMOZ38eau19YShn4FIbvJs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=962 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040042
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
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

On 5/2/23 12:35, Cédric Le Goater wrote:
> On 4/13/23 21:01, Shivaprasad G Bhat wrote:
>> Add test for vextractbm, vextractwm, vextractdm and vextractqm
>> instructions. Test works for both qemu-ppc64 and qemu-ppc64le.
>>
>> Based on the test case written by John Platts posted at [1]
>>
>> References:
>> [1]: https://gitlab.com/qemu-project/qemu/-/issues/1536
>
> Gitlab issues should be referenced as :
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1536
>
> However, this patch adds a test, not a fix. So it is the previous patch
> which should be annotated as resolving the issue.
>
> Also, I think the code should be using  HOST_BIG_ENDIAN instead of
> __ORDER_BIG_ENDIAN__
>
Thanks for the comments Cédric.

Fixing these in v2.

Thanks,

Shivaprasad



