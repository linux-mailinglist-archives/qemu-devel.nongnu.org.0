Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9C446B0F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 23:57:53 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj89g-0005M5-CQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 18:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mj88o-0004eY-QV; Fri, 05 Nov 2021 18:56:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mj88m-00005A-Lv; Fri, 05 Nov 2021 18:56:58 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5KkZGc015999; 
 Fri, 5 Nov 2021 22:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XFH9lyKZrktW7MxK64xoc86BcDv1/fo9RbZ+bTDk764=;
 b=DyyuWmMqSF7vB8iWpe20zSmRRhUxgmaHsSGX3F7N5pKBSUUFRDhPv07xlRKVegE1X6QF
 C+hySbSIC3ECkbNcjWQMRMBLNolgIDgSF8Mirj7SYZ5b+Zv+riKthF91w50nU3AWbfde
 Rg7oIDD21QIYMKJUvsqWqVtsvqumWoVI3Gq2CQU6B9yyjCyqiwDd2SHNXZpPb5lLQ9PX
 npYAAC6PFNKr333qpKCOG2AjIk4SLzyW4wtI2yto12ZsO1Vgl69L9ad90ZjPl5FuJFwu
 PQ81oM8DSiXAD4I3l7HRV3i8iqE3bOl2jEFKgcDzQgB/sm2Mk+25zJoytoFuoLH5PD2y QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c5bxrhvqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 22:56:54 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5Mu30L025486;
 Fri, 5 Nov 2021 22:56:54 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c5bxrhvqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 22:56:54 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5MlORE031383;
 Fri, 5 Nov 2021 22:56:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3c4t4eu9vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 22:56:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A5MuqZe32899380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 22:56:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD667805C;
 Fri,  5 Nov 2021 22:56:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 910377805F;
 Fri,  5 Nov 2021 22:56:51 +0000 (GMT)
Received: from [9.160.106.35] (unknown [9.160.106.35])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 22:56:51 +0000 (GMT)
Message-ID: <7bcc35e1-ca27-eccc-8fb6-9cb6dda38e51@linux.ibm.com>
Date: Fri, 5 Nov 2021 18:56:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] s390x: kvm: adjust diag318 resets to retain data
Content-Language: en-US
From: Collin Walling <walling@linux.ibm.com>
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211105224646.803661-1-walling@linux.ibm.com>
In-Reply-To: <20211105224646.803661-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0kysBm9pxdxl-_NdqCUxg5E6h9Q8p6Ky
X-Proofpoint-GUID: uaSng518EcGPXDDR4YXKKerQXoKMUCUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111050121
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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

On 11/5/21 18:46, Collin Walling wrote:
> The CPNC portion of the diag 318 data is erroneously reset during an
> initial CPU reset caused by SIGP. Let's go ahead and relocate the
> diag318_info field within the CPUS390XState struct such that it is
> only zeroed during a clear reset. This way, the CPNC will be retained
> for each VCPU in the configuration after the diag 318 instruction
> has been invoked by the kernel.
> 
> Additionally, the diag 318 data reset is handled via the CPU reset
> code. The set_diag318 code can be merged into the handler function
> and the helper functions can consequently be removed.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>

I neglected to mention that this addresses a bug that was discovered
internally, observed by a recent patch I sent upstream:

[PATCH] KVM: s390x: add debug statement for diag 318 CPNC data

This patch removes most of the code from one of my past patches. Does it
make more sense to revert the old patch and then introduce a follow-up
that includes the additions introduced by this new one?

commit e2c6cd567422bfa563be026b9741a1854aecdc06
Author: Collin L. Walling <walling@linux.ibm.com>
Date:   Fri Nov 13 17:10:22 2020 -0500

    s390/kvm: fix diag318 propagation and reset functionality

There is also a bug where hotplugged CPUs are not acquiring the CPNC as
well. I will address a fix to this in a follow-up patch in the future.

-- 
Regards,
Collin

Stay safe and stay healthy

