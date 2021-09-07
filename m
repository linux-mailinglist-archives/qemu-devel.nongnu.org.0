Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980F540295D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:07:03 +0200 (CEST)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaoY-00079e-N6
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNaTg-0000Ph-Jp; Tue, 07 Sep 2021 08:45:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNaTe-000796-Pp; Tue, 07 Sep 2021 08:45:28 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 187CWxMq019004; Tue, 7 Sep 2021 08:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vhZRjcTaG9zsYeVOiIBcSscdQwLy/v71u26EE+jOA5U=;
 b=Lk6RW+YaRJGV4tkdgE6KL7bNzE50hivAxrCQElUoxEhU9KKMFsyYEm7TK939rXV7BdeC
 N0mppDbK24IQPmkm1T22Qdi5L7GYK5lnGsuj4CZrW7M59DH0eNVHk9YZuTbt3duWiKA+
 guLs29uEWUCbsinfIml3gZcTcvhGzPv1LOcfeIk+MpmBvo8B0G4br4FlMobQ2Wq8B+Y2
 393mBiXLJxkji7Y9P2uDbZlOV+Vwq8rSVPmxND7LU3DVcPDy+fqEzMqwV5F31VoXIODE
 Pi6Khx73bcPvrgGjFDbzRCxMHfYROqerpR8nNF6ayktmn423R9WtvtDABRf0CxT6PRyA 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awx3e56nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:45:25 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 187CeSGp053471;
 Tue, 7 Sep 2021 08:45:24 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awx3e56mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:45:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 187Cg8Vd023049;
 Tue, 7 Sep 2021 12:45:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3av0e9f92t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 12:45:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 187CjIe831261102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 12:45:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A1F3AE057;
 Tue,  7 Sep 2021 12:45:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FB55AE05A;
 Tue,  7 Sep 2021 12:45:18 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.9.165])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 12:45:18 +0000 (GMT)
Subject: Re: [PATCH v2 3/5] s390x: topology: CPU topology objects and
 structures
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-4-git-send-email-pmorel@linux.ibm.com>
 <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <c9193765-adae-d179-8a14-8bc88a288fe0@linux.ibm.com>
Date: Tue, 7 Sep 2021 14:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ShiR9bZfwOOu7FrF1o2aITQNDJY2DneP
X-Proofpoint-ORIG-GUID: WhskuII7Np03ysV7IjjRthoAyHIjQgbX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_04:2021-09-07,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 9:32 AM, Thomas Huth wrote:
> On 22/07/2021 19.42, Pierre Morel wrote:
>> We use new objects to have a dynamic administration of the CPU topology.
>> The highier level object is the S390 book. In a first implementation
> 

> 
> I didn't spot any migration related code in here ... is this already 
> migration-safe?
> 

Not sure at all.

The topology may change at any moment and we interpret PTF, the 
instruction which tell us if the topology changed.
Obviously the topology on the target may not be the same as on the source.

So what I propose is to disable topology change during the migration:
- on migration start, disable PTF interpretation and block the 
topology_change _report in the emulation.
- on migration end set back PTF interpretation and unblock the emulation

In the case, in discussion with David on KVM, that we do not emulate PTF 
for hosts without the stfl(11) we can even make it simpler in QEMU by 
always reporting "no change" for PTF 2 in the emulation.

Note that the Linux kernel, even if the topology can change at any 
moment use a polling every minute to check the topology changes, so I 
guess we can ignore the optimization during the migration.

What do you think?


-- 
Pierre Morel
IBM Lab Boeblingen

