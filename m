Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D46E403B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 08:56:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poIlA-0000Nw-LN; Mon, 17 Apr 2023 02:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poIku-0000N2-2O; Mon, 17 Apr 2023 02:54:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poIkr-00084q-ND; Mon, 17 Apr 2023 02:54:27 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H64uH3026006; Mon, 17 Apr 2023 06:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3ITrsREqLuy5mws+N3kk49Hg0Kps71YCTZIkRXStSIE=;
 b=PbzQcnrNHHFuCQhOTy253VjLYPPaJ0ke8MRDUP6u6Sldc9n9KQIOSJ/tt90FcxP110kk
 VfoWCWCZiqxg5dpAexoa5m1ERF4mLFjN2hV0WsOe1Ld9eX2ZypNFVTibL76ZX+QlDs39
 3/zqrfisAFNOLDbCRfUF2Bk0DEAhacxHm4U9XHJAeySpOdXoxk5UXH83S33ykixqFslg
 +2088xeIvELOKWFbJN/4bmS+KdNlLI1pebR2JNmGE03Dd4U5cUhcvz/jx68xqbmhxRGN
 /Oc2+T6/KaEpIZ93UIq29NMvA4xXlrydWD6htBfPITHfihhhhVQXwGmpo43cLfihtOP0 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0em20fxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 06:54:21 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H6HCZq017839;
 Mon, 17 Apr 2023 06:54:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0em20fwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 06:54:20 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H5CKGQ029453;
 Mon, 17 Apr 2023 06:54:20 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pykj73xa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 06:54:20 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H6sIJE28115552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 06:54:18 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 941B45805D;
 Mon, 17 Apr 2023 06:54:18 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EC1458059;
 Mon, 17 Apr 2023 06:54:17 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Apr 2023 06:54:16 +0000 (GMT)
Message-ID: <1df96c48-7aba-b3f9-656a-c0cb7c60a916@linux.ibm.com>
Date: Mon, 17 Apr 2023 12:24:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] ppc: spapr: cleanup cr get/store with helper routines.
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-2-harshpb@linux.ibm.com> <87y1muite2.fsf@suse.de>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87y1muite2.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _lSrcF_pAypk4FbuzOgAB0ERdnbiP8Bt
X-Proofpoint-ORIG-GUID: iclQ3zvwMjkMJKgDgbH46Cz4Xs9WTJeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_03,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=827 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170060
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 4/14/23 17:10, Fabiano Rosas wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
> 
> A bit vague on the subject line. I would expect to see some mention to
> nested at least.

Sure, will update subject line to include mention of 
[h_enter|spapr_exit]_nested routines.

> 
>> The bits in cr reg are grouped into eight 4-bit fields represented
>> by env->crf[8] and the related calculations should be abstracted to
>> keep the calling routines simpler to read. This is a step towards
>> cleaning up the [h_enter|spapr_exit]_nested calls for better readability.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>

Thanks!

