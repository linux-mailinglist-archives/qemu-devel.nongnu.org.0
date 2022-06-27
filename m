Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0B55BB9A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 20:27:15 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5tS6-0006WJ-7e
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 14:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o5tQe-0005YS-Gl; Mon, 27 Jun 2022 14:25:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o5tQc-0004HP-4A; Mon, 27 Jun 2022 14:25:43 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RGhbh4022954;
 Mon, 27 Jun 2022 18:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : subject : to : content-type :
 content-transfer-encoding; s=pp1;
 bh=9uSgT02IuOfaSZDmG8X7I7qIRwi4V57wvBc6yL6Qlj0=;
 b=SobdZuZUOL83fjQ94G+KWxXXdHAp033Wfu9n7+bGwou3ztKj1iPnlOBpwxcPM/m/eQK4
 CGHbveDZitwtcOEPizpyreYAsP53bBD9YDMVDmL3VhJddi02iF0WbT9SRIGs2+rDkKEC
 /7BDXF9vltSHkNVKGs37JHAVjYFqpyTz9OS0FGPn8gTetwK8t3NXvE5torRII9CVQVCp
 Pf8LSGNUQgFZUWYphrmxMPuokwQAGkeCCJYbugHVLaplEe6gVJF7z6a3goplzqexGTck
 P2GH8uOo3DsEU5mLtg9a+onLH1tafM3xWLsSC16Ih90y10XJbpoTqPmAykPLsccZLIRg Jw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gygakjt41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 18:25:40 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RIK4LH010577;
 Mon, 27 Jun 2022 18:25:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3gwt092hkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 18:25:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25RIPauB25231778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jun 2022 18:25:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ADCB11C04C;
 Mon, 27 Jun 2022 18:25:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1077411C04A;
 Mon, 27 Jun 2022 18:25:36 +0000 (GMT)
Received: from [9.145.72.213] (unknown [9.145.72.213])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jun 2022 18:25:35 +0000 (GMT)
Message-ID: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
Date: Mon, 27 Jun 2022 20:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Slowness with multi-thread TCG?
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zXACTLyTAk00bOLdes0NPXRBg5XEn7PU
X-Proofpoint-GUID: zXACTLyTAk00bOLdes0NPXRBg5XEn7PU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

[ Resending as it was meant for the qemu-ppc list ]

Hello,

I've been looking at why our qemu powernv model is so slow when booting 
a compressed linux kernel, using multiple vcpus and multi-thread tcg. 
With only one vcpu, the decompression time of the kernel is what it is, 
but when using multiple vcpus, the decompression is actually slower. And 
worse: it degrades very fast with the number of vcpus!

Rough measurement of the decompression time on a x86 laptop with 
multi-thread tcg and using the qemu powernv10 machine:
1 vcpu => 15 seconds
2 vcpus => 45 seconds
4 vcpus => 1 min 30 seconds

Looking in details, when the firmware (skiboot) hands over execution to 
the linux kernel, there's one main thread entering some bootstrap code 
and running the kernel decompression algorithm. All the other secondary 
threads are left spinning in skiboot (1 thread per vpcu). So on paper, 
with multi-thread tcg and assuming the system has enough available 
physical cpus, I would expect the decompression to hog one physical cpu 
and the time needed to be constant, no matter the number of vpcus.

All the secondary threads are left spinning in code like this:

	for (;;) {
		if (cpu_check_jobs(cpu))  // reading cpu-local data
			break;
		if (reconfigure_idle)     // global variable
			break;
		barrier();
	}

The barrier is to force reading the memory with each iteration. It's 
defined as:

   asm volatile("" : : : "memory");


Some time later, the main thread in the linux kernel will get the 
secondary threads out of that loop by posting a job.

My first thought was that the translation of that code through tcg was 
somehow causing some abnormally slow behavior, maybe due to some 
non-obvious contention between the threads. However, if I send the 
threads spinning forever with simply:

     for (;;) ;

supposedly removing any contention, then the decompression time is the same.

Ironically, the behavior seen with single thread tcg is what I would 
expect: 1 thread decompressing in 15 seconds, all the other threads 
spinning for that same amount of time, all sharing the same physical 
cpu, so it all adds up nicely: I see 60 seconds decompression time with 
4 vcpus (4x15). Which means multi-thread tcg is slower by quite a bit. 
And single thread tcg hogs one physical cpu of the laptop vs. 4 physical 
cpus for the slower multi-thread tcg.

Does anybody have an idea of what might happen or have suggestion to 
keep investigating?
Thanks for your help!

   Fred


