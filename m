Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640CD449ADF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 18:38:27 +0100 (CET)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk8bC-0005cM-1I
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 12:38:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mk8ZU-0004eS-V8; Mon, 08 Nov 2021 12:36:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mk8ZT-0004xE-0T; Mon, 08 Nov 2021 12:36:40 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8GVELa016162; 
 Mon, 8 Nov 2021 17:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=h01LRnMDu04Kzfy1ZH2fHbqZIVegQwyMgzA2zLkYjyw=;
 b=ByGCcziOSEwezDJwLr3zaTMw6KAep3Un3MFL8deWlcXvYi07u4/9D/TdfFBfdjpIGCct
 RUDKCjFQXM2evH36yotbFvPB0RL0nEhpKnTAqdD1GANgk0El2p//sgTynu6R/06qE4Lk
 rcRkmVOjVpgo51crgU8XMwc/FK+QAO4zf6ai93Pqf+9aNR7YgGYso9Im3ZKNqhOMjoBr
 n1YwuC9FPBxLYVZnzgSJSRlKbjRJjIdCgxRP1vc+MiWxLF0+n6HDLBKCzTzN4YjPly2u
 o1KVc1iOWpjaL2iytK1ImBvxSJi3AJQcMuweTBf6UJQ7WeNiH/C6ZjLxLGuepM5fNqI2 Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6b56jwtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 17:36:36 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8HBHGx006148;
 Mon, 8 Nov 2021 17:36:35 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6b56jwss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 17:36:35 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8HYelE014575;
 Mon, 8 Nov 2021 17:36:34 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3c5hbah41m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 17:36:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8HaWHU62849280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 17:36:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2A3F28059;
 Mon,  8 Nov 2021 17:36:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2136128060;
 Mon,  8 Nov 2021 17:36:32 +0000 (GMT)
Received: from [9.160.104.209] (unknown [9.160.104.209])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 17:36:31 +0000 (GMT)
Message-ID: <e1143c60-036d-311e-e5c7-8c6224710abc@linux.ibm.com>
Date: Mon, 8 Nov 2021 12:36:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] s390x: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211105224646.803661-1-walling@linux.ibm.com>
 <055031a8-64ad-63d0-0345-69d45b760a7a@linux.ibm.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <055031a8-64ad-63d0-0345-69d45b760a7a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GhzS2Tc6wOCxztB52K7Su4qvCbt2xaL1
X-Proofpoint-ORIG-GUID: 9-OQMCkM-0B_oZMYZnfEfFSFnDEYe-xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080105
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 12:02, Janosch Frank wrote:
> On 11/5/21 23:46, Collin Walling wrote:
>> The CPNC portion of the diag 318 data is erroneously reset during an
>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>> diag318_info field within the CPUS390XState struct such that it is
>> only zeroed during a clear reset. This way, the CPNC will be retained
>> for each VCPU in the configuration after the diag 318 instruction
>> has been invoked by the kernel.
>>
>> Additionally, the diag 318 data reset is handled via the CPU reset
>> code. The set_diag318 code can be merged into the handler function
>> and the helper functions can consequently be removed.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> 
> Fixes tag?
> 

Will include this on v2 post. Thank you.

[...]

-- 
Regards,
Collin

Stay safe and stay healthy

