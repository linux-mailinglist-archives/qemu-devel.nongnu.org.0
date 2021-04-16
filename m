Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00937361F2F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:54:50 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXN3g-0008CP-BU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXN2Y-0007e1-UK; Fri, 16 Apr 2021 07:53:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62866
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXN2U-0005uP-S0; Fri, 16 Apr 2021 07:53:38 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GBXPAe119832; Fri, 16 Apr 2021 07:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bVVWVG+wtKfJLDaKdLgw1I6C9ywp5aA/Qro4G3BsZTU=;
 b=j4LksqyyhrL6dCNGmiDCTW8BQXzhlu1Ea6r50QR98GZZftstUNLE+y4MSpbA58xnYPub
 k/LDJWdoNGhGMj+MB16Y7B3qUqQIahFx3MKqqHgi8VCGChavTcIuSMYBxF3Xi8uNnyFN
 Pu4DBomwCTObMQ9sI/hDPbot+u4rJ75NiO78i9O2mhDuu+luViNXDNWKbzvO1XkXkhgo
 qYC/rjcShcRuifLBM37m07ajhbRFc72NiuAKR1tjyePp24uBJJ+gaRdHHt6pSX+Y6bk+
 jVc6Hy4sbhb8pnJdu4VpvehHW/hAPDczi3cEBnffXgvdeTl9LzFvUOTvGzeTmhoMLmOy sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xrhp2cf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 07:53:27 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GBXkJa120621;
 Fri, 16 Apr 2021 07:53:27 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xrhp2ceq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 07:53:27 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GBm8kn023075;
 Fri, 16 Apr 2021 11:53:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 37u3n8acqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:53:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GBrM8h26673562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 11:53:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA1B642041;
 Fri, 16 Apr 2021 11:53:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A8B14203F;
 Fri, 16 Apr 2021 11:53:22 +0000 (GMT)
Received: from sig-9-145-157-105.de.ibm.com (unknown [9.145.157.105])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 11:53:22 +0000 (GMT)
Message-ID: <2b26e691023da13e4bdbd6085f9fb73523eb3a8b.camel@linux.ibm.com>
Subject: Re: [PATCH v4 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Fri, 16 Apr 2021 13:53:21 +0200
In-Reply-To: <20210415173900.7062f159.cohuck@redhat.com>
References: <20210415130305.28640-1-iii@linux.ibm.com>
 <20210415173900.7062f159.cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BN8hmwHm1DyPguWKYKOmOi-8zjjIyJUM
X-Proofpoint-ORIG-GUID: MmZjI4eZapAXz2sKzGJGC5AbW9sLNK5y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_06:2021-04-15,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=981 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160088
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-04-15 at 17:39 +0200, Cornelia Huck wrote:
> On Thu, 15 Apr 2021 15:03:01 +0200
> Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> 
> > If arch-specific code generates a translation block of size 0,
> > tb_gen_code() may generate a spurious exception.
> > 
> > Fix s390x (patch 1), ARM (patch 2) and xtensa (patch 3) and add an
> > assertion in order to catch such situations earlier (patch 4).
> > 
> > v1: 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> > v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size
> > == 0
> >           in tb_gen_code().
> > 
> > v2: 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
> > v2 -> v3: Split the common code change into a separate patch, add
> > the
> >           ARM patch in order to fix
> >           https://gitlab.com/cohuck/qemu/-/jobs/1178409450
> > 
> > v3: 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02332.html
> > v3 -> v4: Add the xtensa patch in order to fix
> >           https://gitlab.com/cohuck/qemu/-/jobs/1178409540
> > 
> > Ilya Leoshkevich (4):
> >   target/s390x: Fix translation exception on illegal instruction
> >   target/arm: Make sure that commpage's tb->size != 0
> >   target/xtensa: Make sure that tb->size != 0
> >   accel/tcg: Assert that tb->size != 0 after translation
> > 
> >  accel/tcg/translate-all.c |  1 +
> >  target/arm/translate.c    |  1 +
> >  target/s390x/translate.c  | 16 +++++++++++-----
> >  target/xtensa/translate.c |  3 +++
> >  4 files changed, 16 insertions(+), 5 deletions(-)
> > 
> 
> FWIW, this now has passed CI for me.
> 
> If all is good, who will merge it? I can merge through the s390x
> tree,
> if I get acks on the patches for the other architectures, or I can
> give
> my ack on the s390x patch, if somebody else is going to take it.

For me personally it would be totally fine if it goes through your
tree. We still need a review on the ARM patch though.


