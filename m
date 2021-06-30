Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF283B80F3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:49:14 +0200 (CEST)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXmL-0007Yh-7S
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lyXku-0006N7-P1; Wed, 30 Jun 2021 06:47:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lyXks-00031W-Kx; Wed, 30 Jun 2021 06:47:44 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UAY1bJ105012; Wed, 30 Jun 2021 06:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=lkP0PROVDYslGO9pAzcjgiHFV24rFTGILB2NQ/ff6FM=;
 b=kaymrGc0CislysYwB3SkBEIbZ5pv7c6gWbgH/P39fYWvsoKOuEvRko4xpA8nLkQMKiuY
 4epupoSH0GtR8BEiHLx8SUXqHXvhOzDo57vxW9VGMXh4UxL7IVu4TsODyoVTenjSJNr5
 pnKS7RK+QntqyVXBUP2t6XHHxviAXRbtbsVCSo3p8vgmwqLhkEJiRLHfAmt9QiVDbr/1
 2YYlLt8nurtb8ZbhSCk7ugHo1IRgB4QdajV2dJkld/9LH4H0vGHCdhiWOMKOUAPAtbsw
 wKR9Z0cy7lir7HsqF9hnW2p4dcwhN+BZMk/JW7r6nXAY1fRgqNqZigWCYHMWBaorA0TH yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gp1ea1c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 06:47:38 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UAd4xn128971;
 Wed, 30 Jun 2021 06:47:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gp1ea1b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 06:47:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UAgUhF032318;
 Wed, 30 Jun 2021 10:47:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 39duv8hqtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 10:47:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UAlXwm35127614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 10:47:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40AF5A405F;
 Wed, 30 Jun 2021 10:47:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 371ACA405D;
 Wed, 30 Jun 2021 10:47:33 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.93.31])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 10:47:33 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id B589ED80308; Wed, 30 Jun 2021 12:47:32 +0200 (CEST)
Date: Wed, 30 Jun 2021 12:47:32 +0200
From: Ulrich Weigand <uweigand@de.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Message-ID: <20210630104732.GA29019@oc3748833570.ibm.com>
References: <20210623145020.GA30585@oc3748833570.ibm.com>
 <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
 <20210628125803.GA29264@oc3748833570.ibm.com>
 <5c9a00df-aa43-d721-912c-eeb9eda839a4@linaro.org>
 <20210628163236.GA14822@oc3748833570.ibm.com>
 <cdda50ba-cf3d-5021-c7b0-01f66d4f45d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdda50ba-cf3d-5021-c7b0-01f66d4f45d1@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QSpP1P6X-qtp4ZoRcRrR2kjtNJAFlFam
X-Proofpoint-GUID: RYO2iHoAbjlHuAMwgVKfzRD9xX8eDN1E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_02:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=980 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300069
Received-SPF: pass client-ip=148.163.156.1; envelope-from=uweigand@de.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 10:49:52AM -0700, Richard Henderson wrote:
> On 6/28/21 9:32 AM, Ulrich Weigand wrote:
> >>Don't clear out env->fpu_status.float_exception_flags in
> >>handle_exceptions.  Wait until we're actually done with the data.
> >
> >I don't really know much about qemu internals, but this is really
> >confusing me, sorry.  Aren't env->fpu_status and env->cc_op two
> >elements of the same global state?  Why it is OK to use one of
> >these fields to pass information to the next helper, but not the
> >other?  I guess I must be missing something here ...
> 
> One of them has
> 
>     cc_op = tcg_global_mem_new_i32(cpu_env, offsetof(CPUS390XState, cc_op),
>                                    "cc_op");
> 
> which makes it a TCG Global, which may not be modified at will, and one of them does not.

Got it, thanks!

Bye,
Ulrich

-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

