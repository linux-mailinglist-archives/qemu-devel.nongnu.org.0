Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A34D57164A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:58:31 +0200 (CEST)
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCf0-0004ua-Eh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBCYt-0007ax-CT; Tue, 12 Jul 2022 05:52:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBCYr-0006Kc-MC; Tue, 12 Jul 2022 05:52:11 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C9i1eg019955;
 Tue, 12 Jul 2022 09:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=TSMQv2XSpMRAJNVXtva96SwPmcpW6w7F0HQpVCkJH8c=;
 b=M2Z3vOV2grrQwbNq2iQNslGX8ETwUT3m9yrSk29sCS6M/8gDlWjNF9mzdAp/6yrDJwTS
 4082iSgrpa8s7DVpCXYJ9ROZYKBG1jFSUuVAXpl4UvZeGNUp9IbYmekh9Mlv43APjQRl
 8SQFoYKpB5pHBF0+3FeBeO42xnpejEKAOLmQD71adjoRKqPAWlzFoEOyV4KXHTRUN8P9
 IDC3pgAk2cTZhK0VHCxi5OsLvbAf8bAJh0dnHhAZbVAo7MEPfwJkJyds8W8rfL7KYYvw
 P84sHuGNyvl/0PhhHhQW4D3T+a/kl2sIwrfc6hagViCoBAbXY4rIWvYthnW9rIhb3+qC xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h96jyr5un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 09:52:08 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C9jSHX028748;
 Tue, 12 Jul 2022 09:52:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h96jyr5u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 09:52:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C9o867017610;
 Tue, 12 Jul 2022 09:52:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhv0fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 09:52:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26C9q2ga23593404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 09:52:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95B8B5204F;
 Tue, 12 Jul 2022 09:52:02 +0000 (GMT)
Received: from [9.171.48.196] (unknown [9.171.48.196])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1F83A52050;
 Tue, 12 Jul 2022 09:52:02 +0000 (GMT)
Message-ID: <832533a5b27c9aee11fea7633ed401e655491d5b.camel@linux.ibm.com>
Subject: Re: [PATCH 2/3] hw/misc: Add mmio-debug-exit device
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Date: Tue, 12 Jul 2022 11:52:01 +0200
In-Reply-To: <dd9d7b97-88c2-f1c3-8b0a-bb090059b180@linaro.org>
References: <20220711185640.3558813-1-iii@linux.ibm.com>
 <20220711185640.3558813-3-iii@linux.ibm.com>
 <dd9d7b97-88c2-f1c3-8b0a-bb090059b180@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: biyT-YPu8fifFTmn1WkUEAKX3xtAdWPq
X-Proofpoint-ORIG-GUID: P2JBn54mcnfQZD9aT8HXmeXiUgD9Mtc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207120035
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Tue, 2022-07-12 at 10:42 +0530, Richard Henderson wrote:
> On 7/12/22 00:26, Ilya Leoshkevich wrote:
> > System tests on x86 use isa-debug-exit device in order to signal
> > success or failure to the test runner. Unfortunately it's not
> > easily
> > usable on other architectures, since a guest needs to access
> > address_space_io, which may not be as straightforward as on x86.
> > Also, it requires adding ISA bus, which an architecture might not
> > otherwise need.
> > 
> > Introduce mmio-debug-exit device, which has the same semantics, but
> > is
> > triggered by writes to memory.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> You shouldn't need this for s390x, as there are already (at least)
> two other paths to 
> qemu_system_shutdown_request.
> 
> E.g. SIGP, which has a stop option.
> 
> 
> r~
> 

I would normally use lpswe + disabled wait, but this always gives me
exit status code 0, which doesn't allow easily distinguishing between
success and failure.

Code-wise SIGP seems to do roughly the same thing, and a quick
experiment with:

    lgfi %r4,-1
    lgfi %r5,-1
    larl %r6,_cpuaddr
    stap 0(%r6)
    lh %r6,0(%r6)
    nilh %r6,0
    sigp %r4,%r6,5
_cpuaddr: .short 0

confirmed that we get exit status code 0 as well.

Best regards,
Ilya

