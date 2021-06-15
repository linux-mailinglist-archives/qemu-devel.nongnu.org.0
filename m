Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BB3A883A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 20:04:57 +0200 (CEST)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDQm-0000hs-Fx
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 14:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1ltDPE-0008Re-NA; Tue, 15 Jun 2021 14:03:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1ltDP8-0000Qw-Pt; Tue, 15 Jun 2021 14:03:20 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FHXVCE002374; Tue, 15 Jun 2021 14:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Fg4ZoWlw4N3FmV5ToJZEoKaWVXX80W1fGYpDMDg8PM8=;
 b=cP+xmJwLJEGNwoSE437ck+pbiJ7AHGxWIfWbaVg2DVmhfSCmFdi277HCyr7UZ78EbOnr
 7Ki63f2PuHz+MOIvAaobqvO+M4Hu8GlJEjz7s7wBmYyFm/SGX3XTOERcNjEYvUAWE6rV
 nZaSPhDaEHbv4BwRVdcqv0dpP3GB6e2uuybIsxJ3NVXuQffuUPj+8S5/WJ+ODf/9xVke
 Ey0tj+rgbjNLy/Z0xQr16cvg5BayN+j3dwF2EMf8EnMW+w5XEGpxog73jikqunYQmqJQ
 KJyzw/yL2s4q7yM8dB3biv8VY8oiBQrbv8T6xzLASTE7W6zp7m+sxnZwMlPmNioSJzWX 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396yr5txvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 14:03:09 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15FHtVSu108303;
 Tue, 15 Jun 2021 14:03:09 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396yr5txv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 14:03:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FHvSgb025226;
 Tue, 15 Jun 2021 18:03:08 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj9a2rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 18:03:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FI37Yh32571662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 18:03:07 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 334856E04E;
 Tue, 15 Jun 2021 18:03:07 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAA1C6E04C;
 Tue, 15 Jun 2021 18:03:06 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 18:03:06 +0000 (GMT)
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 15 Jun 2021 14:03:06 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
Organization: IBM
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
Message-ID: <87431a2f3cdefff42dc375ec888660e4@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -dCi3hd_Rjct1mFDg207WdstijOd5jFf
X-Proofpoint-GUID: j8GyM0z8RyIqITGfeUxRkJUGHHbuqLid
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_07:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150109
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, david@redhat.com, cohuck@redhat.com, qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-06-14 11:07 pm, Richard Henderson wrote:
> The PSW_MASK_CC component of psw.mask was not handled properly
> in the creation or restoration of signal frames.
> 

Thanks Richard! Peter and I tested this series against:
  * https://bugs.launchpad.net/qemu/+bug/1886793
  * https://bugs.launchpad.net/qemu/+bug/1893040
and they look fixed now.

Appreciate your time on this,

Jon

> 
> r~
> 
> 
> Richard Henderson (5):
>   target/s390x: Expose load_psw and get_psw_mask to cpu.h
>   target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
>   target/s390x: Improve s390_cpu_dump_state vs cc_op
>   target/s390x: Use s390_cpu_{set_psw,get_psw_mask} in gdbstub
>   linux-user/s390x: Save and restore psw.mask properly
> 
>  target/s390x/cpu.h         |   3 ++
>  target/s390x/internal.h    |   5 --
>  linux-user/s390x/signal.c  |  37 ++++++++++++--
>  target/s390x/cc_helper.c   |   2 +-
>  target/s390x/excp_helper.c |  28 +++++-----
>  target/s390x/gdbstub.c     |  15 +-----
>  target/s390x/helper.c      | 101 ++++++++++++++++++++-----------------
>  target/s390x/sigp.c        |   3 +-
>  8 files changed, 110 insertions(+), 84 deletions(-)

