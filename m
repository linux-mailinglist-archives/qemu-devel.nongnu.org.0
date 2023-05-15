Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709DF702AF0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:56:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVrJ-0007qb-Ca; Mon, 15 May 2023 06:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyVrE-0007qD-BN; Mon, 15 May 2023 06:55:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyVrA-0003Je-P6; Mon, 15 May 2023 06:55:12 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FAbOoF002024; Mon, 15 May 2023 10:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8wbnxqcqbAHZ+W1BaqDtJBA7rB7zg18RP58lK+poOVk=;
 b=JPkSMWS/f7f9Ey7/Avx8lxa5xPfdESrGHKGA4RcX1ljf3RjMgTAp3O3o2SUBIb6ir2Fd
 2N/7BK8GJS9tIxfMEEEznGH1/DXiR5+if54Wtwgg/46zzMeM7Ej6cCQGzFzVrsf8AApL
 mVXbuVn+mEVtT+DtOhCjKt0nzcN7QXBsP+jFpr64wQiY2qKkcrP110ug02gNJ4QZo8DL
 0/lKdmo+szNeRHigEnhq2f2ULhIrCXXajsSaKVrl0zq/rk0GBhNnGbEpRSKIPsq4Tg1N
 IAleFGkcX8WSQdfLXvkVwfCuEhpJEFpVpUeNPYBn5Fs4FtCu0F2tYpk9yfp3fDLw2n5C Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkjm89rw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:55:05 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FAcCU4008368;
 Mon, 15 May 2023 10:55:05 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkjm89rw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:55:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34FA9fBC025346;
 Mon, 15 May 2023 10:55:04 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qj265ncjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:55:04 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34FAt3JA33489578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 10:55:03 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DB2258059;
 Mon, 15 May 2023 10:55:03 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8626D5805D;
 Mon, 15 May 2023 10:55:01 +0000 (GMT)
Received: from [9.43.90.211] (unknown [9.43.90.211])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 15 May 2023 10:55:01 +0000 (GMT)
Message-ID: <acd8477f-8ec4-5887-4ac2-faf7d559c8eb@linux.ibm.com>
Date: Mon, 15 May 2023 16:24:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] target/ppc: Implement HEIR SPR
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-6-npiggin@gmail.com>
 <ZFoXjN/PUyDhMDG1@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com>
 <CSMPI9KZ5TT5.GAWG3D1ZUQ3H@wheely>
 <67fcac44-675b-67b3-ba7b-61730c356f50@linux.ibm.com>
 <9d7d3ca6-85d2-ec00-148f-963a12bbc0ad@linux.ibm.com>
 <CSMSGPCJPT00.3T2WYV13GBGT3@wheely>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSMSGPCJPT00.3T2WYV13GBGT3@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZwapeQVxb41wpZbna4fBb71RcI0iTH9m
X-Proofpoint-ORIG-GUID: Nu35quchsXUIWqZRqnTdH_iiL8bd7xvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=445 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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



On 5/15/23 16:15, Nicholas Piggin wrote:
> On Mon May 15, 2023 at 7:32 PM AEST, Harsh Prateek Bora wrote:
>>
>>
>> On 5/15/23 14:02, Harsh Prateek Bora wrote:
>>>>
>>>> That would be wrong for the other HSRR fallthroughs above it.
>>>>
>>> Oh yeh, in that case, may be move it to top of the EXCP_HISI, it would
>>> need duplicating one line of assignment though (relatively better?).
>>
>> correcting myself, no duplication needed if keeping above EXCP_HISI.
> 
> No, because HV_EMU interrupts get an error code that can not be put
> into HSRR1.
> 
Oh ok, thanks for clarifying.

regards,
Harsh

> Thanks,
> Nick
> 

